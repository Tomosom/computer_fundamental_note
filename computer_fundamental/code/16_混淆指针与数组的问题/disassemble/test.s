
a.out:     file format elf32-i386


Disassembly of section .init:

08048274 <_init>:
 8048274:	55                   	push   %ebp
 8048275:	89 e5                	mov    %esp,%ebp
 8048277:	53                   	push   %ebx
 8048278:	83 ec 04             	sub    $0x4,%esp
 804827b:	e8 00 00 00 00       	call   8048280 <_init+0xc>
 8048280:	5b                   	pop    %ebx
 8048281:	81 c3 74 1d 00 00    	add    $0x1d74,%ebx
 8048287:	8b 93 fc ff ff ff    	mov    -0x4(%ebx),%edx
 804828d:	85 d2                	test   %edx,%edx
 804828f:	74 05                	je     8048296 <_init+0x22>
 8048291:	e8 1e 00 00 00       	call   80482b4 <__gmon_start__@plt>
 8048296:	e8 d5 00 00 00       	call   8048370 <frame_dummy>
 804829b:	e8 c0 01 00 00       	call   8048460 <__do_global_ctors_aux>
 80482a0:	58                   	pop    %eax
 80482a1:	5b                   	pop    %ebx
 80482a2:	c9                   	leave  
 80482a3:	c3                   	ret    

Disassembly of section .plt:

080482a4 <__gmon_start__@plt-0x10>:
 80482a4:	ff 35 f8 9f 04 08    	pushl  0x8049ff8
 80482aa:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 80482b0:	00 00                	add    %al,(%eax)
	...

080482b4 <__gmon_start__@plt>:
 80482b4:	ff 25 00 a0 04 08    	jmp    *0x804a000
 80482ba:	68 00 00 00 00       	push   $0x0
 80482bf:	e9 e0 ff ff ff       	jmp    80482a4 <_init+0x30>

080482c4 <__libc_start_main@plt>:
 80482c4:	ff 25 04 a0 04 08    	jmp    *0x804a004
 80482ca:	68 08 00 00 00       	push   $0x8
 80482cf:	e9 d0 ff ff ff       	jmp    80482a4 <_init+0x30>

Disassembly of section .text:

080482e0 <_start>:
 80482e0:	31 ed                	xor    %ebp,%ebp
 80482e2:	5e                   	pop    %esi
 80482e3:	89 e1                	mov    %esp,%ecx
 80482e5:	83 e4 f0             	and    $0xfffffff0,%esp
 80482e8:	50                   	push   %eax
 80482e9:	54                   	push   %esp
 80482ea:	52                   	push   %edx
 80482eb:	68 f0 83 04 08       	push   $0x80483f0
 80482f0:	68 00 84 04 08       	push   $0x8048400
 80482f5:	51                   	push   %ecx
 80482f6:	56                   	push   %esi
 80482f7:	68 d3 83 04 08       	push   $0x80483d3
 80482fc:	e8 c3 ff ff ff       	call   80482c4 <__libc_start_main@plt>
 8048301:	f4                   	hlt    
 8048302:	90                   	nop
 8048303:	90                   	nop
 8048304:	90                   	nop
 8048305:	90                   	nop
 8048306:	90                   	nop
 8048307:	90                   	nop
 8048308:	90                   	nop
 8048309:	90                   	nop
 804830a:	90                   	nop
 804830b:	90                   	nop
 804830c:	90                   	nop
 804830d:	90                   	nop
 804830e:	90                   	nop
 804830f:	90                   	nop

08048310 <__do_global_dtors_aux>:
 8048310:	55                   	push   %ebp
 8048311:	89 e5                	mov    %esp,%ebp
 8048313:	53                   	push   %ebx
 8048314:	83 ec 04             	sub    $0x4,%esp
 8048317:	80 3d 10 a0 04 08 00 	cmpb   $0x0,0x804a010
 804831e:	75 3f                	jne    804835f <__do_global_dtors_aux+0x4f>
 8048320:	a1 14 a0 04 08       	mov    0x804a014,%eax
 8048325:	bb 20 9f 04 08       	mov    $0x8049f20,%ebx
 804832a:	81 eb 1c 9f 04 08    	sub    $0x8049f1c,%ebx
 8048330:	c1 fb 02             	sar    $0x2,%ebx
 8048333:	83 eb 01             	sub    $0x1,%ebx
 8048336:	39 d8                	cmp    %ebx,%eax
 8048338:	73 1e                	jae    8048358 <__do_global_dtors_aux+0x48>
 804833a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048340:	83 c0 01             	add    $0x1,%eax
 8048343:	a3 14 a0 04 08       	mov    %eax,0x804a014
 8048348:	ff 14 85 1c 9f 04 08 	call   *0x8049f1c(,%eax,4)
 804834f:	a1 14 a0 04 08       	mov    0x804a014,%eax
 8048354:	39 d8                	cmp    %ebx,%eax
 8048356:	72 e8                	jb     8048340 <__do_global_dtors_aux+0x30>
 8048358:	c6 05 10 a0 04 08 01 	movb   $0x1,0x804a010
 804835f:	83 c4 04             	add    $0x4,%esp
 8048362:	5b                   	pop    %ebx
 8048363:	5d                   	pop    %ebp
 8048364:	c3                   	ret    
 8048365:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048370 <frame_dummy>:
 8048370:	55                   	push   %ebp
 8048371:	89 e5                	mov    %esp,%ebp
 8048373:	83 ec 18             	sub    $0x18,%esp
 8048376:	a1 24 9f 04 08       	mov    0x8049f24,%eax
 804837b:	85 c0                	test   %eax,%eax
 804837d:	74 12                	je     8048391 <frame_dummy+0x21>
 804837f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048384:	85 c0                	test   %eax,%eax
 8048386:	74 09                	je     8048391 <frame_dummy+0x21>
 8048388:	c7 04 24 24 9f 04 08 	movl   $0x8049f24,(%esp)
 804838f:	ff d0                	call   *%eax
 8048391:	c9                   	leave  
 8048392:	c3                   	ret    
 8048393:	90                   	nop

08048394 <test>:
#include <stdio.h>

int test()
{
 8048394:	55                   	push   %ebp
 8048395:	89 e5                	mov    %esp,%ebp
 8048397:	83 ec 10             	sub    $0x10,%esp
    int a[3] = {0};
 804839a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp) // a的起始地址, 后面是3个连续的int, 均初始化为0
 80483a1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 80483a8:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    int* p = a;
 80483af:	8d 45 f0             	lea    -0x10(%ebp),%eax // P 里边的值为 a 的起始地址的值
 80483b2:	89 45 fc             	mov    %eax,-0x4(%ebp)  // p 对应的内存空间
    
    p[0] = 1;  // a[0] = 1
 80483b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80483b8:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
    p[1] = 2;  // a[1] = 2
 80483be:	8b 45 fc             	mov    -0x4(%ebp),%eax  // 将指针中保存的地址拿到
 80483c1:	83 c0 04             	add    $0x4,%eax        // 根据下标, 对地址进行修正
 80483c4:	c7 00 02 00 00 00    	movl   $0x2,(%eax)      // 往地址里边赋值
    
    a[2] = 3;  // p[2] = 3
 80483ca:	c7 45 f8 03 00 00 00 	movl   $0x3,-0x8(%ebp)  // 数组, 一条指令完成赋值
}
 80483d1:	c9                   	leave  
 80483d2:	c3                   	ret    

080483d3 <main>:

int main()
{
 80483d3:	55                   	push   %ebp
 80483d4:	89 e5                	mov    %esp,%ebp
    test();
 80483d6:	e8 b9 ff ff ff       	call   8048394 <test>

    return 0;
 80483db:	b8 00 00 00 00       	mov    $0x0,%eax
}
 80483e0:	5d                   	pop    %ebp
 80483e1:	c3                   	ret    
 80483e2:	90                   	nop
 80483e3:	90                   	nop
 80483e4:	90                   	nop
 80483e5:	90                   	nop
 80483e6:	90                   	nop
 80483e7:	90                   	nop
 80483e8:	90                   	nop
 80483e9:	90                   	nop
 80483ea:	90                   	nop
 80483eb:	90                   	nop
 80483ec:	90                   	nop
 80483ed:	90                   	nop
 80483ee:	90                   	nop
 80483ef:	90                   	nop

080483f0 <__libc_csu_fini>:
 80483f0:	55                   	push   %ebp
 80483f1:	89 e5                	mov    %esp,%ebp
 80483f3:	5d                   	pop    %ebp
 80483f4:	c3                   	ret    
 80483f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80483f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048400 <__libc_csu_init>:
 8048400:	55                   	push   %ebp
 8048401:	89 e5                	mov    %esp,%ebp
 8048403:	57                   	push   %edi
 8048404:	56                   	push   %esi
 8048405:	53                   	push   %ebx
 8048406:	e8 4f 00 00 00       	call   804845a <__i686.get_pc_thunk.bx>
 804840b:	81 c3 e9 1b 00 00    	add    $0x1be9,%ebx
 8048411:	83 ec 1c             	sub    $0x1c,%esp
 8048414:	e8 5b fe ff ff       	call   8048274 <_init>
 8048419:	8d bb 20 ff ff ff    	lea    -0xe0(%ebx),%edi
 804841f:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 8048425:	29 c7                	sub    %eax,%edi
 8048427:	c1 ff 02             	sar    $0x2,%edi
 804842a:	85 ff                	test   %edi,%edi
 804842c:	74 24                	je     8048452 <__libc_csu_init+0x52>
 804842e:	31 f6                	xor    %esi,%esi
 8048430:	8b 45 10             	mov    0x10(%ebp),%eax
 8048433:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048437:	8b 45 0c             	mov    0xc(%ebp),%eax
 804843a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804843e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048441:	89 04 24             	mov    %eax,(%esp)
 8048444:	ff 94 b3 20 ff ff ff 	call   *-0xe0(%ebx,%esi,4)
 804844b:	83 c6 01             	add    $0x1,%esi
 804844e:	39 fe                	cmp    %edi,%esi
 8048450:	72 de                	jb     8048430 <__libc_csu_init+0x30>
 8048452:	83 c4 1c             	add    $0x1c,%esp
 8048455:	5b                   	pop    %ebx
 8048456:	5e                   	pop    %esi
 8048457:	5f                   	pop    %edi
 8048458:	5d                   	pop    %ebp
 8048459:	c3                   	ret    

0804845a <__i686.get_pc_thunk.bx>:
 804845a:	8b 1c 24             	mov    (%esp),%ebx
 804845d:	c3                   	ret    
 804845e:	90                   	nop
 804845f:	90                   	nop

08048460 <__do_global_ctors_aux>:
 8048460:	55                   	push   %ebp
 8048461:	89 e5                	mov    %esp,%ebp
 8048463:	53                   	push   %ebx
 8048464:	83 ec 04             	sub    $0x4,%esp
 8048467:	a1 14 9f 04 08       	mov    0x8049f14,%eax
 804846c:	83 f8 ff             	cmp    $0xffffffff,%eax
 804846f:	74 13                	je     8048484 <__do_global_ctors_aux+0x24>
 8048471:	bb 14 9f 04 08       	mov    $0x8049f14,%ebx
 8048476:	66 90                	xchg   %ax,%ax
 8048478:	83 eb 04             	sub    $0x4,%ebx
 804847b:	ff d0                	call   *%eax
 804847d:	8b 03                	mov    (%ebx),%eax
 804847f:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048482:	75 f4                	jne    8048478 <__do_global_ctors_aux+0x18>
 8048484:	83 c4 04             	add    $0x4,%esp
 8048487:	5b                   	pop    %ebx
 8048488:	5d                   	pop    %ebp
 8048489:	c3                   	ret    
 804848a:	90                   	nop
 804848b:	90                   	nop

Disassembly of section .fini:

0804848c <_fini>:
 804848c:	55                   	push   %ebp
 804848d:	89 e5                	mov    %esp,%ebp
 804848f:	53                   	push   %ebx
 8048490:	83 ec 04             	sub    $0x4,%esp
 8048493:	e8 00 00 00 00       	call   8048498 <_fini+0xc>
 8048498:	5b                   	pop    %ebx
 8048499:	81 c3 5c 1b 00 00    	add    $0x1b5c,%ebx
 804849f:	e8 6c fe ff ff       	call   8048310 <__do_global_dtors_aux>
 80484a4:	59                   	pop    %ecx
 80484a5:	5b                   	pop    %ebx
 80484a6:	c9                   	leave  
 80484a7:	c3                   	ret    
