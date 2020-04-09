#include <stdio.h>
#include <stdlib.h>
#include "error.h"
#include "errtmr.h"

void demo1()
{
    error_t err = ERROR_T(ERROR_TIMER_ALLOC_NOTIMER);
    
    printf("Module Timer: %X\n", MODULE_TIMER);
    printf("Error Sample: %X\n", err);
    printf("Error Mark: %X\n", (err & ERROR_MARK) != 0);
    printf("Module ID: %X\n", MODULE_ID(err));
    printf("Module Error ID: %X\n", MODULE_ERROR(err));
}

#define HANDLER(err) do {    \
    int e=err;               \
    if((e & ERROR_MARK) &&   \
        !err_handler(e))     \
        exit(e);             \
} while(0)

#define LOG(f, e)  printf("%s [%s:%d] => %X\n", #f, __FILE__, __LINE__, e)

int do_task()
{
    // ... ... 
    
    return 0; //ERROR_T(ERROR_TIMER_STATE_INVSTATE);
}

int sub_func()
{
    int ret = 0;
    
    ret = do_task();
    
    if(ret & ERROR_MARK)
        LOG(sub_func, ret);
    
    // return 0 for no exception
    return ret; 
}

int err_handler(int e)
{
    int ret = 0;

    if( e & ERROR_MARK )
        switch(e ^ ERROR_MARK)
        {
            // handle something unexcepted 
            case ERROR_TIMER_STATE_INVSTATE:
                printf("Reset Timer State!!!\n");
                ret = 1;
                break;
        }
    else
        ret = 1;
    
    // return 1 for success handling
    return ret; 
}

void demo2()
{
    printf("demo2() begin ...\n");
    
    HANDLER(sub_func());
    
    printf("demo2() end ...\n");
}

int main()
{
    demo1();
    
    printf("\n");
    
    demo2();
    
    return 0;
}