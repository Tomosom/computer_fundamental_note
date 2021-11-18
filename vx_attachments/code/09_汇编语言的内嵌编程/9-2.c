#include <stdio.h>

int main()
{
    char* s = "D.T.Software\n";
    int l = 13;
    
    printf("main begin\n");
    
    asm volatile(
        "movl $4, %%eax\n"
        "movl $1, %%ebx\n"
        "movl %0, %%ecx\n"
        "movl %1, %%edx\n"
        "int $0x80     \n"
        :
        : "r"(s), "r"(l)
        : "eax", "ebx", "ecx", "edx"
    );
    
    
    asm volatile(
        "movl $1,  %eax\n"
        "movl $42, %ebx\n"
        "int $0x80     \n"
    );
    
    
    printf("main end\n");
    
    return 0;
}