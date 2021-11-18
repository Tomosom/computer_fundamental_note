#include <stdio.h>
#include <unistd.h>
extern int *g_pointer;
extern void func();

void test_1()
{
    printf("test_1() : %p\n", test_1);
}

void test_2()
{
    printf("test_2() : %p\n", test_2);
}

void test_3()
{
    printf("test_3() : %p\n", test_3);
}
int main(int argc, char *argv[])
{
    typedef void(TFunc)();
    TFunc* fa[] = { test_1, test_2, test_3 };
    int i = 0;

    printf("main() : begin...\n");

    for(i = 0; i < argc; i++) {
        printf("argv[%d] = %s\n", i, argv[i]);
    }

    for(i = 0; i < 100; i++) {
        fa[i%3]();
        sleep(argc > 1);
    }

    printf("g_pointer = %p\n", g_pointer);
    func();

    printf("main() : end...\n");
    return 0;
}
