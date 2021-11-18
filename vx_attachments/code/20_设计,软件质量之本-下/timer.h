/**************************************************
 *                                                *
 *                  D.T.Software                  *
 *                                                *
 **************************************************/

#ifndef _TIMER_H_
#define _TIMER_H_

typedef void Timer;
typedef void(TimerCallback)(Timer*, void*);

void TimerInitialize();
void TimerFinalize();
Timer* CreateTimer(int interval, TimerCallback* callback, void* data);
void DestroyTimer(Timer* timer);

#endif