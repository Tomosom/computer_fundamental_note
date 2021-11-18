#include <stdio.h>

void func()
{
#ifdef TEST
    printf("TEST = %s\n", TEST);
#endif

    return;
}