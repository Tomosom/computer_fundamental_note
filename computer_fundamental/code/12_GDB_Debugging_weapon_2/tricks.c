#include <stdio.h>

int g_var = 1;

struct ST {
    int i;
    int j;
};

int func()
{
    struct ST st[5] = {0};
    int i = 0;
    
    for(i = 0; i < 5; i++) {
        st[i].i = i;
        st[i].j = i * i;
    }
    
    for(i = 0; i < 5; i++) {
        printf("st[%d].i = %d\n", i, st[i].i);
        printf("st[%d].j = %d\n", i, st[i].j);
    }
}

int main()
{
    static int c_var = 2;
	
    func();
	
    return 0;
}
