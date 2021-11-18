#include <stdio.h>
#include <pthread.h>

#if 0

extern const int g_ready; // 此处声明const 表示仅在当前文件, 该变量具有只读属性
//extern int g_ready;   // 若不用const, 则不会出现这个问题

#else   // 解决方案

extern const volatile int g_ready;

#endif

int main()
{
    launch_device();


    while( g_ready == 0 )
    {
        sleep(1);
        
        printf("main() - launching device : g_ready = %d\n", g_ready);
    }
    
    printf("main() - device status : g_ready = %d\n", g_ready);

    return 0;
}
