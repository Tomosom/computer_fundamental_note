#include <stdio.h>

struct {
    short s : 9;
    int j : 9;
    char c;
    short t : 9;
    short u : 9;
    char d;
} s;

int main(int argc, char* argv[])
{
    int i = 0;
    int* p = (int*)&s;

    printf("sizeof = %d\n", sizeof(s));

    s.s = 0x1FF;
    s.j = 0x1FF;
    s.c = 0xFF;
    s.t = 0x1FF;
    s.u = 0x1FF;
    s.d = 0xFF;

    for(i=0; i<sizeof(s)/sizeof(*p); i++)
    {
        printf("%X\n", *p++);
    }
    

    return 0;
}