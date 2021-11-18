#include <stdio.h>

int s1;
extern int s2;

int main()
{
    printf("&s1 = %p\n", &s1);
    printf("&s2 = %p\n", &s2);
    
    return 0;
}