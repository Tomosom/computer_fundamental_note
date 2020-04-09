#include <stdio.h>

int sum(int n)
{
    int ret = 0;
    
    if( n > 0 )
    {
        ret = n + sum(n - 1);
    }
    
    return ret;
}

int main()
{
    int s = 0;
    
    s = sum(10);
    
    printf("sum = %d\n", s);
    
    return 0;
}
