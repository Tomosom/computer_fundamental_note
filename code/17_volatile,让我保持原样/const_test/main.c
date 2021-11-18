#include <stdio.h>

int main()
{
    const int var = 1;
    
    printf("var = %d\n", var);
    
#if 0   // 编译error

    var = 2;

#else   // 间接改变const修饰的变量的值

    int *p = (int *)&var; // 不加强转会告警
    *p = 2;

#endif
    
    printf("var = %d\n", var);

    return 0;
}
