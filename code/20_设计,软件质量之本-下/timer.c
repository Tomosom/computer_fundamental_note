/**************************************************
 *                                                *
 *                  D.T.Software                  *
 *                                                *
 **************************************************/


#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include "timer.h"

#define MAX 32 // 最多支持32个定时器同时工作
#define GAP 10

struct STimer
{
    int id;
    int interval;
    int current;
    int in_callback; // 防御性编程2 : add
    int to_delete; // 防御性编程2 : add
    TimerCallback* callback;
    void* data;
};

static struct STimer* g_timers[MAX];
static volatile int g_run;
static pthread_mutex_t mutex;

static void* Runtime(void* args)
{
    int i = 0;
    
    while( g_run )
    {     
        pthread_mutex_lock(&mutex); 
        
        for(i=0; (i<MAX) && g_run; i++)
        {
            struct STimer* st = g_timers[i];
            
            if( (st != NULL) && (st->callback != NULL) )
            {
                st->current += GAP;
            
                if( st->current >= st->interval )
                {
                    st->in_callback = 1; // 防御性编程2 : add
                    st->callback(st, st->data);
                    st->in_callback = 0; // 防御性编程2, 在进行定时器的回调操作时,不能进行destroy操作
                    
                    st->current = 0; // 防御性编程2, 若无上面一行, 回调操作时destroy定时器, st将变为野指针
                    
                    if( st->to_delete ) // 防御性编程2 : add
                    {
                        g_timers[st->id] = NULL;
            
                        free(st);
                    }
                }
            }
        }
        
        pthread_mutex_unlock(&mutex);  
        
        usleep(GAP * 1000); // 使用了软件上的时钟源
    }
    
    for(i=0; i<MAX; i++)
    {
        free(g_timers[i]);
    }
}


void TimerInitialize()
{
    if( !g_run ) // 防御性编程1 : TimerInitialize只能初始化一次
    {
        pthread_t tid = 0;
        
        g_run = 1;

        pthread_create(&tid, NULL, Runtime, NULL);
    }
}

void TimerFinalize()
{
    g_run = 0;
}

Timer* CreateTimer(int interval, TimerCallback* callback, void* data)
{
    int id = 0;
    struct STimer* ret = (struct STimer*)malloc(sizeof(struct STimer));
    
    if( ret != NULL )
    { 
        pthread_mutex_lock(&mutex);   
        
        for(id=0; id<MAX; id++)
        {
            if( g_timers[id] == NULL )
            {
                g_timers[id] = ret;
                break;
            }
        }
        
        pthread_mutex_unlock(&mutex);
        
        if( id < MAX )
        {
            ret->id = id;
            ret->interval = interval;
            ret->current = 0;
            ret->to_delete = 0;
            ret->in_callback = 0;
            ret->callback = callback;
            ret->data = data;
        }
        else
        {
            free(ret);
            ret = NULL;
        }
    }
    
    return ret;
}

void DestroyTimer(Timer* timer)
{
    if( timer != NULL )
    {
        struct STimer* st = (struct STimer*)timer;
        
        if( st->in_callback )     // 防御性编程2: 修补
        {
            st->to_delete = 1;
        }
        else
        {
            pthread_mutex_lock(&mutex);   
        
            g_timers[st->id] = NULL;
            
            pthread_mutex_unlock(&mutex);   
            
            free(st);
        }
    }
}

