#include "primitive.h"
#include "error.h"
#include "module.h"

static struct errstr_t {
    int available_;
    int last_error_;
    const char **error_array_;
} g_errstr_array [MODULE_COUNT];

const char *errstr (error_t _error)
{
    static bool initialized = false;
    module_t module_id = MODULE_ID (_error);
    int error_id = MODULE_ERROR (_error);

    if (0 == initialized) {
        // errstr_init ();
        initialized = true;
    }

    if (0 == _error) {
        return "SUCCESS";
    }

    if (_error > 0) {
        return "ERROR_ERRSTR_NOT_NEGATIVE";
    }

    if (module_id > MODULE_LAST) {
        return "ERROR_ERRSTR_INVALID_MODULEID";
    }

    if (!g_errstr_array [module_id].available_) {
        return "ERROR_ERRSTR_NOT_AVAILABLE";
    }

    if (error_id > g_errstr_array [module_id].last_error_) {
        return "ERROR_ERRSTR_OUT_OF_LAST";
    }

    if (0 == g_errstr_array [module_id].error_array_ [error_id]) {
        return "ERROR_ERRSTR_NOT_DEFINED";
    }

    return g_errstr_array [module_id].error_array_ [error_id];
}

