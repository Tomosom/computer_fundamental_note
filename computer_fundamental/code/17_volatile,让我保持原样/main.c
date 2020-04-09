#include <stdio.h>
#include <pthread.h>

extern const int g_ready;

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
