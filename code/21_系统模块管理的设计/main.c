#include <stdio.h>
#include "module.h"

error_t module_timer (system_state_t _state)
{
    if (STATE_INITIALIZING == _state) {
        printf ("  Info: timer module is initializing\n");
    } else if (STATE_UP == _state) {
        printf ("  Info: timer module is up\n");
    } else if (STATE_DOWN == _state) {
        printf ("  Info: timer module is down\n");
    } else if (STATE_DESTROYING == _state) {
        printf ("  Info: timer module is destroying\n");
    }

    return 0;
}

error_t module_memory (system_state_t _state)
{
    if (STATE_INITIALIZING == _state) {
        printf ("  Info: memory module is initializing\n");
    } else if (STATE_UP == _state) {
        printf ("  Info: memory module is up\n");
    } else if (STATE_DOWN == _state) {
        printf ("  Info: memory module is down\n");
    } else if (STATE_DESTROYING == _state) {
        printf ("  Info: memory module is destroying\n");
    }

    return 0;
}

void module_registration_entry ()
{
    (void) module_register ("Timer", MODULE_TIMER, OS_LEVEL, module_timer);
    (void) module_register ("Memory", MODULE_HEAP, OS_LEVEL, module_memory);
}

int main ()
{
    module_registration_entry ();

    printf ("\nSystem is going to be up\n");
    if (0 != system_up ()) {
        printf ("Error: system cannot be up\n");
        return -1;
    }

    printf ("\nSystem is going to be down\n");
    system_down ();

    return 0;
}


