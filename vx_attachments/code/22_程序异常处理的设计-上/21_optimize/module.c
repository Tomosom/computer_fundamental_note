#include <stdarg.h>
#include "module.h"
#include "dll.h"
#include "errmod.h"

typedef struct {
    dll_node_t node_;
    const char *p_name_;
    module_callback_t callback_;
    bool is_registered_;
} module_init_t;

static dll_t g_levels [LEVEL_COUNT];
static module_init_t g_modules [MODULE_COUNT];
static system_state_t g_state;

static void console_print (const char* _format, ...)
{
    va_list arglist;

    va_start (arglist, _format);
    (void) vprintf (_format, arglist);
    va_end (arglist);
}

error_t module_register (const char _name [], module_t _module, init_level_t _level, module_callback_t _callback)
{
    module_init_t *p_module;

    if (_module > MODULE_LAST) {
        return ERROR_T (ERROR_MODULE_REG_INVMODULE);
    }
    if (_level > LEVEL_LAST) {
        return ERROR_T (ERROR_MODULE_REG_INVLEVEL);
    }
    if (null == _callback) {
        return ERROR_T (ERROR_MODULE_REG_INVCB);
    }

    p_module = &g_modules [_module];
    if (p_module->is_registered_) {
        return ERROR_T (ERROR_MODULE_REGISTERED);
    }
    p_module->p_name_ = _name;
    p_module->callback_ = _callback;
    p_module->is_registered_ = true;
    dll_push_tail (&g_levels [_level], &p_module->node_);

    return 0;
}

static bool notify_for_each (dll_t *_p_dll, dll_node_t *_p_node, void *_p_arg)
{
    module_init_t *p_module = (module_init_t *)_p_node;
    error_t result = p_module->callback_ (system_state());
    const char *state_str[] = {
        "STATE_INITIALIZING",
        "STATE_UP",
        "STATE_DOWN",
        "STATE_DESTROYING"
    };

    UNUSED (_p_dll);
    UNUSED (_p_arg);

    if (0 != result) {
        console_print ("Error: System State [%s] - %s(%s)can't initialize module %s (%s)",
            state_str[system_state()], p_module->p_name_, errstr (result));
        return false; // ? 重构后此处是否有问题?
    }
    return true;
}

error_t system_up ()
{
    init_level_t level;

    g_state = STATE_INITIALIZING;
    for (level = LEVEL_FIRST; level <= LEVEL_LAST; ++ level) {
        if (0 != dll_traverse (&g_levels [level], notify_for_each, (void *)&level)) {
            return ERROR_T (ERROR_MODULE_INIT_FAILURE);
        }
    }

    g_state = STATE_UP;
    for (level = LEVEL_FIRST; level <= LEVEL_LAST; ++ level) {
        if (0 != dll_traverse (&g_levels [level], notify_for_each, (void *)&level)) {
            return ERROR_T (ERROR_MODULE_UP_FAILURE);
        }
    }

    return 0;
}

void system_down ()
{
    init_level_t level;

    g_state = STATE_DOWN;
    for (level = LEVEL_LAST; level > LEVEL_FIRST; -- level) {
        (void) dll_traverse_reversely (&g_levels [level], notify_for_each, null);
    }
    (void) dll_traverse_reversely (&g_levels [LEVEL_FIRST], notify_for_each, null);

    g_state = STATE_DESTROYING;
    for (level = LEVEL_LAST; level > LEVEL_FIRST; -- level) {
        (void) dll_traverse_reversely (&g_levels [level], notify_for_each, null);
    }
    (void) dll_traverse_reversely (&g_levels [LEVEL_FIRST], notify_for_each, null);
}

system_state_t system_state ()
{
    return g_state;
}

