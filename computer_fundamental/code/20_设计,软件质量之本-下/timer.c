/**************************************************
 *                                                *
 *                  D.T.Software                  *
 *                                                *
 **************************************************/


#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include "timer.h"

#define MAX 32
#define GAP 10

struct STimer
{
    int id;
    int interval;
    int current;
    int in_callback;
    int to_delete;
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
                    st->in_callback = 1;
                    st->callback(st, st->data);
                    st->in_callback = 0;
                    
                    st->current = 0;
                    
                    if( st->to_delete )
                    {
                        g_timers[st->id] = NULL;
            
                        free(st);
                    }
                }
            }
        }
        
        pthread_mutex_unlock(&mutex);  
        
        usleep(GAP * 1000);
    }
    
    for(i=0; i<MAX; i++)
    {
        free(g_timers[i]);
    }
}


void TimerInitialize()
{
    if( !g_run )
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
        
        if( st->in_callback )
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

