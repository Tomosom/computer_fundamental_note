#include <stdio.h>
int *g_pointer;
void func()
{
    *g_pointer = 98;
    return;
}
