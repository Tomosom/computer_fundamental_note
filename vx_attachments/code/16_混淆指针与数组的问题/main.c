#include <stdio.h>

extern char* g_name;
//extern char g_name[];

int main()
{
    define_print();
#if 1    
    printf("main() : %s\n", g_name);
#else
    printf("main() : %c\n", *((char *)&g_name));
    printf("main() : %c\n", *((char *)&g_name + 1));
    printf("main() : %c\n", *((char *)&g_name + 2));
    printf("main() : %c\n", *((char *)&g_name + 3));
#endif
    return 0;
}
