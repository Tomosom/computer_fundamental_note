#include <stdio.h>
#include <stdlib.h>
#include "error.h"
#include "errtmr.h"
#include "errheap.h"

#define LOG(f, e)  printf("%s [%s:%d] => %s\n", #f, __FILE__, __LINE__, errstr(e))

int main()
{
	error_t err = ERROR_T(ERROR_TIMER_STATE_INVSTATE);
	
	LOG(main, err);
	
    return 0;
}
