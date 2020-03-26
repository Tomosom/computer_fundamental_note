# GDB简介
- 什么是 GDB ?
    - GUN项目中的调试器(gun debuger)
    - <font color=red>能够跟踪程序的执行</font>, 也能够<font color=red>恢复程序崩溃前的状态</font>
- 为什么需要 GDB ?
    - 软件不是一次性开发完成的(是软件就有bug, 是程序就有问题)
    - 调试是软件开发过程中不可或缺的技术(调试工具很重要)

- GDB 的常规应用
    - 自定义程序的启动方式 (指定影响程序运行的参数)
    - 设置条件断点 (在条件满足时暂停程序的执行)
    - 回溯检查导致程序异常结束的原因 (Core Dump)
        > 比 addr2line 更方便
    - 动态改变程序执行流 (定位问题的辅助方式)
        > 跳过某一行语句的执行

    > GDB 与前面讲的GUN工具集的区别:
    > GUN工具集 : 静态分析工具, 目标是程序文件
    > GDB : 动态分析工具, 目标是进程

# GDB 的启动方式
- 直接启动
    - gdb
    - gdb <font color=blue>test.out</font>
    - gdb <font color=blue>test.out</font> core
 - 动态链接
     - gdb <font color=blue>test.out</font> pid

# GDB 应用示例
- 应用示例一
    <pre>
    - delphi@delphi-vm:~$ <font color=blue>gdb</font>      // 启动
    - (gdb) <font color=blue>file</font> <font color=purple>test.out</font>          // 载入目标程序
    - (gdb) <font color=blue>set args</font> <font color=purple>arg1 arg2</font>     // 设置命令行参数
    - (gdb) <font color=blue>run</font>                    // 执行目标程序
    </pre>
    ![](_v_images_11/1.png)

- 应用示例二 - 跟踪某个进程的执行
    <pre>
    - delphi@delphi-vm:~$ <font color=blue>gdb</font>      // 启动
    - (gdb) <font color=blue>attach</font> <font color=purple>pid</font>             // 链接到目标进程, 链接成功后
                                   // 目标进程将停止执行
    - (gdb) <font color=blue>continue</font>               // 恢复执行
    </pre>
    ![](_v_images_11/2.png)

# 实验
func.c
```c
#include <stdio.h>
int *g_pointer;
void func()
{
    *g_pointer = 98;
    return;
}
```
test.c
```c
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

    for(i = 0; i < 10; i++) {
        fa[i%3]();
        sleep(argc > 1);
    }

    printf("g_pointer = %p\n", g_pointer);
    func();

    printf("main() : end...\n");
    return 0;
}
```
编译运行, 出现段错误
<pre style=" background-color:#fff">
$ gcc <font color=red>-g</font> *.c
$ ./a.out
main() : begin...
argv[0] = ./a.out
test_1() : 0x40063a
test_2() : 0x400655
test_3() : 0x400670
test_1() : 0x40063a
test_2() : 0x400655
test_3() : 0x400670
test_1() : 0x40063a
test_2() : 0x400655
test_3() : 0x400670
test_1() : 0x40063a
g_pointer = (nil)
Segmentation fault (core dumped)
</pre>

让程序崩溃时产生core文件
<pre style=" background-color:#fff">
$ ulimit -c unlimited
</pre>


> 不能在中文路径下生成 core 文件
> 将 `ulimit -c unlimited` 放置于 `/etc/profile` 可不用每次手动敲命令

