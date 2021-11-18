#include <stdio.h>

int g_global = 0;
int g_test = 1;

extern int* g_pointer;
extern void func();

int main(int argc, char *argv[])
{
    printf("&g_global = %p\n", &g_global);
    printf("&g_test = %p\n", &g_test);
    printf("&g_pointer = %p\n", &g_pointer);
    printf("g_pointer = %p\n", g_pointer);
    printf("&func = %p\n", &func);
    printf("&main = %p\n", &main);
    
    func();
	
    return 0;
}

