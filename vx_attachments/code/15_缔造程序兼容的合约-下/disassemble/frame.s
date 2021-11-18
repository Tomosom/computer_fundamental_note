
a.out:     file format elf32-i386


Disassembly of section .init:

080482b4 <_init>:
 80482b4:	55                   	push   %ebp
 80482b5:	89 e5                	mov    %esp,%ebp
 80482b7:	53                   	push   %ebx
 80482b8:	83 ec 04             	sub    $0x4,%esp
 80482bb:	e8 00 00 00 00       	call   80482c0 <_init+0xc>
 80482c0:	5b                   	pop    %ebx
 80482c1:	81 c3 34 1d 00 00    	add    $0x1d34,%ebx
 80482c7:	8b 93 fc ff ff ff    	mov    -0x4(%ebx),%edx
 80482cd:	85 d2                	test   %edx,%edx
 80482cf:	74 05                	je     80482d6 <_init+0x22>
 80482d1:	e8 1e 00 00 00       	call   80482f4 <__gmon_start__@plt>
 80482d6:	e8 f5 00 00 00       	call   80483d0 <frame_dummy>
 80482db:	e8 70 04 00 00       	call   8048750 <__do_global_ctors_aux>
 80482e0:	58                   	pop    %eax
 80482e1:	5b                   	pop    %ebx
 80482e2:	c9                   	leave  
 80482e3:	c3                   	ret    

Disassembly of section .plt:

080482e4 <__gmon_start__@plt-0x10>:
 80482e4:	ff 35 f8 9f 04 08    	pushl  0x8049ff8
 80482ea:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 80482f0:	00 00                	add    %al,(%eax)
	...

080482f4 <__gmon_start__@plt>:
 80482f4:	ff 25 00 a0 04 08    	jmp    *0x804a000
 80482fa:	68 00 00 00 00       	push   $0x0
 80482ff:	e9 e0 ff ff ff       	jmp    80482e4 <_init+0x30>

08048304 <__libc_start_main@plt>:
 8048304:	ff 25 04 a0 04 08    	jmp    *0x804a004
 804830a:	68 08 00 00 00       	push   $0x8
 804830f:	e9 d0 ff ff ff       	jmp    80482e4 <_init+0x30>

08048314 <printf@plt>:
 8048314:	ff 25 08 a0 04 08    	jmp    *0x804a008
 804831a:	68 10 00 00 00       	push   $0x10
 804831f:	e9 c0 ff ff ff       	jmp    80482e4 <_init+0x30>

08048324 <puts@plt>:
 8048324:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 804832a:	68 18 00 00 00       	push   $0x18
 804832f:	e9 b0 ff ff ff       	jmp    80482e4 <_init+0x30>

Disassembly of section .text:

08048340 <_start>:
 8048340:	31 ed                	xor    %ebp,%ebp
 8048342:	5e                   	pop    %esi
 8048343:	89 e1                	mov    %esp,%ecx
 8048345:	83 e4 f0             	and    $0xfffffff0,%esp
 8048348:	50                   	push   %eax
 8048349:	54                   	push   %esp
 804834a:	52                   	push   %edx
 804834b:	68 e0 86 04 08       	push   $0x80486e0
 8048350:	68 f0 86 04 08       	push   $0x80486f0
 8048355:	51                   	push   %ecx
 8048356:	56                   	push   %esi
 8048357:	68 03 86 04 08       	push   $0x8048603
 804835c:	e8 a3 ff ff ff       	call   8048304 <__libc_start_main@plt>
 8048361:	f4                   	hlt    
 8048362:	90                   	nop
 8048363:	90                   	nop
 8048364:	90                   	nop
 8048365:	90                   	nop
 8048366:	90                   	nop
 8048367:	90                   	nop
 8048368:	90                   	nop
 8048369:	90                   	nop
 804836a:	90                   	nop
 804836b:	90                   	nop
 804836c:	90                   	nop
 804836d:	90                   	nop
 804836e:	90                   	nop
 804836f:	90                   	nop

08048370 <__do_global_dtors_aux>:
 8048370:	55                   	push   %ebp
 8048371:	89 e5                	mov    %esp,%ebp
 8048373:	53                   	push   %ebx
 8048374:	83 ec 04             	sub    $0x4,%esp
 8048377:	80 3d 18 a0 04 08 00 	cmpb   $0x0,0x804a018
 804837e:	75 3f                	jne    80483bf <__do_global_dtors_aux+0x4f>
 8048380:	a1 1c a0 04 08       	mov    0x804a01c,%eax
 8048385:	bb 20 9f 04 08       	mov    $0x8049f20,%ebx
 804838a:	81 eb 1c 9f 04 08    	sub    $0x8049f1c,%ebx
 8048390:	c1 fb 02             	sar    $0x2,%ebx
 8048393:	83 eb 01             	sub    $0x1,%ebx
 8048396:	39 d8                	cmp    %ebx,%eax
 8048398:	73 1e                	jae    80483b8 <__do_global_dtors_aux+0x48>
 804839a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80483a0:	83 c0 01             	add    $0x1,%eax
 80483a3:	a3 1c a0 04 08       	mov    %eax,0x804a01c
 80483a8:	ff 14 85 1c 9f 04 08 	call   *0x8049f1c(,%eax,4)
 80483af:	a1 1c a0 04 08       	mov    0x804a01c,%eax
 80483b4:	39 d8                	cmp    %ebx,%eax
 80483b6:	72 e8                	jb     80483a0 <__do_global_dtors_aux+0x30>
 80483b8:	c6 05 18 a0 04 08 01 	movb   $0x1,0x804a018
 80483bf:	83 c4 04             	add    $0x4,%esp
 80483c2:	5b                   	pop    %ebx
 80483c3:	5d                   	pop    %ebp
 80483c4:	c3                   	ret    
 80483c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80483c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080483d0 <frame_dummy>:
 80483d0:	55                   	push   %ebp
 80483d1:	89 e5                	mov    %esp,%ebp
 80483d3:	83 ec 18             	sub    $0x18,%esp
 80483d6:	a1 24 9f 04 08       	mov    0x8049f24,%eax
 80483db:	85 c0                	test   %eax,%eax
 80483dd:	74 12                	je     80483f1 <frame_dummy+0x21>
 80483df:	b8 00 00 00 00       	mov    $0x0,%eax
 80483e4:	85 c0                	test   %eax,%eax
 80483e6:	74 09                	je     80483f1 <frame_dummy+0x21>
 80483e8:	c7 04 24 24 9f 04 08 	movl   $0x8049f24,(%esp)
 80483ef:	ff d0                	call   *%eax
 80483f1:	c9                   	leave  
 80483f2:	c3                   	ret    
 80483f3:	90                   	nop

080483f4 <test>:
   printf("&ebp = %p\n", &ebp);                            \
   printf("&esp = %p\n", &esp);                            \
} while(0)

void test(int a, int b)
{
 80483f4:	55                   	push   %ebp
 80483f5:	89 e5                	mov    %esp,%ebp
 80483f7:	83 ec 28             	sub    $0x28,%esp
    int c = 3;
 80483fa:	c7 45 f4 03 00 00 00 	movl   $0x3,-0xc(%ebp)
    
    printf("test() : \n");
 8048401:	c7 04 24 a0 87 04 08 	movl   $0x80487a0,(%esp)
 8048408:	e8 17 ff ff ff       	call   8048324 <puts@plt>
    
    PRINT_STACK_FRAME_INFO();
 804840d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8048414:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 804841b:	89 ea                	mov    %ebp,%edx
 804841d:	89 e0                	mov    %esp,%eax
 804841f:	89 55 f0             	mov    %edx,-0x10(%ebp)
 8048422:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8048425:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048428:	b8 aa 87 04 08       	mov    $0x80487aa,%eax
 804842d:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048431:	89 04 24             	mov    %eax,(%esp)
 8048434:	e8 db fe ff ff       	call   8048314 <printf@plt>
 8048439:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804843c:	8b 10                	mov    (%eax),%edx
 804843e:	b8 b4 87 04 08       	mov    $0x80487b4,%eax
 8048443:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048447:	89 04 24             	mov    %eax,(%esp)
 804844a:	e8 c5 fe ff ff       	call   8048314 <printf@plt>
 804844f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048452:	83 c0 04             	add    $0x4,%eax
 8048455:	8b 10                	mov    (%eax),%edx
 8048457:	b8 c9 87 04 08       	mov    $0x80487c9,%eax
 804845c:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048460:	89 04 24             	mov    %eax,(%esp)
 8048463:	e8 ac fe ff ff       	call   8048314 <printf@plt>
 8048468:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804846b:	8d 50 08             	lea    0x8(%eax),%edx
 804846e:	b8 e0 87 04 08       	mov    $0x80487e0,%eax
 8048473:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048477:	89 04 24             	mov    %eax,(%esp)
 804847a:	e8 95 fe ff ff       	call   8048314 <printf@plt>
 804847f:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048482:	b8 f3 87 04 08       	mov    $0x80487f3,%eax
 8048487:	89 54 24 04          	mov    %edx,0x4(%esp)
 804848b:	89 04 24             	mov    %eax,(%esp)
 804848e:	e8 81 fe ff ff       	call   8048314 <printf@plt>
 8048493:	b8 fd 87 04 08       	mov    $0x80487fd,%eax
 8048498:	8d 55 f0             	lea    -0x10(%ebp),%edx
 804849b:	89 54 24 04          	mov    %edx,0x4(%esp)
 804849f:	89 04 24             	mov    %eax,(%esp)
 80484a2:	e8 6d fe ff ff       	call   8048314 <printf@plt>
 80484a7:	b8 08 88 04 08       	mov    $0x8048808,%eax
 80484ac:	8d 55 ec             	lea    -0x14(%ebp),%edx
 80484af:	89 54 24 04          	mov    %edx,0x4(%esp)
 80484b3:	89 04 24             	mov    %eax,(%esp)
 80484b6:	e8 59 fe ff ff       	call   8048314 <printf@plt>
    
    printf("&a = %p\n", &a);
 80484bb:	b8 13 88 04 08       	mov    $0x8048813,%eax
 80484c0:	8d 55 08             	lea    0x8(%ebp),%edx
 80484c3:	89 54 24 04          	mov    %edx,0x4(%esp)
 80484c7:	89 04 24             	mov    %eax,(%esp)
 80484ca:	e8 45 fe ff ff       	call   8048314 <printf@plt>
    printf("&b = %p\n", &b);
 80484cf:	b8 1c 88 04 08       	mov    $0x804881c,%eax
 80484d4:	8d 55 0c             	lea    0xc(%ebp),%edx
 80484d7:	89 54 24 04          	mov    %edx,0x4(%esp)
 80484db:	89 04 24             	mov    %eax,(%esp)
 80484de:	e8 31 fe ff ff       	call   8048314 <printf@plt>
    printf("&c = %p\n", &c);
 80484e3:	b8 25 88 04 08       	mov    $0x8048825,%eax
 80484e8:	8d 55 f4             	lea    -0xc(%ebp),%edx
 80484eb:	89 54 24 04          	mov    %edx,0x4(%esp)
 80484ef:	89 04 24             	mov    %eax,(%esp)
 80484f2:	e8 1d fe ff ff       	call   8048314 <printf@plt>
}
 80484f7:	c9                   	leave  
 80484f8:	c3                   	ret    

080484f9 <func>:

void func()
{
 80484f9:	55                   	push   %ebp
 80484fa:	89 e5                	mov    %esp,%ebp
 80484fc:	83 ec 28             	sub    $0x28,%esp
    int a = 1;
 80484ff:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
    int b = 2;
 8048506:	c7 45 f0 02 00 00 00 	movl   $0x2,-0x10(%ebp)
    
    printf("func() : \n");
 804850d:	c7 04 24 2e 88 04 08 	movl   $0x804882e,(%esp)
 8048514:	e8 0b fe ff ff       	call   8048324 <puts@plt>
    
    PRINT_STACK_FRAME_INFO();
 8048519:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 8048520:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 8048527:	89 ea                	mov    %ebp,%edx
 8048529:	89 e0                	mov    %esp,%eax
 804852b:	89 55 ec             	mov    %edx,-0x14(%ebp)
 804852e:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048531:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8048534:	b8 aa 87 04 08       	mov    $0x80487aa,%eax
 8048539:	89 54 24 04          	mov    %edx,0x4(%esp)
 804853d:	89 04 24             	mov    %eax,(%esp)
 8048540:	e8 cf fd ff ff       	call   8048314 <printf@plt>
 8048545:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048548:	8b 10                	mov    (%eax),%edx
 804854a:	b8 b4 87 04 08       	mov    $0x80487b4,%eax
 804854f:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048553:	89 04 24             	mov    %eax,(%esp)
 8048556:	e8 b9 fd ff ff       	call   8048314 <printf@plt>
 804855b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804855e:	83 c0 04             	add    $0x4,%eax
 8048561:	8b 10                	mov    (%eax),%edx
 8048563:	b8 c9 87 04 08       	mov    $0x80487c9,%eax
 8048568:	89 54 24 04          	mov    %edx,0x4(%esp)
 804856c:	89 04 24             	mov    %eax,(%esp)
 804856f:	e8 a0 fd ff ff       	call   8048314 <printf@plt>
 8048574:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048577:	8d 50 08             	lea    0x8(%eax),%edx
 804857a:	b8 e0 87 04 08       	mov    $0x80487e0,%eax
 804857f:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048583:	89 04 24             	mov    %eax,(%esp)
 8048586:	e8 89 fd ff ff       	call   8048314 <printf@plt>
 804858b:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804858e:	b8 f3 87 04 08       	mov    $0x80487f3,%eax
 8048593:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048597:	89 04 24             	mov    %eax,(%esp)
 804859a:	e8 75 fd ff ff       	call   8048314 <printf@plt>
 804859f:	b8 fd 87 04 08       	mov    $0x80487fd,%eax
 80485a4:	8d 55 ec             	lea    -0x14(%ebp),%edx
 80485a7:	89 54 24 04          	mov    %edx,0x4(%esp)
 80485ab:	89 04 24             	mov    %eax,(%esp)
 80485ae:	e8 61 fd ff ff       	call   8048314 <printf@plt>
 80485b3:	b8 08 88 04 08       	mov    $0x8048808,%eax
 80485b8:	8d 55 e8             	lea    -0x18(%ebp),%edx
 80485bb:	89 54 24 04          	mov    %edx,0x4(%esp)
 80485bf:	89 04 24             	mov    %eax,(%esp)
 80485c2:	e8 4d fd ff ff       	call   8048314 <printf@plt>
    
    printf("&a = %p\n", &a);
 80485c7:	b8 13 88 04 08       	mov    $0x8048813,%eax
 80485cc:	8d 55 f4             	lea    -0xc(%ebp),%edx
 80485cf:	89 54 24 04          	mov    %edx,0x4(%esp)
 80485d3:	89 04 24             	mov    %eax,(%esp)
 80485d6:	e8 39 fd ff ff       	call   8048314 <printf@plt>
    printf("&b = %p\n", &b);
 80485db:	b8 1c 88 04 08       	mov    $0x804881c,%eax
 80485e0:	8d 55 f0             	lea    -0x10(%ebp),%edx
 80485e3:	89 54 24 04          	mov    %edx,0x4(%esp)
 80485e7:	89 04 24             	mov    %eax,(%esp)
 80485ea:	e8 25 fd ff ff       	call   8048314 <printf@plt>
    
    test(a, b);
 80485ef:	8b 55 f0             	mov    -0x10(%ebp),%edx
 80485f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80485f5:	89 54 24 04          	mov    %edx,0x4(%esp)
 80485f9:	89 04 24             	mov    %eax,(%esp)
 80485fc:	e8 f3 fd ff ff       	call   80483f4 <test>
}
 8048601:	c9                   	leave  
 8048602:	c3                   	ret    

08048603 <main>:

int main()
{
 8048603:	55                   	push   %ebp
 8048604:	89 e5                	mov    %esp,%ebp
 8048606:	83 e4 f0             	and    $0xfffffff0,%esp
 8048609:	83 ec 20             	sub    $0x20,%esp
    printf("main() : \n");
 804860c:	c7 04 24 38 88 04 08 	movl   $0x8048838,(%esp)
 8048613:	e8 0c fd ff ff       	call   8048324 <puts@plt>
    
    PRINT_STACK_FRAME_INFO();
 8048618:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
 804861f:	00 
 8048620:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
 8048627:	00 
 8048628:	89 ea                	mov    %ebp,%edx
 804862a:	89 e0                	mov    %esp,%eax
 804862c:	89 54 24 1c          	mov    %edx,0x1c(%esp)
 8048630:	89 44 24 18          	mov    %eax,0x18(%esp)
 8048634:	8b 54 24 1c          	mov    0x1c(%esp),%edx
 8048638:	b8 aa 87 04 08       	mov    $0x80487aa,%eax
 804863d:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048641:	89 04 24             	mov    %eax,(%esp)
 8048644:	e8 cb fc ff ff       	call   8048314 <printf@plt>
 8048649:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 804864d:	8b 10                	mov    (%eax),%edx
 804864f:	b8 b4 87 04 08       	mov    $0x80487b4,%eax
 8048654:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048658:	89 04 24             	mov    %eax,(%esp)
 804865b:	e8 b4 fc ff ff       	call   8048314 <printf@plt>
 8048660:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 8048664:	83 c0 04             	add    $0x4,%eax
 8048667:	8b 10                	mov    (%eax),%edx
 8048669:	b8 c9 87 04 08       	mov    $0x80487c9,%eax
 804866e:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048672:	89 04 24             	mov    %eax,(%esp)
 8048675:	e8 9a fc ff ff       	call   8048314 <printf@plt>
 804867a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 804867e:	8d 50 08             	lea    0x8(%eax),%edx
 8048681:	b8 e0 87 04 08       	mov    $0x80487e0,%eax
 8048686:	89 54 24 04          	mov    %edx,0x4(%esp)
 804868a:	89 04 24             	mov    %eax,(%esp)
 804868d:	e8 82 fc ff ff       	call   8048314 <printf@plt>
 8048692:	8b 54 24 18          	mov    0x18(%esp),%edx
 8048696:	b8 f3 87 04 08       	mov    $0x80487f3,%eax
 804869b:	89 54 24 04          	mov    %edx,0x4(%esp)
 804869f:	89 04 24             	mov    %eax,(%esp)
 80486a2:	e8 6d fc ff ff       	call   8048314 <printf@plt>
 80486a7:	b8 fd 87 04 08       	mov    $0x80487fd,%eax
 80486ac:	8d 54 24 1c          	lea    0x1c(%esp),%edx
 80486b0:	89 54 24 04          	mov    %edx,0x4(%esp)
 80486b4:	89 04 24             	mov    %eax,(%esp)
 80486b7:	e8 58 fc ff ff       	call   8048314 <printf@plt>
 80486bc:	b8 08 88 04 08       	mov    $0x8048808,%eax
 80486c1:	8d 54 24 18          	lea    0x18(%esp),%edx
 80486c5:	89 54 24 04          	mov    %edx,0x4(%esp)
 80486c9:	89 04 24             	mov    %eax,(%esp)
 80486cc:	e8 43 fc ff ff       	call   8048314 <printf@plt>
    
    func();
 80486d1:	e8 23 fe ff ff       	call   80484f9 <func>

    return 0;
 80486d6:	b8 00 00 00 00       	mov    $0x0,%eax
 80486db:	c9                   	leave  
 80486dc:	c3                   	ret    
 80486dd:	90                   	nop
 80486de:	90                   	nop
 80486df:	90                   	nop

080486e0 <__libc_csu_fini>:
 80486e0:	55                   	push   %ebp
 80486e1:	89 e5                	mov    %esp,%ebp
 80486e3:	5d                   	pop    %ebp
 80486e4:	c3                   	ret    
 80486e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80486e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080486f0 <__libc_csu_init>:
 80486f0:	55                   	push   %ebp
 80486f1:	89 e5                	mov    %esp,%ebp
 80486f3:	57                   	push   %edi
 80486f4:	56                   	push   %esi
 80486f5:	53                   	push   %ebx
 80486f6:	e8 4f 00 00 00       	call   804874a <__i686.get_pc_thunk.bx>
 80486fb:	81 c3 f9 18 00 00    	add    $0x18f9,%ebx
 8048701:	83 ec 1c             	sub    $0x1c,%esp
 8048704:	e8 ab fb ff ff       	call   80482b4 <_init>
 8048709:	8d bb 20 ff ff ff    	lea    -0xe0(%ebx),%edi
 804870f:	8d 83 20 ff ff ff    	lea    -0xe0(%ebx),%eax
 8048715:	29 c7                	sub    %eax,%edi
 8048717:	c1 ff 02             	sar    $0x2,%edi
 804871a:	85 ff                	test   %edi,%edi
 804871c:	74 24                	je     8048742 <__libc_csu_init+0x52>
 804871e:	31 f6                	xor    %esi,%esi
 8048720:	8b 45 10             	mov    0x10(%ebp),%eax
 8048723:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048727:	8b 45 0c             	mov    0xc(%ebp),%eax
 804872a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804872e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048731:	89 04 24             	mov    %eax,(%esp)
 8048734:	ff 94 b3 20 ff ff ff 	call   *-0xe0(%ebx,%esi,4)
 804873b:	83 c6 01             	add    $0x1,%esi
 804873e:	39 fe                	cmp    %edi,%esi
 8048740:	72 de                	jb     8048720 <__libc_csu_init+0x30>
 8048742:	83 c4 1c             	add    $0x1c,%esp
 8048745:	5b                   	pop    %ebx
 8048746:	5e                   	pop    %esi
 8048747:	5f                   	pop    %edi
 8048748:	5d                   	pop    %ebp
 8048749:	c3                   	ret    

0804874a <__i686.get_pc_thunk.bx>:
 804874a:	8b 1c 24             	mov    (%esp),%ebx
 804874d:	c3                   	ret    
 804874e:	90                   	nop
 804874f:	90                   	nop

08048750 <__do_global_ctors_aux>:
 8048750:	55                   	push   %ebp
 8048751:	89 e5                	mov    %esp,%ebp
 8048753:	53                   	push   %ebx
 8048754:	83 ec 04             	sub    $0x4,%esp
 8048757:	a1 14 9f 04 08       	mov    0x8049f14,%eax
 804875c:	83 f8 ff             	cmp    $0xffffffff,%eax
 804875f:	74 13                	je     8048774 <__do_global_ctors_aux+0x24>
 8048761:	bb 14 9f 04 08       	mov    $0x8049f14,%ebx
 8048766:	66 90                	xchg   %ax,%ax
 8048768:	83 eb 04             	sub    $0x4,%ebx
 804876b:	ff d0                	call   *%eax
 804876d:	8b 03                	mov    (%ebx),%eax
 804876f:	83 f8 ff             	cmp    $0xffffffff,%eax
 8048772:	75 f4                	jne    8048768 <__do_global_ctors_aux+0x18>
 8048774:	83 c4 04             	add    $0x4,%esp
 8048777:	5b                   	pop    %ebx
 8048778:	5d                   	pop    %ebp
 8048779:	c3                   	ret    
 804877a:	90                   	nop
 804877b:	90                   	nop

Disassembly of section .fini:

0804877c <_fini>:
 804877c:	55                   	push   %ebp
 804877d:	89 e5                	mov    %esp,%ebp
 804877f:	53                   	push   %ebx
 8048780:	83 ec 04             	sub    $0x4,%esp
 8048783:	e8 00 00 00 00       	call   8048788 <_fini+0xc>
 8048788:	5b                   	pop    %ebx
 8048789:	81 c3 6c 18 00 00    	add    $0x186c,%ebx
 804878f:	e8 dc fb ff ff       	call   8048370 <__do_global_dtors_aux>
 8048794:	59                   	pop    %ecx
 8048795:	5b                   	pop    %ebx
 8048796:	c9                   	leave  
 8048797:	c3                   	ret    
