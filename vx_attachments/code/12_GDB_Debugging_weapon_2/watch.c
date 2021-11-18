#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

int g_var = 0;

void *thread_func(void *args)
{
    sleep(5);
    
    g_var = 1;
}

int main()
{
    int i = 0;
    pthread_t tid = 0;
    
    pthread_create(&tid, NULL, thread_func, NULL);
    
    for(i = 0; i < 10; i++) {
        printf("g_var = %d\n", g_var);

        sleep(1);
    }
}
