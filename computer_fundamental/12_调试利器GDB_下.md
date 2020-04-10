# 数据断点
- 数据断点
    - GDB 中支持<font color=red>数据断点</font>的设置
    - watch 命令用于<font color=blue>监视变量是否被改变</font> (本质为硬件断点)
    - watch 命令的用法 : <font color=green>watch var_name</font>
    >1. 数据断点不像软件断点和硬件断点, 当程序执行到某个特殊的代码行时, 就停止运行. 
    >2. 数据断点是当我们感兴趣的某个变量改变了,就起作用, 当前程序的执行就会暂停, 并且GDB会提示我们哪个变量被改变了
    >3. 数据断点的本质是硬件断点, 需要硬件的支持才可以起作用, 因此数据断点的数量也是有限的

## GDB 中的内存查看 (数据断点的使用往往要配合此命令)
- GDB 中可以检查任意内存区域中的数据
- 命令语法 : <font color=blue>x</font> <font color=red>/Nuf</font> <font color=purple>expression</font>
    - N - 需要打印的单元数
    - u - 每个单元的大小
    - f - 数据打印的格式
    > 例 : x /4bx 0x804a024
- x 命令中参数 u 对应的单位

    | 格式 | 打印方式 |
    | --- | ------- |
    | b    | 单字节   |
    | h    | 双字节   |
    | w    | 四字节   |
    | g    | 八字节   |

- GDB 中的打印格式

    | 格式 |   打印方式   |
    | --- | ----------- |
    | x    | 十六进制     |
    | d    | 有符号十进制 |
    | u    | 无符号十进制 |
    | o    | 八进制      |
    | t    | 二进制      |
    | a    | 地址        |
    | c    | 字符        |
    | f    | 浮点数      |

- 示例 : 判断系统大小端
<pre style=" background-color:#fff">
(gdb) <font color=blue>set</font> var = 1    // 此方式复制error, 还是得依赖c程序
(gdb) <font color=blue>print</font> <font color=red>/a</font> &var
$1 = 0x804a024 &lt;var&gt;
(gdb) <font color=blue>x</font> <font color=red>/4bx</font> 0x804a024
0x804a024 &lt;var&gt;:   0x01    0x00    0x00    0x00
(gdb) <font color=blue>x</font> <font color=red>/1bx</font> 0x804a024
0x804a024 &lt;var&gt;:   0x01    // 代表该系统为小端
</pre>

- 实测

main.c
```c
#include <stdio.h>
int a;
int main(int argc, char **argv)
{
        return 0;
}
```

<pre style=" background-color:#fff">
$ gcc -g main.c
$ gdb a.out
GNU gdb (Ubuntu 7.11.1-0ubuntu1~16.5) 7.11.1
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from a.out...done.
(gdb) <font color=blue>start</font>
Temporary breakpoint 1 at 0x4004e1: file main.c, line 5.
Starting program: /home/.../11_GDB_Debugging_weapon_1/code/a.out

Temporary breakpoint 1, main (argc=1, argv=0x7fffffffe368) at main.c:5
5               return 0;
(gdb) <font color=blue>set</font> var a=1
(gdb) <font color=blue>print</font> <font color=red>/a</font> &a
$1 = 0x601034 &lt;a&gt;
(gdb) <font color=blue>x</font> <font color=red>/4bx</font> 0x601034
0x601034 &lt;a&gt;:   0x01    0x00    0x00    0x00
(gdb) <font color=blue>x</font> <font color=red>/1bx</font> 0x601034
0x601034 &lt;a&gt;:   0x01
</pre>

## [<u>实验 - 变量断点和内存查看</u>](code/12_GDB_Debugging_weapon_2)
编译执行
<pre style=" background-color:#fff">
$ gcc -g watch.c -lpthread
$ ./a.out
g_var = 0
g_var = 0
g_var = 0
g_var = 0
g_var = 0
g_var = 1
g_var = 1
g_var = 1
g_var = 1
g_var = 1
</pre>
> Ubuntu16.04多线程编译问题 : 加了-lpthread后, 依然报错undefined reference to `pthread_create'
> 原因 : -lpthread应该在编译生成.o文件的时候加，<font color=red>而不是</font>在.o文件生成可执行文件的时候加
> 错误 : gcc -g -lpthread watch.c
> 正确 : gcc -g watch.c -lpthread

gdb调试
<pre style=" background-color:#fff">
$ gdb a.out
GNU gdb (Ubuntu 7.11.1-0ubuntu1~16.5) 7.11.1
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from a.out...done.
(gdb) <font color=blue>start</font>
Temporary breakpoint 1 at 0x400721: file watch.c, line 15.
Starting program: /home/.../12_GDB_Debugging_weapon_2/code/a.out
[Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".

Temporary breakpoint 1, main () at watch.c:15
15      {
(gdb) <font color=blue>watch</font> g_var    // 设置一个数据断点
Hardware watchpoint 2: g_var
(gdb) <font color=blue>info</font> breakpoints
Num     Type           Disp Enb Address            What
2       hw watchpoint  keep y                      g_var
(gdb) <font color=blue>continue</font>
Continuing.
[New Thread 0x7ffff77ef700 (LWP 4146)]
g_var = 0
g_var = 0
g_var = 0
g_var = 0
g_var = 0
[Switching to Thread 0x7ffff77ef700 (LWP 4146)]

Thread 2 "a.out" hit Hardware watchpoint 2: g_var

Old value = 0
New value = 1
thread_func (args=0x0) at watch.c:12    // 找到了变量值改变的地方
12      }
(gdb) <font color=blue>continue</font>
Continuing.
g_var = 1
[Thread 0x7ffff77ef700 (LWP 4146) exited]
g_var = 1
g_var = 1
g_var = 1
g_var = 1
[Inferior 1 (process 4131) exited normally]
(gdb)
</pre>

# 函数调用栈的查看
- 函数调用栈的查看 (backtrace 和 frame)
    - backtrace
        - 查看函数调用的顺序 (函数调用栈的信息)
        > 用于分析开源代码时, 比较方便 : 在感兴趣的函数处打上断点, 程序执行到该断点时, 就用backtrace查看
    - frame N
        - 切换到栈编号为 N 的上下文中
        > 我们可以任意跳转到当前函数调用过程中, 某一函数的上下文中
    - info frame
        - 查看当前函数调用的栈帧信息

- 什么是栈帧信息 ? (c进阶)
    > 函数调用的时候, 会产生一个`活动记录`, 这个`活动记录`就位于栈上面, 主要记录下图中的内容. 

    ![](_v_images_12/1.png)

- 深入 info 命令

    |      命令      |       功能说明       |
    | -------------- | -------------------- |
    | info register  | 查看当前寄存器的值     |
    | info args      | 查看当前函数参数的值   |
    | info locals    | 查看当前局部变量的值   |
    | info frame     | 查看当前栈帧的详细信息 |
    | info variables | 查看程序中的变量符号   |
    | info functions | 查看程序中的函数符号   |

## [<u>实验</u>](code/12_GDB_Debugging_weapon_2)
编译调试
<pre style=" background-color:#fff">
$ gcc -g frame.c
$ ./a.out
sum = 55
$ gdb a.out
GNU gdb (Ubuntu 7.11.1-0ubuntu1~16.5) 7.11.1
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word"...
Reading symbols from a.out...done.
(gdb) <font color=blue>start</font>
Temporary breakpoint 1 at 0x400562: file frame.c, line 17.
Starting program: /home/.../12_GDB_Debugging_weapon_2/code/a.out

Temporary breakpoint 1, main () at frame.c:17
17          int s = 0;
(gdb) <font color=blue>break sum if n==0</font>
Breakpoint 2 at 0x400531: file frame.c, line 5.
(gdb) <font color=blue>info breakpoints</font>
Num     Type           Disp Enb Address            What
2       breakpoint     keep y   0x0000000000400531 in sum at frame.c:5
        stop only if n==0
(gdb) <font color=blue>continue</font>
Continuing.

Breakpoint 2, sum (n=0) at frame.c:5
5           int ret = 0;
(gdb) <font color=blue>backtrace</font>
#0  sum (n=0) at frame.c:5
#1  0x000000000040054b in sum (n=1) at frame.c:9
#2  0x000000000040054b in sum (n=2) at frame.c:9
#3  0x000000000040054b in sum (n=3) at frame.c:9
#4  0x000000000040054b in sum (n=4) at frame.c:9
#5  0x000000000040054b in sum (n=5) at frame.c:9
#6  0x000000000040054b in sum (n=6) at frame.c:9
#7  0x000000000040054b in sum (n=7) at frame.c:9
#8  0x000000000040054b in sum (n=8) at frame.c:9
#9  0x000000000040054b in sum (n=9) at frame.c:9
#10 0x000000000040054b in sum (n=10) at frame.c:9
#11 0x0000000000400573 in main () at frame.c:19
(gdb) <font color=blue>next</font>
7           if( n > 0 )
(gdb) <font color=blue>next</font>
12          return ret;
(gdb) <font color=blue>info args</font>
n = 0
(gdb) <font color=blue>frame 7</font>
#7  0x000000000040054b in sum (n=7) at frame.c:9
9               ret = n + sum(n - 1);
(gdb) <font color=blue>info args</font>
n = 7
(gdb) <font color=blue>info locals</font>
ret = 0
(gdb) <font color=blue>frame 0</font>    // 返回
#0  sum (n=0) at frame.c:12
12          return ret;
(gdb) <font color=blue>info registers</font>
rax            0x0      0
rbx            0x0      0
rcx            0x0      0
rdx            0x7fffffffe378   140737488348024
rsi            0x7fffffffe368   140737488348008
rdi            0x0      0
rbp            0x7fffffffe080   0x7fffffffe080
rsp            0x7fffffffe060   0x7fffffffe060
r8             0x400610 4195856
r9             0x7ffff7de7ac0   140737351940800
r10            0x846    2118
r11            0x7ffff7a2d740   140737348032320
r12            0x400430 4195376
r13            0x7fffffffe360   140737488348000
r14            0x0      0
r15            0x0      0
rip            0x400555 0x400555 <sum+47>
eflags         0x246    [ PF ZF IF ]
cs             0x33     51
ss             0x2b     43
ds             0x0      0
es             0x0      0
fs             0x0      0
gs             0x0      0
(gdb) <font color=blue>info frame</font>
Stack level 0, frame at 0x7fffffffe090:
 rip = 0x400555 in sum (frame.c:12); saved rip = 0x40054b
 called by frame at 0x7fffffffe0c0
 source language c.
 Arglist at 0x7fffffffe080, args: n=0
 Locals at 0x7fffffffe080, Previous frame's sp is <font color=red>0x7fffffffe090</font>
 Saved registers:
  rbp at 0x7fffffffe080, rip at 0x7fffffffe088
(gdb) <font color=blue>x /1gx 0x7fffffffe080</font>
0x7fffffffe080: <font color=red>0x00007fffffffe0b0</font>
(gdb) <font color=blue>next</font>
13      }
(gdb) <font color=blue>next</font>
12          return ret;
(gdb) <font color=blue>info args</font>
n = 1
(gdb) <font color=blue>info registers</font>
rax            0x1      1
rbx            0x0      0
rcx            0x0      0
rdx            0x0      0
rsi            0x7fffffffe368   140737488348008
rdi            0x0      0
rbp            <font color=red>0x7fffffffe0b0</font>   0x7fffffffe0b0
rsp            0x7fffffffe090   <font color=red>0x7fffffffe090</font>
r8             0x400610 4195856
r9             0x7ffff7de7ac0   140737351940800
r10            0x846    2118
r11            0x7ffff7a2d740   140737348032320
r12            0x400430 4195376
r13            0x7fffffffe360   140737488348000
r14            0x0      0
r15            0x0      0
rip            0x400555 0x400555 <sum+47>
eflags         0x202    [ IF ]
cs             0x33     51
ss             0x2b     43
ds             0x0      0
es             0x0      0
fs             0x0      0
gs             0x0      0
(gdb)
</pre>


# 一些调试中的小技巧
- 一些调试中的小技巧

    |        操作         |            命令            |
    | ------------------ | ------------------------- |
    | 断点处自动打印       | display /f expression     |
    |                    | undisplay                 |
    | 查看程序中的符号     | whatis (前面的nm是静态查看) |
    |                    | ptype                     |
    | GDB 中的代码查看    | list                      |
    |                    | set listsize N            |
    | GDB 中的 shell 操作 | shell                     |

- 技巧示例 : 断点处自动打印
<pre style=" background-color:#fff">
(gdb) <font color=blue>shell</font> <font color=purple>gcc -g test.c -o test.out</font>
(gdb) <font color=blue>file</font> test.out
Reading symbols from /home/delphi/test.out...done.
(gdb) <font color=blue>start</font>
Temporary breakpoint 1 at 0x804846f: file test.c, line 33...
(gdb) <font color=blue>break</font> test.c:18
Breakpoint 2 at 0x80483ef: file test.c, line 18.
(gdb) <font color=blue>continue</font>
Continuing.
Breakpoint 2, func () at test.c:18
18                st[i].i = i;
(gdb) <font color=blue>display</font> <font color=red>/d</font> i
1: /d i = 0
(gdb) <font color=blue>display</font> <font color=red>/d</font> i*i
2: /d i*i = 0
(gdb) <font color=blue>display</font> <font color=red>/a</font> &i
3: /a &i = 0xbffff09c
</pre>

- 技巧示例 : 符号查看
<pre style=" background-color:#fff">
(gdb) <font color=blue>whatis</font> <font color=red>func</font>
type = int ()
(gdb) <font color=blue>ptype</font> <font color=red>func</font>
type = int ()
(gdb) <font color=blue>whatis</font> <font color=green>g_var</font>
type = int
(gdb) <font color=blue>ptype</font> <font color=green>g_var</font>
type = int
(gdb) <font color=blue>whatis</font> <font color=purple>struct ST</font>
type = struct ST
(gdb) <font color=blue>ptype</font> <font color=purple>struct ST</font>    // 差异点, 此处可详细打印结构体
type = struct ST {
    int i;
    int j;
}
</pre>

## [<u>实验</u>](code/12_GDB_Debugging_weapon_2)
编译调试
<pre style=" background-color:#fff">
$ gdb
GNU gdb (Ubuntu 7.11.1-0ubuntu1~16.5) 7.11.1
Copyright (C) 2016 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "x86_64-linux-gnu".
Type "show configuration" for configuration details.
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>.
Find the GDB manual and other documentation resources online at:
<http://www.gnu.org/software/gdb/documentation/>.
For help, type "help".
Type "apropos word" to search for commands related to "word".
(gdb) <font color=blue>shell cat tricks.c</font>
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
(gdb) <font color=blue>shell vi tricks.c</font>    // 打开vi编辑器
(gdb) <font color=blue>shell gcc -g tricks.c</font>    // 在GDB中编译
(gdb) <font color=blue>file a.out</font>
Reading symbols from a.out...done.
(gdb) <font color=blue>start</font>
Temporary breakpoint 1 at 0x400675: file tricks.c, line 30.
Starting program: /home/.../12_GDB_Debugging_weapon_2/code/a.out

Temporary breakpoint 1, main () at tricks.c:30
30          func();
(gdb) <font color=blue>break tricks.c:16</font>
Breakpoint 2 at 0x4005e5: file tricks.c, line 16.
(gdb) <font color=blue>list tricks.c:16</font>    // 查看设置断点处的代码, 默认显示10行
11      {
12          struct ST st[5] = {0};
13          int i = 0;
14
15          for(i = 0; i < 5; i++) {
16              st[i].i = i;
17              st[i].j = i * i;
18          }
19
20          for(i = 0; i < 5; i++) {
(gdb) <font color=blue>set listsize 20</font>    // 设置显示行数
(gdb) <font color=blue>show listsize</font>    // 查看是否设置成功
Number of source lines gdb will list by default is 20.
(gdb) <font color=blue>list tricks.c:16</font>    // 再次查看代码
6           int i;
7           int j;
8       };
9
10      int func()
11      {
12          struct ST st[5] = {0};
13          int i = 0;
14
15          for(i = 0; i < 5; i++) {
16              st[i].i = i;
17              st[i].j = i * i;
18          }
19
20          for(i = 0; i < 5; i++) {
21              printf("st[%d].i = %d\n", i, st[i].i);
22              printf("st[%d].j = %d\n", i, st[i].j);
23          }
24      }
25
(gdb) <font color=blue>continue</font>
Continuing.

Breakpoint 2, func () at tricks.c:16
16              st[i].i = i;
(gdb) <font color=blue>display /d i</font>    // 每次到断点自动打印
1: /d i = 0
(gdb) <font color=blue>display /d i*i</font>
2: /d i*i = 0
(gdb) <font color=blue>display /a &i</font>
3: /a &i = 0x7fffffffe23c
(gdb) <font color=blue>continue</font>
Continuing.

Breakpoint 2, func () at tricks.c:16
16              st[i].i = i;
1: /d i = 1
2: /d i*i = 1
3: /a &i = 0x7fffffffe23c
(gdb) <font color=blue>continue</font>
Continuing.

Breakpoint 2, func () at tricks.c:16
16              st[i].i = i;
1: /d i = 2
2: /d i*i = 4
3: /a &i = 0x7fffffffe23c
(gdb) <font color=blue>continue</font>
Continuing.

Breakpoint 2, func () at tricks.c:16
16              st[i].i = i;
1: /d i = 3
2: /d i*i = 9
3: /a &i = 0x7fffffffe23c
(gdb) <font color=blue>continue</font>
Continuing.

Breakpoint 2, func () at tricks.c:16
16              st[i].i = i;
1: /d i = 4
2: /d i*i = 16
3: /a &i = 0x7fffffffe23c
(gdb) <font color=blue>continue</font>
Continuing.
st[0].i = 0
st[0].j = 0
st[1].i = 1
st[1].j = 1
st[2].i = 2
st[2].j = 4
st[3].i = 3
st[3].j = 9
st[4].i = 4
st[4].j = 16
[Inferior 1 (process 4789) exited normally]
(gdb) <font color=blue>run</font>    // 再次直接run, 依旧会打印前边display设置的自动打印
Starting program: /home/.../12_GDB_Debugging_weapon_2/code/a.out

Breakpoint 2, func () at tricks.c:16
16              st[i].i = i;
1: /d i = 0
2: /d i*i = 0
3: /a &i = 0x7fffffffe23c
(gdb) <font color=blue>undisplay</font>    // 取消自动打印
Delete all auto-display expressions? (y or n) y
(gdb) <font color=blue>continue</font>
Continuing.

Breakpoint 2, func () at tricks.c:16
16              st[i].i = i;
(gdb) <font color=blue>print /d i</font>    // 想要查看只能手动打印
$1 = 1
</pre>
<pre style=" background-color:#fff">
(gdb) <font color=blue>whatis g_var</font>
type = int
(gdb) <font color=blue>ptype g_var</font>
type = int
(gdb) <font color=blue>whatis func</font>
type = int ()
(gdb) <font color=blue>ptype func</font>
type = int ()
(gdb) <font color=blue>whatis struct ST</font>
type = struct ST
(gdb) <font color=blue>ptype struct ST</font>    // 差异点
type = struct ST {
    int i;
    int j;
}
(gdb) <font color=blue>list tricks.c:1</font>
1       #include <stdio.h>
2
3       int g_var = 1;
4
5       struct ST {
6           int i;
7           int j;
8       };
9
10      int func()
11      {
12          struct ST st[5] = {0};
13          int i = 0;
14
15          for(i = 0; i < 5; i++) {
16              st[i].i = i;
17              st[i].j = i * i;
18          }
19
20          for(i = 0; i < 5; i++) {
</pre>
<pre style=" background-color:#fff">
(gdb) <font color=blue>info variables</font>    //查看定义了哪些全局符号
All defined variables:

File ../csu/init-first.c:
int __libc_argc;
char **__libc_argv;
int __libc_multiple_libcs;

File ../elf/dl-sysdep.c:
int __GI___libc_enable_secure;
void *__GI___libc_stack_end;
int __libc_enable_secure;
int __libc_multiple_libcs;
void *__libc_stack_end;
void *_dl_random;

File ../login/utmp_file.c:
const struct utfuncs __libc_utmp_file_functions;
static int file_fd;
static off64_t file_offset;
static _Bool file_writable;
static struct utmp last_entry;

File ../misc/syslog.c:
static int LogFacility;
static int LogFile;
static int LogMask;
static int LogStat;
static const char *LogTag;
static int LogType;
---Type &lt;return&gt; to continue, or q &lt;return&gt; to quit---q    // enter翻页查看, q退出
Quit
(gdb) <font color=blue>info functions</font>    // 查看用了哪些函数
All defined functions:

File ../bits/stdlib-bsearch.h:
void *__GI_bsearch(const void *, const void *, size_t, size_t, __compar_fn_t);

File ../csu/init-first.c:
void __libc_init_first(int, char **, char **);
void _dl_start(void);
void _init(int, char **, char **);

File ../csu/libc-start.c:
int __libc_start_main(int (*)(int, char **, char **), int, char **, int (*)(int, char **, char **), void (*)(void), void (*)(void), void *);

File ../debug/memmove_chk.c:
void *__memmove_chk_sse2(void *, const void *, size_t, size_t);

File ../elf/dl-runtime.c:
void _dl_call_pltexit(struct link_map *, Elf64_Word, const void *, void *);
Elf64_Addr _dl_fixup(struct link_map *, Elf64_Word);
Elf64_Addr _dl_profile_fixup(struct link_map *, Elf64_Word, Elf64_Addr, void *, long *);

File ../elf/dl-sysdep.c:
void _dl_show_auxv(void);
Elf64_Addr _dl_sysdep_start(void **, void (*)(const Elf64_Phdr *, Elf64_Word, Elf64_Addr *, Elf64_auxv_t *));
void _dl_sysdep_start_cleanup(void);

File ../iconv/skeleton.c:
int __gconv_transform_ascii_internal(struct __gconv_step *, struct __gconv_step_data *, const unsigned char **, const unsigned char *, unsigned char **, size_t *, int, int);
int __gconv_transform_internal_ascii(struct __gconv_step *, struct __gconv_step_data *, const unsigned char **, const unsigned char *, unsigned char **, size_t *, int, int);
---Type &lt;return&gt; to continue, or q &lt;return&gt; to quit---q    // enter翻页查看, q退出
Quit
(gdb) <font color=blue>q</font>
A debugging session is active.

        Inferior 1 [process 4800] will be killed.

Quit anyway? (y or n) y
</pre>

# 小结
- GDB 支持<font color=red>数据断点</font>的设置 (一种类型的硬件断点)
- watch 用于<font color=purple>监视变量</font>是否被改变, x用于<font color=purple>查看内存中的数据</font>
- GDB 支持函数调用栈的查看 (backtrace, info frames)
- GDB 支持运行时对程序中的符号进行查看 (whatis, ptype)
