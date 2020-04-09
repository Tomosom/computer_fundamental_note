#include <stdio.h>
#include "timer.h"

void callback_1(Timer* t, void* data)
{
    printf("I'm callback for t1.\n");
}

int main()
{
    Timer* t1 = NULL;
    
    TimerInitialize();
    
    t1 = CreateTimer(1000, callback_1, NULL);
    
    getchar();
    
    DestroyTimer(t1);
    
    TimerFinalize();
    
    return 0;
}