#include <stdio.h>

int test(int a, int b, int c)
{
    return a + b + c;
}

void __attribute__((__cdecl__)) func_1(int i)
{
}

void __attribute__((__stdcall__)) func_2(int i)
{
}

void __attribute__((__fastcall__)) func_3(int i)
{
}

int main()
{
    int r = test(1, 2, 3);
    
    printf("r = %d\n", r);
    
    return 0;
}