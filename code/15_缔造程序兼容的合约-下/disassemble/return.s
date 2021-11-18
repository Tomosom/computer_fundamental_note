
a.out:     file format elf32-i386


Disassembly of section .init:

08048294 <_init>:
 8048294:	55                   	push   %ebp
 8048295:	89 e5                	mov    %esp,%ebp
 8048297:	53                   	push   %ebx
 8048298:	83 ec 04             	sub    $0x4,%esp
 804829b:	e8 00 00 00 00       	call   80482a0 <_init+0xc>
 80482a0:	5b                   	pop    %ebx
 80482a1:	81 c3 54 1d 00 00    	add    $0x1d54,%ebx
 80482a7:	8b 93 fc ff ff ff    	mov    -0x4(%ebx),%edx
 80482ad:	85 d2                	test   %edx,%edx
 80482af:	74 05                	je     80482b6 <_init+0x22>
 80482b1:	e8 1e 00 00 00       	call   80482d4 <__gmon_start__@plt>
 80482b6:	e8 e5 00 00 00       	call   80483a0 <frame_dummy>
 80482bb:	e8 10 03 00 00       	call   80485d0 <__do_global_ctors_aux>
 80482c0:	58                   	pop    %eax
 80482c1:	5b                   	pop    %ebx
 80482c2:	c9                   	leave  
 80482c3:	c3                   	ret    

Disassembly of section .plt:

080482c4 <__gmon_start__@plt-0x10>:
 80482c4:	ff 35 f8 9f 04 08    	pushl  0x8049ff8
 80482ca:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 80482d0:	00 00                	add    %al,(%eax)
	...

080482d4 <__gmon_start__@plt>:
 80482d4:	ff 25 00 a0 04 08    	jmp    *0x804a000
 80482da:	68 00 00 00 00       	push   $0x0
 80482df:	e9 e0 ff ff ff       	jmp    80482c4 <_init+0x30>

080482e4 <__libc_start_main@plt>:
 80482e4:	ff 25 04 a0 04 08    	jmp    *0x804a004
 80482ea:	68 08 00 00 00       	push   $0x8
 80482ef:	e9 d0 ff ff ff       	jmp    80482c4 <_init+0x30>

080482f4 <printf@plt>:
 80482f4:	ff 25 08 a0 04 08    	jmp    *0x804a008
 80482fa:	68 10 00 00 00       	push   $0x10
 80482ff:	e9 c0 ff ff ff       	jmp    80482c4 <_init+0x30>

Disassembly of section .text:

08048310 <_start>:
 8048310:	31 ed                	xor    %ebp,%ebp
 8048312:	5e                   	pop    %esi
 8048313:	89 e1                	mov    %esp,%ecx
 8048315:	83 e4 f0             	and    $0xfffffff0,%esp
 8048318:	50                   	push   %eax
 8048319:	54                   	push   %esp
 804831a:	52                   	push   %edx
 804831b:	68 60 85 04 08       	push   $0x8048560
 8048320:	68 70 85 04 08       	push   $0x8048570
 8048325:	51                   	push   %ecx
 8048326:	56                   	push   %esi
 8048327:	68 47 85 04 08       	push   $0x8048547
 804832c:	e8 b3 ff ff ff       	call   80482e4 <__libc_start_main@plt>
 8048331:	f4                   	hlt    
 8048332:	90                   	nop
 8048333:	90                   	nop
 8048334:	90                   	nop
 8048335:	90                   	nop
 8048336:	90                   	nop
 8048337:	90                   	nop
 8048338:	90                   	nop
 8048339:	90                   	nop
 804833a:	90                   	nop
 804833b:	90                   	nop
 804833c:	90                   	nop
 804833d:	90                   	nop
 804833e:	90                   	nop
 804833f:	90                   	nop

08048340 <__do_global_dtors_aux>:
 8048340:	55                   	push   %ebp
 8048341:	89 e5                	mov    %esp,%ebp
 8048343:	53                   	push   %ebx
 8048344:	83 ec 04             	sub    $0x4,%esp
 8048347:	80 3d 14 a0 04 08 00 	cmpb   $0x0,0x804a014
 804834e:	75 3f                	jne    804838f <__do_global_dtors_aux+0x4f>
 8048350:	a1 18 a0 04 08       	mov    0x804a018,%eax
 8048355:	bb 20 9f 04 08       	mov    $0x8049f20,%ebx
 804835a:	81 eb 1c 9f 04 08    	sub    $0x8049f1c,%ebx
 8048360:	c1 fb 02             	sar    $0x2,%ebx
 8048363:	83 eb 01             	sub    $0x1,%ebx
 8048366:	39 d8                	cmp    %ebx,%eax
 8048368:	73 1e                	jae    8048388 <__do_global_dtors_aux+0x48>
 804836a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048370:	83 c0 01             	add    $0x1,%eax
 8048373:	a3 18 a0 04 08       	mov    %eax,0x804a018
 8048378:	ff 14 85 1c 9f 04 08 	call   *0x8049f1c(,%eax,4)
 804837f:	a1 18 a0 04 08       	mov    0x804a018,%eax
 8048384:	39 d8                	cmp    %ebx,%eax
 8048386:	72 e8                	jb     8048370 <__do_global_dtors_aux+0x30>
 8048388:	c6 05 14 a0 04 08 01 	movb   $0x1,0x804a014
 804838f:	83 c4 04             	add    $0x4,%esp
 8048392:	5b                   	pop    %ebx
 8048393:	5d                   	pop    %ebp
 8048394:	c3                   	ret    
 8048395:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080483a0 <frame_dummy>:
 80483a0:	55                   	push   %ebp
 80483a1:	89 e5                	mov    %esp,%ebp
 80483a3:	83 ec 18             	sub    $0x18,%esp
 80483a6:	a1 24 9f 04 08       	mov    0x8049f24,%eax
 80483ab:	85 c0                	test   %eax,%eax
 80483ad:	74 12                	je     80483c1 <frame_dummy+0x21>
 80483af:	b8 00 00 00 00       	mov    $0x0,%eax
 80483b4:	85 c0                	test   %eax,%eax
 80483b6:	74 09                	je     80483c1 <frame_dummy+0x21>
 80483b8:	c7 04 24 24 9f 04 08 	movl   $0x8049f24,(%esp)
 80483bf:	ff d0                	call   *%eax
 80483c1:	c9                   	leave  
 80483c2:	c3                   	ret    
 80483c3:	90                   	nop

080483c4 <f>:
    int y;
    int z;
};

struct ST f(int x, int y, int z)
{
 80483c4:	55                   	push   %ebp
 80483c5:	89 e5                	mov    %esp,%ebp
 80483c7:	53                   	push   %ebx
 80483c8:	83 ec 24             	sub    $0x24,%esp
 80483cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    struct ST st = {0};
 80483ce:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 80483d5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 80483dc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    
    printf("f() : &st = %p\n", &st);
 80483e3:	b8 20 86 04 08       	mov    $0x8048620,%eax
 80483e8:	8d 55 ec             	lea    -0x14(%ebp),%edx
 80483eb:	89 54 24 04          	mov    %edx,0x4(%esp)
 80483ef:	89 04 24             	mov    %eax,(%esp)
 80483f2:	e8 fd fe ff ff       	call   80482f4 <printf@plt>
    
    st.x = x;
 80483f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80483fa:	89 45 ec             	mov    %eax,-0x14(%ebp)
    st.y = y;
 80483fd:	8b 45 10             	mov    0x10(%ebp),%eax
 8048400:	89 45 f0             	mov    %eax,-0x10(%ebp)
    st.z = z;
 8048403:	8b 45 14             	mov    0x14(%ebp),%eax
 8048406:	89 45 f4             	mov    %eax,-0xc(%ebp)
    
    return st;
 8048409:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804840c:	89 03                	mov    %eax,(%ebx)
 804840e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048411:	89 43 04             	mov    %eax,0x4(%ebx)
 8048414:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048417:	89 43 08             	mov    %eax,0x8(%ebx)
}
 804841a:	89 d8                	mov    %ebx,%eax
 804841c:	83 c4 24             	add    $0x24,%esp
 804841f:	5b                   	pop    %ebx
 8048420:	5d                   	pop    %ebp
 8048421:	c2 04 00             	ret    $0x4

08048424 <g>:

void g()
{
 8048424:	55                   	push   %ebp
 8048425:	89 e5                	mov    %esp,%ebp
 8048427:	83 ec 38             	sub    $0x38,%esp
    struct ST st = {0};
 804842a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 8048431:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8048438:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    
    printf("g() : &st = %p\n", &st);
 804843f:	b8 30 86 04 08       	mov    $0x8048630,%eax
 8048444:	8d 55 ec             	lea    -0x14(%ebp),%edx
 8048447:	89 54 24 04          	mov    %edx,0x4(%esp)
 804844b:	89 04 24             	mov    %eax,(%esp)
 804844e:	e8 a1 fe ff ff       	call   80482f4 <printf@plt>
    
    st = f(1, 2, 3);
 8048453:	8d 45 d8             	lea    -0x28(%ebp),%eax     // 将次此地址放入eax寄存器, 此地址是中间临时变量的地址
 8048456:	c7 44 24 0c 03 00 00 	movl   $0x3,0xc(%esp)
 804845d:	00 
 804845e:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
 8048465:	00 
 8048466:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 804846d:	00 
 804846e:	89 04 24             	mov    %eax,(%esp)          // eax寄存器中的值最后入栈
 8048471:	e8 4e ff ff ff       	call   80483c4 <f>
 8048476:	83 ec 04             	sub    $0x4,%esp
 8048479:	8b 45 d8             	mov    -0x28(%ebp),%eax     // 函数调用完后,进行了一个拷贝的动作
 804847c:	89 45 ec             	mov    %eax,-0x14(%ebp)     // -0x14(%ebp) 偏移的这个地址就是 st 的地址
 804847f:	8b 45 dc             	mov    -0x24(%ebp),%eax
 8048482:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048485:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048488:	89 45 f4             	mov    %eax,-0xc(%ebp)
    
    printf("g() : st.x = %d\n", st.x);
 804848b:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804848e:	b8 40 86 04 08       	mov    $0x8048640,%eax
 8048493:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048497:	89 04 24             	mov    %eax,(%esp)
 804849a:	e8 55 fe ff ff       	call   80482f4 <printf@plt>
    printf("g() : st.y = %d\n", st.y);
 804849f:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80484a2:	b8 51 86 04 08       	mov    $0x8048651,%eax
 80484a7:	89 54 24 04          	mov    %edx,0x4(%esp)
 80484ab:	89 04 24             	mov    %eax,(%esp)
 80484ae:	e8 41 fe ff ff       	call   80482f4 <printf@plt>
    printf("g() : st.z = %d\n", st.z);
 80484b3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80484b6:	b8 62 86 04 08       	mov    $0x8048662,%eax
 80484bb:	89 54 24 04          	mov    %edx,0x4(%esp)
 80484bf:	89 04 24             	mov    %eax,(%esp)
 80484c2:	e8 2d fe ff ff       	call   80482f4 <printf@plt>
}
 80484c7:	c9                   	leave  
 80484c8:	c3                   	ret    

080484c9 <h>:

void h()
{
 80484c9:	55                   	push   %ebp
 80484ca:	89 e5                	mov    %esp,%ebp
 80484cc:	83 ec 28             	sub    $0x28,%esp
    struct ST st = f(4, 5, 6);
 80484cf:	8d 45 ec             	lea    -0x14(%ebp),%eax     // 将这个偏移地址放到eax寄存器中, 这个偏移地址就是st的地址
 80484d2:	c7 44 24 0c 06 00 00 	movl   $0x6,0xc(%esp)
 80484d9:	00 
 80484da:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
 80484e1:	00 
 80484e2:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
 80484e9:	00 
 80484ea:	89 04 24             	mov    %eax,(%esp)          // st 地址入栈
 80484ed:	e8 d2 fe ff ff       	call   80483c4 <f>
 80484f2:	83 ec 04             	sub    $0x4,%esp
    
    printf("h() : &st = %p\n", &st);
 80484f5:	b8 73 86 04 08       	mov    $0x8048673,%eax
 80484fa:	8d 55 ec             	lea    -0x14(%ebp),%edx
 80484fd:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048501:	89 04 24             	mov    %eax,(%esp)
 8048504:	e8 eb fd ff ff       	call   80482f4 <printf@plt>
    printf("h() : st.x = %d\n", st.x);
 8048509:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804850c:	b8 83 86 04 08       	mov    $0x8048683,%eax
 8048511:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048515:	89 04 24             	mov    %eax,(%esp)
 8048518:	e8 d7 fd ff ff       	call   80482f4 <printf@plt>
    printf("h() : st.y = %d\n", st.y);
 804851d:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048520:	b8 94 86 04 08       	mov    $0x8048694,%eax
 8048525:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048529:	89 04 24             	mov    %eax,(%esp)
 804852c:	e8 c3 fd ff ff       	call   80482f4 <printf@plt>
    printf("h() : st.z = %d\n", st.z);
 8048531:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8048534:	b8 a5 86 04 08       	mov    $0x80486a5,%eax
 8048539:	89 54 24 04          	mov    %edx,0x4(%esp)
 804853d:	89 04 24             	mov    %eax,(%esp)
 8048540:	e8 af fd ff ff       	call   80482f4 <printf@plt>
}
 8048545:	c9                   	leave  
 8048546:	c3                   	ret    

08048547 <main>:

int main()
{
 8048547:	55                   	push   %ebp
 8048548:	89 e5                	mov    %esp,%ebp
 804854a:	83 e4 f0             	and    $0xfffffff0,%esp
    h();
 804854d:	e8 77 ff ff ff       	call   80484c9 <h>
    g();
 8048552:	e8 cd fe ff ff       	call   8048424 <g>
    
    return 0;
 8048557:	b8 00 00 00 00       	mov    $0x0,%eax
 804855c:	89 ec                	mov    %ebp,%esp
 804855e:	5d                   	pop    %ebp
 804855f:	c3                   	ret    

08048560 <__libc_csu_fini>:
 8048560:	55                   	push   %ebp
 8048561:	89 e5                	mov    %esp,%ebp
 8048563:	5d                   	pop    %ebp
 8048564:	c3                   	ret    
 8048565:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048570 <__libc_csu_init>:
 8048570:	55                   	push   %ebp
 8048571:	89 e5                	mov    %esp,%ebp
 8048573:	57                   	push   %edi
 8048574:	56                   	push   %esi
 8048575:	53                   	push   %ebx
 8048576:	e8 4f 00 00 00       	call   80485ca <__i686.get_pc_thunk.bx>
 804857b:	81 c3 79 1a 00 00    	add    $0x1a79,%ebx
 8048581:	83 ec 1c             	sub    $0x1c,%esp
 8048584:	e8 0b fd ff ff       	call   8048294 <_init>
 8048589:	8d bb 20 ff ff ff    	lea    -0xe0(%ebx),%edi
 804858f:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 8048595:	29 c7                	sub    %eax,%edi
 8048597:	c1 ff 02             	sar    $0x2,%edi
 804859a:	85 ff                	test   %edi,%edi
 804859c:	74 24                	je     80485c2 <__libc_csu_init+0x52>
 804859e:	31 f6                	xor    %esi,%esi
 80485a0:	8b 45 10             	mov    0x10(%ebp),%eax
 80485a3:	89 44 24 08          	mov    %eax,0x8(%esp)
 80485a7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80485aa:	89 44 24 04          	mov    %eax,0x4(%esp)
 80485ae:	8b 45 08             	mov    0x8(%ebp),%eax
 80485b1:	89 04 24             	mov    %eax,(%esp)
 80485b4:	ff 94 b3 20 ff ff ff 	call   *-0xe0(%ebx,%esi,4)
 80485bb:	83 c6 01             	add    $0x1,%esi
 80485be:	39 fe                	cmp    %edi,%esi
 80485c0:	72 de                	jb     80485a0 <__libc_csu_init+0x30>
 80485c2:	83 c4 1c             	add    $0x1c,%esp
 80485c5:	5b                   	pop    %ebx
 80485c6:	5e                   	pop    %esi
 80485c7:	5f                   	pop    %edi
 80485c8:	5d                   	pop    %ebp
 80485c9:	c3                   	ret    

080485ca <__i686.get_pc_thunk.bx>:
 80485ca:	8b 1c 24             	mov    (%esp),%ebx
 80485cd:	c3                   	ret    
 80485ce:	90                   	nop
 80485cf:	90                   	nop

080485d0 <__do_global_ctors_aux>:
 80485d0:	55                   	push   %ebp
 80485d1:	89 e5                	mov    %esp,%ebp
 80485d3:	53                   	push   %ebx
 80485d4:	83 ec 04             	sub    $0x4,%esp
 80485d7:	a1 14 9f 04 08       	mov    0x8049f14,%eax
 80485dc:	83 f8 ff             	cmp    $0xffffffff,%eax
 80485df:	74 13                	je     80485f4 <__do_global_ctors_aux+0x24>
 80485e1:	bb 14 9f 04 08       	mov    $0x8049f14,%ebx
 80485e6:	66 90                	xchg   %ax,%ax
 80485e8:	83 eb 04             	sub    $0x4,%ebx
 80485eb:	ff d0                	call   *%eax
 80485ed:	8b 03                	mov    (%ebx),%eax
 80485ef:	83 f8 ff             	cmp    $0xffffffff,%eax
 80485f2:	75 f4                	jne    80485e8 <__do_global_ctors_aux+0x18>
 80485f4:	83 c4 04             	add    $0x4,%esp
 80485f7:	5b                   	pop    %ebx
 80485f8:	5d                   	pop    %ebp
 80485f9:	c3                   	ret    
 80485fa:	90                   	nop
 80485fb:	90                   	nop

Disassembly of section .fini:

080485fc <_fini>:
 80485fc:	55                   	push   %ebp
 80485fd:	89 e5                	mov    %esp,%ebp
 80485ff:	53                   	push   %ebx
 8048600:	83 ec 04             	sub    $0x4,%esp
 8048603:	e8 00 00 00 00       	call   8048608 <_fini+0xc>
 8048608:	5b                   	pop    %ebx
 8048609:	81 c3 ec 19 00 00    	add    $0x19ec,%ebx
 804860f:	e8 2c fd ff ff       	call   8048340 <__do_global_dtors_aux>
 8048614:	59                   	pop    %ecx
 8048615:	5b                   	pop    %ebx
 8048616:	c9                   	leave  
 8048617:	c3                   	ret    
