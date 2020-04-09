#include <stdio.h>

extern char* g_name;

int main()
{
    define_print();
    
    printf("main() : %s\n", g_name);
    
    return 0;
}
