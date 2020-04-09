#include <stdio.h>
#include <pthread.h>
#include <unistd.h>

int g_ready = 0;

void* init_device(void* args)
{
    sleep(5);

    g_ready = 1;

    printf("init_device() - device status : g_ready = %d\n", g_ready);
}

void launch_device()
{
    pthread_t tid = 0;

    pthread_create(&tid, NULL, init_device, NULL);
}
