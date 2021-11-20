# 嵌入式开发中的常见情形
![](vx_images/_v_images_17/1.png)
![](vx_images/_v_images_17/2.png)

# [<u>实验 - 设备启动及初始化</u>](vx_attachments/code/17_volatile,让我保持原样)

正常编译执行, 结果ok

<pre style=" background-color:#fff">
$ gcc device.c main.c -lpthread
$ ./a.out
main() - launching device : g_ready = 0
main() - launching device : g_ready = 0
main() - launching device : g_ready = 0
main() - launching device : g_ready = 0
init_device() - device status : g_ready = 1
main() - launching device : g_ready = 1
main() - device status : g_ready = 1
</pre>

实际工程发布代码时,编译时均会加上 -On 选项进行优化
编译运行结果不一致

<pre style=" background-color:#fff">
$ gcc device.c main.c -lpthread -O3
$ ./a.out
main() - launching device : g_ready = 0
main() - launching device : g_ready = 0
main() - launching device : g_ready = 0
main() - launching device : g_ready = 0
init_device() - device status : g_ready = 1
main() - launching device : g_ready = 0
main() - launching device : g_ready = 0
main() - launching device : g_ready = 0
main() - launching device : g_ready = 0
main() - launching device : g_ready = 0
main() - launching device : g_ready = 0
(死循环)
</pre>

- 问题分析
    - 编译优化时, 编译器根据当前文件进行优化 (根据前面所讲, 也是根据当前文件进行编译)
    - 编译器能够发现变量 <font color=blue>"不可能" 被改变</font> (const 全局变量)
    - 为了效率上的提高, <font color=#d0d>编译将变量值进行缓存</font>
    - 缓存的方式为 : <font color=blue>把变量值从内存中读取进入寄存器</font>
    - <font color=red>每次访问变量时直接从寄存器读取对应值</font>

    > 寄存器的访问速度远远高于内存的访问速度

- 解决方案
    - 使用 <font color=blue>volatile</font> 修饰可能<font color=red>被 "意外" 修改的变量</font> (内存)
        - <font color=blue>volatile</font> 修饰的变量是一种 <font color=red>"易变的" </font>变量
        - <font color=blue>volatile</font> 可理解为 <font color=#d0d>"编译器警告指示字"</font>
        - <font color=blue>volatile</font> 告诉编译器<font color=#d0d>必须每次去内存中取变量值</font>

# [<u>实验 - 使用 volatile 修饰变量</u>](vx_attachments/code/17_volatile,让我保持原样)

main.c中 `extern const int g_ready;` 更改为 `extern const volatile int g_ready;`
define.c中 `int g_ready = 0;` 更改为 `volatile int g_ready = 0;`
再次编译运行, 结果OK

<pre style=" background-color:#fff">
$ gcc device.c main.c -lpthread -O3
$ ./a.out
main() - launching device : g_ready = 0
main() - launching device : g_ready = 0
main() - launching device : g_ready = 0
main() - launching device : g_ready = 0
init_device() - device status : g_ready = 1
main() - launching device : g_ready = 1
main() - device status : g_ready = 1
</pre>


# 问题
- 如何理解 <font color=blue>const</font> 和 <font color=blue>volatile</font> 同时修饰变量 ? <font color=red>在语义上是否矛盾 ?</font>

- const 和 volatile
    - <font color=blue>const</font> 表示被修饰的变量<font color=#d0d>不能出现在赋值符号左边</font>
    - <font color=blue>volatile</font> 表示使用变量时<font color=blue>直接从内存取值</font>
    - <font color=blue>const</font> 和 <font color=blue>volatile</font> 同时修饰变量时<font color=red>互不影响</font>其含义

    ![](vx_images/_v_images_17/3.png)

- [<u>const 实验</u>](vx_attachments/code/17_volatile,让我保持原样/const_test)

<pre style=" background-color:#fff">
$ gcc main.c
$ ./a.out
var = 1
var = 2
</pre>

> const定义的不是一个常量, 而是一个只读变量
> const修饰的变量不能直接被改变, 不代表不能间接被改变

# 小结
- 编译优化时, <font color=blue>编译器只根据当前文件进行优化</font>
- 编译器的优化策略可能造成一些 "意外"
- <font color=blue>volatile</font> 强制编译器必须<font color=#d0d>每次从内存中取变量值</font>
- <font color=blue>const</font> 和 <font color=blue>volatile</font> 同时修饰变量时<font color=red>互不影响</font>其含义
