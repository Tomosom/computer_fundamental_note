
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
 80482bb:	e8 f0 01 00 00       	call   80484b0 <__do_global_ctors_aux>
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
 804831b:	68 40 84 04 08       	push   $0x8048440
 8048320:	68 50 84 04 08       	push   $0x8048450
 8048325:	51                   	push   %ecx
 8048326:	56                   	push   %esi
 8048327:	68 ec 83 04 08       	push   $0x80483ec
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

080483c4 <test>:
#include <stdio.h>

int test(int a, int b, int c)
{
 80483c4:	55                   	push   %ebp
 80483c5:	89 e5                	mov    %esp,%ebp
    return a + b + c;
 80483c7:	8b 45 0c             	mov    0xc(%ebp),%eax
 80483ca:	8b 55 08             	mov    0x8(%ebp),%edx
 80483cd:	8d 04 02             	lea    (%edx,%eax,1),%eax
 80483d0:	03 45 10             	add    0x10(%ebp),%eax
}
 80483d3:	5d                   	pop    %ebp
 80483d4:	c3                   	ret    

080483d5 <func_1>:

void __attribute__((__cdecl__)) func_1(int i)
{
 80483d5:	55                   	push   %ebp
 80483d6:	89 e5                	mov    %esp,%ebp
}
 80483d8:	5d                   	pop    %ebp
 80483d9:	c3                   	ret    

080483da <func_2>:

void __attribute__((__stdcall__)) func_2(int i)
{
 80483da:	55                   	push   %ebp
 80483db:	89 e5                	mov    %esp,%ebp
}
 80483dd:	5d                   	pop    %ebp
 80483de:	c2 04 00             	ret    $0x4

080483e1 <func_3>:

void __attribute__((__fastcall__)) func_3(int i)
{
 80483e1:	55                   	push   %ebp
 80483e2:	89 e5                	mov    %esp,%ebp
 80483e4:	83 ec 04             	sub    $0x4,%esp
 80483e7:	89 4d fc             	mov    %ecx,-0x4(%ebp)
}
 80483ea:	c9                   	leave  
 80483eb:	c3                   	ret    

080483ec <main>:

int main()
{
 80483ec:	55                   	push   %ebp
 80483ed:	89 e5                	mov    %esp,%ebp
 80483ef:	83 e4 f0             	and    $0xfffffff0,%esp
 80483f2:	83 ec 20             	sub    $0x20,%esp
    int r = test(1, 2, 3);
 80483f5:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
 80483fc:	00 
 80483fd:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
 8048404:	00 
 8048405:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 804840c:	e8 b3 ff ff ff       	call   80483c4 <test>
 8048411:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    
    printf("r = %d\n", r);
 8048415:	b8 00 85 04 08       	mov    $0x8048500,%eax
 804841a:	8b 54 24 1c          	mov    0x1c(%esp),%edx
 804841e:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048422:	89 04 24             	mov    %eax,(%esp)
 8048425:	e8 ca fe ff ff       	call   80482f4 <printf@plt>
    
    return 0;
 804842a:	b8 00 00 00 00       	mov    $0x0,%eax
 804842f:	c9                   	leave  
 8048430:	c3                   	ret    
 8048431:	90                   	nop
 8048432:	90                   	nop
 8048433:	90                   	nop
 8048434:	90                   	nop
 8048435:	90                   	nop
 8048436:	90                   	nop
 8048437:	90                   	nop
 8048438:	90                   	nop
 8048439:	90                   	nop
 804843a:	90                   	nop
 804843b:	90                   	nop
 804843c:	90                   	nop
 804843d:	90                   	nop
 804843e:	90                   	nop
 804843f:	90                   	nop

08048440 <__libc_csu_fini>:
 8048440:	55                   	push   %ebp
 8048441:	89 e5                	mov    %esp,%ebp
 8048443:	5d                   	pop    %ebp
 8048444:	c3                   	ret    
 8048445:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048450 <__libc_csu_init>:
 8048450:	55                   	push   %ebp
 8048451:	89 e5                	mov    %esp,%ebp
 8048453:	57                   	push   %edi
 8048454:	56                   	push   %esi
 8048455:	53                   	push   %ebx
 8048456:	e8 4f 00 00 00       	call   80484aa <__i686.get_pc_thunk.bx>
 804845b:	81 c3 99 1b 00 00    	add    $0x1b99,%ebx
 8048461:	83 ec 1c             	sub    $0x1c,%esp
 8048464:	e8 2b fe ff ff       	call   8048294 <_init>
 8048469:	8d bb 20 ff ff ff    	lea    -0xe0(%ebx),%edi
 804846f:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 8048475:	29 c7                	sub    %eax,%edi
 8048477:	c1 ff 02             	sar    $0x2,%edi
 804847a:	85 ff                	test   %edi,%edi
 804847c:	74 24                	je     80484a2 <__libc_csu_init+0x52>
 804847e:	31 f6                	xor    %esi,%esi
 8048480:	8b 45 10             	mov    0x10(%ebp),%eax
 8048483:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048487:	8b 45 0c             	mov    0xc(%ebp),%eax
 804848a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804848e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048491:	89 04 24             	mov    %eax,(%esp)
 8048494:	ff 94 b3 20 ff ff ff 	call   *-0xe0(%ebx,%esi,4)
 804849b:	83 c6 01             	add    $0x1,%esi
 804849e:	39 fe                	cmp    %edi,%esi
 80484a0:	72 de                	jb     8048480 <__libc_csu_init+0x30>
 80484a2:	83 c4 1c             	add    $0x1c,%esp
 80484a5:	5b                   	pop    %ebx
 80484a6:	5e                   	pop    %esi
 80484a7:	5f                   	pop    %edi
 80484a8:	5d                   	pop    %ebp
 80484a9:	c3                   	ret    

080484aa <__i686.get_pc_thunk.bx>:
 80484aa:	8b 1c 24             	mov    (%esp),%ebx
 80484ad:	c3                   	ret    
 80484ae:	90                   	nop
 80484af:	90                   	nop

080484b0 <__do_global_ctors_aux>:
 80484b0:	55                   	push   %ebp
 80484b1:	89 e5                	mov    %esp,%ebp
 80484b3:	53                   	push   %ebx
 80484b4:	83 ec 04             	sub    $0x4,%esp
 80484b7:	a1 14 9f 04 08       	mov    0x8049f14,%eax
 80484bc:	83 f8 ff             	cmp    $0xffffffff,%eax
 80484bf:	74 13                	je     80484d4 <__do_global_ctors_aux+0x24>
 80484c1:	bb 14 9f 04 08       	mov    $0x8049f14,%ebx
 80484c6:	66 90                	xchg   %ax,%ax
 80484c8:	83 eb 04             	sub    $0x4,%ebx
 80484cb:	ff d0                	call   *%eax
 80484cd:	8b 03                	mov    (%ebx),%eax
 80484cf:	83 f8 ff             	cmp    $0xffffffff,%eax
 80484d2:	75 f4                	jne    80484c8 <__do_global_ctors_aux+0x18>
 80484d4:	83 c4 04             	add    $0x4,%esp
 80484d7:	5b                   	pop    %ebx
 80484d8:	5d                   	pop    %ebp
 80484d9:	c3                   	ret    
 80484da:	90                   	nop
 80484db:	90                   	nop

Disassembly of section .fini:

080484dc <_fini>:
 80484dc:	55                   	push   %ebp
 80484dd:	89 e5                	mov    %esp,%ebp
 80484df:	53                   	push   %ebx
 80484e0:	83 ec 04             	sub    $0x4,%esp
 80484e3:	e8 00 00 00 00       	call   80484e8 <_fini+0xc>
 80484e8:	5b                   	pop    %ebx
 80484e9:	81 c3 0c 1b 00 00    	add    $0x1b0c,%ebx
 80484ef:	e8 4c fe ff ff       	call   8048340 <__do_global_dtors_aux>
 80484f4:	59                   	pop    %ecx
 80484f5:	5b                   	pop    %ebx
 80484f6:	c9                   	leave  
 80484f7:	c3                   	ret    
