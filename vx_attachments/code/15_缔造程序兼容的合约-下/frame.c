#include <stdio.h>

#define PRINT_STACK_FRAME_INFO() do                        \
{                                                          \
    char* ebp = NULL;                                      \
    char* esp = NULL;                                      \
                                                           \
                                                           \
    asm volatile (                                         \
        "movl %%ebp, %0\n"                                 \
        "movl %%esp, %1\n"                                 \
        : "=r"(ebp), "=r"(esp)                             \
        );                                                 \
                                                           \
   printf("ebp = %p\n", ebp);                              \
   printf("previous ebp = 0x%x\n", *((int*)ebp));          \
   printf("return address = 0x%x\n", *((int*)(ebp + 4)));  \
   printf("previous esp = %p\n", ebp + 8);                 \
   printf("esp = %p\n", esp);                              \
   printf("&ebp = %p\n", &ebp);                            \
   printf("&esp = %p\n", &esp);                            \
} while(0)

void test(int a, int b)
{
    int c = 3;
    
    printf("test() : \n");
    
    PRINT_STACK_FRAME_INFO();
    
    printf("&a = %p\n", &a);
    printf("&b = %p\n", &b);
    printf("&c = %p\n", &c);
}

void func()
{
    int a = 1;
    int b = 2;
    
    printf("func() : \n");
    
    PRINT_STACK_FRAME_INFO();
    
    printf("&a = %p\n", &a);
    printf("&b = %p\n", &b);
    
    test(a, b);
}

int main()
{
    printf("main() : \n");
    
    PRINT_STACK_FRAME_INFO();
    
    func();

    return 0;
}