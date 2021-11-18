#include <stdio.h>

int* g_pointer;

void func()
{
	*g_pointer = (size_t)"D.T.Software";

    return;
}
