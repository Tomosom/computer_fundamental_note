#include <stdio.h>

int test()
{
    int a[3] = {0};
    int* p = a;
    
    p[0] = 1;  // a[0] = 1
    p[1] = 2;  // a[1] = 2
    
    a[2] = 3;  // p[2] = 3
}

int main()
{
    test();

    return 0;
}
