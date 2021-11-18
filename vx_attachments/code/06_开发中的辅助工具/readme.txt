1. addr2line
    IP寄存器?

2. nm
    $ ls
    func.c  test.c
    $ gcc -g -c test.c -o test.o
    $ gcc -g -c func.c -o func.o
    $ ls
    func.c  func.o  test.c  test.o
    
    // T:代码段. func.o仅仅是编译得到的目标文件,不是最终的可执行文件(仅仅编译了还没链接),有些符号的最终地址是还没有确定的,因此标识符func地址为0000000000000000,代表在当前的func.o这个文件里面,func这个标识符相对于代码段的起始地址的偏移是0000000000000000.
    // C:在编译的时候不知该位于什么段, 0000000000000008仅代表g_pointer占用8个字节的内存
    $ nm func.o
    0000000000000000 T func
    0000000000000008 C g_pointer

    // U:代表未定义的. 在test.o里边要使用func,但是不知道func是什么,链接之后才知道
    // B:BSS(Block Started by Symbol)段. 前面的数值表示这个标识符相对于BSS段的偏移
    // D:data段. 前面的数值表示这个标识符相对于数据段的偏移
    // printf不是我们定义的,是C库里边定义的
    $ nm test.o
                     U func
    0000000000000000 B g_global
                     U g_pointer
    0000000000000000 D g_test
    0000000000000000 T main
                     U printf

    // g_pointer已被链接过
    $ gcc func.o test.o -o test.out
    $ nm test.out
    000000000060103c B __bss_start
    0000000000601040 b completed.7594
    0000000000601028 D __data_start
    0000000000601028 W data_start
    0000000000400460 t deregister_tm_clones
    00000000004004e0 t __do_global_dtors_aux
    0000000000600e18 t __do_global_dtors_aux_fini_array_entry
    0000000000601030 D __dso_handle
    0000000000600e28 d _DYNAMIC
    000000000060103c D _edata
    0000000000601050 B _end
    0000000000400654 T _fini
    0000000000400500 t frame_dummy
    0000000000600e10 t __frame_dummy_init_array_entry
    0000000000400818 r __FRAME_END__
    0000000000400526 T func
    0000000000601044 B g_global
    0000000000601000 d _GLOBAL_OFFSET_TABLE_
                     w __gmon_start__
    00000000004006c8 r __GNU_EH_FRAME_HDR
    0000000000601048 B g_pointer
    0000000000601038 D g_test
    00000000004003c8 T _init
    0000000000600e18 t __init_array_end
    0000000000600e10 t __init_array_start
    0000000000400660 R _IO_stdin_used
                     w _ITM_deregisterTMCloneTable
                     w _ITM_registerTMCloneTable
    0000000000600e20 d __JCR_END__
    0000000000600e20 d __JCR_LIST__
                     w _Jv_RegisterClasses
    0000000000400650 T __libc_csu_fini
    00000000004005e0 T __libc_csu_init
                     U __libc_start_main@@GLIBC_2.2.5
    000000000040053b T main
                     U printf@@GLIBC_2.2.5
    00000000004004a0 t register_tm_clones
    0000000000400430 T _start
    0000000000601040 D __TMC_END__

    // 对比地址,发现一致
    $ ./test.out
    &g_global = 0x601044
    &g_test = 0x601038
    &g_pointer = 0x601048
    g_pointer = (nil)
    &func = 0x400526
    &main = 0x40053b
    Segmentation fault (core dumped)
    
3. objdump
    $ ls
    func.c  test.c
    $ gcc -c -g func.c -o func.o
    $ ls
    func.c  func.o  test.c

    打印目标文件对应的汇编代码
        $ objdump -d func.o

        func.o:     file format elf64-x86-64


        Disassembly of section .text:

        0000000000000000 <func>:
           0:   55                      push   %rbp
           1:   48 89 e5                mov    %rsp,%rbp
           4:   48 8b 05 00 00 00 00    mov    0x0(%rip),%rax        # b <func+0xb>
           b:   ba 00 00 00 00          mov    $0x0,%edx
          10:   89 10                   mov    %edx,(%rax)
          12:   90                      nop
          13:   5d                      pop    %rbp
          14:   c3                      retq

    当目标文件有调试信息时(-g),使用-S可查看汇编到源码的映射
    用途 : 判断是否语言误用, 或编译器在编译过程中没有优化好,造成的时序上的bug
        $ objdump -S func.o

        func.o:     file format elf64-x86-64


        Disassembly of section .text:

        0000000000000000 <func>:
        #include <stdio.h>

        int* g_pointer;

        void func()
        {
           0:   55                      push   %rbp
           1:   48 89 e5                mov    %rsp,%rbp
                *g_pointer = (size_t)"D.T.Software";
           4:   48 8b 05 00 00 00 00    mov    0x0(%rip),%rax        # b <func+0xb>
           b:   ba 00 00 00 00          mov    $0x0,%edx
          10:   89 10                   mov    %edx,(%rax)

            return;
          12:   90                      nop
        }
          13:   5d                      pop    %rbp
          14:   c3                      retq

    查看目标文件中的详细信息,相对于nm工具
        $ objdump -h func.o

        func.o:     file format elf64-x86-64

        Sections:
        Idx Name          Size      VMA               LMA               File off  Algn
          0 .text         00000015  0000000000000000  0000000000000000  00000040  2**0
                          CONTENTS, ALLOC, LOAD, RELOC, READONLY, CODE
          1 .data         00000000  0000000000000000  0000000000000000  00000055  2**0
                          CONTENTS, ALLOC, LOAD, DATA
          2 .bss          00000000  0000000000000000  0000000000000000  00000055  2**0
                          ALLOC
          3 .rodata       0000000d  0000000000000000  0000000000000000  00000055  2**0
                          CONTENTS, ALLOC, LOAD, READONLY, DATA
          4 .debug_info   000000b3  0000000000000000  0000000000000000  00000062  2**0
                          CONTENTS, RELOC, READONLY, DEBUGGING
          5 .debug_abbrev 00000067  0000000000000000  0000000000000000  00000115  2**0
                          CONTENTS, READONLY, DEBUGGING
          6 .debug_aranges 00000030  0000000000000000  0000000000000000  0000017c  2**0
                          CONTENTS, RELOC, READONLY, DEBUGGING
          7 .debug_line   0000006f  0000000000000000  0000000000000000  000001ac  2**0
                          CONTENTS, RELOC, READONLY, DEBUGGING
          8 .debug_str    0000012e  0000000000000000  0000000000000000  0000021b  2**0
                          CONTENTS, READONLY, DEBUGGING
          9 .comment      00000036  0000000000000000  0000000000000000  00000349  2**0
                          CONTENTS, READONLY
         10 .note.GNU-stack 00000000  0000000000000000  0000000000000000  0000037f  2**0
                          CONTENTS, READONLY
         11 .eh_frame     00000038  0000000000000000  0000000000000000  00000380  2**3
                          CONTENTS, ALLOC, LOAD, RELOC, READONLY, DATA
                          
    使用-h查看执行文件,可发现虚存地址(VMA)和加载地址(LMA)是完全一致的?
    可执行程序是如何加载到内存中运行的?
    先考虑三个地址的概念 : 虚存地址(VMA) 加载地址(LMA) 运行地址
    
    1.桌面环境
        加载地址(LMA):虚拟内存中的加载目标地址(段加载的终点)
        执行test.out时,会发生三件事情:
            1.为这个可执行文件创建一个进程:
                分配虚存
            2.将段信息(可执行文件中)拷贝到虚存(利用File off找各种段在哪里)编译产生的虚地址中
            3.执行程序
        虚存地址(VMA):编译产生的虚地址
        运行地址:     代码在内存中实际运行的地址(实地址)
        此时: LMA=VMA
    2.嵌入式系统
        源代码--交叉编译-->test.bin, 烧写到设备上运行
        1.烧写到nand flash(只能够存储程序数据,不能够执行)中时,需加载到ram中去执行.
            加载地址(LMA):flash中代码的起始地址(段加载的起点)
            上电的时候如何具体知道该加载哪些段到ram里边去执行?(嵌入式设备里边,上电的时候有可能文件系统都不存在,这时候file off是根本没有用的)
            于是,我们必须考虑存储设备中的地址,我们要执行的代码在flash中的哪个地址处,此时的加载地址是flash中代码的起始地址
            运行地址是ram中的实地址
            此时: LMA≠VMA
        2.烧写到nor flash(里边的代码可以直接执行)中时
            加载地址(LMA):nor flash中的地址
            上电时,直接到nor flash中执行相应的指令即可
            此时的加载地址是nor flash中的地址, 运行地址也是nor flash中的地址
            这种情况下,没有虚存地址(VMA)
            此时: LMA=运行地址
    
    Idx         : 段下标
    Name        : 段标识符(名字)
    Size        : 段所占空间的大小
    VMA         : 段起始位置的虚存地址
    LMA         : 段在存储空间中的加载地址
    File off    : 段在目标文件中的相对位置
    Algn        : 段的边界对齐字节数
    
        $ gcc -c -g test.c -o test.o
        $ gcc func.o test.o -o test.out
        $ objdump -h test.out

        test.out:     file format elf64-x86-64

        Sections:
        Idx Name          Size      VMA               LMA               File off  Algn
          0 .interp       0000001c  0000000000400238  0000000000400238  00000238  2**0
                          CONTENTS, ALLOC, LOAD, READONLY, DATA
          1 .note.ABI-tag 00000020  0000000000400254  0000000000400254  00000254  2**2
                          CONTENTS, ALLOC, LOAD, READONLY, DATA
          2 .note.gnu.build-id 00000024  0000000000400274  0000000000400274  00000274  2**2
                          CONTENTS, ALLOC, LOAD, READONLY, DATA
          3 .gnu.hash     0000001c  0000000000400298  0000000000400298  00000298  2**3
                          CONTENTS, ALLOC, LOAD, READONLY, DATA
          4 .dynsym       00000060  00000000004002b8  00000000004002b8  000002b8  2**3
                          CONTENTS, ALLOC, LOAD, READONLY, DATA
          5 .dynstr       0000003f  0000000000400318  0000000000400318  00000318  2**0
                          CONTENTS, ALLOC, LOAD, READONLY, DATA
          6 .gnu.version  00000008  0000000000400358  0000000000400358  00000358  2**1
                          CONTENTS, ALLOC, LOAD, READONLY, DATA
          7 .gnu.version_r 00000020  0000000000400360  0000000000400360  00000360  2**3
                          CONTENTS, ALLOC, LOAD, READONLY, DATA
          8 .rela.dyn     00000018  0000000000400380  0000000000400380  00000380  2**3
                          CONTENTS, ALLOC, LOAD, READONLY, DATA
          9 .rela.plt     00000030  0000000000400398  0000000000400398  00000398  2**3
                          CONTENTS, ALLOC, LOAD, READONLY, DATA
         10 .init         0000001a  00000000004003c8  00000000004003c8  000003c8  2**2
                          CONTENTS, ALLOC, LOAD, READONLY, CODE
         11 .plt          00000030  00000000004003f0  00000000004003f0  000003f0  2**4
                          CONTENTS, ALLOC, LOAD, READONLY, CODE
         12 .plt.got      00000008  0000000000400420  0000000000400420  00000420  2**3
                          CONTENTS, ALLOC, LOAD, READONLY, CODE
         13 .text         00000222  0000000000400430  0000000000400430  00000430  2**4
                          CONTENTS, ALLOC, LOAD, READONLY, CODE
         14 .fini         00000009  0000000000400654  0000000000400654  00000654  2**2
                          CONTENTS, ALLOC, LOAD, READONLY, CODE
         15 .rodata       00000068  0000000000400660  0000000000400660  00000660  2**2
                          CONTENTS, ALLOC, LOAD, READONLY, DATA
         16 .eh_frame_hdr 0000003c  00000000004006c8  00000000004006c8  000006c8  2**2
                          CONTENTS, ALLOC, LOAD, READONLY, DATA
         17 .eh_frame     00000114  0000000000400708  0000000000400708  00000708  2**3
                          CONTENTS, ALLOC, LOAD, READONLY, DATA
         18 .init_array   00000008  0000000000600e10  0000000000600e10  00000e10  2**3
                          CONTENTS, ALLOC, LOAD, DATA
         19 .fini_array   00000008  0000000000600e18  0000000000600e18  00000e18  2**3
                          CONTENTS, ALLOC, LOAD, DATA
         20 .jcr          00000008  0000000000600e20  0000000000600e20  00000e20  2**3
                          CONTENTS, ALLOC, LOAD, DATA
         21 .dynamic      000001d0  0000000000600e28  0000000000600e28  00000e28  2**3
                          CONTENTS, ALLOC, LOAD, DATA
         22 .got          00000008  0000000000600ff8  0000000000600ff8  00000ff8  2**3
                          CONTENTS, ALLOC, LOAD, DATA
         23 .got.plt      00000028  0000000000601000  0000000000601000  00001000  2**3
                          CONTENTS, ALLOC, LOAD, DATA
         24 .data         00000014  0000000000601028  0000000000601028  00001028  2**3
                          CONTENTS, ALLOC, LOAD, DATA
         25 .bss          00000010  0000000000601040  0000000000601040  0000103c  2**3
                          ALLOC
         26 .comment      00000035  0000000000000000  0000000000000000  0000103c  2**0
                          CONTENTS, READONLY
         27 .debug_aranges 00000060  0000000000000000  0000000000000000  00001071  2**0
                          CONTENTS, READONLY, DEBUGGING
         28 .debug_info   000001ac  0000000000000000  0000000000000000  000010d1  2**0
                          CONTENTS, READONLY, DEBUGGING
         29 .debug_abbrev 000000e7  0000000000000000  0000000000000000  0000127d  2**0
                          CONTENTS, READONLY, DEBUGGING
         30 .debug_line   000000b8  0000000000000000  0000000000000000  00001364  2**0
                          CONTENTS, READONLY, DEBUGGING
         31 .debug_str    00000136  0000000000000000  0000000000000000  0000141c  2**0
                          CONTENTS, READONLY, DEBUGGING

4. size 查看各个段的大小,方便做优化
    $ size test.out
    text    data     bss     dec     hex filename
    2062     576      16    2654     a5e test.out
5. strings 获取目标文件中的所有字符串常量, 用于分析哪些字符串常量是冗余的
    $ strip func.o
    $ strings func.o
    D.T.Software
    GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609
    .shstrtab
    .text
    .data
    .bss
    .rodata
    .comment
    .note.GNU-stack
    .eh_frame

    $ strip test.o
    $ strings test.o
    &g_global = %p
    &g_test = %p
    &g_pointer = %p
    g_pointer = %p
    &func = %p
    &main = %p
    GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609
    .shstrtab
    .text
    .data
    .bss
    .rodata
    .comment
    .note.GNU-stack
    .eh_frame

补充: GUN为GCC编译器提供了配套的辅助工具集(Binutils)
    http://www.gnu.org/software/binutils/