#include <stdio.h>
#include "func.h"

int g_global = 0;
int g_test = 1;

int main(int argc, char *argv[])
{
    func();
    
    printf("&g_global = %p\n", &g_global);
    printf("&g_test = %p\n", &g_test);
    printf("&func = %p\n", &func);
    printf("&main = %p\n", &main);
	
    return 0;
}

