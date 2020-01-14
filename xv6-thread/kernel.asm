
kernel:     file format elf32-i386


Disassembly of section .text:

80100000 <multiboot_header>:
80100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
80100006:	00 00                	add    %al,(%eax)
80100008:	fe 4f 52             	decb   0x52(%edi)
8010000b:	e4                   	.byte 0xe4

8010000c <entry>:
8010000c:	0f 20 e0             	mov    %cr4,%eax
8010000f:	83 c8 10             	or     $0x10,%eax
80100012:	0f 22 e0             	mov    %eax,%cr4
80100015:	b8 00 a0 10 00       	mov    $0x10a000,%eax
8010001a:	0f 22 d8             	mov    %eax,%cr3
8010001d:	0f 20 c0             	mov    %cr0,%eax
80100020:	0d 00 00 01 80       	or     $0x80010000,%eax
80100025:	0f 22 c0             	mov    %eax,%cr0
80100028:	bc c0 c5 10 80       	mov    $0x8010c5c0,%esp
8010002d:	b8 a0 2e 10 80       	mov    $0x80102ea0,%eax
80100032:	ff e0                	jmp    *%eax
80100034:	66 90                	xchg   %ax,%ax
80100036:	66 90                	xchg   %ax,%ax
80100038:	66 90                	xchg   %ax,%ax
8010003a:	66 90                	xchg   %ax,%ax
8010003c:	66 90                	xchg   %ax,%ax
8010003e:	66 90                	xchg   %ax,%ax

80100040 <binit>:
80100040:	55                   	push   %ebp
80100041:	89 e5                	mov    %esp,%ebp
80100043:	53                   	push   %ebx
80100044:	bb f4 c5 10 80       	mov    $0x8010c5f4,%ebx
80100049:	83 ec 0c             	sub    $0xc,%esp
8010004c:	68 20 78 10 80       	push   $0x80107820
80100051:	68 c0 c5 10 80       	push   $0x8010c5c0
80100056:	e8 85 49 00 00       	call   801049e0 <initlock>
8010005b:	c7 05 0c 0d 11 80 bc 	movl   $0x80110cbc,0x80110d0c
80100062:	0c 11 80 
80100065:	c7 05 10 0d 11 80 bc 	movl   $0x80110cbc,0x80110d10
8010006c:	0c 11 80 
8010006f:	83 c4 10             	add    $0x10,%esp
80100072:	ba bc 0c 11 80       	mov    $0x80110cbc,%edx
80100077:	eb 09                	jmp    80100082 <binit+0x42>
80100079:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100080:	89 c3                	mov    %eax,%ebx
80100082:	8d 43 0c             	lea    0xc(%ebx),%eax
80100085:	83 ec 08             	sub    $0x8,%esp
80100088:	89 53 54             	mov    %edx,0x54(%ebx)
8010008b:	c7 43 50 bc 0c 11 80 	movl   $0x80110cbc,0x50(%ebx)
80100092:	68 27 78 10 80       	push   $0x80107827
80100097:	50                   	push   %eax
80100098:	e8 13 48 00 00       	call   801048b0 <initsleeplock>
8010009d:	a1 10 0d 11 80       	mov    0x80110d10,%eax
801000a2:	83 c4 10             	add    $0x10,%esp
801000a5:	89 da                	mov    %ebx,%edx
801000a7:	89 58 50             	mov    %ebx,0x50(%eax)
801000aa:	8d 83 5c 02 00 00    	lea    0x25c(%ebx),%eax
801000b0:	89 1d 10 0d 11 80    	mov    %ebx,0x80110d10
801000b6:	3d bc 0c 11 80       	cmp    $0x80110cbc,%eax
801000bb:	75 c3                	jne    80100080 <binit+0x40>
801000bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801000c0:	c9                   	leave  
801000c1:	c3                   	ret    
801000c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801000c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801000d0 <bread>:
801000d0:	55                   	push   %ebp
801000d1:	89 e5                	mov    %esp,%ebp
801000d3:	57                   	push   %edi
801000d4:	56                   	push   %esi
801000d5:	53                   	push   %ebx
801000d6:	83 ec 18             	sub    $0x18,%esp
801000d9:	8b 75 08             	mov    0x8(%ebp),%esi
801000dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801000df:	68 c0 c5 10 80       	push   $0x8010c5c0
801000e4:	e8 57 4a 00 00       	call   80104b40 <acquire>
801000e9:	8b 1d 10 0d 11 80    	mov    0x80110d10,%ebx
801000ef:	83 c4 10             	add    $0x10,%esp
801000f2:	81 fb bc 0c 11 80    	cmp    $0x80110cbc,%ebx
801000f8:	75 11                	jne    8010010b <bread+0x3b>
801000fa:	eb 24                	jmp    80100120 <bread+0x50>
801000fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100100:	8b 5b 54             	mov    0x54(%ebx),%ebx
80100103:	81 fb bc 0c 11 80    	cmp    $0x80110cbc,%ebx
80100109:	74 15                	je     80100120 <bread+0x50>
8010010b:	3b 73 04             	cmp    0x4(%ebx),%esi
8010010e:	75 f0                	jne    80100100 <bread+0x30>
80100110:	3b 7b 08             	cmp    0x8(%ebx),%edi
80100113:	75 eb                	jne    80100100 <bread+0x30>
80100115:	83 43 4c 01          	addl   $0x1,0x4c(%ebx)
80100119:	eb 3f                	jmp    8010015a <bread+0x8a>
8010011b:	90                   	nop
8010011c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100120:	8b 1d 0c 0d 11 80    	mov    0x80110d0c,%ebx
80100126:	81 fb bc 0c 11 80    	cmp    $0x80110cbc,%ebx
8010012c:	75 0d                	jne    8010013b <bread+0x6b>
8010012e:	eb 60                	jmp    80100190 <bread+0xc0>
80100130:	8b 5b 50             	mov    0x50(%ebx),%ebx
80100133:	81 fb bc 0c 11 80    	cmp    $0x80110cbc,%ebx
80100139:	74 55                	je     80100190 <bread+0xc0>
8010013b:	8b 43 4c             	mov    0x4c(%ebx),%eax
8010013e:	85 c0                	test   %eax,%eax
80100140:	75 ee                	jne    80100130 <bread+0x60>
80100142:	f6 03 04             	testb  $0x4,(%ebx)
80100145:	75 e9                	jne    80100130 <bread+0x60>
80100147:	89 73 04             	mov    %esi,0x4(%ebx)
8010014a:	89 7b 08             	mov    %edi,0x8(%ebx)
8010014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80100153:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
8010015a:	83 ec 0c             	sub    $0xc,%esp
8010015d:	68 c0 c5 10 80       	push   $0x8010c5c0
80100162:	e8 89 4a 00 00       	call   80104bf0 <release>
80100167:	8d 43 0c             	lea    0xc(%ebx),%eax
8010016a:	89 04 24             	mov    %eax,(%esp)
8010016d:	e8 7e 47 00 00       	call   801048f0 <acquiresleep>
80100172:	83 c4 10             	add    $0x10,%esp
80100175:	f6 03 02             	testb  $0x2,(%ebx)
80100178:	75 0c                	jne    80100186 <bread+0xb6>
8010017a:	83 ec 0c             	sub    $0xc,%esp
8010017d:	53                   	push   %ebx
8010017e:	e8 ad 1f 00 00       	call   80102130 <iderw>
80100183:	83 c4 10             	add    $0x10,%esp
80100186:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100189:	89 d8                	mov    %ebx,%eax
8010018b:	5b                   	pop    %ebx
8010018c:	5e                   	pop    %esi
8010018d:	5f                   	pop    %edi
8010018e:	5d                   	pop    %ebp
8010018f:	c3                   	ret    
80100190:	83 ec 0c             	sub    $0xc,%esp
80100193:	68 2e 78 10 80       	push   $0x8010782e
80100198:	e8 d3 01 00 00       	call   80100370 <panic>
8010019d:	8d 76 00             	lea    0x0(%esi),%esi

801001a0 <bwrite>:
801001a0:	55                   	push   %ebp
801001a1:	89 e5                	mov    %esp,%ebp
801001a3:	53                   	push   %ebx
801001a4:	83 ec 10             	sub    $0x10,%esp
801001a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001aa:	8d 43 0c             	lea    0xc(%ebx),%eax
801001ad:	50                   	push   %eax
801001ae:	e8 dd 47 00 00       	call   80104990 <holdingsleep>
801001b3:	83 c4 10             	add    $0x10,%esp
801001b6:	85 c0                	test   %eax,%eax
801001b8:	74 0f                	je     801001c9 <bwrite+0x29>
801001ba:	83 0b 04             	orl    $0x4,(%ebx)
801001bd:	89 5d 08             	mov    %ebx,0x8(%ebp)
801001c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801001c3:	c9                   	leave  
801001c4:	e9 67 1f 00 00       	jmp    80102130 <iderw>
801001c9:	83 ec 0c             	sub    $0xc,%esp
801001cc:	68 3f 78 10 80       	push   $0x8010783f
801001d1:	e8 9a 01 00 00       	call   80100370 <panic>
801001d6:	8d 76 00             	lea    0x0(%esi),%esi
801001d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801001e0 <brelse>:
801001e0:	55                   	push   %ebp
801001e1:	89 e5                	mov    %esp,%ebp
801001e3:	56                   	push   %esi
801001e4:	53                   	push   %ebx
801001e5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801001e8:	83 ec 0c             	sub    $0xc,%esp
801001eb:	8d 73 0c             	lea    0xc(%ebx),%esi
801001ee:	56                   	push   %esi
801001ef:	e8 9c 47 00 00       	call   80104990 <holdingsleep>
801001f4:	83 c4 10             	add    $0x10,%esp
801001f7:	85 c0                	test   %eax,%eax
801001f9:	74 66                	je     80100261 <brelse+0x81>
801001fb:	83 ec 0c             	sub    $0xc,%esp
801001fe:	56                   	push   %esi
801001ff:	e8 4c 47 00 00       	call   80104950 <releasesleep>
80100204:	c7 04 24 c0 c5 10 80 	movl   $0x8010c5c0,(%esp)
8010020b:	e8 30 49 00 00       	call   80104b40 <acquire>
80100210:	8b 43 4c             	mov    0x4c(%ebx),%eax
80100213:	83 c4 10             	add    $0x10,%esp
80100216:	83 e8 01             	sub    $0x1,%eax
80100219:	85 c0                	test   %eax,%eax
8010021b:	89 43 4c             	mov    %eax,0x4c(%ebx)
8010021e:	75 2f                	jne    8010024f <brelse+0x6f>
80100220:	8b 43 54             	mov    0x54(%ebx),%eax
80100223:	8b 53 50             	mov    0x50(%ebx),%edx
80100226:	89 50 50             	mov    %edx,0x50(%eax)
80100229:	8b 43 50             	mov    0x50(%ebx),%eax
8010022c:	8b 53 54             	mov    0x54(%ebx),%edx
8010022f:	89 50 54             	mov    %edx,0x54(%eax)
80100232:	a1 10 0d 11 80       	mov    0x80110d10,%eax
80100237:	c7 43 50 bc 0c 11 80 	movl   $0x80110cbc,0x50(%ebx)
8010023e:	89 43 54             	mov    %eax,0x54(%ebx)
80100241:	a1 10 0d 11 80       	mov    0x80110d10,%eax
80100246:	89 58 50             	mov    %ebx,0x50(%eax)
80100249:	89 1d 10 0d 11 80    	mov    %ebx,0x80110d10
8010024f:	c7 45 08 c0 c5 10 80 	movl   $0x8010c5c0,0x8(%ebp)
80100256:	8d 65 f8             	lea    -0x8(%ebp),%esp
80100259:	5b                   	pop    %ebx
8010025a:	5e                   	pop    %esi
8010025b:	5d                   	pop    %ebp
8010025c:	e9 8f 49 00 00       	jmp    80104bf0 <release>
80100261:	83 ec 0c             	sub    $0xc,%esp
80100264:	68 46 78 10 80       	push   $0x80107846
80100269:	e8 02 01 00 00       	call   80100370 <panic>
8010026e:	66 90                	xchg   %ax,%ax

80100270 <consoleread>:
80100270:	55                   	push   %ebp
80100271:	89 e5                	mov    %esp,%ebp
80100273:	57                   	push   %edi
80100274:	56                   	push   %esi
80100275:	53                   	push   %ebx
80100276:	83 ec 28             	sub    $0x28,%esp
80100279:	8b 7d 08             	mov    0x8(%ebp),%edi
8010027c:	8b 75 0c             	mov    0xc(%ebp),%esi
8010027f:	57                   	push   %edi
80100280:	e8 0b 15 00 00       	call   80101790 <iunlock>
80100285:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
8010028c:	e8 af 48 00 00       	call   80104b40 <acquire>
80100291:	8b 5d 10             	mov    0x10(%ebp),%ebx
80100294:	83 c4 10             	add    $0x10,%esp
80100297:	31 c0                	xor    %eax,%eax
80100299:	85 db                	test   %ebx,%ebx
8010029b:	0f 8e 9a 00 00 00    	jle    8010033b <consoleread+0xcb>
801002a1:	a1 a0 0f 11 80       	mov    0x80110fa0,%eax
801002a6:	3b 05 a4 0f 11 80    	cmp    0x80110fa4,%eax
801002ac:	74 24                	je     801002d2 <consoleread+0x62>
801002ae:	eb 58                	jmp    80100308 <consoleread+0x98>
801002b0:	83 ec 08             	sub    $0x8,%esp
801002b3:	68 20 b5 10 80       	push   $0x8010b520
801002b8:	68 a0 0f 11 80       	push   $0x80110fa0
801002bd:	e8 8e 3c 00 00       	call   80103f50 <sleep>
801002c2:	a1 a0 0f 11 80       	mov    0x80110fa0,%eax
801002c7:	83 c4 10             	add    $0x10,%esp
801002ca:	3b 05 a4 0f 11 80    	cmp    0x80110fa4,%eax
801002d0:	75 36                	jne    80100308 <consoleread+0x98>
801002d2:	e8 19 35 00 00       	call   801037f0 <myproc>
801002d7:	8b 40 24             	mov    0x24(%eax),%eax
801002da:	85 c0                	test   %eax,%eax
801002dc:	74 d2                	je     801002b0 <consoleread+0x40>
801002de:	83 ec 0c             	sub    $0xc,%esp
801002e1:	68 20 b5 10 80       	push   $0x8010b520
801002e6:	e8 05 49 00 00       	call   80104bf0 <release>
801002eb:	89 3c 24             	mov    %edi,(%esp)
801002ee:	e8 bd 13 00 00       	call   801016b0 <ilock>
801002f3:	83 c4 10             	add    $0x10,%esp
801002f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801002fb:	8d 65 f4             	lea    -0xc(%ebp),%esp
801002fe:	5b                   	pop    %ebx
801002ff:	5e                   	pop    %esi
80100300:	5f                   	pop    %edi
80100301:	5d                   	pop    %ebp
80100302:	c3                   	ret    
80100303:	90                   	nop
80100304:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100308:	8d 50 01             	lea    0x1(%eax),%edx
8010030b:	89 15 a0 0f 11 80    	mov    %edx,0x80110fa0
80100311:	89 c2                	mov    %eax,%edx
80100313:	83 e2 7f             	and    $0x7f,%edx
80100316:	0f be 92 20 0f 11 80 	movsbl -0x7feef0e0(%edx),%edx
8010031d:	83 fa 04             	cmp    $0x4,%edx
80100320:	74 39                	je     8010035b <consoleread+0xeb>
80100322:	83 c6 01             	add    $0x1,%esi
80100325:	83 eb 01             	sub    $0x1,%ebx
80100328:	83 fa 0a             	cmp    $0xa,%edx
8010032b:	88 56 ff             	mov    %dl,-0x1(%esi)
8010032e:	74 35                	je     80100365 <consoleread+0xf5>
80100330:	85 db                	test   %ebx,%ebx
80100332:	0f 85 69 ff ff ff    	jne    801002a1 <consoleread+0x31>
80100338:	8b 45 10             	mov    0x10(%ebp),%eax
8010033b:	83 ec 0c             	sub    $0xc,%esp
8010033e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100341:	68 20 b5 10 80       	push   $0x8010b520
80100346:	e8 a5 48 00 00       	call   80104bf0 <release>
8010034b:	89 3c 24             	mov    %edi,(%esp)
8010034e:	e8 5d 13 00 00       	call   801016b0 <ilock>
80100353:	83 c4 10             	add    $0x10,%esp
80100356:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80100359:	eb a0                	jmp    801002fb <consoleread+0x8b>
8010035b:	39 5d 10             	cmp    %ebx,0x10(%ebp)
8010035e:	76 05                	jbe    80100365 <consoleread+0xf5>
80100360:	a3 a0 0f 11 80       	mov    %eax,0x80110fa0
80100365:	8b 45 10             	mov    0x10(%ebp),%eax
80100368:	29 d8                	sub    %ebx,%eax
8010036a:	eb cf                	jmp    8010033b <consoleread+0xcb>
8010036c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100370 <panic>:
80100370:	55                   	push   %ebp
80100371:	89 e5                	mov    %esp,%ebp
80100373:	56                   	push   %esi
80100374:	53                   	push   %ebx
80100375:	83 ec 30             	sub    $0x30,%esp
80100378:	fa                   	cli    
80100379:	c7 05 54 b5 10 80 00 	movl   $0x0,0x8010b554
80100380:	00 00 00 
80100383:	8d 5d d0             	lea    -0x30(%ebp),%ebx
80100386:	8d 75 f8             	lea    -0x8(%ebp),%esi
80100389:	e8 a2 23 00 00       	call   80102730 <lapicid>
8010038e:	83 ec 08             	sub    $0x8,%esp
80100391:	50                   	push   %eax
80100392:	68 4d 78 10 80       	push   $0x8010784d
80100397:	e8 c4 02 00 00       	call   80100660 <cprintf>
8010039c:	58                   	pop    %eax
8010039d:	ff 75 08             	pushl  0x8(%ebp)
801003a0:	e8 bb 02 00 00       	call   80100660 <cprintf>
801003a5:	c7 04 24 e7 81 10 80 	movl   $0x801081e7,(%esp)
801003ac:	e8 af 02 00 00       	call   80100660 <cprintf>
801003b1:	5a                   	pop    %edx
801003b2:	8d 45 08             	lea    0x8(%ebp),%eax
801003b5:	59                   	pop    %ecx
801003b6:	53                   	push   %ebx
801003b7:	50                   	push   %eax
801003b8:	e8 43 46 00 00       	call   80104a00 <getcallerpcs>
801003bd:	83 c4 10             	add    $0x10,%esp
801003c0:	83 ec 08             	sub    $0x8,%esp
801003c3:	ff 33                	pushl  (%ebx)
801003c5:	83 c3 04             	add    $0x4,%ebx
801003c8:	68 61 78 10 80       	push   $0x80107861
801003cd:	e8 8e 02 00 00       	call   80100660 <cprintf>
801003d2:	83 c4 10             	add    $0x10,%esp
801003d5:	39 f3                	cmp    %esi,%ebx
801003d7:	75 e7                	jne    801003c0 <panic+0x50>
801003d9:	c7 05 58 b5 10 80 01 	movl   $0x1,0x8010b558
801003e0:	00 00 00 
801003e3:	eb fe                	jmp    801003e3 <panic+0x73>
801003e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801003e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801003f0 <consputc>:
801003f0:	8b 15 58 b5 10 80    	mov    0x8010b558,%edx
801003f6:	85 d2                	test   %edx,%edx
801003f8:	74 06                	je     80100400 <consputc+0x10>
801003fa:	fa                   	cli    
801003fb:	eb fe                	jmp    801003fb <consputc+0xb>
801003fd:	8d 76 00             	lea    0x0(%esi),%esi
80100400:	55                   	push   %ebp
80100401:	89 e5                	mov    %esp,%ebp
80100403:	57                   	push   %edi
80100404:	56                   	push   %esi
80100405:	53                   	push   %ebx
80100406:	89 c3                	mov    %eax,%ebx
80100408:	83 ec 0c             	sub    $0xc,%esp
8010040b:	3d 00 01 00 00       	cmp    $0x100,%eax
80100410:	0f 84 b8 00 00 00    	je     801004ce <consputc+0xde>
80100416:	83 ec 0c             	sub    $0xc,%esp
80100419:	50                   	push   %eax
8010041a:	e8 b1 5f 00 00       	call   801063d0 <uartputc>
8010041f:	83 c4 10             	add    $0x10,%esp
80100422:	bf d4 03 00 00       	mov    $0x3d4,%edi
80100427:	b8 0e 00 00 00       	mov    $0xe,%eax
8010042c:	89 fa                	mov    %edi,%edx
8010042e:	ee                   	out    %al,(%dx)
8010042f:	be d5 03 00 00       	mov    $0x3d5,%esi
80100434:	89 f2                	mov    %esi,%edx
80100436:	ec                   	in     (%dx),%al
80100437:	0f b6 c0             	movzbl %al,%eax
8010043a:	89 fa                	mov    %edi,%edx
8010043c:	c1 e0 08             	shl    $0x8,%eax
8010043f:	89 c1                	mov    %eax,%ecx
80100441:	b8 0f 00 00 00       	mov    $0xf,%eax
80100446:	ee                   	out    %al,(%dx)
80100447:	89 f2                	mov    %esi,%edx
80100449:	ec                   	in     (%dx),%al
8010044a:	0f b6 c0             	movzbl %al,%eax
8010044d:	09 c8                	or     %ecx,%eax
8010044f:	83 fb 0a             	cmp    $0xa,%ebx
80100452:	0f 84 0b 01 00 00    	je     80100563 <consputc+0x173>
80100458:	81 fb 00 01 00 00    	cmp    $0x100,%ebx
8010045e:	0f 84 e6 00 00 00    	je     8010054a <consputc+0x15a>
80100464:	0f b6 d3             	movzbl %bl,%edx
80100467:	8d 78 01             	lea    0x1(%eax),%edi
8010046a:	80 ce 07             	or     $0x7,%dh
8010046d:	66 89 94 00 00 80 0b 	mov    %dx,-0x7ff48000(%eax,%eax,1)
80100474:	80 
80100475:	81 ff d0 07 00 00    	cmp    $0x7d0,%edi
8010047b:	0f 8f bc 00 00 00    	jg     8010053d <consputc+0x14d>
80100481:	81 ff 7f 07 00 00    	cmp    $0x77f,%edi
80100487:	7f 6f                	jg     801004f8 <consputc+0x108>
80100489:	89 f8                	mov    %edi,%eax
8010048b:	8d 8c 3f 00 80 0b 80 	lea    -0x7ff48000(%edi,%edi,1),%ecx
80100492:	89 fb                	mov    %edi,%ebx
80100494:	c1 e8 08             	shr    $0x8,%eax
80100497:	89 c6                	mov    %eax,%esi
80100499:	bf d4 03 00 00       	mov    $0x3d4,%edi
8010049e:	b8 0e 00 00 00       	mov    $0xe,%eax
801004a3:	89 fa                	mov    %edi,%edx
801004a5:	ee                   	out    %al,(%dx)
801004a6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004ab:	89 f0                	mov    %esi,%eax
801004ad:	ee                   	out    %al,(%dx)
801004ae:	b8 0f 00 00 00       	mov    $0xf,%eax
801004b3:	89 fa                	mov    %edi,%edx
801004b5:	ee                   	out    %al,(%dx)
801004b6:	ba d5 03 00 00       	mov    $0x3d5,%edx
801004bb:	89 d8                	mov    %ebx,%eax
801004bd:	ee                   	out    %al,(%dx)
801004be:	b8 20 07 00 00       	mov    $0x720,%eax
801004c3:	66 89 01             	mov    %ax,(%ecx)
801004c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
801004c9:	5b                   	pop    %ebx
801004ca:	5e                   	pop    %esi
801004cb:	5f                   	pop    %edi
801004cc:	5d                   	pop    %ebp
801004cd:	c3                   	ret    
801004ce:	83 ec 0c             	sub    $0xc,%esp
801004d1:	6a 08                	push   $0x8
801004d3:	e8 f8 5e 00 00       	call   801063d0 <uartputc>
801004d8:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
801004df:	e8 ec 5e 00 00       	call   801063d0 <uartputc>
801004e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
801004eb:	e8 e0 5e 00 00       	call   801063d0 <uartputc>
801004f0:	83 c4 10             	add    $0x10,%esp
801004f3:	e9 2a ff ff ff       	jmp    80100422 <consputc+0x32>
801004f8:	83 ec 04             	sub    $0x4,%esp
801004fb:	8d 5f b0             	lea    -0x50(%edi),%ebx
801004fe:	68 60 0e 00 00       	push   $0xe60
80100503:	68 a0 80 0b 80       	push   $0x800b80a0
80100508:	68 00 80 0b 80       	push   $0x800b8000
8010050d:	8d b4 1b 00 80 0b 80 	lea    -0x7ff48000(%ebx,%ebx,1),%esi
80100514:	e8 d7 47 00 00       	call   80104cf0 <memmove>
80100519:	b8 80 07 00 00       	mov    $0x780,%eax
8010051e:	83 c4 0c             	add    $0xc,%esp
80100521:	29 d8                	sub    %ebx,%eax
80100523:	01 c0                	add    %eax,%eax
80100525:	50                   	push   %eax
80100526:	6a 00                	push   $0x0
80100528:	56                   	push   %esi
80100529:	e8 12 47 00 00       	call   80104c40 <memset>
8010052e:	89 f1                	mov    %esi,%ecx
80100530:	83 c4 10             	add    $0x10,%esp
80100533:	be 07 00 00 00       	mov    $0x7,%esi
80100538:	e9 5c ff ff ff       	jmp    80100499 <consputc+0xa9>
8010053d:	83 ec 0c             	sub    $0xc,%esp
80100540:	68 65 78 10 80       	push   $0x80107865
80100545:	e8 26 fe ff ff       	call   80100370 <panic>
8010054a:	85 c0                	test   %eax,%eax
8010054c:	8d 78 ff             	lea    -0x1(%eax),%edi
8010054f:	0f 85 20 ff ff ff    	jne    80100475 <consputc+0x85>
80100555:	b9 00 80 0b 80       	mov    $0x800b8000,%ecx
8010055a:	31 db                	xor    %ebx,%ebx
8010055c:	31 f6                	xor    %esi,%esi
8010055e:	e9 36 ff ff ff       	jmp    80100499 <consputc+0xa9>
80100563:	ba 67 66 66 66       	mov    $0x66666667,%edx
80100568:	f7 ea                	imul   %edx
8010056a:	89 d0                	mov    %edx,%eax
8010056c:	c1 e8 05             	shr    $0x5,%eax
8010056f:	8d 04 80             	lea    (%eax,%eax,4),%eax
80100572:	c1 e0 04             	shl    $0x4,%eax
80100575:	8d 78 50             	lea    0x50(%eax),%edi
80100578:	e9 f8 fe ff ff       	jmp    80100475 <consputc+0x85>
8010057d:	8d 76 00             	lea    0x0(%esi),%esi

80100580 <printint>:
80100580:	55                   	push   %ebp
80100581:	89 e5                	mov    %esp,%ebp
80100583:	57                   	push   %edi
80100584:	56                   	push   %esi
80100585:	53                   	push   %ebx
80100586:	89 d6                	mov    %edx,%esi
80100588:	83 ec 2c             	sub    $0x2c,%esp
8010058b:	85 c9                	test   %ecx,%ecx
8010058d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
80100590:	74 0c                	je     8010059e <printint+0x1e>
80100592:	89 c7                	mov    %eax,%edi
80100594:	c1 ef 1f             	shr    $0x1f,%edi
80100597:	85 c0                	test   %eax,%eax
80100599:	89 7d d4             	mov    %edi,-0x2c(%ebp)
8010059c:	78 51                	js     801005ef <printint+0x6f>
8010059e:	31 ff                	xor    %edi,%edi
801005a0:	8d 5d d7             	lea    -0x29(%ebp),%ebx
801005a3:	eb 05                	jmp    801005aa <printint+0x2a>
801005a5:	8d 76 00             	lea    0x0(%esi),%esi
801005a8:	89 cf                	mov    %ecx,%edi
801005aa:	31 d2                	xor    %edx,%edx
801005ac:	8d 4f 01             	lea    0x1(%edi),%ecx
801005af:	f7 f6                	div    %esi
801005b1:	0f b6 92 90 78 10 80 	movzbl -0x7fef8770(%edx),%edx
801005b8:	85 c0                	test   %eax,%eax
801005ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
801005bd:	75 e9                	jne    801005a8 <printint+0x28>
801005bf:	8b 45 d4             	mov    -0x2c(%ebp),%eax
801005c2:	85 c0                	test   %eax,%eax
801005c4:	74 08                	je     801005ce <printint+0x4e>
801005c6:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
801005cb:	8d 4f 02             	lea    0x2(%edi),%ecx
801005ce:	8d 74 0d d7          	lea    -0x29(%ebp,%ecx,1),%esi
801005d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005d8:	0f be 06             	movsbl (%esi),%eax
801005db:	83 ee 01             	sub    $0x1,%esi
801005de:	e8 0d fe ff ff       	call   801003f0 <consputc>
801005e3:	39 de                	cmp    %ebx,%esi
801005e5:	75 f1                	jne    801005d8 <printint+0x58>
801005e7:	83 c4 2c             	add    $0x2c,%esp
801005ea:	5b                   	pop    %ebx
801005eb:	5e                   	pop    %esi
801005ec:	5f                   	pop    %edi
801005ed:	5d                   	pop    %ebp
801005ee:	c3                   	ret    
801005ef:	f7 d8                	neg    %eax
801005f1:	eb ab                	jmp    8010059e <printint+0x1e>
801005f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801005f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100600 <consolewrite>:
80100600:	55                   	push   %ebp
80100601:	89 e5                	mov    %esp,%ebp
80100603:	57                   	push   %edi
80100604:	56                   	push   %esi
80100605:	53                   	push   %ebx
80100606:	83 ec 18             	sub    $0x18,%esp
80100609:	ff 75 08             	pushl  0x8(%ebp)
8010060c:	8b 75 10             	mov    0x10(%ebp),%esi
8010060f:	e8 7c 11 00 00       	call   80101790 <iunlock>
80100614:	c7 04 24 20 b5 10 80 	movl   $0x8010b520,(%esp)
8010061b:	e8 20 45 00 00       	call   80104b40 <acquire>
80100620:	8b 7d 0c             	mov    0xc(%ebp),%edi
80100623:	83 c4 10             	add    $0x10,%esp
80100626:	85 f6                	test   %esi,%esi
80100628:	8d 1c 37             	lea    (%edi,%esi,1),%ebx
8010062b:	7e 12                	jle    8010063f <consolewrite+0x3f>
8010062d:	8d 76 00             	lea    0x0(%esi),%esi
80100630:	0f b6 07             	movzbl (%edi),%eax
80100633:	83 c7 01             	add    $0x1,%edi
80100636:	e8 b5 fd ff ff       	call   801003f0 <consputc>
8010063b:	39 df                	cmp    %ebx,%edi
8010063d:	75 f1                	jne    80100630 <consolewrite+0x30>
8010063f:	83 ec 0c             	sub    $0xc,%esp
80100642:	68 20 b5 10 80       	push   $0x8010b520
80100647:	e8 a4 45 00 00       	call   80104bf0 <release>
8010064c:	58                   	pop    %eax
8010064d:	ff 75 08             	pushl  0x8(%ebp)
80100650:	e8 5b 10 00 00       	call   801016b0 <ilock>
80100655:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100658:	89 f0                	mov    %esi,%eax
8010065a:	5b                   	pop    %ebx
8010065b:	5e                   	pop    %esi
8010065c:	5f                   	pop    %edi
8010065d:	5d                   	pop    %ebp
8010065e:	c3                   	ret    
8010065f:	90                   	nop

80100660 <cprintf>:
80100660:	55                   	push   %ebp
80100661:	89 e5                	mov    %esp,%ebp
80100663:	57                   	push   %edi
80100664:	56                   	push   %esi
80100665:	53                   	push   %ebx
80100666:	83 ec 1c             	sub    $0x1c,%esp
80100669:	a1 54 b5 10 80       	mov    0x8010b554,%eax
8010066e:	85 c0                	test   %eax,%eax
80100670:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100673:	0f 85 47 01 00 00    	jne    801007c0 <cprintf+0x160>
80100679:	8b 45 08             	mov    0x8(%ebp),%eax
8010067c:	85 c0                	test   %eax,%eax
8010067e:	89 c1                	mov    %eax,%ecx
80100680:	0f 84 4f 01 00 00    	je     801007d5 <cprintf+0x175>
80100686:	0f b6 00             	movzbl (%eax),%eax
80100689:	31 db                	xor    %ebx,%ebx
8010068b:	8d 75 0c             	lea    0xc(%ebp),%esi
8010068e:	89 cf                	mov    %ecx,%edi
80100690:	85 c0                	test   %eax,%eax
80100692:	75 55                	jne    801006e9 <cprintf+0x89>
80100694:	eb 68                	jmp    801006fe <cprintf+0x9e>
80100696:	8d 76 00             	lea    0x0(%esi),%esi
80100699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801006a0:	83 c3 01             	add    $0x1,%ebx
801006a3:	0f b6 14 1f          	movzbl (%edi,%ebx,1),%edx
801006a7:	85 d2                	test   %edx,%edx
801006a9:	74 53                	je     801006fe <cprintf+0x9e>
801006ab:	83 fa 70             	cmp    $0x70,%edx
801006ae:	74 7a                	je     8010072a <cprintf+0xca>
801006b0:	7f 6e                	jg     80100720 <cprintf+0xc0>
801006b2:	83 fa 25             	cmp    $0x25,%edx
801006b5:	0f 84 ad 00 00 00    	je     80100768 <cprintf+0x108>
801006bb:	83 fa 64             	cmp    $0x64,%edx
801006be:	0f 85 84 00 00 00    	jne    80100748 <cprintf+0xe8>
801006c4:	8d 46 04             	lea    0x4(%esi),%eax
801006c7:	b9 01 00 00 00       	mov    $0x1,%ecx
801006cc:	ba 0a 00 00 00       	mov    $0xa,%edx
801006d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801006d4:	8b 06                	mov    (%esi),%eax
801006d6:	e8 a5 fe ff ff       	call   80100580 <printint>
801006db:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801006de:	83 c3 01             	add    $0x1,%ebx
801006e1:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006e5:	85 c0                	test   %eax,%eax
801006e7:	74 15                	je     801006fe <cprintf+0x9e>
801006e9:	83 f8 25             	cmp    $0x25,%eax
801006ec:	74 b2                	je     801006a0 <cprintf+0x40>
801006ee:	e8 fd fc ff ff       	call   801003f0 <consputc>
801006f3:	83 c3 01             	add    $0x1,%ebx
801006f6:	0f b6 04 1f          	movzbl (%edi,%ebx,1),%eax
801006fa:	85 c0                	test   %eax,%eax
801006fc:	75 eb                	jne    801006e9 <cprintf+0x89>
801006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
80100701:	85 c0                	test   %eax,%eax
80100703:	74 10                	je     80100715 <cprintf+0xb5>
80100705:	83 ec 0c             	sub    $0xc,%esp
80100708:	68 20 b5 10 80       	push   $0x8010b520
8010070d:	e8 de 44 00 00       	call   80104bf0 <release>
80100712:	83 c4 10             	add    $0x10,%esp
80100715:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100718:	5b                   	pop    %ebx
80100719:	5e                   	pop    %esi
8010071a:	5f                   	pop    %edi
8010071b:	5d                   	pop    %ebp
8010071c:	c3                   	ret    
8010071d:	8d 76 00             	lea    0x0(%esi),%esi
80100720:	83 fa 73             	cmp    $0x73,%edx
80100723:	74 5b                	je     80100780 <cprintf+0x120>
80100725:	83 fa 78             	cmp    $0x78,%edx
80100728:	75 1e                	jne    80100748 <cprintf+0xe8>
8010072a:	8d 46 04             	lea    0x4(%esi),%eax
8010072d:	31 c9                	xor    %ecx,%ecx
8010072f:	ba 10 00 00 00       	mov    $0x10,%edx
80100734:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100737:	8b 06                	mov    (%esi),%eax
80100739:	e8 42 fe ff ff       	call   80100580 <printint>
8010073e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
80100741:	eb 9b                	jmp    801006de <cprintf+0x7e>
80100743:	90                   	nop
80100744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100748:	b8 25 00 00 00       	mov    $0x25,%eax
8010074d:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80100750:	e8 9b fc ff ff       	call   801003f0 <consputc>
80100755:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80100758:	89 d0                	mov    %edx,%eax
8010075a:	e8 91 fc ff ff       	call   801003f0 <consputc>
8010075f:	e9 7a ff ff ff       	jmp    801006de <cprintf+0x7e>
80100764:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100768:	b8 25 00 00 00       	mov    $0x25,%eax
8010076d:	e8 7e fc ff ff       	call   801003f0 <consputc>
80100772:	e9 7c ff ff ff       	jmp    801006f3 <cprintf+0x93>
80100777:	89 f6                	mov    %esi,%esi
80100779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100780:	8d 46 04             	lea    0x4(%esi),%eax
80100783:	8b 36                	mov    (%esi),%esi
80100785:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80100788:	b8 78 78 10 80       	mov    $0x80107878,%eax
8010078d:	85 f6                	test   %esi,%esi
8010078f:	0f 44 f0             	cmove  %eax,%esi
80100792:	0f be 06             	movsbl (%esi),%eax
80100795:	84 c0                	test   %al,%al
80100797:	74 16                	je     801007af <cprintf+0x14f>
80100799:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007a0:	83 c6 01             	add    $0x1,%esi
801007a3:	e8 48 fc ff ff       	call   801003f0 <consputc>
801007a8:	0f be 06             	movsbl (%esi),%eax
801007ab:	84 c0                	test   %al,%al
801007ad:	75 f1                	jne    801007a0 <cprintf+0x140>
801007af:	8b 75 e4             	mov    -0x1c(%ebp),%esi
801007b2:	e9 27 ff ff ff       	jmp    801006de <cprintf+0x7e>
801007b7:	89 f6                	mov    %esi,%esi
801007b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801007c0:	83 ec 0c             	sub    $0xc,%esp
801007c3:	68 20 b5 10 80       	push   $0x8010b520
801007c8:	e8 73 43 00 00       	call   80104b40 <acquire>
801007cd:	83 c4 10             	add    $0x10,%esp
801007d0:	e9 a4 fe ff ff       	jmp    80100679 <cprintf+0x19>
801007d5:	83 ec 0c             	sub    $0xc,%esp
801007d8:	68 7f 78 10 80       	push   $0x8010787f
801007dd:	e8 8e fb ff ff       	call   80100370 <panic>
801007e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801007e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801007f0 <consoleintr>:
801007f0:	55                   	push   %ebp
801007f1:	89 e5                	mov    %esp,%ebp
801007f3:	57                   	push   %edi
801007f4:	56                   	push   %esi
801007f5:	53                   	push   %ebx
801007f6:	31 f6                	xor    %esi,%esi
801007f8:	83 ec 18             	sub    $0x18,%esp
801007fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
801007fe:	68 20 b5 10 80       	push   $0x8010b520
80100803:	e8 38 43 00 00       	call   80104b40 <acquire>
80100808:	83 c4 10             	add    $0x10,%esp
8010080b:	90                   	nop
8010080c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100810:	ff d3                	call   *%ebx
80100812:	85 c0                	test   %eax,%eax
80100814:	89 c7                	mov    %eax,%edi
80100816:	78 48                	js     80100860 <consoleintr+0x70>
80100818:	83 ff 10             	cmp    $0x10,%edi
8010081b:	0f 84 3f 01 00 00    	je     80100960 <consoleintr+0x170>
80100821:	7e 5d                	jle    80100880 <consoleintr+0x90>
80100823:	83 ff 15             	cmp    $0x15,%edi
80100826:	0f 84 dc 00 00 00    	je     80100908 <consoleintr+0x118>
8010082c:	83 ff 7f             	cmp    $0x7f,%edi
8010082f:	75 54                	jne    80100885 <consoleintr+0x95>
80100831:	a1 a8 0f 11 80       	mov    0x80110fa8,%eax
80100836:	3b 05 a4 0f 11 80    	cmp    0x80110fa4,%eax
8010083c:	74 d2                	je     80100810 <consoleintr+0x20>
8010083e:	83 e8 01             	sub    $0x1,%eax
80100841:	a3 a8 0f 11 80       	mov    %eax,0x80110fa8
80100846:	b8 00 01 00 00       	mov    $0x100,%eax
8010084b:	e8 a0 fb ff ff       	call   801003f0 <consputc>
80100850:	ff d3                	call   *%ebx
80100852:	85 c0                	test   %eax,%eax
80100854:	89 c7                	mov    %eax,%edi
80100856:	79 c0                	jns    80100818 <consoleintr+0x28>
80100858:	90                   	nop
80100859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100860:	83 ec 0c             	sub    $0xc,%esp
80100863:	68 20 b5 10 80       	push   $0x8010b520
80100868:	e8 83 43 00 00       	call   80104bf0 <release>
8010086d:	83 c4 10             	add    $0x10,%esp
80100870:	85 f6                	test   %esi,%esi
80100872:	0f 85 f8 00 00 00    	jne    80100970 <consoleintr+0x180>
80100878:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010087b:	5b                   	pop    %ebx
8010087c:	5e                   	pop    %esi
8010087d:	5f                   	pop    %edi
8010087e:	5d                   	pop    %ebp
8010087f:	c3                   	ret    
80100880:	83 ff 08             	cmp    $0x8,%edi
80100883:	74 ac                	je     80100831 <consoleintr+0x41>
80100885:	85 ff                	test   %edi,%edi
80100887:	74 87                	je     80100810 <consoleintr+0x20>
80100889:	a1 a8 0f 11 80       	mov    0x80110fa8,%eax
8010088e:	89 c2                	mov    %eax,%edx
80100890:	2b 15 a0 0f 11 80    	sub    0x80110fa0,%edx
80100896:	83 fa 7f             	cmp    $0x7f,%edx
80100899:	0f 87 71 ff ff ff    	ja     80100810 <consoleintr+0x20>
8010089f:	8d 50 01             	lea    0x1(%eax),%edx
801008a2:	83 e0 7f             	and    $0x7f,%eax
801008a5:	83 ff 0d             	cmp    $0xd,%edi
801008a8:	89 15 a8 0f 11 80    	mov    %edx,0x80110fa8
801008ae:	0f 84 c8 00 00 00    	je     8010097c <consoleintr+0x18c>
801008b4:	89 f9                	mov    %edi,%ecx
801008b6:	88 88 20 0f 11 80    	mov    %cl,-0x7feef0e0(%eax)
801008bc:	89 f8                	mov    %edi,%eax
801008be:	e8 2d fb ff ff       	call   801003f0 <consputc>
801008c3:	83 ff 0a             	cmp    $0xa,%edi
801008c6:	0f 84 c1 00 00 00    	je     8010098d <consoleintr+0x19d>
801008cc:	83 ff 04             	cmp    $0x4,%edi
801008cf:	0f 84 b8 00 00 00    	je     8010098d <consoleintr+0x19d>
801008d5:	a1 a0 0f 11 80       	mov    0x80110fa0,%eax
801008da:	83 e8 80             	sub    $0xffffff80,%eax
801008dd:	39 05 a8 0f 11 80    	cmp    %eax,0x80110fa8
801008e3:	0f 85 27 ff ff ff    	jne    80100810 <consoleintr+0x20>
801008e9:	83 ec 0c             	sub    $0xc,%esp
801008ec:	a3 a4 0f 11 80       	mov    %eax,0x80110fa4
801008f1:	68 a0 0f 11 80       	push   $0x80110fa0
801008f6:	e8 15 38 00 00       	call   80104110 <wakeup>
801008fb:	83 c4 10             	add    $0x10,%esp
801008fe:	e9 0d ff ff ff       	jmp    80100810 <consoleintr+0x20>
80100903:	90                   	nop
80100904:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100908:	a1 a8 0f 11 80       	mov    0x80110fa8,%eax
8010090d:	39 05 a4 0f 11 80    	cmp    %eax,0x80110fa4
80100913:	75 2b                	jne    80100940 <consoleintr+0x150>
80100915:	e9 f6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010091a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100920:	a3 a8 0f 11 80       	mov    %eax,0x80110fa8
80100925:	b8 00 01 00 00       	mov    $0x100,%eax
8010092a:	e8 c1 fa ff ff       	call   801003f0 <consputc>
8010092f:	a1 a8 0f 11 80       	mov    0x80110fa8,%eax
80100934:	3b 05 a4 0f 11 80    	cmp    0x80110fa4,%eax
8010093a:	0f 84 d0 fe ff ff    	je     80100810 <consoleintr+0x20>
80100940:	83 e8 01             	sub    $0x1,%eax
80100943:	89 c2                	mov    %eax,%edx
80100945:	83 e2 7f             	and    $0x7f,%edx
80100948:	80 ba 20 0f 11 80 0a 	cmpb   $0xa,-0x7feef0e0(%edx)
8010094f:	75 cf                	jne    80100920 <consoleintr+0x130>
80100951:	e9 ba fe ff ff       	jmp    80100810 <consoleintr+0x20>
80100956:	8d 76 00             	lea    0x0(%esi),%esi
80100959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80100960:	be 01 00 00 00       	mov    $0x1,%esi
80100965:	e9 a6 fe ff ff       	jmp    80100810 <consoleintr+0x20>
8010096a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100970:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100973:	5b                   	pop    %ebx
80100974:	5e                   	pop    %esi
80100975:	5f                   	pop    %edi
80100976:	5d                   	pop    %ebp
80100977:	e9 84 38 00 00       	jmp    80104200 <procdump>
8010097c:	c6 80 20 0f 11 80 0a 	movb   $0xa,-0x7feef0e0(%eax)
80100983:	b8 0a 00 00 00       	mov    $0xa,%eax
80100988:	e8 63 fa ff ff       	call   801003f0 <consputc>
8010098d:	a1 a8 0f 11 80       	mov    0x80110fa8,%eax
80100992:	e9 52 ff ff ff       	jmp    801008e9 <consoleintr+0xf9>
80100997:	89 f6                	mov    %esi,%esi
80100999:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801009a0 <consoleinit>:
801009a0:	55                   	push   %ebp
801009a1:	89 e5                	mov    %esp,%ebp
801009a3:	83 ec 10             	sub    $0x10,%esp
801009a6:	68 88 78 10 80       	push   $0x80107888
801009ab:	68 20 b5 10 80       	push   $0x8010b520
801009b0:	e8 2b 40 00 00       	call   801049e0 <initlock>
801009b5:	58                   	pop    %eax
801009b6:	5a                   	pop    %edx
801009b7:	6a 00                	push   $0x0
801009b9:	6a 01                	push   $0x1
801009bb:	c7 05 6c 19 11 80 00 	movl   $0x80100600,0x8011196c
801009c2:	06 10 80 
801009c5:	c7 05 68 19 11 80 70 	movl   $0x80100270,0x80111968
801009cc:	02 10 80 
801009cf:	c7 05 54 b5 10 80 01 	movl   $0x1,0x8010b554
801009d6:	00 00 00 
801009d9:	e8 02 19 00 00       	call   801022e0 <ioapicenable>
801009de:	83 c4 10             	add    $0x10,%esp
801009e1:	c9                   	leave  
801009e2:	c3                   	ret    
801009e3:	66 90                	xchg   %ax,%ax
801009e5:	66 90                	xchg   %ax,%ax
801009e7:	66 90                	xchg   %ax,%ax
801009e9:	66 90                	xchg   %ax,%ax
801009eb:	66 90                	xchg   %ax,%ax
801009ed:	66 90                	xchg   %ax,%ax
801009ef:	90                   	nop

801009f0 <exec>:
801009f0:	55                   	push   %ebp
801009f1:	89 e5                	mov    %esp,%ebp
801009f3:	57                   	push   %edi
801009f4:	56                   	push   %esi
801009f5:	53                   	push   %ebx
801009f6:	81 ec 0c 01 00 00    	sub    $0x10c,%esp
801009fc:	e8 ef 2d 00 00       	call   801037f0 <myproc>
80100a01:	89 85 f4 fe ff ff    	mov    %eax,-0x10c(%ebp)
80100a07:	e8 84 21 00 00       	call   80102b90 <begin_op>
80100a0c:	83 ec 0c             	sub    $0xc,%esp
80100a0f:	ff 75 08             	pushl  0x8(%ebp)
80100a12:	e8 e9 14 00 00       	call   80101f00 <namei>
80100a17:	83 c4 10             	add    $0x10,%esp
80100a1a:	85 c0                	test   %eax,%eax
80100a1c:	0f 84 a8 01 00 00    	je     80100bca <exec+0x1da>
80100a22:	83 ec 0c             	sub    $0xc,%esp
80100a25:	89 c3                	mov    %eax,%ebx
80100a27:	50                   	push   %eax
80100a28:	e8 83 0c 00 00       	call   801016b0 <ilock>
80100a2d:	8d 85 24 ff ff ff    	lea    -0xdc(%ebp),%eax
80100a33:	6a 34                	push   $0x34
80100a35:	6a 00                	push   $0x0
80100a37:	50                   	push   %eax
80100a38:	53                   	push   %ebx
80100a39:	e8 52 0f 00 00       	call   80101990 <readi>
80100a3e:	83 c4 20             	add    $0x20,%esp
80100a41:	83 f8 34             	cmp    $0x34,%eax
80100a44:	74 22                	je     80100a68 <exec+0x78>
80100a46:	83 ec 0c             	sub    $0xc,%esp
80100a49:	53                   	push   %ebx
80100a4a:	e8 f1 0e 00 00       	call   80101940 <iunlockput>
80100a4f:	e8 ac 21 00 00       	call   80102c00 <end_op>
80100a54:	83 c4 10             	add    $0x10,%esp
80100a57:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100a5c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100a5f:	5b                   	pop    %ebx
80100a60:	5e                   	pop    %esi
80100a61:	5f                   	pop    %edi
80100a62:	5d                   	pop    %ebp
80100a63:	c3                   	ret    
80100a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100a68:	81 bd 24 ff ff ff 7f 	cmpl   $0x464c457f,-0xdc(%ebp)
80100a6f:	45 4c 46 
80100a72:	75 d2                	jne    80100a46 <exec+0x56>
80100a74:	e8 e7 6a 00 00       	call   80107560 <setupkvm>
80100a79:	85 c0                	test   %eax,%eax
80100a7b:	89 85 f0 fe ff ff    	mov    %eax,-0x110(%ebp)
80100a81:	74 c3                	je     80100a46 <exec+0x56>
80100a83:	66 83 bd 50 ff ff ff 	cmpw   $0x0,-0xb0(%ebp)
80100a8a:	00 
80100a8b:	8b b5 40 ff ff ff    	mov    -0xc0(%ebp),%esi
80100a91:	c7 85 ec fe ff ff 00 	movl   $0x0,-0x114(%ebp)
80100a98:	00 00 00 
80100a9b:	0f 84 c5 00 00 00    	je     80100b66 <exec+0x176>
80100aa1:	31 ff                	xor    %edi,%edi
80100aa3:	eb 18                	jmp    80100abd <exec+0xcd>
80100aa5:	8d 76 00             	lea    0x0(%esi),%esi
80100aa8:	0f b7 85 50 ff ff ff 	movzwl -0xb0(%ebp),%eax
80100aaf:	83 c7 01             	add    $0x1,%edi
80100ab2:	83 c6 20             	add    $0x20,%esi
80100ab5:	39 f8                	cmp    %edi,%eax
80100ab7:	0f 8e a9 00 00 00    	jle    80100b66 <exec+0x176>
80100abd:	8d 85 04 ff ff ff    	lea    -0xfc(%ebp),%eax
80100ac3:	6a 20                	push   $0x20
80100ac5:	56                   	push   %esi
80100ac6:	50                   	push   %eax
80100ac7:	53                   	push   %ebx
80100ac8:	e8 c3 0e 00 00       	call   80101990 <readi>
80100acd:	83 c4 10             	add    $0x10,%esp
80100ad0:	83 f8 20             	cmp    $0x20,%eax
80100ad3:	75 7b                	jne    80100b50 <exec+0x160>
80100ad5:	83 bd 04 ff ff ff 01 	cmpl   $0x1,-0xfc(%ebp)
80100adc:	75 ca                	jne    80100aa8 <exec+0xb8>
80100ade:	8b 85 18 ff ff ff    	mov    -0xe8(%ebp),%eax
80100ae4:	3b 85 14 ff ff ff    	cmp    -0xec(%ebp),%eax
80100aea:	72 64                	jb     80100b50 <exec+0x160>
80100aec:	03 85 0c ff ff ff    	add    -0xf4(%ebp),%eax
80100af2:	72 5c                	jb     80100b50 <exec+0x160>
80100af4:	83 ec 04             	sub    $0x4,%esp
80100af7:	50                   	push   %eax
80100af8:	ff b5 ec fe ff ff    	pushl  -0x114(%ebp)
80100afe:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b04:	e8 a7 68 00 00       	call   801073b0 <allocuvm>
80100b09:	83 c4 10             	add    $0x10,%esp
80100b0c:	85 c0                	test   %eax,%eax
80100b0e:	89 85 ec fe ff ff    	mov    %eax,-0x114(%ebp)
80100b14:	74 3a                	je     80100b50 <exec+0x160>
80100b16:	8b 85 0c ff ff ff    	mov    -0xf4(%ebp),%eax
80100b1c:	a9 ff 0f 00 00       	test   $0xfff,%eax
80100b21:	75 2d                	jne    80100b50 <exec+0x160>
80100b23:	83 ec 0c             	sub    $0xc,%esp
80100b26:	ff b5 14 ff ff ff    	pushl  -0xec(%ebp)
80100b2c:	ff b5 08 ff ff ff    	pushl  -0xf8(%ebp)
80100b32:	53                   	push   %ebx
80100b33:	50                   	push   %eax
80100b34:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b3a:	e8 b1 67 00 00       	call   801072f0 <loaduvm>
80100b3f:	83 c4 20             	add    $0x20,%esp
80100b42:	85 c0                	test   %eax,%eax
80100b44:	0f 89 5e ff ff ff    	jns    80100aa8 <exec+0xb8>
80100b4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100b50:	83 ec 0c             	sub    $0xc,%esp
80100b53:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100b59:	e8 82 69 00 00       	call   801074e0 <freevm>
80100b5e:	83 c4 10             	add    $0x10,%esp
80100b61:	e9 e0 fe ff ff       	jmp    80100a46 <exec+0x56>
80100b66:	83 ec 0c             	sub    $0xc,%esp
80100b69:	53                   	push   %ebx
80100b6a:	e8 d1 0d 00 00       	call   80101940 <iunlockput>
80100b6f:	e8 8c 20 00 00       	call   80102c00 <end_op>
80100b74:	8b 85 ec fe ff ff    	mov    -0x114(%ebp),%eax
80100b7a:	8b 8d f4 fe ff ff    	mov    -0x10c(%ebp),%ecx
80100b80:	83 c4 0c             	add    $0xc,%esp
80100b83:	05 ff 0f 00 00       	add    $0xfff,%eax
80100b88:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80100b8d:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
80100b93:	89 81 94 01 00 00    	mov    %eax,0x194(%ecx)
80100b99:	52                   	push   %edx
80100b9a:	50                   	push   %eax
80100b9b:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100ba1:	e8 0a 68 00 00       	call   801073b0 <allocuvm>
80100ba6:	83 c4 10             	add    $0x10,%esp
80100ba9:	85 c0                	test   %eax,%eax
80100bab:	89 c6                	mov    %eax,%esi
80100bad:	75 3a                	jne    80100be9 <exec+0x1f9>
80100baf:	83 ec 0c             	sub    $0xc,%esp
80100bb2:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bb8:	e8 23 69 00 00       	call   801074e0 <freevm>
80100bbd:	83 c4 10             	add    $0x10,%esp
80100bc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100bc5:	e9 92 fe ff ff       	jmp    80100a5c <exec+0x6c>
80100bca:	e8 31 20 00 00       	call   80102c00 <end_op>
80100bcf:	83 ec 0c             	sub    $0xc,%esp
80100bd2:	68 a1 78 10 80       	push   $0x801078a1
80100bd7:	e8 84 fa ff ff       	call   80100660 <cprintf>
80100bdc:	83 c4 10             	add    $0x10,%esp
80100bdf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100be4:	e9 73 fe ff ff       	jmp    80100a5c <exec+0x6c>
80100be9:	8d 80 00 e0 ff ff    	lea    -0x2000(%eax),%eax
80100bef:	83 ec 08             	sub    $0x8,%esp
80100bf2:	31 ff                	xor    %edi,%edi
80100bf4:	89 f3                	mov    %esi,%ebx
80100bf6:	50                   	push   %eax
80100bf7:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100bfd:	e8 fe 69 00 00       	call   80107600 <clearpteu>
80100c02:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c05:	83 c4 10             	add    $0x10,%esp
80100c08:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c0e:	8b 00                	mov    (%eax),%eax
80100c10:	85 c0                	test   %eax,%eax
80100c12:	74 71                	je     80100c85 <exec+0x295>
80100c14:	89 b5 ec fe ff ff    	mov    %esi,-0x114(%ebp)
80100c1a:	8b b5 f0 fe ff ff    	mov    -0x110(%ebp),%esi
80100c20:	eb 0b                	jmp    80100c2d <exec+0x23d>
80100c22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100c28:	83 ff 20             	cmp    $0x20,%edi
80100c2b:	74 82                	je     80100baf <exec+0x1bf>
80100c2d:	83 ec 0c             	sub    $0xc,%esp
80100c30:	50                   	push   %eax
80100c31:	e8 4a 42 00 00       	call   80104e80 <strlen>
80100c36:	f7 d0                	not    %eax
80100c38:	01 c3                	add    %eax,%ebx
80100c3a:	58                   	pop    %eax
80100c3b:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c3e:	83 e3 fc             	and    $0xfffffffc,%ebx
80100c41:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c44:	e8 37 42 00 00       	call   80104e80 <strlen>
80100c49:	83 c0 01             	add    $0x1,%eax
80100c4c:	50                   	push   %eax
80100c4d:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c50:	ff 34 b8             	pushl  (%eax,%edi,4)
80100c53:	53                   	push   %ebx
80100c54:	56                   	push   %esi
80100c55:	e8 16 6b 00 00       	call   80107770 <copyout>
80100c5a:	83 c4 20             	add    $0x20,%esp
80100c5d:	85 c0                	test   %eax,%eax
80100c5f:	0f 88 4a ff ff ff    	js     80100baf <exec+0x1bf>
80100c65:	8b 45 0c             	mov    0xc(%ebp),%eax
80100c68:	89 9c bd 64 ff ff ff 	mov    %ebx,-0x9c(%ebp,%edi,4)
80100c6f:	83 c7 01             	add    $0x1,%edi
80100c72:	8d 95 58 ff ff ff    	lea    -0xa8(%ebp),%edx
80100c78:	8b 04 b8             	mov    (%eax,%edi,4),%eax
80100c7b:	85 c0                	test   %eax,%eax
80100c7d:	75 a9                	jne    80100c28 <exec+0x238>
80100c7f:	8b b5 ec fe ff ff    	mov    -0x114(%ebp),%esi
80100c85:	8d 04 bd 04 00 00 00 	lea    0x4(,%edi,4),%eax
80100c8c:	89 d9                	mov    %ebx,%ecx
80100c8e:	c7 84 bd 64 ff ff ff 	movl   $0x0,-0x9c(%ebp,%edi,4)
80100c95:	00 00 00 00 
80100c99:	c7 85 58 ff ff ff ff 	movl   $0xffffffff,-0xa8(%ebp)
80100ca0:	ff ff ff 
80100ca3:	89 bd 5c ff ff ff    	mov    %edi,-0xa4(%ebp)
80100ca9:	29 c1                	sub    %eax,%ecx
80100cab:	83 c0 0c             	add    $0xc,%eax
80100cae:	29 c3                	sub    %eax,%ebx
80100cb0:	50                   	push   %eax
80100cb1:	52                   	push   %edx
80100cb2:	53                   	push   %ebx
80100cb3:	ff b5 f0 fe ff ff    	pushl  -0x110(%ebp)
80100cb9:	89 8d 60 ff ff ff    	mov    %ecx,-0xa0(%ebp)
80100cbf:	e8 ac 6a 00 00       	call   80107770 <copyout>
80100cc4:	83 c4 10             	add    $0x10,%esp
80100cc7:	85 c0                	test   %eax,%eax
80100cc9:	0f 88 e0 fe ff ff    	js     80100baf <exec+0x1bf>
80100ccf:	8b 45 08             	mov    0x8(%ebp),%eax
80100cd2:	0f b6 10             	movzbl (%eax),%edx
80100cd5:	84 d2                	test   %dl,%dl
80100cd7:	74 19                	je     80100cf2 <exec+0x302>
80100cd9:	8b 4d 08             	mov    0x8(%ebp),%ecx
80100cdc:	83 c0 01             	add    $0x1,%eax
80100cdf:	80 fa 2f             	cmp    $0x2f,%dl
80100ce2:	0f b6 10             	movzbl (%eax),%edx
80100ce5:	0f 44 c8             	cmove  %eax,%ecx
80100ce8:	83 c0 01             	add    $0x1,%eax
80100ceb:	84 d2                	test   %dl,%dl
80100ced:	75 f0                	jne    80100cdf <exec+0x2ef>
80100cef:	89 4d 08             	mov    %ecx,0x8(%ebp)
80100cf2:	8b bd f4 fe ff ff    	mov    -0x10c(%ebp),%edi
80100cf8:	50                   	push   %eax
80100cf9:	6a 10                	push   $0x10
80100cfb:	ff 75 08             	pushl  0x8(%ebp)
80100cfe:	89 f8                	mov    %edi,%eax
80100d00:	83 c0 6c             	add    $0x6c,%eax
80100d03:	50                   	push   %eax
80100d04:	e8 37 41 00 00       	call   80104e40 <safestrcpy>
80100d09:	8b 8d f0 fe ff ff    	mov    -0x110(%ebp),%ecx
80100d0f:	89 f8                	mov    %edi,%eax
80100d11:	8b 7f 04             	mov    0x4(%edi),%edi
80100d14:	89 30                	mov    %esi,(%eax)
80100d16:	89 c6                	mov    %eax,%esi
80100d18:	89 48 04             	mov    %ecx,0x4(%eax)
80100d1b:	8b 40 18             	mov    0x18(%eax),%eax
80100d1e:	8b 95 3c ff ff ff    	mov    -0xc4(%ebp),%edx
80100d24:	89 50 38             	mov    %edx,0x38(%eax)
80100d27:	8b 46 18             	mov    0x18(%esi),%eax
80100d2a:	89 58 44             	mov    %ebx,0x44(%eax)
80100d2d:	89 34 24             	mov    %esi,(%esp)
80100d30:	e8 2b 64 00 00       	call   80107160 <switchuvm>
80100d35:	89 3c 24             	mov    %edi,(%esp)
80100d38:	e8 a3 67 00 00       	call   801074e0 <freevm>
80100d3d:	5a                   	pop    %edx
80100d3e:	59                   	pop    %ecx
80100d3f:	ff 76 7c             	pushl  0x7c(%esi)
80100d42:	ff 76 10             	pushl  0x10(%esi)
80100d45:	e8 b6 3a 00 00       	call   80104800 <exit_threads>
80100d4a:	89 f0                	mov    %esi,%eax
80100d4c:	c7 46 7c 00 00 00 00 	movl   $0x0,0x7c(%esi)
80100d53:	83 c4 10             	add    $0x10,%esp
80100d56:	89 b0 80 00 00 00    	mov    %esi,0x80(%eax)
80100d5c:	c7 86 8c 01 00 00 00 	movl   $0x0,0x18c(%esi)
80100d63:	00 00 00 
80100d66:	31 c0                	xor    %eax,%eax
80100d68:	c7 86 90 01 00 00 00 	movl   $0x0,0x190(%esi)
80100d6f:	00 00 00 
80100d72:	c7 86 84 00 00 00 00 	movl   $0x0,0x84(%esi)
80100d79:	00 00 00 
80100d7c:	e9 db fc ff ff       	jmp    80100a5c <exec+0x6c>
80100d81:	66 90                	xchg   %ax,%ax
80100d83:	66 90                	xchg   %ax,%ax
80100d85:	66 90                	xchg   %ax,%ax
80100d87:	66 90                	xchg   %ax,%ax
80100d89:	66 90                	xchg   %ax,%ax
80100d8b:	66 90                	xchg   %ax,%ax
80100d8d:	66 90                	xchg   %ax,%ax
80100d8f:	90                   	nop

80100d90 <fileinit>:
80100d90:	55                   	push   %ebp
80100d91:	89 e5                	mov    %esp,%ebp
80100d93:	83 ec 10             	sub    $0x10,%esp
80100d96:	68 ad 78 10 80       	push   $0x801078ad
80100d9b:	68 c0 0f 11 80       	push   $0x80110fc0
80100da0:	e8 3b 3c 00 00       	call   801049e0 <initlock>
80100da5:	83 c4 10             	add    $0x10,%esp
80100da8:	c9                   	leave  
80100da9:	c3                   	ret    
80100daa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100db0 <filealloc>:
80100db0:	55                   	push   %ebp
80100db1:	89 e5                	mov    %esp,%ebp
80100db3:	53                   	push   %ebx
80100db4:	bb f4 0f 11 80       	mov    $0x80110ff4,%ebx
80100db9:	83 ec 10             	sub    $0x10,%esp
80100dbc:	68 c0 0f 11 80       	push   $0x80110fc0
80100dc1:	e8 7a 3d 00 00       	call   80104b40 <acquire>
80100dc6:	83 c4 10             	add    $0x10,%esp
80100dc9:	eb 10                	jmp    80100ddb <filealloc+0x2b>
80100dcb:	90                   	nop
80100dcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100dd0:	83 c3 18             	add    $0x18,%ebx
80100dd3:	81 fb 54 19 11 80    	cmp    $0x80111954,%ebx
80100dd9:	74 25                	je     80100e00 <filealloc+0x50>
80100ddb:	8b 43 04             	mov    0x4(%ebx),%eax
80100dde:	85 c0                	test   %eax,%eax
80100de0:	75 ee                	jne    80100dd0 <filealloc+0x20>
80100de2:	83 ec 0c             	sub    $0xc,%esp
80100de5:	c7 43 04 01 00 00 00 	movl   $0x1,0x4(%ebx)
80100dec:	68 c0 0f 11 80       	push   $0x80110fc0
80100df1:	e8 fa 3d 00 00       	call   80104bf0 <release>
80100df6:	89 d8                	mov    %ebx,%eax
80100df8:	83 c4 10             	add    $0x10,%esp
80100dfb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100dfe:	c9                   	leave  
80100dff:	c3                   	ret    
80100e00:	83 ec 0c             	sub    $0xc,%esp
80100e03:	68 c0 0f 11 80       	push   $0x80110fc0
80100e08:	e8 e3 3d 00 00       	call   80104bf0 <release>
80100e0d:	83 c4 10             	add    $0x10,%esp
80100e10:	31 c0                	xor    %eax,%eax
80100e12:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e15:	c9                   	leave  
80100e16:	c3                   	ret    
80100e17:	89 f6                	mov    %esi,%esi
80100e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e20 <filedup>:
80100e20:	55                   	push   %ebp
80100e21:	89 e5                	mov    %esp,%ebp
80100e23:	53                   	push   %ebx
80100e24:	83 ec 10             	sub    $0x10,%esp
80100e27:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100e2a:	68 c0 0f 11 80       	push   $0x80110fc0
80100e2f:	e8 0c 3d 00 00       	call   80104b40 <acquire>
80100e34:	8b 43 04             	mov    0x4(%ebx),%eax
80100e37:	83 c4 10             	add    $0x10,%esp
80100e3a:	85 c0                	test   %eax,%eax
80100e3c:	7e 1a                	jle    80100e58 <filedup+0x38>
80100e3e:	83 c0 01             	add    $0x1,%eax
80100e41:	83 ec 0c             	sub    $0xc,%esp
80100e44:	89 43 04             	mov    %eax,0x4(%ebx)
80100e47:	68 c0 0f 11 80       	push   $0x80110fc0
80100e4c:	e8 9f 3d 00 00       	call   80104bf0 <release>
80100e51:	89 d8                	mov    %ebx,%eax
80100e53:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100e56:	c9                   	leave  
80100e57:	c3                   	ret    
80100e58:	83 ec 0c             	sub    $0xc,%esp
80100e5b:	68 b4 78 10 80       	push   $0x801078b4
80100e60:	e8 0b f5 ff ff       	call   80100370 <panic>
80100e65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100e69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80100e70 <fileclose>:
80100e70:	55                   	push   %ebp
80100e71:	89 e5                	mov    %esp,%ebp
80100e73:	57                   	push   %edi
80100e74:	56                   	push   %esi
80100e75:	53                   	push   %ebx
80100e76:	83 ec 28             	sub    $0x28,%esp
80100e79:	8b 7d 08             	mov    0x8(%ebp),%edi
80100e7c:	68 c0 0f 11 80       	push   $0x80110fc0
80100e81:	e8 ba 3c 00 00       	call   80104b40 <acquire>
80100e86:	8b 47 04             	mov    0x4(%edi),%eax
80100e89:	83 c4 10             	add    $0x10,%esp
80100e8c:	85 c0                	test   %eax,%eax
80100e8e:	0f 8e 9b 00 00 00    	jle    80100f2f <fileclose+0xbf>
80100e94:	83 e8 01             	sub    $0x1,%eax
80100e97:	85 c0                	test   %eax,%eax
80100e99:	89 47 04             	mov    %eax,0x4(%edi)
80100e9c:	74 1a                	je     80100eb8 <fileclose+0x48>
80100e9e:	c7 45 08 c0 0f 11 80 	movl   $0x80110fc0,0x8(%ebp)
80100ea5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ea8:	5b                   	pop    %ebx
80100ea9:	5e                   	pop    %esi
80100eaa:	5f                   	pop    %edi
80100eab:	5d                   	pop    %ebp
80100eac:	e9 3f 3d 00 00       	jmp    80104bf0 <release>
80100eb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80100eb8:	0f b6 47 09          	movzbl 0x9(%edi),%eax
80100ebc:	8b 1f                	mov    (%edi),%ebx
80100ebe:	83 ec 0c             	sub    $0xc,%esp
80100ec1:	8b 77 0c             	mov    0xc(%edi),%esi
80100ec4:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
80100eca:	88 45 e7             	mov    %al,-0x19(%ebp)
80100ecd:	8b 47 10             	mov    0x10(%edi),%eax
80100ed0:	68 c0 0f 11 80       	push   $0x80110fc0
80100ed5:	89 45 e0             	mov    %eax,-0x20(%ebp)
80100ed8:	e8 13 3d 00 00       	call   80104bf0 <release>
80100edd:	83 c4 10             	add    $0x10,%esp
80100ee0:	83 fb 01             	cmp    $0x1,%ebx
80100ee3:	74 13                	je     80100ef8 <fileclose+0x88>
80100ee5:	83 fb 02             	cmp    $0x2,%ebx
80100ee8:	74 26                	je     80100f10 <fileclose+0xa0>
80100eea:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100eed:	5b                   	pop    %ebx
80100eee:	5e                   	pop    %esi
80100eef:	5f                   	pop    %edi
80100ef0:	5d                   	pop    %ebp
80100ef1:	c3                   	ret    
80100ef2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100ef8:	0f be 5d e7          	movsbl -0x19(%ebp),%ebx
80100efc:	83 ec 08             	sub    $0x8,%esp
80100eff:	53                   	push   %ebx
80100f00:	56                   	push   %esi
80100f01:	e8 2a 24 00 00       	call   80103330 <pipeclose>
80100f06:	83 c4 10             	add    $0x10,%esp
80100f09:	eb df                	jmp    80100eea <fileclose+0x7a>
80100f0b:	90                   	nop
80100f0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80100f10:	e8 7b 1c 00 00       	call   80102b90 <begin_op>
80100f15:	83 ec 0c             	sub    $0xc,%esp
80100f18:	ff 75 e0             	pushl  -0x20(%ebp)
80100f1b:	e8 c0 08 00 00       	call   801017e0 <iput>
80100f20:	83 c4 10             	add    $0x10,%esp
80100f23:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100f26:	5b                   	pop    %ebx
80100f27:	5e                   	pop    %esi
80100f28:	5f                   	pop    %edi
80100f29:	5d                   	pop    %ebp
80100f2a:	e9 d1 1c 00 00       	jmp    80102c00 <end_op>
80100f2f:	83 ec 0c             	sub    $0xc,%esp
80100f32:	68 bc 78 10 80       	push   $0x801078bc
80100f37:	e8 34 f4 ff ff       	call   80100370 <panic>
80100f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80100f40 <filestat>:
80100f40:	55                   	push   %ebp
80100f41:	89 e5                	mov    %esp,%ebp
80100f43:	53                   	push   %ebx
80100f44:	83 ec 04             	sub    $0x4,%esp
80100f47:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f4a:	83 3b 02             	cmpl   $0x2,(%ebx)
80100f4d:	75 31                	jne    80100f80 <filestat+0x40>
80100f4f:	83 ec 0c             	sub    $0xc,%esp
80100f52:	ff 73 10             	pushl  0x10(%ebx)
80100f55:	e8 56 07 00 00       	call   801016b0 <ilock>
80100f5a:	58                   	pop    %eax
80100f5b:	5a                   	pop    %edx
80100f5c:	ff 75 0c             	pushl  0xc(%ebp)
80100f5f:	ff 73 10             	pushl  0x10(%ebx)
80100f62:	e8 f9 09 00 00       	call   80101960 <stati>
80100f67:	59                   	pop    %ecx
80100f68:	ff 73 10             	pushl  0x10(%ebx)
80100f6b:	e8 20 08 00 00       	call   80101790 <iunlock>
80100f70:	83 c4 10             	add    $0x10,%esp
80100f73:	31 c0                	xor    %eax,%eax
80100f75:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f78:	c9                   	leave  
80100f79:	c3                   	ret    
80100f7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80100f80:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80100f85:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80100f88:	c9                   	leave  
80100f89:	c3                   	ret    
80100f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80100f90 <fileread>:
80100f90:	55                   	push   %ebp
80100f91:	89 e5                	mov    %esp,%ebp
80100f93:	57                   	push   %edi
80100f94:	56                   	push   %esi
80100f95:	53                   	push   %ebx
80100f96:	83 ec 0c             	sub    $0xc,%esp
80100f99:	8b 5d 08             	mov    0x8(%ebp),%ebx
80100f9c:	8b 75 0c             	mov    0xc(%ebp),%esi
80100f9f:	8b 7d 10             	mov    0x10(%ebp),%edi
80100fa2:	80 7b 08 00          	cmpb   $0x0,0x8(%ebx)
80100fa6:	74 60                	je     80101008 <fileread+0x78>
80100fa8:	8b 03                	mov    (%ebx),%eax
80100faa:	83 f8 01             	cmp    $0x1,%eax
80100fad:	74 41                	je     80100ff0 <fileread+0x60>
80100faf:	83 f8 02             	cmp    $0x2,%eax
80100fb2:	75 5b                	jne    8010100f <fileread+0x7f>
80100fb4:	83 ec 0c             	sub    $0xc,%esp
80100fb7:	ff 73 10             	pushl  0x10(%ebx)
80100fba:	e8 f1 06 00 00       	call   801016b0 <ilock>
80100fbf:	57                   	push   %edi
80100fc0:	ff 73 14             	pushl  0x14(%ebx)
80100fc3:	56                   	push   %esi
80100fc4:	ff 73 10             	pushl  0x10(%ebx)
80100fc7:	e8 c4 09 00 00       	call   80101990 <readi>
80100fcc:	83 c4 20             	add    $0x20,%esp
80100fcf:	85 c0                	test   %eax,%eax
80100fd1:	89 c6                	mov    %eax,%esi
80100fd3:	7e 03                	jle    80100fd8 <fileread+0x48>
80100fd5:	01 43 14             	add    %eax,0x14(%ebx)
80100fd8:	83 ec 0c             	sub    $0xc,%esp
80100fdb:	ff 73 10             	pushl  0x10(%ebx)
80100fde:	e8 ad 07 00 00       	call   80101790 <iunlock>
80100fe3:	83 c4 10             	add    $0x10,%esp
80100fe6:	89 f0                	mov    %esi,%eax
80100fe8:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100feb:	5b                   	pop    %ebx
80100fec:	5e                   	pop    %esi
80100fed:	5f                   	pop    %edi
80100fee:	5d                   	pop    %ebp
80100fef:	c3                   	ret    
80100ff0:	8b 43 0c             	mov    0xc(%ebx),%eax
80100ff3:	89 45 08             	mov    %eax,0x8(%ebp)
80100ff6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80100ff9:	5b                   	pop    %ebx
80100ffa:	5e                   	pop    %esi
80100ffb:	5f                   	pop    %edi
80100ffc:	5d                   	pop    %ebp
80100ffd:	e9 ce 24 00 00       	jmp    801034d0 <piperead>
80101002:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101008:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010100d:	eb d9                	jmp    80100fe8 <fileread+0x58>
8010100f:	83 ec 0c             	sub    $0xc,%esp
80101012:	68 c6 78 10 80       	push   $0x801078c6
80101017:	e8 54 f3 ff ff       	call   80100370 <panic>
8010101c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101020 <filewrite>:
80101020:	55                   	push   %ebp
80101021:	89 e5                	mov    %esp,%ebp
80101023:	57                   	push   %edi
80101024:	56                   	push   %esi
80101025:	53                   	push   %ebx
80101026:	83 ec 1c             	sub    $0x1c,%esp
80101029:	8b 75 08             	mov    0x8(%ebp),%esi
8010102c:	8b 45 0c             	mov    0xc(%ebp),%eax
8010102f:	80 7e 09 00          	cmpb   $0x0,0x9(%esi)
80101033:	89 45 dc             	mov    %eax,-0x24(%ebp)
80101036:	8b 45 10             	mov    0x10(%ebp),%eax
80101039:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010103c:	0f 84 aa 00 00 00    	je     801010ec <filewrite+0xcc>
80101042:	8b 06                	mov    (%esi),%eax
80101044:	83 f8 01             	cmp    $0x1,%eax
80101047:	0f 84 c2 00 00 00    	je     8010110f <filewrite+0xef>
8010104d:	83 f8 02             	cmp    $0x2,%eax
80101050:	0f 85 d8 00 00 00    	jne    8010112e <filewrite+0x10e>
80101056:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101059:	31 ff                	xor    %edi,%edi
8010105b:	85 c0                	test   %eax,%eax
8010105d:	7f 34                	jg     80101093 <filewrite+0x73>
8010105f:	e9 9c 00 00 00       	jmp    80101100 <filewrite+0xe0>
80101064:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101068:	01 46 14             	add    %eax,0x14(%esi)
8010106b:	83 ec 0c             	sub    $0xc,%esp
8010106e:	ff 76 10             	pushl  0x10(%esi)
80101071:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101074:	e8 17 07 00 00       	call   80101790 <iunlock>
80101079:	e8 82 1b 00 00       	call   80102c00 <end_op>
8010107e:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101081:	83 c4 10             	add    $0x10,%esp
80101084:	39 d8                	cmp    %ebx,%eax
80101086:	0f 85 95 00 00 00    	jne    80101121 <filewrite+0x101>
8010108c:	01 c7                	add    %eax,%edi
8010108e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101091:	7e 6d                	jle    80101100 <filewrite+0xe0>
80101093:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
80101096:	b8 00 06 00 00       	mov    $0x600,%eax
8010109b:	29 fb                	sub    %edi,%ebx
8010109d:	81 fb 00 06 00 00    	cmp    $0x600,%ebx
801010a3:	0f 4f d8             	cmovg  %eax,%ebx
801010a6:	e8 e5 1a 00 00       	call   80102b90 <begin_op>
801010ab:	83 ec 0c             	sub    $0xc,%esp
801010ae:	ff 76 10             	pushl  0x10(%esi)
801010b1:	e8 fa 05 00 00       	call   801016b0 <ilock>
801010b6:	8b 45 dc             	mov    -0x24(%ebp),%eax
801010b9:	53                   	push   %ebx
801010ba:	ff 76 14             	pushl  0x14(%esi)
801010bd:	01 f8                	add    %edi,%eax
801010bf:	50                   	push   %eax
801010c0:	ff 76 10             	pushl  0x10(%esi)
801010c3:	e8 c8 09 00 00       	call   80101a90 <writei>
801010c8:	83 c4 20             	add    $0x20,%esp
801010cb:	85 c0                	test   %eax,%eax
801010cd:	7f 99                	jg     80101068 <filewrite+0x48>
801010cf:	83 ec 0c             	sub    $0xc,%esp
801010d2:	ff 76 10             	pushl  0x10(%esi)
801010d5:	89 45 e0             	mov    %eax,-0x20(%ebp)
801010d8:	e8 b3 06 00 00       	call   80101790 <iunlock>
801010dd:	e8 1e 1b 00 00       	call   80102c00 <end_op>
801010e2:	8b 45 e0             	mov    -0x20(%ebp),%eax
801010e5:	83 c4 10             	add    $0x10,%esp
801010e8:	85 c0                	test   %eax,%eax
801010ea:	74 98                	je     80101084 <filewrite+0x64>
801010ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
801010ef:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801010f4:	5b                   	pop    %ebx
801010f5:	5e                   	pop    %esi
801010f6:	5f                   	pop    %edi
801010f7:	5d                   	pop    %ebp
801010f8:	c3                   	ret    
801010f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101100:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
80101103:	75 e7                	jne    801010ec <filewrite+0xcc>
80101105:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101108:	89 f8                	mov    %edi,%eax
8010110a:	5b                   	pop    %ebx
8010110b:	5e                   	pop    %esi
8010110c:	5f                   	pop    %edi
8010110d:	5d                   	pop    %ebp
8010110e:	c3                   	ret    
8010110f:	8b 46 0c             	mov    0xc(%esi),%eax
80101112:	89 45 08             	mov    %eax,0x8(%ebp)
80101115:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101118:	5b                   	pop    %ebx
80101119:	5e                   	pop    %esi
8010111a:	5f                   	pop    %edi
8010111b:	5d                   	pop    %ebp
8010111c:	e9 af 22 00 00       	jmp    801033d0 <pipewrite>
80101121:	83 ec 0c             	sub    $0xc,%esp
80101124:	68 cf 78 10 80       	push   $0x801078cf
80101129:	e8 42 f2 ff ff       	call   80100370 <panic>
8010112e:	83 ec 0c             	sub    $0xc,%esp
80101131:	68 d5 78 10 80       	push   $0x801078d5
80101136:	e8 35 f2 ff ff       	call   80100370 <panic>
8010113b:	66 90                	xchg   %ax,%ax
8010113d:	66 90                	xchg   %ax,%ax
8010113f:	90                   	nop

80101140 <balloc>:
80101140:	55                   	push   %ebp
80101141:	89 e5                	mov    %esp,%ebp
80101143:	57                   	push   %edi
80101144:	56                   	push   %esi
80101145:	53                   	push   %ebx
80101146:	83 ec 1c             	sub    $0x1c,%esp
80101149:	8b 0d c0 19 11 80    	mov    0x801119c0,%ecx
8010114f:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101152:	85 c9                	test   %ecx,%ecx
80101154:	0f 84 85 00 00 00    	je     801011df <balloc+0x9f>
8010115a:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
80101161:	8b 75 dc             	mov    -0x24(%ebp),%esi
80101164:	83 ec 08             	sub    $0x8,%esp
80101167:	89 f0                	mov    %esi,%eax
80101169:	c1 f8 0c             	sar    $0xc,%eax
8010116c:	03 05 d8 19 11 80    	add    0x801119d8,%eax
80101172:	50                   	push   %eax
80101173:	ff 75 d8             	pushl  -0x28(%ebp)
80101176:	e8 55 ef ff ff       	call   801000d0 <bread>
8010117b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010117e:	a1 c0 19 11 80       	mov    0x801119c0,%eax
80101183:	83 c4 10             	add    $0x10,%esp
80101186:	89 45 e0             	mov    %eax,-0x20(%ebp)
80101189:	31 c0                	xor    %eax,%eax
8010118b:	eb 2d                	jmp    801011ba <balloc+0x7a>
8010118d:	8d 76 00             	lea    0x0(%esi),%esi
80101190:	89 c1                	mov    %eax,%ecx
80101192:	ba 01 00 00 00       	mov    $0x1,%edx
80101197:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
8010119a:	83 e1 07             	and    $0x7,%ecx
8010119d:	d3 e2                	shl    %cl,%edx
8010119f:	89 c1                	mov    %eax,%ecx
801011a1:	c1 f9 03             	sar    $0x3,%ecx
801011a4:	0f b6 7c 0b 5c       	movzbl 0x5c(%ebx,%ecx,1),%edi
801011a9:	85 d7                	test   %edx,%edi
801011ab:	74 43                	je     801011f0 <balloc+0xb0>
801011ad:	83 c0 01             	add    $0x1,%eax
801011b0:	83 c6 01             	add    $0x1,%esi
801011b3:	3d 00 10 00 00       	cmp    $0x1000,%eax
801011b8:	74 05                	je     801011bf <balloc+0x7f>
801011ba:	3b 75 e0             	cmp    -0x20(%ebp),%esi
801011bd:	72 d1                	jb     80101190 <balloc+0x50>
801011bf:	83 ec 0c             	sub    $0xc,%esp
801011c2:	ff 75 e4             	pushl  -0x1c(%ebp)
801011c5:	e8 16 f0 ff ff       	call   801001e0 <brelse>
801011ca:	81 45 dc 00 10 00 00 	addl   $0x1000,-0x24(%ebp)
801011d1:	83 c4 10             	add    $0x10,%esp
801011d4:	8b 45 dc             	mov    -0x24(%ebp),%eax
801011d7:	39 05 c0 19 11 80    	cmp    %eax,0x801119c0
801011dd:	77 82                	ja     80101161 <balloc+0x21>
801011df:	83 ec 0c             	sub    $0xc,%esp
801011e2:	68 df 78 10 80       	push   $0x801078df
801011e7:	e8 84 f1 ff ff       	call   80100370 <panic>
801011ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801011f0:	09 fa                	or     %edi,%edx
801011f2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801011f5:	83 ec 0c             	sub    $0xc,%esp
801011f8:	88 54 0f 5c          	mov    %dl,0x5c(%edi,%ecx,1)
801011fc:	57                   	push   %edi
801011fd:	e8 6e 1b 00 00       	call   80102d70 <log_write>
80101202:	89 3c 24             	mov    %edi,(%esp)
80101205:	e8 d6 ef ff ff       	call   801001e0 <brelse>
8010120a:	58                   	pop    %eax
8010120b:	5a                   	pop    %edx
8010120c:	56                   	push   %esi
8010120d:	ff 75 d8             	pushl  -0x28(%ebp)
80101210:	e8 bb ee ff ff       	call   801000d0 <bread>
80101215:	89 c3                	mov    %eax,%ebx
80101217:	8d 40 5c             	lea    0x5c(%eax),%eax
8010121a:	83 c4 0c             	add    $0xc,%esp
8010121d:	68 00 02 00 00       	push   $0x200
80101222:	6a 00                	push   $0x0
80101224:	50                   	push   %eax
80101225:	e8 16 3a 00 00       	call   80104c40 <memset>
8010122a:	89 1c 24             	mov    %ebx,(%esp)
8010122d:	e8 3e 1b 00 00       	call   80102d70 <log_write>
80101232:	89 1c 24             	mov    %ebx,(%esp)
80101235:	e8 a6 ef ff ff       	call   801001e0 <brelse>
8010123a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010123d:	89 f0                	mov    %esi,%eax
8010123f:	5b                   	pop    %ebx
80101240:	5e                   	pop    %esi
80101241:	5f                   	pop    %edi
80101242:	5d                   	pop    %ebp
80101243:	c3                   	ret    
80101244:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010124a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101250 <iget>:
80101250:	55                   	push   %ebp
80101251:	89 e5                	mov    %esp,%ebp
80101253:	57                   	push   %edi
80101254:	56                   	push   %esi
80101255:	53                   	push   %ebx
80101256:	89 c7                	mov    %eax,%edi
80101258:	31 f6                	xor    %esi,%esi
8010125a:	bb 14 1a 11 80       	mov    $0x80111a14,%ebx
8010125f:	83 ec 28             	sub    $0x28,%esp
80101262:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101265:	68 e0 19 11 80       	push   $0x801119e0
8010126a:	e8 d1 38 00 00       	call   80104b40 <acquire>
8010126f:	83 c4 10             	add    $0x10,%esp
80101272:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101275:	eb 1b                	jmp    80101292 <iget+0x42>
80101277:	89 f6                	mov    %esi,%esi
80101279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101280:	85 f6                	test   %esi,%esi
80101282:	74 44                	je     801012c8 <iget+0x78>
80101284:	81 c3 90 00 00 00    	add    $0x90,%ebx
8010128a:	81 fb 34 36 11 80    	cmp    $0x80113634,%ebx
80101290:	74 4e                	je     801012e0 <iget+0x90>
80101292:	8b 4b 08             	mov    0x8(%ebx),%ecx
80101295:	85 c9                	test   %ecx,%ecx
80101297:	7e e7                	jle    80101280 <iget+0x30>
80101299:	39 3b                	cmp    %edi,(%ebx)
8010129b:	75 e3                	jne    80101280 <iget+0x30>
8010129d:	39 53 04             	cmp    %edx,0x4(%ebx)
801012a0:	75 de                	jne    80101280 <iget+0x30>
801012a2:	83 ec 0c             	sub    $0xc,%esp
801012a5:	83 c1 01             	add    $0x1,%ecx
801012a8:	89 de                	mov    %ebx,%esi
801012aa:	68 e0 19 11 80       	push   $0x801119e0
801012af:	89 4b 08             	mov    %ecx,0x8(%ebx)
801012b2:	e8 39 39 00 00       	call   80104bf0 <release>
801012b7:	83 c4 10             	add    $0x10,%esp
801012ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801012bd:	89 f0                	mov    %esi,%eax
801012bf:	5b                   	pop    %ebx
801012c0:	5e                   	pop    %esi
801012c1:	5f                   	pop    %edi
801012c2:	5d                   	pop    %ebp
801012c3:	c3                   	ret    
801012c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801012c8:	85 c9                	test   %ecx,%ecx
801012ca:	0f 44 f3             	cmove  %ebx,%esi
801012cd:	81 c3 90 00 00 00    	add    $0x90,%ebx
801012d3:	81 fb 34 36 11 80    	cmp    $0x80113634,%ebx
801012d9:	75 b7                	jne    80101292 <iget+0x42>
801012db:	90                   	nop
801012dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801012e0:	85 f6                	test   %esi,%esi
801012e2:	74 2d                	je     80101311 <iget+0xc1>
801012e4:	83 ec 0c             	sub    $0xc,%esp
801012e7:	89 3e                	mov    %edi,(%esi)
801012e9:	89 56 04             	mov    %edx,0x4(%esi)
801012ec:	c7 46 08 01 00 00 00 	movl   $0x1,0x8(%esi)
801012f3:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
801012fa:	68 e0 19 11 80       	push   $0x801119e0
801012ff:	e8 ec 38 00 00       	call   80104bf0 <release>
80101304:	83 c4 10             	add    $0x10,%esp
80101307:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010130a:	89 f0                	mov    %esi,%eax
8010130c:	5b                   	pop    %ebx
8010130d:	5e                   	pop    %esi
8010130e:	5f                   	pop    %edi
8010130f:	5d                   	pop    %ebp
80101310:	c3                   	ret    
80101311:	83 ec 0c             	sub    $0xc,%esp
80101314:	68 f5 78 10 80       	push   $0x801078f5
80101319:	e8 52 f0 ff ff       	call   80100370 <panic>
8010131e:	66 90                	xchg   %ax,%ax

80101320 <bmap>:
80101320:	55                   	push   %ebp
80101321:	89 e5                	mov    %esp,%ebp
80101323:	57                   	push   %edi
80101324:	56                   	push   %esi
80101325:	53                   	push   %ebx
80101326:	89 c6                	mov    %eax,%esi
80101328:	83 ec 1c             	sub    $0x1c,%esp
8010132b:	83 fa 0b             	cmp    $0xb,%edx
8010132e:	77 18                	ja     80101348 <bmap+0x28>
80101330:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80101333:	8b 43 5c             	mov    0x5c(%ebx),%eax
80101336:	85 c0                	test   %eax,%eax
80101338:	74 76                	je     801013b0 <bmap+0x90>
8010133a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010133d:	5b                   	pop    %ebx
8010133e:	5e                   	pop    %esi
8010133f:	5f                   	pop    %edi
80101340:	5d                   	pop    %ebp
80101341:	c3                   	ret    
80101342:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101348:	8d 5a f4             	lea    -0xc(%edx),%ebx
8010134b:	83 fb 7f             	cmp    $0x7f,%ebx
8010134e:	0f 87 83 00 00 00    	ja     801013d7 <bmap+0xb7>
80101354:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
8010135a:	85 c0                	test   %eax,%eax
8010135c:	74 6a                	je     801013c8 <bmap+0xa8>
8010135e:	83 ec 08             	sub    $0x8,%esp
80101361:	50                   	push   %eax
80101362:	ff 36                	pushl  (%esi)
80101364:	e8 67 ed ff ff       	call   801000d0 <bread>
80101369:	8d 54 98 5c          	lea    0x5c(%eax,%ebx,4),%edx
8010136d:	83 c4 10             	add    $0x10,%esp
80101370:	89 c7                	mov    %eax,%edi
80101372:	8b 1a                	mov    (%edx),%ebx
80101374:	85 db                	test   %ebx,%ebx
80101376:	75 1d                	jne    80101395 <bmap+0x75>
80101378:	8b 06                	mov    (%esi),%eax
8010137a:	89 55 e4             	mov    %edx,-0x1c(%ebp)
8010137d:	e8 be fd ff ff       	call   80101140 <balloc>
80101382:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101385:	83 ec 0c             	sub    $0xc,%esp
80101388:	89 c3                	mov    %eax,%ebx
8010138a:	89 02                	mov    %eax,(%edx)
8010138c:	57                   	push   %edi
8010138d:	e8 de 19 00 00       	call   80102d70 <log_write>
80101392:	83 c4 10             	add    $0x10,%esp
80101395:	83 ec 0c             	sub    $0xc,%esp
80101398:	57                   	push   %edi
80101399:	e8 42 ee ff ff       	call   801001e0 <brelse>
8010139e:	83 c4 10             	add    $0x10,%esp
801013a1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013a4:	89 d8                	mov    %ebx,%eax
801013a6:	5b                   	pop    %ebx
801013a7:	5e                   	pop    %esi
801013a8:	5f                   	pop    %edi
801013a9:	5d                   	pop    %ebp
801013aa:	c3                   	ret    
801013ab:	90                   	nop
801013ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801013b0:	8b 06                	mov    (%esi),%eax
801013b2:	e8 89 fd ff ff       	call   80101140 <balloc>
801013b7:	89 43 5c             	mov    %eax,0x5c(%ebx)
801013ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
801013bd:	5b                   	pop    %ebx
801013be:	5e                   	pop    %esi
801013bf:	5f                   	pop    %edi
801013c0:	5d                   	pop    %ebp
801013c1:	c3                   	ret    
801013c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801013c8:	8b 06                	mov    (%esi),%eax
801013ca:	e8 71 fd ff ff       	call   80101140 <balloc>
801013cf:	89 86 8c 00 00 00    	mov    %eax,0x8c(%esi)
801013d5:	eb 87                	jmp    8010135e <bmap+0x3e>
801013d7:	83 ec 0c             	sub    $0xc,%esp
801013da:	68 05 79 10 80       	push   $0x80107905
801013df:	e8 8c ef ff ff       	call   80100370 <panic>
801013e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801013ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801013f0 <readsb>:
801013f0:	55                   	push   %ebp
801013f1:	89 e5                	mov    %esp,%ebp
801013f3:	56                   	push   %esi
801013f4:	53                   	push   %ebx
801013f5:	8b 75 0c             	mov    0xc(%ebp),%esi
801013f8:	83 ec 08             	sub    $0x8,%esp
801013fb:	6a 01                	push   $0x1
801013fd:	ff 75 08             	pushl  0x8(%ebp)
80101400:	e8 cb ec ff ff       	call   801000d0 <bread>
80101405:	89 c3                	mov    %eax,%ebx
80101407:	8d 40 5c             	lea    0x5c(%eax),%eax
8010140a:	83 c4 0c             	add    $0xc,%esp
8010140d:	6a 1c                	push   $0x1c
8010140f:	50                   	push   %eax
80101410:	56                   	push   %esi
80101411:	e8 da 38 00 00       	call   80104cf0 <memmove>
80101416:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101419:	83 c4 10             	add    $0x10,%esp
8010141c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010141f:	5b                   	pop    %ebx
80101420:	5e                   	pop    %esi
80101421:	5d                   	pop    %ebp
80101422:	e9 b9 ed ff ff       	jmp    801001e0 <brelse>
80101427:	89 f6                	mov    %esi,%esi
80101429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101430 <bfree>:
80101430:	55                   	push   %ebp
80101431:	89 e5                	mov    %esp,%ebp
80101433:	56                   	push   %esi
80101434:	53                   	push   %ebx
80101435:	89 d3                	mov    %edx,%ebx
80101437:	89 c6                	mov    %eax,%esi
80101439:	83 ec 08             	sub    $0x8,%esp
8010143c:	68 c0 19 11 80       	push   $0x801119c0
80101441:	50                   	push   %eax
80101442:	e8 a9 ff ff ff       	call   801013f0 <readsb>
80101447:	58                   	pop    %eax
80101448:	5a                   	pop    %edx
80101449:	89 da                	mov    %ebx,%edx
8010144b:	c1 ea 0c             	shr    $0xc,%edx
8010144e:	03 15 d8 19 11 80    	add    0x801119d8,%edx
80101454:	52                   	push   %edx
80101455:	56                   	push   %esi
80101456:	e8 75 ec ff ff       	call   801000d0 <bread>
8010145b:	89 d9                	mov    %ebx,%ecx
8010145d:	81 e3 ff 0f 00 00    	and    $0xfff,%ebx
80101463:	ba 01 00 00 00       	mov    $0x1,%edx
80101468:	83 e1 07             	and    $0x7,%ecx
8010146b:	c1 fb 03             	sar    $0x3,%ebx
8010146e:	83 c4 10             	add    $0x10,%esp
80101471:	d3 e2                	shl    %cl,%edx
80101473:	0f b6 4c 18 5c       	movzbl 0x5c(%eax,%ebx,1),%ecx
80101478:	85 d1                	test   %edx,%ecx
8010147a:	74 27                	je     801014a3 <bfree+0x73>
8010147c:	89 c6                	mov    %eax,%esi
8010147e:	f7 d2                	not    %edx
80101480:	89 c8                	mov    %ecx,%eax
80101482:	83 ec 0c             	sub    $0xc,%esp
80101485:	21 d0                	and    %edx,%eax
80101487:	88 44 1e 5c          	mov    %al,0x5c(%esi,%ebx,1)
8010148b:	56                   	push   %esi
8010148c:	e8 df 18 00 00       	call   80102d70 <log_write>
80101491:	89 34 24             	mov    %esi,(%esp)
80101494:	e8 47 ed ff ff       	call   801001e0 <brelse>
80101499:	83 c4 10             	add    $0x10,%esp
8010149c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010149f:	5b                   	pop    %ebx
801014a0:	5e                   	pop    %esi
801014a1:	5d                   	pop    %ebp
801014a2:	c3                   	ret    
801014a3:	83 ec 0c             	sub    $0xc,%esp
801014a6:	68 18 79 10 80       	push   $0x80107918
801014ab:	e8 c0 ee ff ff       	call   80100370 <panic>

801014b0 <iinit>:
801014b0:	55                   	push   %ebp
801014b1:	89 e5                	mov    %esp,%ebp
801014b3:	53                   	push   %ebx
801014b4:	bb 20 1a 11 80       	mov    $0x80111a20,%ebx
801014b9:	83 ec 0c             	sub    $0xc,%esp
801014bc:	68 2b 79 10 80       	push   $0x8010792b
801014c1:	68 e0 19 11 80       	push   $0x801119e0
801014c6:	e8 15 35 00 00       	call   801049e0 <initlock>
801014cb:	83 c4 10             	add    $0x10,%esp
801014ce:	66 90                	xchg   %ax,%ax
801014d0:	83 ec 08             	sub    $0x8,%esp
801014d3:	68 32 79 10 80       	push   $0x80107932
801014d8:	53                   	push   %ebx
801014d9:	81 c3 90 00 00 00    	add    $0x90,%ebx
801014df:	e8 cc 33 00 00       	call   801048b0 <initsleeplock>
801014e4:	83 c4 10             	add    $0x10,%esp
801014e7:	81 fb 40 36 11 80    	cmp    $0x80113640,%ebx
801014ed:	75 e1                	jne    801014d0 <iinit+0x20>
801014ef:	83 ec 08             	sub    $0x8,%esp
801014f2:	68 c0 19 11 80       	push   $0x801119c0
801014f7:	ff 75 08             	pushl  0x8(%ebp)
801014fa:	e8 f1 fe ff ff       	call   801013f0 <readsb>
801014ff:	ff 35 d8 19 11 80    	pushl  0x801119d8
80101505:	ff 35 d4 19 11 80    	pushl  0x801119d4
8010150b:	ff 35 d0 19 11 80    	pushl  0x801119d0
80101511:	ff 35 cc 19 11 80    	pushl  0x801119cc
80101517:	ff 35 c8 19 11 80    	pushl  0x801119c8
8010151d:	ff 35 c4 19 11 80    	pushl  0x801119c4
80101523:	ff 35 c0 19 11 80    	pushl  0x801119c0
80101529:	68 98 79 10 80       	push   $0x80107998
8010152e:	e8 2d f1 ff ff       	call   80100660 <cprintf>
80101533:	83 c4 30             	add    $0x30,%esp
80101536:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101539:	c9                   	leave  
8010153a:	c3                   	ret    
8010153b:	90                   	nop
8010153c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101540 <ialloc>:
80101540:	55                   	push   %ebp
80101541:	89 e5                	mov    %esp,%ebp
80101543:	57                   	push   %edi
80101544:	56                   	push   %esi
80101545:	53                   	push   %ebx
80101546:	83 ec 1c             	sub    $0x1c,%esp
80101549:	83 3d c8 19 11 80 01 	cmpl   $0x1,0x801119c8
80101550:	8b 45 0c             	mov    0xc(%ebp),%eax
80101553:	8b 75 08             	mov    0x8(%ebp),%esi
80101556:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101559:	0f 86 91 00 00 00    	jbe    801015f0 <ialloc+0xb0>
8010155f:	bb 01 00 00 00       	mov    $0x1,%ebx
80101564:	eb 21                	jmp    80101587 <ialloc+0x47>
80101566:	8d 76 00             	lea    0x0(%esi),%esi
80101569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101570:	83 ec 0c             	sub    $0xc,%esp
80101573:	83 c3 01             	add    $0x1,%ebx
80101576:	57                   	push   %edi
80101577:	e8 64 ec ff ff       	call   801001e0 <brelse>
8010157c:	83 c4 10             	add    $0x10,%esp
8010157f:	39 1d c8 19 11 80    	cmp    %ebx,0x801119c8
80101585:	76 69                	jbe    801015f0 <ialloc+0xb0>
80101587:	89 d8                	mov    %ebx,%eax
80101589:	83 ec 08             	sub    $0x8,%esp
8010158c:	c1 e8 03             	shr    $0x3,%eax
8010158f:	03 05 d4 19 11 80    	add    0x801119d4,%eax
80101595:	50                   	push   %eax
80101596:	56                   	push   %esi
80101597:	e8 34 eb ff ff       	call   801000d0 <bread>
8010159c:	89 c7                	mov    %eax,%edi
8010159e:	89 d8                	mov    %ebx,%eax
801015a0:	83 c4 10             	add    $0x10,%esp
801015a3:	83 e0 07             	and    $0x7,%eax
801015a6:	c1 e0 06             	shl    $0x6,%eax
801015a9:	8d 4c 07 5c          	lea    0x5c(%edi,%eax,1),%ecx
801015ad:	66 83 39 00          	cmpw   $0x0,(%ecx)
801015b1:	75 bd                	jne    80101570 <ialloc+0x30>
801015b3:	83 ec 04             	sub    $0x4,%esp
801015b6:	89 4d e0             	mov    %ecx,-0x20(%ebp)
801015b9:	6a 40                	push   $0x40
801015bb:	6a 00                	push   $0x0
801015bd:	51                   	push   %ecx
801015be:	e8 7d 36 00 00       	call   80104c40 <memset>
801015c3:	0f b7 45 e4          	movzwl -0x1c(%ebp),%eax
801015c7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
801015ca:	66 89 01             	mov    %ax,(%ecx)
801015cd:	89 3c 24             	mov    %edi,(%esp)
801015d0:	e8 9b 17 00 00       	call   80102d70 <log_write>
801015d5:	89 3c 24             	mov    %edi,(%esp)
801015d8:	e8 03 ec ff ff       	call   801001e0 <brelse>
801015dd:	83 c4 10             	add    $0x10,%esp
801015e0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801015e3:	89 da                	mov    %ebx,%edx
801015e5:	89 f0                	mov    %esi,%eax
801015e7:	5b                   	pop    %ebx
801015e8:	5e                   	pop    %esi
801015e9:	5f                   	pop    %edi
801015ea:	5d                   	pop    %ebp
801015eb:	e9 60 fc ff ff       	jmp    80101250 <iget>
801015f0:	83 ec 0c             	sub    $0xc,%esp
801015f3:	68 38 79 10 80       	push   $0x80107938
801015f8:	e8 73 ed ff ff       	call   80100370 <panic>
801015fd:	8d 76 00             	lea    0x0(%esi),%esi

80101600 <iupdate>:
80101600:	55                   	push   %ebp
80101601:	89 e5                	mov    %esp,%ebp
80101603:	56                   	push   %esi
80101604:	53                   	push   %ebx
80101605:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101608:	83 ec 08             	sub    $0x8,%esp
8010160b:	8b 43 04             	mov    0x4(%ebx),%eax
8010160e:	83 c3 5c             	add    $0x5c,%ebx
80101611:	c1 e8 03             	shr    $0x3,%eax
80101614:	03 05 d4 19 11 80    	add    0x801119d4,%eax
8010161a:	50                   	push   %eax
8010161b:	ff 73 a4             	pushl  -0x5c(%ebx)
8010161e:	e8 ad ea ff ff       	call   801000d0 <bread>
80101623:	89 c6                	mov    %eax,%esi
80101625:	8b 43 a8             	mov    -0x58(%ebx),%eax
80101628:	0f b7 53 f4          	movzwl -0xc(%ebx),%edx
8010162c:	83 c4 0c             	add    $0xc,%esp
8010162f:	83 e0 07             	and    $0x7,%eax
80101632:	c1 e0 06             	shl    $0x6,%eax
80101635:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101639:	66 89 10             	mov    %dx,(%eax)
8010163c:	0f b7 53 f6          	movzwl -0xa(%ebx),%edx
80101640:	83 c0 0c             	add    $0xc,%eax
80101643:	66 89 50 f6          	mov    %dx,-0xa(%eax)
80101647:	0f b7 53 f8          	movzwl -0x8(%ebx),%edx
8010164b:	66 89 50 f8          	mov    %dx,-0x8(%eax)
8010164f:	0f b7 53 fa          	movzwl -0x6(%ebx),%edx
80101653:	66 89 50 fa          	mov    %dx,-0x6(%eax)
80101657:	8b 53 fc             	mov    -0x4(%ebx),%edx
8010165a:	89 50 fc             	mov    %edx,-0x4(%eax)
8010165d:	6a 34                	push   $0x34
8010165f:	53                   	push   %ebx
80101660:	50                   	push   %eax
80101661:	e8 8a 36 00 00       	call   80104cf0 <memmove>
80101666:	89 34 24             	mov    %esi,(%esp)
80101669:	e8 02 17 00 00       	call   80102d70 <log_write>
8010166e:	89 75 08             	mov    %esi,0x8(%ebp)
80101671:	83 c4 10             	add    $0x10,%esp
80101674:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101677:	5b                   	pop    %ebx
80101678:	5e                   	pop    %esi
80101679:	5d                   	pop    %ebp
8010167a:	e9 61 eb ff ff       	jmp    801001e0 <brelse>
8010167f:	90                   	nop

80101680 <idup>:
80101680:	55                   	push   %ebp
80101681:	89 e5                	mov    %esp,%ebp
80101683:	53                   	push   %ebx
80101684:	83 ec 10             	sub    $0x10,%esp
80101687:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010168a:	68 e0 19 11 80       	push   $0x801119e0
8010168f:	e8 ac 34 00 00       	call   80104b40 <acquire>
80101694:	83 43 08 01          	addl   $0x1,0x8(%ebx)
80101698:	c7 04 24 e0 19 11 80 	movl   $0x801119e0,(%esp)
8010169f:	e8 4c 35 00 00       	call   80104bf0 <release>
801016a4:	89 d8                	mov    %ebx,%eax
801016a6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801016a9:	c9                   	leave  
801016aa:	c3                   	ret    
801016ab:	90                   	nop
801016ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801016b0 <ilock>:
801016b0:	55                   	push   %ebp
801016b1:	89 e5                	mov    %esp,%ebp
801016b3:	56                   	push   %esi
801016b4:	53                   	push   %ebx
801016b5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801016b8:	85 db                	test   %ebx,%ebx
801016ba:	0f 84 b7 00 00 00    	je     80101777 <ilock+0xc7>
801016c0:	8b 53 08             	mov    0x8(%ebx),%edx
801016c3:	85 d2                	test   %edx,%edx
801016c5:	0f 8e ac 00 00 00    	jle    80101777 <ilock+0xc7>
801016cb:	8d 43 0c             	lea    0xc(%ebx),%eax
801016ce:	83 ec 0c             	sub    $0xc,%esp
801016d1:	50                   	push   %eax
801016d2:	e8 19 32 00 00       	call   801048f0 <acquiresleep>
801016d7:	8b 43 4c             	mov    0x4c(%ebx),%eax
801016da:	83 c4 10             	add    $0x10,%esp
801016dd:	85 c0                	test   %eax,%eax
801016df:	74 0f                	je     801016f0 <ilock+0x40>
801016e1:	8d 65 f8             	lea    -0x8(%ebp),%esp
801016e4:	5b                   	pop    %ebx
801016e5:	5e                   	pop    %esi
801016e6:	5d                   	pop    %ebp
801016e7:	c3                   	ret    
801016e8:	90                   	nop
801016e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801016f0:	8b 43 04             	mov    0x4(%ebx),%eax
801016f3:	83 ec 08             	sub    $0x8,%esp
801016f6:	c1 e8 03             	shr    $0x3,%eax
801016f9:	03 05 d4 19 11 80    	add    0x801119d4,%eax
801016ff:	50                   	push   %eax
80101700:	ff 33                	pushl  (%ebx)
80101702:	e8 c9 e9 ff ff       	call   801000d0 <bread>
80101707:	89 c6                	mov    %eax,%esi
80101709:	8b 43 04             	mov    0x4(%ebx),%eax
8010170c:	83 c4 0c             	add    $0xc,%esp
8010170f:	83 e0 07             	and    $0x7,%eax
80101712:	c1 e0 06             	shl    $0x6,%eax
80101715:	8d 44 06 5c          	lea    0x5c(%esi,%eax,1),%eax
80101719:	0f b7 10             	movzwl (%eax),%edx
8010171c:	83 c0 0c             	add    $0xc,%eax
8010171f:	66 89 53 50          	mov    %dx,0x50(%ebx)
80101723:	0f b7 50 f6          	movzwl -0xa(%eax),%edx
80101727:	66 89 53 52          	mov    %dx,0x52(%ebx)
8010172b:	0f b7 50 f8          	movzwl -0x8(%eax),%edx
8010172f:	66 89 53 54          	mov    %dx,0x54(%ebx)
80101733:	0f b7 50 fa          	movzwl -0x6(%eax),%edx
80101737:	66 89 53 56          	mov    %dx,0x56(%ebx)
8010173b:	8b 50 fc             	mov    -0x4(%eax),%edx
8010173e:	89 53 58             	mov    %edx,0x58(%ebx)
80101741:	6a 34                	push   $0x34
80101743:	50                   	push   %eax
80101744:	8d 43 5c             	lea    0x5c(%ebx),%eax
80101747:	50                   	push   %eax
80101748:	e8 a3 35 00 00       	call   80104cf0 <memmove>
8010174d:	89 34 24             	mov    %esi,(%esp)
80101750:	e8 8b ea ff ff       	call   801001e0 <brelse>
80101755:	83 c4 10             	add    $0x10,%esp
80101758:	66 83 7b 50 00       	cmpw   $0x0,0x50(%ebx)
8010175d:	c7 43 4c 01 00 00 00 	movl   $0x1,0x4c(%ebx)
80101764:	0f 85 77 ff ff ff    	jne    801016e1 <ilock+0x31>
8010176a:	83 ec 0c             	sub    $0xc,%esp
8010176d:	68 50 79 10 80       	push   $0x80107950
80101772:	e8 f9 eb ff ff       	call   80100370 <panic>
80101777:	83 ec 0c             	sub    $0xc,%esp
8010177a:	68 4a 79 10 80       	push   $0x8010794a
8010177f:	e8 ec eb ff ff       	call   80100370 <panic>
80101784:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010178a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101790 <iunlock>:
80101790:	55                   	push   %ebp
80101791:	89 e5                	mov    %esp,%ebp
80101793:	56                   	push   %esi
80101794:	53                   	push   %ebx
80101795:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101798:	85 db                	test   %ebx,%ebx
8010179a:	74 28                	je     801017c4 <iunlock+0x34>
8010179c:	8d 73 0c             	lea    0xc(%ebx),%esi
8010179f:	83 ec 0c             	sub    $0xc,%esp
801017a2:	56                   	push   %esi
801017a3:	e8 e8 31 00 00       	call   80104990 <holdingsleep>
801017a8:	83 c4 10             	add    $0x10,%esp
801017ab:	85 c0                	test   %eax,%eax
801017ad:	74 15                	je     801017c4 <iunlock+0x34>
801017af:	8b 43 08             	mov    0x8(%ebx),%eax
801017b2:	85 c0                	test   %eax,%eax
801017b4:	7e 0e                	jle    801017c4 <iunlock+0x34>
801017b6:	89 75 08             	mov    %esi,0x8(%ebp)
801017b9:	8d 65 f8             	lea    -0x8(%ebp),%esp
801017bc:	5b                   	pop    %ebx
801017bd:	5e                   	pop    %esi
801017be:	5d                   	pop    %ebp
801017bf:	e9 8c 31 00 00       	jmp    80104950 <releasesleep>
801017c4:	83 ec 0c             	sub    $0xc,%esp
801017c7:	68 5f 79 10 80       	push   $0x8010795f
801017cc:	e8 9f eb ff ff       	call   80100370 <panic>
801017d1:	eb 0d                	jmp    801017e0 <iput>
801017d3:	90                   	nop
801017d4:	90                   	nop
801017d5:	90                   	nop
801017d6:	90                   	nop
801017d7:	90                   	nop
801017d8:	90                   	nop
801017d9:	90                   	nop
801017da:	90                   	nop
801017db:	90                   	nop
801017dc:	90                   	nop
801017dd:	90                   	nop
801017de:	90                   	nop
801017df:	90                   	nop

801017e0 <iput>:
801017e0:	55                   	push   %ebp
801017e1:	89 e5                	mov    %esp,%ebp
801017e3:	57                   	push   %edi
801017e4:	56                   	push   %esi
801017e5:	53                   	push   %ebx
801017e6:	83 ec 28             	sub    $0x28,%esp
801017e9:	8b 75 08             	mov    0x8(%ebp),%esi
801017ec:	8d 7e 0c             	lea    0xc(%esi),%edi
801017ef:	57                   	push   %edi
801017f0:	e8 fb 30 00 00       	call   801048f0 <acquiresleep>
801017f5:	8b 56 4c             	mov    0x4c(%esi),%edx
801017f8:	83 c4 10             	add    $0x10,%esp
801017fb:	85 d2                	test   %edx,%edx
801017fd:	74 07                	je     80101806 <iput+0x26>
801017ff:	66 83 7e 56 00       	cmpw   $0x0,0x56(%esi)
80101804:	74 32                	je     80101838 <iput+0x58>
80101806:	83 ec 0c             	sub    $0xc,%esp
80101809:	57                   	push   %edi
8010180a:	e8 41 31 00 00       	call   80104950 <releasesleep>
8010180f:	c7 04 24 e0 19 11 80 	movl   $0x801119e0,(%esp)
80101816:	e8 25 33 00 00       	call   80104b40 <acquire>
8010181b:	83 6e 08 01          	subl   $0x1,0x8(%esi)
8010181f:	83 c4 10             	add    $0x10,%esp
80101822:	c7 45 08 e0 19 11 80 	movl   $0x801119e0,0x8(%ebp)
80101829:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010182c:	5b                   	pop    %ebx
8010182d:	5e                   	pop    %esi
8010182e:	5f                   	pop    %edi
8010182f:	5d                   	pop    %ebp
80101830:	e9 bb 33 00 00       	jmp    80104bf0 <release>
80101835:	8d 76 00             	lea    0x0(%esi),%esi
80101838:	83 ec 0c             	sub    $0xc,%esp
8010183b:	68 e0 19 11 80       	push   $0x801119e0
80101840:	e8 fb 32 00 00       	call   80104b40 <acquire>
80101845:	8b 5e 08             	mov    0x8(%esi),%ebx
80101848:	c7 04 24 e0 19 11 80 	movl   $0x801119e0,(%esp)
8010184f:	e8 9c 33 00 00       	call   80104bf0 <release>
80101854:	83 c4 10             	add    $0x10,%esp
80101857:	83 fb 01             	cmp    $0x1,%ebx
8010185a:	75 aa                	jne    80101806 <iput+0x26>
8010185c:	8d 8e 8c 00 00 00    	lea    0x8c(%esi),%ecx
80101862:	89 7d e4             	mov    %edi,-0x1c(%ebp)
80101865:	8d 5e 5c             	lea    0x5c(%esi),%ebx
80101868:	89 cf                	mov    %ecx,%edi
8010186a:	eb 0b                	jmp    80101877 <iput+0x97>
8010186c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101870:	83 c3 04             	add    $0x4,%ebx
80101873:	39 fb                	cmp    %edi,%ebx
80101875:	74 19                	je     80101890 <iput+0xb0>
80101877:	8b 13                	mov    (%ebx),%edx
80101879:	85 d2                	test   %edx,%edx
8010187b:	74 f3                	je     80101870 <iput+0x90>
8010187d:	8b 06                	mov    (%esi),%eax
8010187f:	e8 ac fb ff ff       	call   80101430 <bfree>
80101884:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010188a:	eb e4                	jmp    80101870 <iput+0x90>
8010188c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101890:	8b 86 8c 00 00 00    	mov    0x8c(%esi),%eax
80101896:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80101899:	85 c0                	test   %eax,%eax
8010189b:	75 33                	jne    801018d0 <iput+0xf0>
8010189d:	83 ec 0c             	sub    $0xc,%esp
801018a0:	c7 46 58 00 00 00 00 	movl   $0x0,0x58(%esi)
801018a7:	56                   	push   %esi
801018a8:	e8 53 fd ff ff       	call   80101600 <iupdate>
801018ad:	31 c0                	xor    %eax,%eax
801018af:	66 89 46 50          	mov    %ax,0x50(%esi)
801018b3:	89 34 24             	mov    %esi,(%esp)
801018b6:	e8 45 fd ff ff       	call   80101600 <iupdate>
801018bb:	c7 46 4c 00 00 00 00 	movl   $0x0,0x4c(%esi)
801018c2:	83 c4 10             	add    $0x10,%esp
801018c5:	e9 3c ff ff ff       	jmp    80101806 <iput+0x26>
801018ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801018d0:	83 ec 08             	sub    $0x8,%esp
801018d3:	50                   	push   %eax
801018d4:	ff 36                	pushl  (%esi)
801018d6:	e8 f5 e7 ff ff       	call   801000d0 <bread>
801018db:	8d 88 5c 02 00 00    	lea    0x25c(%eax),%ecx
801018e1:	89 7d e0             	mov    %edi,-0x20(%ebp)
801018e4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801018e7:	8d 58 5c             	lea    0x5c(%eax),%ebx
801018ea:	83 c4 10             	add    $0x10,%esp
801018ed:	89 cf                	mov    %ecx,%edi
801018ef:	eb 0e                	jmp    801018ff <iput+0x11f>
801018f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801018f8:	83 c3 04             	add    $0x4,%ebx
801018fb:	39 fb                	cmp    %edi,%ebx
801018fd:	74 0f                	je     8010190e <iput+0x12e>
801018ff:	8b 13                	mov    (%ebx),%edx
80101901:	85 d2                	test   %edx,%edx
80101903:	74 f3                	je     801018f8 <iput+0x118>
80101905:	8b 06                	mov    (%esi),%eax
80101907:	e8 24 fb ff ff       	call   80101430 <bfree>
8010190c:	eb ea                	jmp    801018f8 <iput+0x118>
8010190e:	83 ec 0c             	sub    $0xc,%esp
80101911:	ff 75 e4             	pushl  -0x1c(%ebp)
80101914:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101917:	e8 c4 e8 ff ff       	call   801001e0 <brelse>
8010191c:	8b 96 8c 00 00 00    	mov    0x8c(%esi),%edx
80101922:	8b 06                	mov    (%esi),%eax
80101924:	e8 07 fb ff ff       	call   80101430 <bfree>
80101929:	c7 86 8c 00 00 00 00 	movl   $0x0,0x8c(%esi)
80101930:	00 00 00 
80101933:	83 c4 10             	add    $0x10,%esp
80101936:	e9 62 ff ff ff       	jmp    8010189d <iput+0xbd>
8010193b:	90                   	nop
8010193c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101940 <iunlockput>:
80101940:	55                   	push   %ebp
80101941:	89 e5                	mov    %esp,%ebp
80101943:	53                   	push   %ebx
80101944:	83 ec 10             	sub    $0x10,%esp
80101947:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010194a:	53                   	push   %ebx
8010194b:	e8 40 fe ff ff       	call   80101790 <iunlock>
80101950:	89 5d 08             	mov    %ebx,0x8(%ebp)
80101953:	83 c4 10             	add    $0x10,%esp
80101956:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80101959:	c9                   	leave  
8010195a:	e9 81 fe ff ff       	jmp    801017e0 <iput>
8010195f:	90                   	nop

80101960 <stati>:
80101960:	55                   	push   %ebp
80101961:	89 e5                	mov    %esp,%ebp
80101963:	8b 55 08             	mov    0x8(%ebp),%edx
80101966:	8b 45 0c             	mov    0xc(%ebp),%eax
80101969:	8b 0a                	mov    (%edx),%ecx
8010196b:	89 48 04             	mov    %ecx,0x4(%eax)
8010196e:	8b 4a 04             	mov    0x4(%edx),%ecx
80101971:	89 48 08             	mov    %ecx,0x8(%eax)
80101974:	0f b7 4a 50          	movzwl 0x50(%edx),%ecx
80101978:	66 89 08             	mov    %cx,(%eax)
8010197b:	0f b7 4a 56          	movzwl 0x56(%edx),%ecx
8010197f:	66 89 48 0c          	mov    %cx,0xc(%eax)
80101983:	8b 52 58             	mov    0x58(%edx),%edx
80101986:	89 50 10             	mov    %edx,0x10(%eax)
80101989:	5d                   	pop    %ebp
8010198a:	c3                   	ret    
8010198b:	90                   	nop
8010198c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80101990 <readi>:
80101990:	55                   	push   %ebp
80101991:	89 e5                	mov    %esp,%ebp
80101993:	57                   	push   %edi
80101994:	56                   	push   %esi
80101995:	53                   	push   %ebx
80101996:	83 ec 1c             	sub    $0x1c,%esp
80101999:	8b 45 08             	mov    0x8(%ebp),%eax
8010199c:	8b 7d 0c             	mov    0xc(%ebp),%edi
8010199f:	8b 75 10             	mov    0x10(%ebp),%esi
801019a2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
801019a7:	89 7d e0             	mov    %edi,-0x20(%ebp)
801019aa:	8b 7d 14             	mov    0x14(%ebp),%edi
801019ad:	89 45 d8             	mov    %eax,-0x28(%ebp)
801019b0:	89 7d e4             	mov    %edi,-0x1c(%ebp)
801019b3:	0f 84 a7 00 00 00    	je     80101a60 <readi+0xd0>
801019b9:	8b 45 d8             	mov    -0x28(%ebp),%eax
801019bc:	8b 40 58             	mov    0x58(%eax),%eax
801019bf:	39 f0                	cmp    %esi,%eax
801019c1:	0f 82 c1 00 00 00    	jb     80101a88 <readi+0xf8>
801019c7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
801019ca:	89 fa                	mov    %edi,%edx
801019cc:	01 f2                	add    %esi,%edx
801019ce:	0f 82 b4 00 00 00    	jb     80101a88 <readi+0xf8>
801019d4:	89 c1                	mov    %eax,%ecx
801019d6:	29 f1                	sub    %esi,%ecx
801019d8:	39 d0                	cmp    %edx,%eax
801019da:	0f 43 cf             	cmovae %edi,%ecx
801019dd:	31 ff                	xor    %edi,%edi
801019df:	85 c9                	test   %ecx,%ecx
801019e1:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801019e4:	74 6d                	je     80101a53 <readi+0xc3>
801019e6:	8d 76 00             	lea    0x0(%esi),%esi
801019e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801019f0:	8b 5d d8             	mov    -0x28(%ebp),%ebx
801019f3:	89 f2                	mov    %esi,%edx
801019f5:	c1 ea 09             	shr    $0x9,%edx
801019f8:	89 d8                	mov    %ebx,%eax
801019fa:	e8 21 f9 ff ff       	call   80101320 <bmap>
801019ff:	83 ec 08             	sub    $0x8,%esp
80101a02:	50                   	push   %eax
80101a03:	ff 33                	pushl  (%ebx)
80101a05:	bb 00 02 00 00       	mov    $0x200,%ebx
80101a0a:	e8 c1 e6 ff ff       	call   801000d0 <bread>
80101a0f:	89 c2                	mov    %eax,%edx
80101a11:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101a14:	89 f1                	mov    %esi,%ecx
80101a16:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101a1c:	83 c4 0c             	add    $0xc,%esp
80101a1f:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101a22:	29 cb                	sub    %ecx,%ebx
80101a24:	29 f8                	sub    %edi,%eax
80101a26:	39 c3                	cmp    %eax,%ebx
80101a28:	0f 47 d8             	cmova  %eax,%ebx
80101a2b:	8d 44 0a 5c          	lea    0x5c(%edx,%ecx,1),%eax
80101a2f:	53                   	push   %ebx
80101a30:	01 df                	add    %ebx,%edi
80101a32:	01 de                	add    %ebx,%esi
80101a34:	50                   	push   %eax
80101a35:	ff 75 e0             	pushl  -0x20(%ebp)
80101a38:	e8 b3 32 00 00       	call   80104cf0 <memmove>
80101a3d:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101a40:	89 14 24             	mov    %edx,(%esp)
80101a43:	e8 98 e7 ff ff       	call   801001e0 <brelse>
80101a48:	01 5d e0             	add    %ebx,-0x20(%ebp)
80101a4b:	83 c4 10             	add    $0x10,%esp
80101a4e:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
80101a51:	77 9d                	ja     801019f0 <readi+0x60>
80101a53:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101a56:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a59:	5b                   	pop    %ebx
80101a5a:	5e                   	pop    %esi
80101a5b:	5f                   	pop    %edi
80101a5c:	5d                   	pop    %ebp
80101a5d:	c3                   	ret    
80101a5e:	66 90                	xchg   %ax,%ax
80101a60:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101a64:	66 83 f8 09          	cmp    $0x9,%ax
80101a68:	77 1e                	ja     80101a88 <readi+0xf8>
80101a6a:	8b 04 c5 60 19 11 80 	mov    -0x7feee6a0(,%eax,8),%eax
80101a71:	85 c0                	test   %eax,%eax
80101a73:	74 13                	je     80101a88 <readi+0xf8>
80101a75:	89 7d 10             	mov    %edi,0x10(%ebp)
80101a78:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101a7b:	5b                   	pop    %ebx
80101a7c:	5e                   	pop    %esi
80101a7d:	5f                   	pop    %edi
80101a7e:	5d                   	pop    %ebp
80101a7f:	ff e0                	jmp    *%eax
80101a81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101a88:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101a8d:	eb c7                	jmp    80101a56 <readi+0xc6>
80101a8f:	90                   	nop

80101a90 <writei>:
80101a90:	55                   	push   %ebp
80101a91:	89 e5                	mov    %esp,%ebp
80101a93:	57                   	push   %edi
80101a94:	56                   	push   %esi
80101a95:	53                   	push   %ebx
80101a96:	83 ec 1c             	sub    $0x1c,%esp
80101a99:	8b 45 08             	mov    0x8(%ebp),%eax
80101a9c:	8b 75 0c             	mov    0xc(%ebp),%esi
80101a9f:	8b 7d 14             	mov    0x14(%ebp),%edi
80101aa2:	66 83 78 50 03       	cmpw   $0x3,0x50(%eax)
80101aa7:	89 75 dc             	mov    %esi,-0x24(%ebp)
80101aaa:	89 45 d8             	mov    %eax,-0x28(%ebp)
80101aad:	8b 75 10             	mov    0x10(%ebp),%esi
80101ab0:	89 7d e0             	mov    %edi,-0x20(%ebp)
80101ab3:	0f 84 b7 00 00 00    	je     80101b70 <writei+0xe0>
80101ab9:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101abc:	39 70 58             	cmp    %esi,0x58(%eax)
80101abf:	0f 82 eb 00 00 00    	jb     80101bb0 <writei+0x120>
80101ac5:	8b 7d e0             	mov    -0x20(%ebp),%edi
80101ac8:	89 f8                	mov    %edi,%eax
80101aca:	01 f0                	add    %esi,%eax
80101acc:	3d 00 18 01 00       	cmp    $0x11800,%eax
80101ad1:	0f 87 d9 00 00 00    	ja     80101bb0 <writei+0x120>
80101ad7:	39 c6                	cmp    %eax,%esi
80101ad9:	0f 87 d1 00 00 00    	ja     80101bb0 <writei+0x120>
80101adf:	85 ff                	test   %edi,%edi
80101ae1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
80101ae8:	74 78                	je     80101b62 <writei+0xd2>
80101aea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101af0:	8b 7d d8             	mov    -0x28(%ebp),%edi
80101af3:	89 f2                	mov    %esi,%edx
80101af5:	bb 00 02 00 00       	mov    $0x200,%ebx
80101afa:	c1 ea 09             	shr    $0x9,%edx
80101afd:	89 f8                	mov    %edi,%eax
80101aff:	e8 1c f8 ff ff       	call   80101320 <bmap>
80101b04:	83 ec 08             	sub    $0x8,%esp
80101b07:	50                   	push   %eax
80101b08:	ff 37                	pushl  (%edi)
80101b0a:	e8 c1 e5 ff ff       	call   801000d0 <bread>
80101b0f:	89 c7                	mov    %eax,%edi
80101b11:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b14:	2b 45 e4             	sub    -0x1c(%ebp),%eax
80101b17:	89 f1                	mov    %esi,%ecx
80101b19:	83 c4 0c             	add    $0xc,%esp
80101b1c:	81 e1 ff 01 00 00    	and    $0x1ff,%ecx
80101b22:	29 cb                	sub    %ecx,%ebx
80101b24:	39 c3                	cmp    %eax,%ebx
80101b26:	0f 47 d8             	cmova  %eax,%ebx
80101b29:	8d 44 0f 5c          	lea    0x5c(%edi,%ecx,1),%eax
80101b2d:	53                   	push   %ebx
80101b2e:	ff 75 dc             	pushl  -0x24(%ebp)
80101b31:	01 de                	add    %ebx,%esi
80101b33:	50                   	push   %eax
80101b34:	e8 b7 31 00 00       	call   80104cf0 <memmove>
80101b39:	89 3c 24             	mov    %edi,(%esp)
80101b3c:	e8 2f 12 00 00       	call   80102d70 <log_write>
80101b41:	89 3c 24             	mov    %edi,(%esp)
80101b44:	e8 97 e6 ff ff       	call   801001e0 <brelse>
80101b49:	01 5d e4             	add    %ebx,-0x1c(%ebp)
80101b4c:	01 5d dc             	add    %ebx,-0x24(%ebp)
80101b4f:	83 c4 10             	add    $0x10,%esp
80101b52:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101b55:	39 55 e0             	cmp    %edx,-0x20(%ebp)
80101b58:	77 96                	ja     80101af0 <writei+0x60>
80101b5a:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b5d:	3b 70 58             	cmp    0x58(%eax),%esi
80101b60:	77 36                	ja     80101b98 <writei+0x108>
80101b62:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101b65:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b68:	5b                   	pop    %ebx
80101b69:	5e                   	pop    %esi
80101b6a:	5f                   	pop    %edi
80101b6b:	5d                   	pop    %ebp
80101b6c:	c3                   	ret    
80101b6d:	8d 76 00             	lea    0x0(%esi),%esi
80101b70:	0f bf 40 52          	movswl 0x52(%eax),%eax
80101b74:	66 83 f8 09          	cmp    $0x9,%ax
80101b78:	77 36                	ja     80101bb0 <writei+0x120>
80101b7a:	8b 04 c5 64 19 11 80 	mov    -0x7feee69c(,%eax,8),%eax
80101b81:	85 c0                	test   %eax,%eax
80101b83:	74 2b                	je     80101bb0 <writei+0x120>
80101b85:	89 7d 10             	mov    %edi,0x10(%ebp)
80101b88:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101b8b:	5b                   	pop    %ebx
80101b8c:	5e                   	pop    %esi
80101b8d:	5f                   	pop    %edi
80101b8e:	5d                   	pop    %ebp
80101b8f:	ff e0                	jmp    *%eax
80101b91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101b98:	8b 45 d8             	mov    -0x28(%ebp),%eax
80101b9b:	83 ec 0c             	sub    $0xc,%esp
80101b9e:	89 70 58             	mov    %esi,0x58(%eax)
80101ba1:	50                   	push   %eax
80101ba2:	e8 59 fa ff ff       	call   80101600 <iupdate>
80101ba7:	83 c4 10             	add    $0x10,%esp
80101baa:	eb b6                	jmp    80101b62 <writei+0xd2>
80101bac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101bb0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101bb5:	eb ae                	jmp    80101b65 <writei+0xd5>
80101bb7:	89 f6                	mov    %esi,%esi
80101bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101bc0 <namecmp>:
80101bc0:	55                   	push   %ebp
80101bc1:	89 e5                	mov    %esp,%ebp
80101bc3:	83 ec 0c             	sub    $0xc,%esp
80101bc6:	6a 0e                	push   $0xe
80101bc8:	ff 75 0c             	pushl  0xc(%ebp)
80101bcb:	ff 75 08             	pushl  0x8(%ebp)
80101bce:	e8 9d 31 00 00       	call   80104d70 <strncmp>
80101bd3:	c9                   	leave  
80101bd4:	c3                   	ret    
80101bd5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101be0 <dirlookup>:
80101be0:	55                   	push   %ebp
80101be1:	89 e5                	mov    %esp,%ebp
80101be3:	57                   	push   %edi
80101be4:	56                   	push   %esi
80101be5:	53                   	push   %ebx
80101be6:	83 ec 1c             	sub    $0x1c,%esp
80101be9:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101bec:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80101bf1:	0f 85 80 00 00 00    	jne    80101c77 <dirlookup+0x97>
80101bf7:	8b 53 58             	mov    0x58(%ebx),%edx
80101bfa:	31 ff                	xor    %edi,%edi
80101bfc:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101bff:	85 d2                	test   %edx,%edx
80101c01:	75 0d                	jne    80101c10 <dirlookup+0x30>
80101c03:	eb 5b                	jmp    80101c60 <dirlookup+0x80>
80101c05:	8d 76 00             	lea    0x0(%esi),%esi
80101c08:	83 c7 10             	add    $0x10,%edi
80101c0b:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101c0e:	76 50                	jbe    80101c60 <dirlookup+0x80>
80101c10:	6a 10                	push   $0x10
80101c12:	57                   	push   %edi
80101c13:	56                   	push   %esi
80101c14:	53                   	push   %ebx
80101c15:	e8 76 fd ff ff       	call   80101990 <readi>
80101c1a:	83 c4 10             	add    $0x10,%esp
80101c1d:	83 f8 10             	cmp    $0x10,%eax
80101c20:	75 48                	jne    80101c6a <dirlookup+0x8a>
80101c22:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101c27:	74 df                	je     80101c08 <dirlookup+0x28>
80101c29:	8d 45 da             	lea    -0x26(%ebp),%eax
80101c2c:	83 ec 04             	sub    $0x4,%esp
80101c2f:	6a 0e                	push   $0xe
80101c31:	50                   	push   %eax
80101c32:	ff 75 0c             	pushl  0xc(%ebp)
80101c35:	e8 36 31 00 00       	call   80104d70 <strncmp>
80101c3a:	83 c4 10             	add    $0x10,%esp
80101c3d:	85 c0                	test   %eax,%eax
80101c3f:	75 c7                	jne    80101c08 <dirlookup+0x28>
80101c41:	8b 45 10             	mov    0x10(%ebp),%eax
80101c44:	85 c0                	test   %eax,%eax
80101c46:	74 05                	je     80101c4d <dirlookup+0x6d>
80101c48:	8b 45 10             	mov    0x10(%ebp),%eax
80101c4b:	89 38                	mov    %edi,(%eax)
80101c4d:	0f b7 55 d8          	movzwl -0x28(%ebp),%edx
80101c51:	8b 03                	mov    (%ebx),%eax
80101c53:	e8 f8 f5 ff ff       	call   80101250 <iget>
80101c58:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c5b:	5b                   	pop    %ebx
80101c5c:	5e                   	pop    %esi
80101c5d:	5f                   	pop    %edi
80101c5e:	5d                   	pop    %ebp
80101c5f:	c3                   	ret    
80101c60:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101c63:	31 c0                	xor    %eax,%eax
80101c65:	5b                   	pop    %ebx
80101c66:	5e                   	pop    %esi
80101c67:	5f                   	pop    %edi
80101c68:	5d                   	pop    %ebp
80101c69:	c3                   	ret    
80101c6a:	83 ec 0c             	sub    $0xc,%esp
80101c6d:	68 79 79 10 80       	push   $0x80107979
80101c72:	e8 f9 e6 ff ff       	call   80100370 <panic>
80101c77:	83 ec 0c             	sub    $0xc,%esp
80101c7a:	68 67 79 10 80       	push   $0x80107967
80101c7f:	e8 ec e6 ff ff       	call   80100370 <panic>
80101c84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101c8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80101c90 <namex>:
80101c90:	55                   	push   %ebp
80101c91:	89 e5                	mov    %esp,%ebp
80101c93:	57                   	push   %edi
80101c94:	56                   	push   %esi
80101c95:	53                   	push   %ebx
80101c96:	89 cf                	mov    %ecx,%edi
80101c98:	89 c3                	mov    %eax,%ebx
80101c9a:	83 ec 1c             	sub    $0x1c,%esp
80101c9d:	80 38 2f             	cmpb   $0x2f,(%eax)
80101ca0:	89 55 e0             	mov    %edx,-0x20(%ebp)
80101ca3:	0f 84 53 01 00 00    	je     80101dfc <namex+0x16c>
80101ca9:	e8 42 1b 00 00       	call   801037f0 <myproc>
80101cae:	83 ec 0c             	sub    $0xc,%esp
80101cb1:	8b 70 68             	mov    0x68(%eax),%esi
80101cb4:	68 e0 19 11 80       	push   $0x801119e0
80101cb9:	e8 82 2e 00 00       	call   80104b40 <acquire>
80101cbe:	83 46 08 01          	addl   $0x1,0x8(%esi)
80101cc2:	c7 04 24 e0 19 11 80 	movl   $0x801119e0,(%esp)
80101cc9:	e8 22 2f 00 00       	call   80104bf0 <release>
80101cce:	83 c4 10             	add    $0x10,%esp
80101cd1:	eb 08                	jmp    80101cdb <namex+0x4b>
80101cd3:	90                   	nop
80101cd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101cd8:	83 c3 01             	add    $0x1,%ebx
80101cdb:	0f b6 03             	movzbl (%ebx),%eax
80101cde:	3c 2f                	cmp    $0x2f,%al
80101ce0:	74 f6                	je     80101cd8 <namex+0x48>
80101ce2:	84 c0                	test   %al,%al
80101ce4:	0f 84 e3 00 00 00    	je     80101dcd <namex+0x13d>
80101cea:	0f b6 03             	movzbl (%ebx),%eax
80101ced:	89 da                	mov    %ebx,%edx
80101cef:	84 c0                	test   %al,%al
80101cf1:	0f 84 ac 00 00 00    	je     80101da3 <namex+0x113>
80101cf7:	3c 2f                	cmp    $0x2f,%al
80101cf9:	75 09                	jne    80101d04 <namex+0x74>
80101cfb:	e9 a3 00 00 00       	jmp    80101da3 <namex+0x113>
80101d00:	84 c0                	test   %al,%al
80101d02:	74 0a                	je     80101d0e <namex+0x7e>
80101d04:	83 c2 01             	add    $0x1,%edx
80101d07:	0f b6 02             	movzbl (%edx),%eax
80101d0a:	3c 2f                	cmp    $0x2f,%al
80101d0c:	75 f2                	jne    80101d00 <namex+0x70>
80101d0e:	89 d1                	mov    %edx,%ecx
80101d10:	29 d9                	sub    %ebx,%ecx
80101d12:	83 f9 0d             	cmp    $0xd,%ecx
80101d15:	0f 8e 8d 00 00 00    	jle    80101da8 <namex+0x118>
80101d1b:	83 ec 04             	sub    $0x4,%esp
80101d1e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
80101d21:	6a 0e                	push   $0xe
80101d23:	53                   	push   %ebx
80101d24:	57                   	push   %edi
80101d25:	e8 c6 2f 00 00       	call   80104cf0 <memmove>
80101d2a:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80101d2d:	83 c4 10             	add    $0x10,%esp
80101d30:	89 d3                	mov    %edx,%ebx
80101d32:	80 3a 2f             	cmpb   $0x2f,(%edx)
80101d35:	75 11                	jne    80101d48 <namex+0xb8>
80101d37:	89 f6                	mov    %esi,%esi
80101d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80101d40:	83 c3 01             	add    $0x1,%ebx
80101d43:	80 3b 2f             	cmpb   $0x2f,(%ebx)
80101d46:	74 f8                	je     80101d40 <namex+0xb0>
80101d48:	83 ec 0c             	sub    $0xc,%esp
80101d4b:	56                   	push   %esi
80101d4c:	e8 5f f9 ff ff       	call   801016b0 <ilock>
80101d51:	83 c4 10             	add    $0x10,%esp
80101d54:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80101d59:	0f 85 7f 00 00 00    	jne    80101dde <namex+0x14e>
80101d5f:	8b 55 e0             	mov    -0x20(%ebp),%edx
80101d62:	85 d2                	test   %edx,%edx
80101d64:	74 09                	je     80101d6f <namex+0xdf>
80101d66:	80 3b 00             	cmpb   $0x0,(%ebx)
80101d69:	0f 84 a3 00 00 00    	je     80101e12 <namex+0x182>
80101d6f:	83 ec 04             	sub    $0x4,%esp
80101d72:	6a 00                	push   $0x0
80101d74:	57                   	push   %edi
80101d75:	56                   	push   %esi
80101d76:	e8 65 fe ff ff       	call   80101be0 <dirlookup>
80101d7b:	83 c4 10             	add    $0x10,%esp
80101d7e:	85 c0                	test   %eax,%eax
80101d80:	74 5c                	je     80101dde <namex+0x14e>
80101d82:	83 ec 0c             	sub    $0xc,%esp
80101d85:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80101d88:	56                   	push   %esi
80101d89:	e8 02 fa ff ff       	call   80101790 <iunlock>
80101d8e:	89 34 24             	mov    %esi,(%esp)
80101d91:	e8 4a fa ff ff       	call   801017e0 <iput>
80101d96:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80101d99:	83 c4 10             	add    $0x10,%esp
80101d9c:	89 c6                	mov    %eax,%esi
80101d9e:	e9 38 ff ff ff       	jmp    80101cdb <namex+0x4b>
80101da3:	31 c9                	xor    %ecx,%ecx
80101da5:	8d 76 00             	lea    0x0(%esi),%esi
80101da8:	83 ec 04             	sub    $0x4,%esp
80101dab:	89 55 dc             	mov    %edx,-0x24(%ebp)
80101dae:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80101db1:	51                   	push   %ecx
80101db2:	53                   	push   %ebx
80101db3:	57                   	push   %edi
80101db4:	e8 37 2f 00 00       	call   80104cf0 <memmove>
80101db9:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80101dbc:	8b 55 dc             	mov    -0x24(%ebp),%edx
80101dbf:	83 c4 10             	add    $0x10,%esp
80101dc2:	c6 04 0f 00          	movb   $0x0,(%edi,%ecx,1)
80101dc6:	89 d3                	mov    %edx,%ebx
80101dc8:	e9 65 ff ff ff       	jmp    80101d32 <namex+0xa2>
80101dcd:	8b 45 e0             	mov    -0x20(%ebp),%eax
80101dd0:	85 c0                	test   %eax,%eax
80101dd2:	75 54                	jne    80101e28 <namex+0x198>
80101dd4:	89 f0                	mov    %esi,%eax
80101dd6:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101dd9:	5b                   	pop    %ebx
80101dda:	5e                   	pop    %esi
80101ddb:	5f                   	pop    %edi
80101ddc:	5d                   	pop    %ebp
80101ddd:	c3                   	ret    
80101dde:	83 ec 0c             	sub    $0xc,%esp
80101de1:	56                   	push   %esi
80101de2:	e8 a9 f9 ff ff       	call   80101790 <iunlock>
80101de7:	89 34 24             	mov    %esi,(%esp)
80101dea:	e8 f1 f9 ff ff       	call   801017e0 <iput>
80101def:	83 c4 10             	add    $0x10,%esp
80101df2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101df5:	31 c0                	xor    %eax,%eax
80101df7:	5b                   	pop    %ebx
80101df8:	5e                   	pop    %esi
80101df9:	5f                   	pop    %edi
80101dfa:	5d                   	pop    %ebp
80101dfb:	c3                   	ret    
80101dfc:	ba 01 00 00 00       	mov    $0x1,%edx
80101e01:	b8 01 00 00 00       	mov    $0x1,%eax
80101e06:	e8 45 f4 ff ff       	call   80101250 <iget>
80101e0b:	89 c6                	mov    %eax,%esi
80101e0d:	e9 c9 fe ff ff       	jmp    80101cdb <namex+0x4b>
80101e12:	83 ec 0c             	sub    $0xc,%esp
80101e15:	56                   	push   %esi
80101e16:	e8 75 f9 ff ff       	call   80101790 <iunlock>
80101e1b:	83 c4 10             	add    $0x10,%esp
80101e1e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101e21:	89 f0                	mov    %esi,%eax
80101e23:	5b                   	pop    %ebx
80101e24:	5e                   	pop    %esi
80101e25:	5f                   	pop    %edi
80101e26:	5d                   	pop    %ebp
80101e27:	c3                   	ret    
80101e28:	83 ec 0c             	sub    $0xc,%esp
80101e2b:	56                   	push   %esi
80101e2c:	e8 af f9 ff ff       	call   801017e0 <iput>
80101e31:	83 c4 10             	add    $0x10,%esp
80101e34:	31 c0                	xor    %eax,%eax
80101e36:	eb 9e                	jmp    80101dd6 <namex+0x146>
80101e38:	90                   	nop
80101e39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80101e40 <dirlink>:
80101e40:	55                   	push   %ebp
80101e41:	89 e5                	mov    %esp,%ebp
80101e43:	57                   	push   %edi
80101e44:	56                   	push   %esi
80101e45:	53                   	push   %ebx
80101e46:	83 ec 20             	sub    $0x20,%esp
80101e49:	8b 5d 08             	mov    0x8(%ebp),%ebx
80101e4c:	6a 00                	push   $0x0
80101e4e:	ff 75 0c             	pushl  0xc(%ebp)
80101e51:	53                   	push   %ebx
80101e52:	e8 89 fd ff ff       	call   80101be0 <dirlookup>
80101e57:	83 c4 10             	add    $0x10,%esp
80101e5a:	85 c0                	test   %eax,%eax
80101e5c:	75 67                	jne    80101ec5 <dirlink+0x85>
80101e5e:	8b 7b 58             	mov    0x58(%ebx),%edi
80101e61:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e64:	85 ff                	test   %edi,%edi
80101e66:	74 29                	je     80101e91 <dirlink+0x51>
80101e68:	31 ff                	xor    %edi,%edi
80101e6a:	8d 75 d8             	lea    -0x28(%ebp),%esi
80101e6d:	eb 09                	jmp    80101e78 <dirlink+0x38>
80101e6f:	90                   	nop
80101e70:	83 c7 10             	add    $0x10,%edi
80101e73:	39 7b 58             	cmp    %edi,0x58(%ebx)
80101e76:	76 19                	jbe    80101e91 <dirlink+0x51>
80101e78:	6a 10                	push   $0x10
80101e7a:	57                   	push   %edi
80101e7b:	56                   	push   %esi
80101e7c:	53                   	push   %ebx
80101e7d:	e8 0e fb ff ff       	call   80101990 <readi>
80101e82:	83 c4 10             	add    $0x10,%esp
80101e85:	83 f8 10             	cmp    $0x10,%eax
80101e88:	75 4e                	jne    80101ed8 <dirlink+0x98>
80101e8a:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80101e8f:	75 df                	jne    80101e70 <dirlink+0x30>
80101e91:	8d 45 da             	lea    -0x26(%ebp),%eax
80101e94:	83 ec 04             	sub    $0x4,%esp
80101e97:	6a 0e                	push   $0xe
80101e99:	ff 75 0c             	pushl  0xc(%ebp)
80101e9c:	50                   	push   %eax
80101e9d:	e8 3e 2f 00 00       	call   80104de0 <strncpy>
80101ea2:	8b 45 10             	mov    0x10(%ebp),%eax
80101ea5:	6a 10                	push   $0x10
80101ea7:	57                   	push   %edi
80101ea8:	56                   	push   %esi
80101ea9:	53                   	push   %ebx
80101eaa:	66 89 45 d8          	mov    %ax,-0x28(%ebp)
80101eae:	e8 dd fb ff ff       	call   80101a90 <writei>
80101eb3:	83 c4 20             	add    $0x20,%esp
80101eb6:	83 f8 10             	cmp    $0x10,%eax
80101eb9:	75 2a                	jne    80101ee5 <dirlink+0xa5>
80101ebb:	31 c0                	xor    %eax,%eax
80101ebd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80101ec0:	5b                   	pop    %ebx
80101ec1:	5e                   	pop    %esi
80101ec2:	5f                   	pop    %edi
80101ec3:	5d                   	pop    %ebp
80101ec4:	c3                   	ret    
80101ec5:	83 ec 0c             	sub    $0xc,%esp
80101ec8:	50                   	push   %eax
80101ec9:	e8 12 f9 ff ff       	call   801017e0 <iput>
80101ece:	83 c4 10             	add    $0x10,%esp
80101ed1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80101ed6:	eb e5                	jmp    80101ebd <dirlink+0x7d>
80101ed8:	83 ec 0c             	sub    $0xc,%esp
80101edb:	68 88 79 10 80       	push   $0x80107988
80101ee0:	e8 8b e4 ff ff       	call   80100370 <panic>
80101ee5:	83 ec 0c             	sub    $0xc,%esp
80101ee8:	68 ce 7f 10 80       	push   $0x80107fce
80101eed:	e8 7e e4 ff ff       	call   80100370 <panic>
80101ef2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80101ef9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f00 <namei>:
80101f00:	55                   	push   %ebp
80101f01:	31 d2                	xor    %edx,%edx
80101f03:	89 e5                	mov    %esp,%ebp
80101f05:	83 ec 18             	sub    $0x18,%esp
80101f08:	8b 45 08             	mov    0x8(%ebp),%eax
80101f0b:	8d 4d ea             	lea    -0x16(%ebp),%ecx
80101f0e:	e8 7d fd ff ff       	call   80101c90 <namex>
80101f13:	c9                   	leave  
80101f14:	c3                   	ret    
80101f15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80101f20 <nameiparent>:
80101f20:	55                   	push   %ebp
80101f21:	ba 01 00 00 00       	mov    $0x1,%edx
80101f26:	89 e5                	mov    %esp,%ebp
80101f28:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80101f2b:	8b 45 08             	mov    0x8(%ebp),%eax
80101f2e:	5d                   	pop    %ebp
80101f2f:	e9 5c fd ff ff       	jmp    80101c90 <namex>
80101f34:	66 90                	xchg   %ax,%ax
80101f36:	66 90                	xchg   %ax,%ax
80101f38:	66 90                	xchg   %ax,%ax
80101f3a:	66 90                	xchg   %ax,%ax
80101f3c:	66 90                	xchg   %ax,%ax
80101f3e:	66 90                	xchg   %ax,%ax

80101f40 <idestart>:
80101f40:	55                   	push   %ebp
80101f41:	85 c0                	test   %eax,%eax
80101f43:	89 e5                	mov    %esp,%ebp
80101f45:	56                   	push   %esi
80101f46:	53                   	push   %ebx
80101f47:	0f 84 ad 00 00 00    	je     80101ffa <idestart+0xba>
80101f4d:	8b 58 08             	mov    0x8(%eax),%ebx
80101f50:	89 c1                	mov    %eax,%ecx
80101f52:	81 fb e7 03 00 00    	cmp    $0x3e7,%ebx
80101f58:	0f 87 8f 00 00 00    	ja     80101fed <idestart+0xad>
80101f5e:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101f63:	90                   	nop
80101f64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80101f68:	ec                   	in     (%dx),%al
80101f69:	83 e0 c0             	and    $0xffffffc0,%eax
80101f6c:	3c 40                	cmp    $0x40,%al
80101f6e:	75 f8                	jne    80101f68 <idestart+0x28>
80101f70:	31 f6                	xor    %esi,%esi
80101f72:	ba f6 03 00 00       	mov    $0x3f6,%edx
80101f77:	89 f0                	mov    %esi,%eax
80101f79:	ee                   	out    %al,(%dx)
80101f7a:	ba f2 01 00 00       	mov    $0x1f2,%edx
80101f7f:	b8 01 00 00 00       	mov    $0x1,%eax
80101f84:	ee                   	out    %al,(%dx)
80101f85:	ba f3 01 00 00       	mov    $0x1f3,%edx
80101f8a:	89 d8                	mov    %ebx,%eax
80101f8c:	ee                   	out    %al,(%dx)
80101f8d:	89 d8                	mov    %ebx,%eax
80101f8f:	ba f4 01 00 00       	mov    $0x1f4,%edx
80101f94:	c1 f8 08             	sar    $0x8,%eax
80101f97:	ee                   	out    %al,(%dx)
80101f98:	ba f5 01 00 00       	mov    $0x1f5,%edx
80101f9d:	89 f0                	mov    %esi,%eax
80101f9f:	ee                   	out    %al,(%dx)
80101fa0:	0f b6 41 04          	movzbl 0x4(%ecx),%eax
80101fa4:	ba f6 01 00 00       	mov    $0x1f6,%edx
80101fa9:	83 e0 01             	and    $0x1,%eax
80101fac:	c1 e0 04             	shl    $0x4,%eax
80101faf:	83 c8 e0             	or     $0xffffffe0,%eax
80101fb2:	ee                   	out    %al,(%dx)
80101fb3:	f6 01 04             	testb  $0x4,(%ecx)
80101fb6:	ba f7 01 00 00       	mov    $0x1f7,%edx
80101fbb:	75 13                	jne    80101fd0 <idestart+0x90>
80101fbd:	b8 20 00 00 00       	mov    $0x20,%eax
80101fc2:	ee                   	out    %al,(%dx)
80101fc3:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101fc6:	5b                   	pop    %ebx
80101fc7:	5e                   	pop    %esi
80101fc8:	5d                   	pop    %ebp
80101fc9:	c3                   	ret    
80101fca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80101fd0:	b8 30 00 00 00       	mov    $0x30,%eax
80101fd5:	ee                   	out    %al,(%dx)
80101fd6:	ba f0 01 00 00       	mov    $0x1f0,%edx
80101fdb:	8d 71 5c             	lea    0x5c(%ecx),%esi
80101fde:	b9 80 00 00 00       	mov    $0x80,%ecx
80101fe3:	fc                   	cld    
80101fe4:	f3 6f                	rep outsl %ds:(%esi),(%dx)
80101fe6:	8d 65 f8             	lea    -0x8(%ebp),%esp
80101fe9:	5b                   	pop    %ebx
80101fea:	5e                   	pop    %esi
80101feb:	5d                   	pop    %ebp
80101fec:	c3                   	ret    
80101fed:	83 ec 0c             	sub    $0xc,%esp
80101ff0:	68 f4 79 10 80       	push   $0x801079f4
80101ff5:	e8 76 e3 ff ff       	call   80100370 <panic>
80101ffa:	83 ec 0c             	sub    $0xc,%esp
80101ffd:	68 eb 79 10 80       	push   $0x801079eb
80102002:	e8 69 e3 ff ff       	call   80100370 <panic>
80102007:	89 f6                	mov    %esi,%esi
80102009:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102010 <ideinit>:
80102010:	55                   	push   %ebp
80102011:	89 e5                	mov    %esp,%ebp
80102013:	83 ec 10             	sub    $0x10,%esp
80102016:	68 06 7a 10 80       	push   $0x80107a06
8010201b:	68 80 b5 10 80       	push   $0x8010b580
80102020:	e8 bb 29 00 00       	call   801049e0 <initlock>
80102025:	58                   	pop    %eax
80102026:	a1 00 3d 11 80       	mov    0x80113d00,%eax
8010202b:	5a                   	pop    %edx
8010202c:	83 e8 01             	sub    $0x1,%eax
8010202f:	50                   	push   %eax
80102030:	6a 0e                	push   $0xe
80102032:	e8 a9 02 00 00       	call   801022e0 <ioapicenable>
80102037:	83 c4 10             	add    $0x10,%esp
8010203a:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010203f:	90                   	nop
80102040:	ec                   	in     (%dx),%al
80102041:	83 e0 c0             	and    $0xffffffc0,%eax
80102044:	3c 40                	cmp    $0x40,%al
80102046:	75 f8                	jne    80102040 <ideinit+0x30>
80102048:	ba f6 01 00 00       	mov    $0x1f6,%edx
8010204d:	b8 f0 ff ff ff       	mov    $0xfffffff0,%eax
80102052:	ee                   	out    %al,(%dx)
80102053:	b9 e8 03 00 00       	mov    $0x3e8,%ecx
80102058:	ba f7 01 00 00       	mov    $0x1f7,%edx
8010205d:	eb 06                	jmp    80102065 <ideinit+0x55>
8010205f:	90                   	nop
80102060:	83 e9 01             	sub    $0x1,%ecx
80102063:	74 0f                	je     80102074 <ideinit+0x64>
80102065:	ec                   	in     (%dx),%al
80102066:	84 c0                	test   %al,%al
80102068:	74 f6                	je     80102060 <ideinit+0x50>
8010206a:	c7 05 60 b5 10 80 01 	movl   $0x1,0x8010b560
80102071:	00 00 00 
80102074:	ba f6 01 00 00       	mov    $0x1f6,%edx
80102079:	b8 e0 ff ff ff       	mov    $0xffffffe0,%eax
8010207e:	ee                   	out    %al,(%dx)
8010207f:	c9                   	leave  
80102080:	c3                   	ret    
80102081:	eb 0d                	jmp    80102090 <ideintr>
80102083:	90                   	nop
80102084:	90                   	nop
80102085:	90                   	nop
80102086:	90                   	nop
80102087:	90                   	nop
80102088:	90                   	nop
80102089:	90                   	nop
8010208a:	90                   	nop
8010208b:	90                   	nop
8010208c:	90                   	nop
8010208d:	90                   	nop
8010208e:	90                   	nop
8010208f:	90                   	nop

80102090 <ideintr>:
80102090:	55                   	push   %ebp
80102091:	89 e5                	mov    %esp,%ebp
80102093:	57                   	push   %edi
80102094:	56                   	push   %esi
80102095:	53                   	push   %ebx
80102096:	83 ec 18             	sub    $0x18,%esp
80102099:	68 80 b5 10 80       	push   $0x8010b580
8010209e:	e8 9d 2a 00 00       	call   80104b40 <acquire>
801020a3:	8b 1d 64 b5 10 80    	mov    0x8010b564,%ebx
801020a9:	83 c4 10             	add    $0x10,%esp
801020ac:	85 db                	test   %ebx,%ebx
801020ae:	74 34                	je     801020e4 <ideintr+0x54>
801020b0:	8b 43 58             	mov    0x58(%ebx),%eax
801020b3:	a3 64 b5 10 80       	mov    %eax,0x8010b564
801020b8:	8b 33                	mov    (%ebx),%esi
801020ba:	f7 c6 04 00 00 00    	test   $0x4,%esi
801020c0:	74 3e                	je     80102100 <ideintr+0x70>
801020c2:	83 e6 fb             	and    $0xfffffffb,%esi
801020c5:	83 ec 0c             	sub    $0xc,%esp
801020c8:	83 ce 02             	or     $0x2,%esi
801020cb:	89 33                	mov    %esi,(%ebx)
801020cd:	53                   	push   %ebx
801020ce:	e8 3d 20 00 00       	call   80104110 <wakeup>
801020d3:	a1 64 b5 10 80       	mov    0x8010b564,%eax
801020d8:	83 c4 10             	add    $0x10,%esp
801020db:	85 c0                	test   %eax,%eax
801020dd:	74 05                	je     801020e4 <ideintr+0x54>
801020df:	e8 5c fe ff ff       	call   80101f40 <idestart>
801020e4:	83 ec 0c             	sub    $0xc,%esp
801020e7:	68 80 b5 10 80       	push   $0x8010b580
801020ec:	e8 ff 2a 00 00       	call   80104bf0 <release>
801020f1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801020f4:	5b                   	pop    %ebx
801020f5:	5e                   	pop    %esi
801020f6:	5f                   	pop    %edi
801020f7:	5d                   	pop    %ebp
801020f8:	c3                   	ret    
801020f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102100:	ba f7 01 00 00       	mov    $0x1f7,%edx
80102105:	8d 76 00             	lea    0x0(%esi),%esi
80102108:	ec                   	in     (%dx),%al
80102109:	89 c1                	mov    %eax,%ecx
8010210b:	83 e1 c0             	and    $0xffffffc0,%ecx
8010210e:	80 f9 40             	cmp    $0x40,%cl
80102111:	75 f5                	jne    80102108 <ideintr+0x78>
80102113:	a8 21                	test   $0x21,%al
80102115:	75 ab                	jne    801020c2 <ideintr+0x32>
80102117:	8d 7b 5c             	lea    0x5c(%ebx),%edi
8010211a:	b9 80 00 00 00       	mov    $0x80,%ecx
8010211f:	ba f0 01 00 00       	mov    $0x1f0,%edx
80102124:	fc                   	cld    
80102125:	f3 6d                	rep insl (%dx),%es:(%edi)
80102127:	8b 33                	mov    (%ebx),%esi
80102129:	eb 97                	jmp    801020c2 <ideintr+0x32>
8010212b:	90                   	nop
8010212c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102130 <iderw>:
80102130:	55                   	push   %ebp
80102131:	89 e5                	mov    %esp,%ebp
80102133:	53                   	push   %ebx
80102134:	83 ec 10             	sub    $0x10,%esp
80102137:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010213a:	8d 43 0c             	lea    0xc(%ebx),%eax
8010213d:	50                   	push   %eax
8010213e:	e8 4d 28 00 00       	call   80104990 <holdingsleep>
80102143:	83 c4 10             	add    $0x10,%esp
80102146:	85 c0                	test   %eax,%eax
80102148:	0f 84 ad 00 00 00    	je     801021fb <iderw+0xcb>
8010214e:	8b 03                	mov    (%ebx),%eax
80102150:	83 e0 06             	and    $0x6,%eax
80102153:	83 f8 02             	cmp    $0x2,%eax
80102156:	0f 84 b9 00 00 00    	je     80102215 <iderw+0xe5>
8010215c:	8b 53 04             	mov    0x4(%ebx),%edx
8010215f:	85 d2                	test   %edx,%edx
80102161:	74 0d                	je     80102170 <iderw+0x40>
80102163:	a1 60 b5 10 80       	mov    0x8010b560,%eax
80102168:	85 c0                	test   %eax,%eax
8010216a:	0f 84 98 00 00 00    	je     80102208 <iderw+0xd8>
80102170:	83 ec 0c             	sub    $0xc,%esp
80102173:	68 80 b5 10 80       	push   $0x8010b580
80102178:	e8 c3 29 00 00       	call   80104b40 <acquire>
8010217d:	8b 15 64 b5 10 80    	mov    0x8010b564,%edx
80102183:	83 c4 10             	add    $0x10,%esp
80102186:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
8010218d:	85 d2                	test   %edx,%edx
8010218f:	75 09                	jne    8010219a <iderw+0x6a>
80102191:	eb 58                	jmp    801021eb <iderw+0xbb>
80102193:	90                   	nop
80102194:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102198:	89 c2                	mov    %eax,%edx
8010219a:	8b 42 58             	mov    0x58(%edx),%eax
8010219d:	85 c0                	test   %eax,%eax
8010219f:	75 f7                	jne    80102198 <iderw+0x68>
801021a1:	83 c2 58             	add    $0x58,%edx
801021a4:	89 1a                	mov    %ebx,(%edx)
801021a6:	3b 1d 64 b5 10 80    	cmp    0x8010b564,%ebx
801021ac:	74 44                	je     801021f2 <iderw+0xc2>
801021ae:	8b 03                	mov    (%ebx),%eax
801021b0:	83 e0 06             	and    $0x6,%eax
801021b3:	83 f8 02             	cmp    $0x2,%eax
801021b6:	74 23                	je     801021db <iderw+0xab>
801021b8:	90                   	nop
801021b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801021c0:	83 ec 08             	sub    $0x8,%esp
801021c3:	68 80 b5 10 80       	push   $0x8010b580
801021c8:	53                   	push   %ebx
801021c9:	e8 82 1d 00 00       	call   80103f50 <sleep>
801021ce:	8b 03                	mov    (%ebx),%eax
801021d0:	83 c4 10             	add    $0x10,%esp
801021d3:	83 e0 06             	and    $0x6,%eax
801021d6:	83 f8 02             	cmp    $0x2,%eax
801021d9:	75 e5                	jne    801021c0 <iderw+0x90>
801021db:	c7 45 08 80 b5 10 80 	movl   $0x8010b580,0x8(%ebp)
801021e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801021e5:	c9                   	leave  
801021e6:	e9 05 2a 00 00       	jmp    80104bf0 <release>
801021eb:	ba 64 b5 10 80       	mov    $0x8010b564,%edx
801021f0:	eb b2                	jmp    801021a4 <iderw+0x74>
801021f2:	89 d8                	mov    %ebx,%eax
801021f4:	e8 47 fd ff ff       	call   80101f40 <idestart>
801021f9:	eb b3                	jmp    801021ae <iderw+0x7e>
801021fb:	83 ec 0c             	sub    $0xc,%esp
801021fe:	68 0a 7a 10 80       	push   $0x80107a0a
80102203:	e8 68 e1 ff ff       	call   80100370 <panic>
80102208:	83 ec 0c             	sub    $0xc,%esp
8010220b:	68 35 7a 10 80       	push   $0x80107a35
80102210:	e8 5b e1 ff ff       	call   80100370 <panic>
80102215:	83 ec 0c             	sub    $0xc,%esp
80102218:	68 20 7a 10 80       	push   $0x80107a20
8010221d:	e8 4e e1 ff ff       	call   80100370 <panic>
80102222:	66 90                	xchg   %ax,%ax
80102224:	66 90                	xchg   %ax,%ax
80102226:	66 90                	xchg   %ax,%ax
80102228:	66 90                	xchg   %ax,%ax
8010222a:	66 90                	xchg   %ax,%ax
8010222c:	66 90                	xchg   %ax,%ax
8010222e:	66 90                	xchg   %ax,%ax

80102230 <ioapicinit>:
80102230:	55                   	push   %ebp
80102231:	c7 05 34 36 11 80 00 	movl   $0xfec00000,0x80113634
80102238:	00 c0 fe 
8010223b:	89 e5                	mov    %esp,%ebp
8010223d:	56                   	push   %esi
8010223e:	53                   	push   %ebx
8010223f:	c7 05 00 00 c0 fe 01 	movl   $0x1,0xfec00000
80102246:	00 00 00 
80102249:	8b 15 34 36 11 80    	mov    0x80113634,%edx
8010224f:	8b 72 10             	mov    0x10(%edx),%esi
80102252:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
80102258:	8b 0d 34 36 11 80    	mov    0x80113634,%ecx
8010225e:	0f b6 15 60 37 11 80 	movzbl 0x80113760,%edx
80102265:	89 f0                	mov    %esi,%eax
80102267:	c1 e8 10             	shr    $0x10,%eax
8010226a:	0f b6 f0             	movzbl %al,%esi
8010226d:	8b 41 10             	mov    0x10(%ecx),%eax
80102270:	c1 e8 18             	shr    $0x18,%eax
80102273:	39 d0                	cmp    %edx,%eax
80102275:	74 16                	je     8010228d <ioapicinit+0x5d>
80102277:	83 ec 0c             	sub    $0xc,%esp
8010227a:	68 54 7a 10 80       	push   $0x80107a54
8010227f:	e8 dc e3 ff ff       	call   80100660 <cprintf>
80102284:	8b 0d 34 36 11 80    	mov    0x80113634,%ecx
8010228a:	83 c4 10             	add    $0x10,%esp
8010228d:	83 c6 21             	add    $0x21,%esi
80102290:	ba 10 00 00 00       	mov    $0x10,%edx
80102295:	b8 20 00 00 00       	mov    $0x20,%eax
8010229a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801022a0:	89 11                	mov    %edx,(%ecx)
801022a2:	8b 0d 34 36 11 80    	mov    0x80113634,%ecx
801022a8:	89 c3                	mov    %eax,%ebx
801022aa:	81 cb 00 00 01 00    	or     $0x10000,%ebx
801022b0:	83 c0 01             	add    $0x1,%eax
801022b3:	89 59 10             	mov    %ebx,0x10(%ecx)
801022b6:	8d 5a 01             	lea    0x1(%edx),%ebx
801022b9:	83 c2 02             	add    $0x2,%edx
801022bc:	39 f0                	cmp    %esi,%eax
801022be:	89 19                	mov    %ebx,(%ecx)
801022c0:	8b 0d 34 36 11 80    	mov    0x80113634,%ecx
801022c6:	c7 41 10 00 00 00 00 	movl   $0x0,0x10(%ecx)
801022cd:	75 d1                	jne    801022a0 <ioapicinit+0x70>
801022cf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801022d2:	5b                   	pop    %ebx
801022d3:	5e                   	pop    %esi
801022d4:	5d                   	pop    %ebp
801022d5:	c3                   	ret    
801022d6:	8d 76 00             	lea    0x0(%esi),%esi
801022d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801022e0 <ioapicenable>:
801022e0:	55                   	push   %ebp
801022e1:	8b 0d 34 36 11 80    	mov    0x80113634,%ecx
801022e7:	89 e5                	mov    %esp,%ebp
801022e9:	8b 45 08             	mov    0x8(%ebp),%eax
801022ec:	8d 50 20             	lea    0x20(%eax),%edx
801022ef:	8d 44 00 10          	lea    0x10(%eax,%eax,1),%eax
801022f3:	89 01                	mov    %eax,(%ecx)
801022f5:	8b 0d 34 36 11 80    	mov    0x80113634,%ecx
801022fb:	83 c0 01             	add    $0x1,%eax
801022fe:	89 51 10             	mov    %edx,0x10(%ecx)
80102301:	8b 55 0c             	mov    0xc(%ebp),%edx
80102304:	89 01                	mov    %eax,(%ecx)
80102306:	a1 34 36 11 80       	mov    0x80113634,%eax
8010230b:	c1 e2 18             	shl    $0x18,%edx
8010230e:	89 50 10             	mov    %edx,0x10(%eax)
80102311:	5d                   	pop    %ebp
80102312:	c3                   	ret    
80102313:	66 90                	xchg   %ax,%ax
80102315:	66 90                	xchg   %ax,%ax
80102317:	66 90                	xchg   %ax,%ax
80102319:	66 90                	xchg   %ax,%ax
8010231b:	66 90                	xchg   %ax,%ax
8010231d:	66 90                	xchg   %ax,%ax
8010231f:	90                   	nop

80102320 <kfree>:
80102320:	55                   	push   %ebp
80102321:	89 e5                	mov    %esp,%ebp
80102323:	53                   	push   %ebx
80102324:	83 ec 04             	sub    $0x4,%esp
80102327:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010232a:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
80102330:	75 70                	jne    801023a2 <kfree+0x82>
80102332:	81 fb a8 ab 11 80    	cmp    $0x8011aba8,%ebx
80102338:	72 68                	jb     801023a2 <kfree+0x82>
8010233a:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
80102340:	3d ff ff ff 0d       	cmp    $0xdffffff,%eax
80102345:	77 5b                	ja     801023a2 <kfree+0x82>
80102347:	83 ec 04             	sub    $0x4,%esp
8010234a:	68 00 10 00 00       	push   $0x1000
8010234f:	6a 01                	push   $0x1
80102351:	53                   	push   %ebx
80102352:	e8 e9 28 00 00       	call   80104c40 <memset>
80102357:	8b 15 74 36 11 80    	mov    0x80113674,%edx
8010235d:	83 c4 10             	add    $0x10,%esp
80102360:	85 d2                	test   %edx,%edx
80102362:	75 2c                	jne    80102390 <kfree+0x70>
80102364:	a1 78 36 11 80       	mov    0x80113678,%eax
80102369:	89 03                	mov    %eax,(%ebx)
8010236b:	a1 74 36 11 80       	mov    0x80113674,%eax
80102370:	89 1d 78 36 11 80    	mov    %ebx,0x80113678
80102376:	85 c0                	test   %eax,%eax
80102378:	75 06                	jne    80102380 <kfree+0x60>
8010237a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010237d:	c9                   	leave  
8010237e:	c3                   	ret    
8010237f:	90                   	nop
80102380:	c7 45 08 40 36 11 80 	movl   $0x80113640,0x8(%ebp)
80102387:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010238a:	c9                   	leave  
8010238b:	e9 60 28 00 00       	jmp    80104bf0 <release>
80102390:	83 ec 0c             	sub    $0xc,%esp
80102393:	68 40 36 11 80       	push   $0x80113640
80102398:	e8 a3 27 00 00       	call   80104b40 <acquire>
8010239d:	83 c4 10             	add    $0x10,%esp
801023a0:	eb c2                	jmp    80102364 <kfree+0x44>
801023a2:	83 ec 0c             	sub    $0xc,%esp
801023a5:	68 86 7a 10 80       	push   $0x80107a86
801023aa:	e8 c1 df ff ff       	call   80100370 <panic>
801023af:	90                   	nop

801023b0 <freerange>:
801023b0:	55                   	push   %ebp
801023b1:	89 e5                	mov    %esp,%ebp
801023b3:	56                   	push   %esi
801023b4:	53                   	push   %ebx
801023b5:	8b 45 08             	mov    0x8(%ebp),%eax
801023b8:	8b 75 0c             	mov    0xc(%ebp),%esi
801023bb:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801023c1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801023c7:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023cd:	39 de                	cmp    %ebx,%esi
801023cf:	72 23                	jb     801023f4 <freerange+0x44>
801023d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801023d8:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
801023de:	83 ec 0c             	sub    $0xc,%esp
801023e1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801023e7:	50                   	push   %eax
801023e8:	e8 33 ff ff ff       	call   80102320 <kfree>
801023ed:	83 c4 10             	add    $0x10,%esp
801023f0:	39 f3                	cmp    %esi,%ebx
801023f2:	76 e4                	jbe    801023d8 <freerange+0x28>
801023f4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801023f7:	5b                   	pop    %ebx
801023f8:	5e                   	pop    %esi
801023f9:	5d                   	pop    %ebp
801023fa:	c3                   	ret    
801023fb:	90                   	nop
801023fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102400 <kinit1>:
80102400:	55                   	push   %ebp
80102401:	89 e5                	mov    %esp,%ebp
80102403:	56                   	push   %esi
80102404:	53                   	push   %ebx
80102405:	8b 75 0c             	mov    0xc(%ebp),%esi
80102408:	83 ec 08             	sub    $0x8,%esp
8010240b:	68 8c 7a 10 80       	push   $0x80107a8c
80102410:	68 40 36 11 80       	push   $0x80113640
80102415:	e8 c6 25 00 00       	call   801049e0 <initlock>
8010241a:	8b 45 08             	mov    0x8(%ebp),%eax
8010241d:	83 c4 10             	add    $0x10,%esp
80102420:	c7 05 74 36 11 80 00 	movl   $0x0,0x80113674
80102427:	00 00 00 
8010242a:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102430:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102436:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010243c:	39 de                	cmp    %ebx,%esi
8010243e:	72 1c                	jb     8010245c <kinit1+0x5c>
80102440:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
80102446:	83 ec 0c             	sub    $0xc,%esp
80102449:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010244f:	50                   	push   %eax
80102450:	e8 cb fe ff ff       	call   80102320 <kfree>
80102455:	83 c4 10             	add    $0x10,%esp
80102458:	39 de                	cmp    %ebx,%esi
8010245a:	73 e4                	jae    80102440 <kinit1+0x40>
8010245c:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010245f:	5b                   	pop    %ebx
80102460:	5e                   	pop    %esi
80102461:	5d                   	pop    %ebp
80102462:	c3                   	ret    
80102463:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102470 <kinit2>:
80102470:	55                   	push   %ebp
80102471:	89 e5                	mov    %esp,%ebp
80102473:	56                   	push   %esi
80102474:	53                   	push   %ebx
80102475:	8b 45 08             	mov    0x8(%ebp),%eax
80102478:	8b 75 0c             	mov    0xc(%ebp),%esi
8010247b:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
80102481:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80102487:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010248d:	39 de                	cmp    %ebx,%esi
8010248f:	72 23                	jb     801024b4 <kinit2+0x44>
80102491:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102498:	8d 83 00 f0 ff ff    	lea    -0x1000(%ebx),%eax
8010249e:	83 ec 0c             	sub    $0xc,%esp
801024a1:	81 c3 00 10 00 00    	add    $0x1000,%ebx
801024a7:	50                   	push   %eax
801024a8:	e8 73 fe ff ff       	call   80102320 <kfree>
801024ad:	83 c4 10             	add    $0x10,%esp
801024b0:	39 de                	cmp    %ebx,%esi
801024b2:	73 e4                	jae    80102498 <kinit2+0x28>
801024b4:	c7 05 74 36 11 80 01 	movl   $0x1,0x80113674
801024bb:	00 00 00 
801024be:	8d 65 f8             	lea    -0x8(%ebp),%esp
801024c1:	5b                   	pop    %ebx
801024c2:	5e                   	pop    %esi
801024c3:	5d                   	pop    %ebp
801024c4:	c3                   	ret    
801024c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801024c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801024d0 <kalloc>:
801024d0:	55                   	push   %ebp
801024d1:	89 e5                	mov    %esp,%ebp
801024d3:	53                   	push   %ebx
801024d4:	83 ec 04             	sub    $0x4,%esp
801024d7:	a1 74 36 11 80       	mov    0x80113674,%eax
801024dc:	85 c0                	test   %eax,%eax
801024de:	75 30                	jne    80102510 <kalloc+0x40>
801024e0:	8b 1d 78 36 11 80    	mov    0x80113678,%ebx
801024e6:	85 db                	test   %ebx,%ebx
801024e8:	74 1c                	je     80102506 <kalloc+0x36>
801024ea:	8b 13                	mov    (%ebx),%edx
801024ec:	89 15 78 36 11 80    	mov    %edx,0x80113678
801024f2:	85 c0                	test   %eax,%eax
801024f4:	74 10                	je     80102506 <kalloc+0x36>
801024f6:	83 ec 0c             	sub    $0xc,%esp
801024f9:	68 40 36 11 80       	push   $0x80113640
801024fe:	e8 ed 26 00 00       	call   80104bf0 <release>
80102503:	83 c4 10             	add    $0x10,%esp
80102506:	89 d8                	mov    %ebx,%eax
80102508:	8b 5d fc             	mov    -0x4(%ebp),%ebx
8010250b:	c9                   	leave  
8010250c:	c3                   	ret    
8010250d:	8d 76 00             	lea    0x0(%esi),%esi
80102510:	83 ec 0c             	sub    $0xc,%esp
80102513:	68 40 36 11 80       	push   $0x80113640
80102518:	e8 23 26 00 00       	call   80104b40 <acquire>
8010251d:	8b 1d 78 36 11 80    	mov    0x80113678,%ebx
80102523:	83 c4 10             	add    $0x10,%esp
80102526:	a1 74 36 11 80       	mov    0x80113674,%eax
8010252b:	85 db                	test   %ebx,%ebx
8010252d:	75 bb                	jne    801024ea <kalloc+0x1a>
8010252f:	eb c1                	jmp    801024f2 <kalloc+0x22>
80102531:	66 90                	xchg   %ax,%ax
80102533:	66 90                	xchg   %ax,%ax
80102535:	66 90                	xchg   %ax,%ax
80102537:	66 90                	xchg   %ax,%ax
80102539:	66 90                	xchg   %ax,%ax
8010253b:	66 90                	xchg   %ax,%ax
8010253d:	66 90                	xchg   %ax,%ax
8010253f:	90                   	nop

80102540 <kbdgetc>:
80102540:	55                   	push   %ebp
80102541:	ba 64 00 00 00       	mov    $0x64,%edx
80102546:	89 e5                	mov    %esp,%ebp
80102548:	ec                   	in     (%dx),%al
80102549:	a8 01                	test   $0x1,%al
8010254b:	0f 84 af 00 00 00    	je     80102600 <kbdgetc+0xc0>
80102551:	ba 60 00 00 00       	mov    $0x60,%edx
80102556:	ec                   	in     (%dx),%al
80102557:	0f b6 d0             	movzbl %al,%edx
8010255a:	81 fa e0 00 00 00    	cmp    $0xe0,%edx
80102560:	74 7e                	je     801025e0 <kbdgetc+0xa0>
80102562:	84 c0                	test   %al,%al
80102564:	8b 0d b4 b5 10 80    	mov    0x8010b5b4,%ecx
8010256a:	79 24                	jns    80102590 <kbdgetc+0x50>
8010256c:	f6 c1 40             	test   $0x40,%cl
8010256f:	75 05                	jne    80102576 <kbdgetc+0x36>
80102571:	89 c2                	mov    %eax,%edx
80102573:	83 e2 7f             	and    $0x7f,%edx
80102576:	0f b6 82 c0 7b 10 80 	movzbl -0x7fef8440(%edx),%eax
8010257d:	83 c8 40             	or     $0x40,%eax
80102580:	0f b6 c0             	movzbl %al,%eax
80102583:	f7 d0                	not    %eax
80102585:	21 c8                	and    %ecx,%eax
80102587:	a3 b4 b5 10 80       	mov    %eax,0x8010b5b4
8010258c:	31 c0                	xor    %eax,%eax
8010258e:	5d                   	pop    %ebp
8010258f:	c3                   	ret    
80102590:	f6 c1 40             	test   $0x40,%cl
80102593:	74 09                	je     8010259e <kbdgetc+0x5e>
80102595:	83 c8 80             	or     $0xffffff80,%eax
80102598:	83 e1 bf             	and    $0xffffffbf,%ecx
8010259b:	0f b6 d0             	movzbl %al,%edx
8010259e:	0f b6 82 c0 7b 10 80 	movzbl -0x7fef8440(%edx),%eax
801025a5:	09 c1                	or     %eax,%ecx
801025a7:	0f b6 82 c0 7a 10 80 	movzbl -0x7fef8540(%edx),%eax
801025ae:	31 c1                	xor    %eax,%ecx
801025b0:	89 c8                	mov    %ecx,%eax
801025b2:	89 0d b4 b5 10 80    	mov    %ecx,0x8010b5b4
801025b8:	83 e0 03             	and    $0x3,%eax
801025bb:	83 e1 08             	and    $0x8,%ecx
801025be:	8b 04 85 a0 7a 10 80 	mov    -0x7fef8560(,%eax,4),%eax
801025c5:	0f b6 04 10          	movzbl (%eax,%edx,1),%eax
801025c9:	74 c3                	je     8010258e <kbdgetc+0x4e>
801025cb:	8d 50 9f             	lea    -0x61(%eax),%edx
801025ce:	83 fa 19             	cmp    $0x19,%edx
801025d1:	77 1d                	ja     801025f0 <kbdgetc+0xb0>
801025d3:	83 e8 20             	sub    $0x20,%eax
801025d6:	5d                   	pop    %ebp
801025d7:	c3                   	ret    
801025d8:	90                   	nop
801025d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801025e0:	31 c0                	xor    %eax,%eax
801025e2:	83 0d b4 b5 10 80 40 	orl    $0x40,0x8010b5b4
801025e9:	5d                   	pop    %ebp
801025ea:	c3                   	ret    
801025eb:	90                   	nop
801025ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801025f0:	8d 48 bf             	lea    -0x41(%eax),%ecx
801025f3:	8d 50 20             	lea    0x20(%eax),%edx
801025f6:	5d                   	pop    %ebp
801025f7:	83 f9 19             	cmp    $0x19,%ecx
801025fa:	0f 46 c2             	cmovbe %edx,%eax
801025fd:	c3                   	ret    
801025fe:	66 90                	xchg   %ax,%ax
80102600:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80102605:	5d                   	pop    %ebp
80102606:	c3                   	ret    
80102607:	89 f6                	mov    %esi,%esi
80102609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102610 <kbdintr>:
80102610:	55                   	push   %ebp
80102611:	89 e5                	mov    %esp,%ebp
80102613:	83 ec 14             	sub    $0x14,%esp
80102616:	68 40 25 10 80       	push   $0x80102540
8010261b:	e8 d0 e1 ff ff       	call   801007f0 <consoleintr>
80102620:	83 c4 10             	add    $0x10,%esp
80102623:	c9                   	leave  
80102624:	c3                   	ret    
80102625:	66 90                	xchg   %ax,%ax
80102627:	66 90                	xchg   %ax,%ax
80102629:	66 90                	xchg   %ax,%ax
8010262b:	66 90                	xchg   %ax,%ax
8010262d:	66 90                	xchg   %ax,%ax
8010262f:	90                   	nop

80102630 <lapicinit>:
80102630:	a1 7c 36 11 80       	mov    0x8011367c,%eax
80102635:	55                   	push   %ebp
80102636:	89 e5                	mov    %esp,%ebp
80102638:	85 c0                	test   %eax,%eax
8010263a:	0f 84 c8 00 00 00    	je     80102708 <lapicinit+0xd8>
80102640:	c7 80 f0 00 00 00 3f 	movl   $0x13f,0xf0(%eax)
80102647:	01 00 00 
8010264a:	8b 50 20             	mov    0x20(%eax),%edx
8010264d:	c7 80 e0 03 00 00 0b 	movl   $0xb,0x3e0(%eax)
80102654:	00 00 00 
80102657:	8b 50 20             	mov    0x20(%eax),%edx
8010265a:	c7 80 20 03 00 00 20 	movl   $0x20020,0x320(%eax)
80102661:	00 02 00 
80102664:	8b 50 20             	mov    0x20(%eax),%edx
80102667:	c7 80 80 03 00 00 80 	movl   $0x989680,0x380(%eax)
8010266e:	96 98 00 
80102671:	8b 50 20             	mov    0x20(%eax),%edx
80102674:	c7 80 50 03 00 00 00 	movl   $0x10000,0x350(%eax)
8010267b:	00 01 00 
8010267e:	8b 50 20             	mov    0x20(%eax),%edx
80102681:	c7 80 60 03 00 00 00 	movl   $0x10000,0x360(%eax)
80102688:	00 01 00 
8010268b:	8b 50 20             	mov    0x20(%eax),%edx
8010268e:	8b 50 30             	mov    0x30(%eax),%edx
80102691:	c1 ea 10             	shr    $0x10,%edx
80102694:	80 fa 03             	cmp    $0x3,%dl
80102697:	77 77                	ja     80102710 <lapicinit+0xe0>
80102699:	c7 80 70 03 00 00 33 	movl   $0x33,0x370(%eax)
801026a0:	00 00 00 
801026a3:	8b 50 20             	mov    0x20(%eax),%edx
801026a6:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026ad:	00 00 00 
801026b0:	8b 50 20             	mov    0x20(%eax),%edx
801026b3:	c7 80 80 02 00 00 00 	movl   $0x0,0x280(%eax)
801026ba:	00 00 00 
801026bd:	8b 50 20             	mov    0x20(%eax),%edx
801026c0:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
801026c7:	00 00 00 
801026ca:	8b 50 20             	mov    0x20(%eax),%edx
801026cd:	c7 80 10 03 00 00 00 	movl   $0x0,0x310(%eax)
801026d4:	00 00 00 
801026d7:	8b 50 20             	mov    0x20(%eax),%edx
801026da:	c7 80 00 03 00 00 00 	movl   $0x88500,0x300(%eax)
801026e1:	85 08 00 
801026e4:	8b 50 20             	mov    0x20(%eax),%edx
801026e7:	89 f6                	mov    %esi,%esi
801026e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801026f0:	8b 90 00 03 00 00    	mov    0x300(%eax),%edx
801026f6:	80 e6 10             	and    $0x10,%dh
801026f9:	75 f5                	jne    801026f0 <lapicinit+0xc0>
801026fb:	c7 80 80 00 00 00 00 	movl   $0x0,0x80(%eax)
80102702:	00 00 00 
80102705:	8b 40 20             	mov    0x20(%eax),%eax
80102708:	5d                   	pop    %ebp
80102709:	c3                   	ret    
8010270a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102710:	c7 80 40 03 00 00 00 	movl   $0x10000,0x340(%eax)
80102717:	00 01 00 
8010271a:	8b 50 20             	mov    0x20(%eax),%edx
8010271d:	e9 77 ff ff ff       	jmp    80102699 <lapicinit+0x69>
80102722:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102730 <lapicid>:
80102730:	a1 7c 36 11 80       	mov    0x8011367c,%eax
80102735:	55                   	push   %ebp
80102736:	89 e5                	mov    %esp,%ebp
80102738:	85 c0                	test   %eax,%eax
8010273a:	74 0c                	je     80102748 <lapicid+0x18>
8010273c:	8b 40 20             	mov    0x20(%eax),%eax
8010273f:	5d                   	pop    %ebp
80102740:	c1 e8 18             	shr    $0x18,%eax
80102743:	c3                   	ret    
80102744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102748:	31 c0                	xor    %eax,%eax
8010274a:	5d                   	pop    %ebp
8010274b:	c3                   	ret    
8010274c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102750 <lapiceoi>:
80102750:	a1 7c 36 11 80       	mov    0x8011367c,%eax
80102755:	55                   	push   %ebp
80102756:	89 e5                	mov    %esp,%ebp
80102758:	85 c0                	test   %eax,%eax
8010275a:	74 0d                	je     80102769 <lapiceoi+0x19>
8010275c:	c7 80 b0 00 00 00 00 	movl   $0x0,0xb0(%eax)
80102763:	00 00 00 
80102766:	8b 40 20             	mov    0x20(%eax),%eax
80102769:	5d                   	pop    %ebp
8010276a:	c3                   	ret    
8010276b:	90                   	nop
8010276c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80102770 <microdelay>:
80102770:	55                   	push   %ebp
80102771:	89 e5                	mov    %esp,%ebp
80102773:	5d                   	pop    %ebp
80102774:	c3                   	ret    
80102775:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102780 <lapicstartap>:
80102780:	55                   	push   %ebp
80102781:	ba 70 00 00 00       	mov    $0x70,%edx
80102786:	b8 0f 00 00 00       	mov    $0xf,%eax
8010278b:	89 e5                	mov    %esp,%ebp
8010278d:	53                   	push   %ebx
8010278e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80102791:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102794:	ee                   	out    %al,(%dx)
80102795:	ba 71 00 00 00       	mov    $0x71,%edx
8010279a:	b8 0a 00 00 00       	mov    $0xa,%eax
8010279f:	ee                   	out    %al,(%dx)
801027a0:	31 c0                	xor    %eax,%eax
801027a2:	c1 e3 18             	shl    $0x18,%ebx
801027a5:	66 a3 67 04 00 80    	mov    %ax,0x80000467
801027ab:	89 c8                	mov    %ecx,%eax
801027ad:	c1 e9 0c             	shr    $0xc,%ecx
801027b0:	c1 e8 04             	shr    $0x4,%eax
801027b3:	89 da                	mov    %ebx,%edx
801027b5:	80 cd 06             	or     $0x6,%ch
801027b8:	66 a3 69 04 00 80    	mov    %ax,0x80000469
801027be:	a1 7c 36 11 80       	mov    0x8011367c,%eax
801027c3:	89 98 10 03 00 00    	mov    %ebx,0x310(%eax)
801027c9:	8b 58 20             	mov    0x20(%eax),%ebx
801027cc:	c7 80 00 03 00 00 00 	movl   $0xc500,0x300(%eax)
801027d3:	c5 00 00 
801027d6:	8b 58 20             	mov    0x20(%eax),%ebx
801027d9:	c7 80 00 03 00 00 00 	movl   $0x8500,0x300(%eax)
801027e0:	85 00 00 
801027e3:	8b 58 20             	mov    0x20(%eax),%ebx
801027e6:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801027ec:	8b 58 20             	mov    0x20(%eax),%ebx
801027ef:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
801027f5:	8b 58 20             	mov    0x20(%eax),%ebx
801027f8:	89 90 10 03 00 00    	mov    %edx,0x310(%eax)
801027fe:	8b 50 20             	mov    0x20(%eax),%edx
80102801:	89 88 00 03 00 00    	mov    %ecx,0x300(%eax)
80102807:	8b 40 20             	mov    0x20(%eax),%eax
8010280a:	5b                   	pop    %ebx
8010280b:	5d                   	pop    %ebp
8010280c:	c3                   	ret    
8010280d:	8d 76 00             	lea    0x0(%esi),%esi

80102810 <cmostime>:
80102810:	55                   	push   %ebp
80102811:	ba 70 00 00 00       	mov    $0x70,%edx
80102816:	b8 0b 00 00 00       	mov    $0xb,%eax
8010281b:	89 e5                	mov    %esp,%ebp
8010281d:	57                   	push   %edi
8010281e:	56                   	push   %esi
8010281f:	53                   	push   %ebx
80102820:	83 ec 4c             	sub    $0x4c,%esp
80102823:	ee                   	out    %al,(%dx)
80102824:	ba 71 00 00 00       	mov    $0x71,%edx
80102829:	ec                   	in     (%dx),%al
8010282a:	83 e0 04             	and    $0x4,%eax
8010282d:	8d 75 d0             	lea    -0x30(%ebp),%esi
80102830:	31 db                	xor    %ebx,%ebx
80102832:	88 45 b7             	mov    %al,-0x49(%ebp)
80102835:	bf 70 00 00 00       	mov    $0x70,%edi
8010283a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102840:	89 d8                	mov    %ebx,%eax
80102842:	89 fa                	mov    %edi,%edx
80102844:	ee                   	out    %al,(%dx)
80102845:	b9 71 00 00 00       	mov    $0x71,%ecx
8010284a:	89 ca                	mov    %ecx,%edx
8010284c:	ec                   	in     (%dx),%al
8010284d:	0f b6 c0             	movzbl %al,%eax
80102850:	89 fa                	mov    %edi,%edx
80102852:	89 45 b8             	mov    %eax,-0x48(%ebp)
80102855:	b8 02 00 00 00       	mov    $0x2,%eax
8010285a:	ee                   	out    %al,(%dx)
8010285b:	89 ca                	mov    %ecx,%edx
8010285d:	ec                   	in     (%dx),%al
8010285e:	0f b6 c0             	movzbl %al,%eax
80102861:	89 fa                	mov    %edi,%edx
80102863:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102866:	b8 04 00 00 00       	mov    $0x4,%eax
8010286b:	ee                   	out    %al,(%dx)
8010286c:	89 ca                	mov    %ecx,%edx
8010286e:	ec                   	in     (%dx),%al
8010286f:	0f b6 c0             	movzbl %al,%eax
80102872:	89 fa                	mov    %edi,%edx
80102874:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102877:	b8 07 00 00 00       	mov    $0x7,%eax
8010287c:	ee                   	out    %al,(%dx)
8010287d:	89 ca                	mov    %ecx,%edx
8010287f:	ec                   	in     (%dx),%al
80102880:	0f b6 c0             	movzbl %al,%eax
80102883:	89 fa                	mov    %edi,%edx
80102885:	89 45 c4             	mov    %eax,-0x3c(%ebp)
80102888:	b8 08 00 00 00       	mov    $0x8,%eax
8010288d:	ee                   	out    %al,(%dx)
8010288e:	89 ca                	mov    %ecx,%edx
80102890:	ec                   	in     (%dx),%al
80102891:	0f b6 c0             	movzbl %al,%eax
80102894:	89 fa                	mov    %edi,%edx
80102896:	89 45 c8             	mov    %eax,-0x38(%ebp)
80102899:	b8 09 00 00 00       	mov    $0x9,%eax
8010289e:	ee                   	out    %al,(%dx)
8010289f:	89 ca                	mov    %ecx,%edx
801028a1:	ec                   	in     (%dx),%al
801028a2:	0f b6 c0             	movzbl %al,%eax
801028a5:	89 fa                	mov    %edi,%edx
801028a7:	89 45 cc             	mov    %eax,-0x34(%ebp)
801028aa:	b8 0a 00 00 00       	mov    $0xa,%eax
801028af:	ee                   	out    %al,(%dx)
801028b0:	89 ca                	mov    %ecx,%edx
801028b2:	ec                   	in     (%dx),%al
801028b3:	84 c0                	test   %al,%al
801028b5:	78 89                	js     80102840 <cmostime+0x30>
801028b7:	89 d8                	mov    %ebx,%eax
801028b9:	89 fa                	mov    %edi,%edx
801028bb:	ee                   	out    %al,(%dx)
801028bc:	89 ca                	mov    %ecx,%edx
801028be:	ec                   	in     (%dx),%al
801028bf:	0f b6 c0             	movzbl %al,%eax
801028c2:	89 fa                	mov    %edi,%edx
801028c4:	89 45 d0             	mov    %eax,-0x30(%ebp)
801028c7:	b8 02 00 00 00       	mov    $0x2,%eax
801028cc:	ee                   	out    %al,(%dx)
801028cd:	89 ca                	mov    %ecx,%edx
801028cf:	ec                   	in     (%dx),%al
801028d0:	0f b6 c0             	movzbl %al,%eax
801028d3:	89 fa                	mov    %edi,%edx
801028d5:	89 45 d4             	mov    %eax,-0x2c(%ebp)
801028d8:	b8 04 00 00 00       	mov    $0x4,%eax
801028dd:	ee                   	out    %al,(%dx)
801028de:	89 ca                	mov    %ecx,%edx
801028e0:	ec                   	in     (%dx),%al
801028e1:	0f b6 c0             	movzbl %al,%eax
801028e4:	89 fa                	mov    %edi,%edx
801028e6:	89 45 d8             	mov    %eax,-0x28(%ebp)
801028e9:	b8 07 00 00 00       	mov    $0x7,%eax
801028ee:	ee                   	out    %al,(%dx)
801028ef:	89 ca                	mov    %ecx,%edx
801028f1:	ec                   	in     (%dx),%al
801028f2:	0f b6 c0             	movzbl %al,%eax
801028f5:	89 fa                	mov    %edi,%edx
801028f7:	89 45 dc             	mov    %eax,-0x24(%ebp)
801028fa:	b8 08 00 00 00       	mov    $0x8,%eax
801028ff:	ee                   	out    %al,(%dx)
80102900:	89 ca                	mov    %ecx,%edx
80102902:	ec                   	in     (%dx),%al
80102903:	0f b6 c0             	movzbl %al,%eax
80102906:	89 fa                	mov    %edi,%edx
80102908:	89 45 e0             	mov    %eax,-0x20(%ebp)
8010290b:	b8 09 00 00 00       	mov    $0x9,%eax
80102910:	ee                   	out    %al,(%dx)
80102911:	89 ca                	mov    %ecx,%edx
80102913:	ec                   	in     (%dx),%al
80102914:	0f b6 c0             	movzbl %al,%eax
80102917:	83 ec 04             	sub    $0x4,%esp
8010291a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010291d:	8d 45 b8             	lea    -0x48(%ebp),%eax
80102920:	6a 18                	push   $0x18
80102922:	56                   	push   %esi
80102923:	50                   	push   %eax
80102924:	e8 67 23 00 00       	call   80104c90 <memcmp>
80102929:	83 c4 10             	add    $0x10,%esp
8010292c:	85 c0                	test   %eax,%eax
8010292e:	0f 85 0c ff ff ff    	jne    80102840 <cmostime+0x30>
80102934:	80 7d b7 00          	cmpb   $0x0,-0x49(%ebp)
80102938:	75 78                	jne    801029b2 <cmostime+0x1a2>
8010293a:	8b 45 b8             	mov    -0x48(%ebp),%eax
8010293d:	89 c2                	mov    %eax,%edx
8010293f:	83 e0 0f             	and    $0xf,%eax
80102942:	c1 ea 04             	shr    $0x4,%edx
80102945:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102948:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010294b:	89 45 b8             	mov    %eax,-0x48(%ebp)
8010294e:	8b 45 bc             	mov    -0x44(%ebp),%eax
80102951:	89 c2                	mov    %eax,%edx
80102953:	83 e0 0f             	and    $0xf,%eax
80102956:	c1 ea 04             	shr    $0x4,%edx
80102959:	8d 14 92             	lea    (%edx,%edx,4),%edx
8010295c:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010295f:	89 45 bc             	mov    %eax,-0x44(%ebp)
80102962:	8b 45 c0             	mov    -0x40(%ebp),%eax
80102965:	89 c2                	mov    %eax,%edx
80102967:	83 e0 0f             	and    $0xf,%eax
8010296a:	c1 ea 04             	shr    $0x4,%edx
8010296d:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102970:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102973:	89 45 c0             	mov    %eax,-0x40(%ebp)
80102976:	8b 45 c4             	mov    -0x3c(%ebp),%eax
80102979:	89 c2                	mov    %eax,%edx
8010297b:	83 e0 0f             	and    $0xf,%eax
8010297e:	c1 ea 04             	shr    $0x4,%edx
80102981:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102984:	8d 04 50             	lea    (%eax,%edx,2),%eax
80102987:	89 45 c4             	mov    %eax,-0x3c(%ebp)
8010298a:	8b 45 c8             	mov    -0x38(%ebp),%eax
8010298d:	89 c2                	mov    %eax,%edx
8010298f:	83 e0 0f             	and    $0xf,%eax
80102992:	c1 ea 04             	shr    $0x4,%edx
80102995:	8d 14 92             	lea    (%edx,%edx,4),%edx
80102998:	8d 04 50             	lea    (%eax,%edx,2),%eax
8010299b:	89 45 c8             	mov    %eax,-0x38(%ebp)
8010299e:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029a1:	89 c2                	mov    %eax,%edx
801029a3:	83 e0 0f             	and    $0xf,%eax
801029a6:	c1 ea 04             	shr    $0x4,%edx
801029a9:	8d 14 92             	lea    (%edx,%edx,4),%edx
801029ac:	8d 04 50             	lea    (%eax,%edx,2),%eax
801029af:	89 45 cc             	mov    %eax,-0x34(%ebp)
801029b2:	8b 75 08             	mov    0x8(%ebp),%esi
801029b5:	8b 45 b8             	mov    -0x48(%ebp),%eax
801029b8:	89 06                	mov    %eax,(%esi)
801029ba:	8b 45 bc             	mov    -0x44(%ebp),%eax
801029bd:	89 46 04             	mov    %eax,0x4(%esi)
801029c0:	8b 45 c0             	mov    -0x40(%ebp),%eax
801029c3:	89 46 08             	mov    %eax,0x8(%esi)
801029c6:	8b 45 c4             	mov    -0x3c(%ebp),%eax
801029c9:	89 46 0c             	mov    %eax,0xc(%esi)
801029cc:	8b 45 c8             	mov    -0x38(%ebp),%eax
801029cf:	89 46 10             	mov    %eax,0x10(%esi)
801029d2:	8b 45 cc             	mov    -0x34(%ebp),%eax
801029d5:	89 46 14             	mov    %eax,0x14(%esi)
801029d8:	81 46 14 d0 07 00 00 	addl   $0x7d0,0x14(%esi)
801029df:	8d 65 f4             	lea    -0xc(%ebp),%esp
801029e2:	5b                   	pop    %ebx
801029e3:	5e                   	pop    %esi
801029e4:	5f                   	pop    %edi
801029e5:	5d                   	pop    %ebp
801029e6:	c3                   	ret    
801029e7:	66 90                	xchg   %ax,%ax
801029e9:	66 90                	xchg   %ax,%ax
801029eb:	66 90                	xchg   %ax,%ax
801029ed:	66 90                	xchg   %ax,%ax
801029ef:	90                   	nop

801029f0 <install_trans>:
801029f0:	8b 0d c8 36 11 80    	mov    0x801136c8,%ecx
801029f6:	85 c9                	test   %ecx,%ecx
801029f8:	0f 8e 85 00 00 00    	jle    80102a83 <install_trans+0x93>
801029fe:	55                   	push   %ebp
801029ff:	89 e5                	mov    %esp,%ebp
80102a01:	57                   	push   %edi
80102a02:	56                   	push   %esi
80102a03:	53                   	push   %ebx
80102a04:	31 db                	xor    %ebx,%ebx
80102a06:	83 ec 0c             	sub    $0xc,%esp
80102a09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102a10:	a1 b4 36 11 80       	mov    0x801136b4,%eax
80102a15:	83 ec 08             	sub    $0x8,%esp
80102a18:	01 d8                	add    %ebx,%eax
80102a1a:	83 c0 01             	add    $0x1,%eax
80102a1d:	50                   	push   %eax
80102a1e:	ff 35 c4 36 11 80    	pushl  0x801136c4
80102a24:	e8 a7 d6 ff ff       	call   801000d0 <bread>
80102a29:	89 c7                	mov    %eax,%edi
80102a2b:	58                   	pop    %eax
80102a2c:	5a                   	pop    %edx
80102a2d:	ff 34 9d cc 36 11 80 	pushl  -0x7feec934(,%ebx,4)
80102a34:	ff 35 c4 36 11 80    	pushl  0x801136c4
80102a3a:	83 c3 01             	add    $0x1,%ebx
80102a3d:	e8 8e d6 ff ff       	call   801000d0 <bread>
80102a42:	89 c6                	mov    %eax,%esi
80102a44:	8d 47 5c             	lea    0x5c(%edi),%eax
80102a47:	83 c4 0c             	add    $0xc,%esp
80102a4a:	68 00 02 00 00       	push   $0x200
80102a4f:	50                   	push   %eax
80102a50:	8d 46 5c             	lea    0x5c(%esi),%eax
80102a53:	50                   	push   %eax
80102a54:	e8 97 22 00 00       	call   80104cf0 <memmove>
80102a59:	89 34 24             	mov    %esi,(%esp)
80102a5c:	e8 3f d7 ff ff       	call   801001a0 <bwrite>
80102a61:	89 3c 24             	mov    %edi,(%esp)
80102a64:	e8 77 d7 ff ff       	call   801001e0 <brelse>
80102a69:	89 34 24             	mov    %esi,(%esp)
80102a6c:	e8 6f d7 ff ff       	call   801001e0 <brelse>
80102a71:	83 c4 10             	add    $0x10,%esp
80102a74:	39 1d c8 36 11 80    	cmp    %ebx,0x801136c8
80102a7a:	7f 94                	jg     80102a10 <install_trans+0x20>
80102a7c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102a7f:	5b                   	pop    %ebx
80102a80:	5e                   	pop    %esi
80102a81:	5f                   	pop    %edi
80102a82:	5d                   	pop    %ebp
80102a83:	f3 c3                	repz ret 
80102a85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102a90 <write_head>:
80102a90:	55                   	push   %ebp
80102a91:	89 e5                	mov    %esp,%ebp
80102a93:	53                   	push   %ebx
80102a94:	83 ec 0c             	sub    $0xc,%esp
80102a97:	ff 35 b4 36 11 80    	pushl  0x801136b4
80102a9d:	ff 35 c4 36 11 80    	pushl  0x801136c4
80102aa3:	e8 28 d6 ff ff       	call   801000d0 <bread>
80102aa8:	8b 0d c8 36 11 80    	mov    0x801136c8,%ecx
80102aae:	83 c4 10             	add    $0x10,%esp
80102ab1:	89 c3                	mov    %eax,%ebx
80102ab3:	85 c9                	test   %ecx,%ecx
80102ab5:	89 48 5c             	mov    %ecx,0x5c(%eax)
80102ab8:	7e 1f                	jle    80102ad9 <write_head+0x49>
80102aba:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
80102ac1:	31 d2                	xor    %edx,%edx
80102ac3:	90                   	nop
80102ac4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102ac8:	8b 8a cc 36 11 80    	mov    -0x7feec934(%edx),%ecx
80102ace:	89 4c 13 60          	mov    %ecx,0x60(%ebx,%edx,1)
80102ad2:	83 c2 04             	add    $0x4,%edx
80102ad5:	39 c2                	cmp    %eax,%edx
80102ad7:	75 ef                	jne    80102ac8 <write_head+0x38>
80102ad9:	83 ec 0c             	sub    $0xc,%esp
80102adc:	53                   	push   %ebx
80102add:	e8 be d6 ff ff       	call   801001a0 <bwrite>
80102ae2:	89 1c 24             	mov    %ebx,(%esp)
80102ae5:	e8 f6 d6 ff ff       	call   801001e0 <brelse>
80102aea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102aed:	c9                   	leave  
80102aee:	c3                   	ret    
80102aef:	90                   	nop

80102af0 <initlog>:
80102af0:	55                   	push   %ebp
80102af1:	89 e5                	mov    %esp,%ebp
80102af3:	53                   	push   %ebx
80102af4:	83 ec 2c             	sub    $0x2c,%esp
80102af7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102afa:	68 c0 7c 10 80       	push   $0x80107cc0
80102aff:	68 80 36 11 80       	push   $0x80113680
80102b04:	e8 d7 1e 00 00       	call   801049e0 <initlock>
80102b09:	58                   	pop    %eax
80102b0a:	8d 45 dc             	lea    -0x24(%ebp),%eax
80102b0d:	5a                   	pop    %edx
80102b0e:	50                   	push   %eax
80102b0f:	53                   	push   %ebx
80102b10:	e8 db e8 ff ff       	call   801013f0 <readsb>
80102b15:	8b 55 e8             	mov    -0x18(%ebp),%edx
80102b18:	8b 45 ec             	mov    -0x14(%ebp),%eax
80102b1b:	59                   	pop    %ecx
80102b1c:	89 1d c4 36 11 80    	mov    %ebx,0x801136c4
80102b22:	89 15 b8 36 11 80    	mov    %edx,0x801136b8
80102b28:	a3 b4 36 11 80       	mov    %eax,0x801136b4
80102b2d:	5a                   	pop    %edx
80102b2e:	50                   	push   %eax
80102b2f:	53                   	push   %ebx
80102b30:	e8 9b d5 ff ff       	call   801000d0 <bread>
80102b35:	8b 48 5c             	mov    0x5c(%eax),%ecx
80102b38:	83 c4 10             	add    $0x10,%esp
80102b3b:	85 c9                	test   %ecx,%ecx
80102b3d:	89 0d c8 36 11 80    	mov    %ecx,0x801136c8
80102b43:	7e 1c                	jle    80102b61 <initlog+0x71>
80102b45:	8d 1c 8d 00 00 00 00 	lea    0x0(,%ecx,4),%ebx
80102b4c:	31 d2                	xor    %edx,%edx
80102b4e:	66 90                	xchg   %ax,%ax
80102b50:	8b 4c 10 60          	mov    0x60(%eax,%edx,1),%ecx
80102b54:	83 c2 04             	add    $0x4,%edx
80102b57:	89 8a c8 36 11 80    	mov    %ecx,-0x7feec938(%edx)
80102b5d:	39 da                	cmp    %ebx,%edx
80102b5f:	75 ef                	jne    80102b50 <initlog+0x60>
80102b61:	83 ec 0c             	sub    $0xc,%esp
80102b64:	50                   	push   %eax
80102b65:	e8 76 d6 ff ff       	call   801001e0 <brelse>
80102b6a:	e8 81 fe ff ff       	call   801029f0 <install_trans>
80102b6f:	c7 05 c8 36 11 80 00 	movl   $0x0,0x801136c8
80102b76:	00 00 00 
80102b79:	e8 12 ff ff ff       	call   80102a90 <write_head>
80102b7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102b81:	c9                   	leave  
80102b82:	c3                   	ret    
80102b83:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80102b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102b90 <begin_op>:
80102b90:	55                   	push   %ebp
80102b91:	89 e5                	mov    %esp,%ebp
80102b93:	83 ec 14             	sub    $0x14,%esp
80102b96:	68 80 36 11 80       	push   $0x80113680
80102b9b:	e8 a0 1f 00 00       	call   80104b40 <acquire>
80102ba0:	83 c4 10             	add    $0x10,%esp
80102ba3:	eb 18                	jmp    80102bbd <begin_op+0x2d>
80102ba5:	8d 76 00             	lea    0x0(%esi),%esi
80102ba8:	83 ec 08             	sub    $0x8,%esp
80102bab:	68 80 36 11 80       	push   $0x80113680
80102bb0:	68 80 36 11 80       	push   $0x80113680
80102bb5:	e8 96 13 00 00       	call   80103f50 <sleep>
80102bba:	83 c4 10             	add    $0x10,%esp
80102bbd:	a1 c0 36 11 80       	mov    0x801136c0,%eax
80102bc2:	85 c0                	test   %eax,%eax
80102bc4:	75 e2                	jne    80102ba8 <begin_op+0x18>
80102bc6:	a1 bc 36 11 80       	mov    0x801136bc,%eax
80102bcb:	8b 15 c8 36 11 80    	mov    0x801136c8,%edx
80102bd1:	83 c0 01             	add    $0x1,%eax
80102bd4:	8d 0c 80             	lea    (%eax,%eax,4),%ecx
80102bd7:	8d 14 4a             	lea    (%edx,%ecx,2),%edx
80102bda:	83 fa 1e             	cmp    $0x1e,%edx
80102bdd:	7f c9                	jg     80102ba8 <begin_op+0x18>
80102bdf:	83 ec 0c             	sub    $0xc,%esp
80102be2:	a3 bc 36 11 80       	mov    %eax,0x801136bc
80102be7:	68 80 36 11 80       	push   $0x80113680
80102bec:	e8 ff 1f 00 00       	call   80104bf0 <release>
80102bf1:	83 c4 10             	add    $0x10,%esp
80102bf4:	c9                   	leave  
80102bf5:	c3                   	ret    
80102bf6:	8d 76 00             	lea    0x0(%esi),%esi
80102bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80102c00 <end_op>:
80102c00:	55                   	push   %ebp
80102c01:	89 e5                	mov    %esp,%ebp
80102c03:	57                   	push   %edi
80102c04:	56                   	push   %esi
80102c05:	53                   	push   %ebx
80102c06:	83 ec 18             	sub    $0x18,%esp
80102c09:	68 80 36 11 80       	push   $0x80113680
80102c0e:	e8 2d 1f 00 00       	call   80104b40 <acquire>
80102c13:	a1 bc 36 11 80       	mov    0x801136bc,%eax
80102c18:	8b 1d c0 36 11 80    	mov    0x801136c0,%ebx
80102c1e:	83 c4 10             	add    $0x10,%esp
80102c21:	83 e8 01             	sub    $0x1,%eax
80102c24:	85 db                	test   %ebx,%ebx
80102c26:	a3 bc 36 11 80       	mov    %eax,0x801136bc
80102c2b:	0f 85 23 01 00 00    	jne    80102d54 <end_op+0x154>
80102c31:	85 c0                	test   %eax,%eax
80102c33:	0f 85 f7 00 00 00    	jne    80102d30 <end_op+0x130>
80102c39:	83 ec 0c             	sub    $0xc,%esp
80102c3c:	c7 05 c0 36 11 80 01 	movl   $0x1,0x801136c0
80102c43:	00 00 00 
80102c46:	31 db                	xor    %ebx,%ebx
80102c48:	68 80 36 11 80       	push   $0x80113680
80102c4d:	e8 9e 1f 00 00       	call   80104bf0 <release>
80102c52:	8b 0d c8 36 11 80    	mov    0x801136c8,%ecx
80102c58:	83 c4 10             	add    $0x10,%esp
80102c5b:	85 c9                	test   %ecx,%ecx
80102c5d:	0f 8e 8a 00 00 00    	jle    80102ced <end_op+0xed>
80102c63:	90                   	nop
80102c64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102c68:	a1 b4 36 11 80       	mov    0x801136b4,%eax
80102c6d:	83 ec 08             	sub    $0x8,%esp
80102c70:	01 d8                	add    %ebx,%eax
80102c72:	83 c0 01             	add    $0x1,%eax
80102c75:	50                   	push   %eax
80102c76:	ff 35 c4 36 11 80    	pushl  0x801136c4
80102c7c:	e8 4f d4 ff ff       	call   801000d0 <bread>
80102c81:	89 c6                	mov    %eax,%esi
80102c83:	58                   	pop    %eax
80102c84:	5a                   	pop    %edx
80102c85:	ff 34 9d cc 36 11 80 	pushl  -0x7feec934(,%ebx,4)
80102c8c:	ff 35 c4 36 11 80    	pushl  0x801136c4
80102c92:	83 c3 01             	add    $0x1,%ebx
80102c95:	e8 36 d4 ff ff       	call   801000d0 <bread>
80102c9a:	89 c7                	mov    %eax,%edi
80102c9c:	8d 40 5c             	lea    0x5c(%eax),%eax
80102c9f:	83 c4 0c             	add    $0xc,%esp
80102ca2:	68 00 02 00 00       	push   $0x200
80102ca7:	50                   	push   %eax
80102ca8:	8d 46 5c             	lea    0x5c(%esi),%eax
80102cab:	50                   	push   %eax
80102cac:	e8 3f 20 00 00       	call   80104cf0 <memmove>
80102cb1:	89 34 24             	mov    %esi,(%esp)
80102cb4:	e8 e7 d4 ff ff       	call   801001a0 <bwrite>
80102cb9:	89 3c 24             	mov    %edi,(%esp)
80102cbc:	e8 1f d5 ff ff       	call   801001e0 <brelse>
80102cc1:	89 34 24             	mov    %esi,(%esp)
80102cc4:	e8 17 d5 ff ff       	call   801001e0 <brelse>
80102cc9:	83 c4 10             	add    $0x10,%esp
80102ccc:	3b 1d c8 36 11 80    	cmp    0x801136c8,%ebx
80102cd2:	7c 94                	jl     80102c68 <end_op+0x68>
80102cd4:	e8 b7 fd ff ff       	call   80102a90 <write_head>
80102cd9:	e8 12 fd ff ff       	call   801029f0 <install_trans>
80102cde:	c7 05 c8 36 11 80 00 	movl   $0x0,0x801136c8
80102ce5:	00 00 00 
80102ce8:	e8 a3 fd ff ff       	call   80102a90 <write_head>
80102ced:	83 ec 0c             	sub    $0xc,%esp
80102cf0:	68 80 36 11 80       	push   $0x80113680
80102cf5:	e8 46 1e 00 00       	call   80104b40 <acquire>
80102cfa:	c7 04 24 80 36 11 80 	movl   $0x80113680,(%esp)
80102d01:	c7 05 c0 36 11 80 00 	movl   $0x0,0x801136c0
80102d08:	00 00 00 
80102d0b:	e8 00 14 00 00       	call   80104110 <wakeup>
80102d10:	c7 04 24 80 36 11 80 	movl   $0x80113680,(%esp)
80102d17:	e8 d4 1e 00 00       	call   80104bf0 <release>
80102d1c:	83 c4 10             	add    $0x10,%esp
80102d1f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d22:	5b                   	pop    %ebx
80102d23:	5e                   	pop    %esi
80102d24:	5f                   	pop    %edi
80102d25:	5d                   	pop    %ebp
80102d26:	c3                   	ret    
80102d27:	89 f6                	mov    %esi,%esi
80102d29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102d30:	83 ec 0c             	sub    $0xc,%esp
80102d33:	68 80 36 11 80       	push   $0x80113680
80102d38:	e8 d3 13 00 00       	call   80104110 <wakeup>
80102d3d:	c7 04 24 80 36 11 80 	movl   $0x80113680,(%esp)
80102d44:	e8 a7 1e 00 00       	call   80104bf0 <release>
80102d49:	83 c4 10             	add    $0x10,%esp
80102d4c:	8d 65 f4             	lea    -0xc(%ebp),%esp
80102d4f:	5b                   	pop    %ebx
80102d50:	5e                   	pop    %esi
80102d51:	5f                   	pop    %edi
80102d52:	5d                   	pop    %ebp
80102d53:	c3                   	ret    
80102d54:	83 ec 0c             	sub    $0xc,%esp
80102d57:	68 c4 7c 10 80       	push   $0x80107cc4
80102d5c:	e8 0f d6 ff ff       	call   80100370 <panic>
80102d61:	eb 0d                	jmp    80102d70 <log_write>
80102d63:	90                   	nop
80102d64:	90                   	nop
80102d65:	90                   	nop
80102d66:	90                   	nop
80102d67:	90                   	nop
80102d68:	90                   	nop
80102d69:	90                   	nop
80102d6a:	90                   	nop
80102d6b:	90                   	nop
80102d6c:	90                   	nop
80102d6d:	90                   	nop
80102d6e:	90                   	nop
80102d6f:	90                   	nop

80102d70 <log_write>:
80102d70:	55                   	push   %ebp
80102d71:	89 e5                	mov    %esp,%ebp
80102d73:	53                   	push   %ebx
80102d74:	83 ec 04             	sub    $0x4,%esp
80102d77:	8b 15 c8 36 11 80    	mov    0x801136c8,%edx
80102d7d:	8b 5d 08             	mov    0x8(%ebp),%ebx
80102d80:	83 fa 1d             	cmp    $0x1d,%edx
80102d83:	0f 8f 97 00 00 00    	jg     80102e20 <log_write+0xb0>
80102d89:	a1 b8 36 11 80       	mov    0x801136b8,%eax
80102d8e:	83 e8 01             	sub    $0x1,%eax
80102d91:	39 c2                	cmp    %eax,%edx
80102d93:	0f 8d 87 00 00 00    	jge    80102e20 <log_write+0xb0>
80102d99:	a1 bc 36 11 80       	mov    0x801136bc,%eax
80102d9e:	85 c0                	test   %eax,%eax
80102da0:	0f 8e 87 00 00 00    	jle    80102e2d <log_write+0xbd>
80102da6:	83 ec 0c             	sub    $0xc,%esp
80102da9:	68 80 36 11 80       	push   $0x80113680
80102dae:	e8 8d 1d 00 00       	call   80104b40 <acquire>
80102db3:	8b 15 c8 36 11 80    	mov    0x801136c8,%edx
80102db9:	83 c4 10             	add    $0x10,%esp
80102dbc:	83 fa 00             	cmp    $0x0,%edx
80102dbf:	7e 50                	jle    80102e11 <log_write+0xa1>
80102dc1:	8b 4b 08             	mov    0x8(%ebx),%ecx
80102dc4:	31 c0                	xor    %eax,%eax
80102dc6:	3b 0d cc 36 11 80    	cmp    0x801136cc,%ecx
80102dcc:	75 0b                	jne    80102dd9 <log_write+0x69>
80102dce:	eb 38                	jmp    80102e08 <log_write+0x98>
80102dd0:	39 0c 85 cc 36 11 80 	cmp    %ecx,-0x7feec934(,%eax,4)
80102dd7:	74 2f                	je     80102e08 <log_write+0x98>
80102dd9:	83 c0 01             	add    $0x1,%eax
80102ddc:	39 d0                	cmp    %edx,%eax
80102dde:	75 f0                	jne    80102dd0 <log_write+0x60>
80102de0:	89 0c 95 cc 36 11 80 	mov    %ecx,-0x7feec934(,%edx,4)
80102de7:	83 c2 01             	add    $0x1,%edx
80102dea:	89 15 c8 36 11 80    	mov    %edx,0x801136c8
80102df0:	83 0b 04             	orl    $0x4,(%ebx)
80102df3:	c7 45 08 80 36 11 80 	movl   $0x80113680,0x8(%ebp)
80102dfa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80102dfd:	c9                   	leave  
80102dfe:	e9 ed 1d 00 00       	jmp    80104bf0 <release>
80102e03:	90                   	nop
80102e04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102e08:	89 0c 85 cc 36 11 80 	mov    %ecx,-0x7feec934(,%eax,4)
80102e0f:	eb df                	jmp    80102df0 <log_write+0x80>
80102e11:	8b 43 08             	mov    0x8(%ebx),%eax
80102e14:	a3 cc 36 11 80       	mov    %eax,0x801136cc
80102e19:	75 d5                	jne    80102df0 <log_write+0x80>
80102e1b:	eb ca                	jmp    80102de7 <log_write+0x77>
80102e1d:	8d 76 00             	lea    0x0(%esi),%esi
80102e20:	83 ec 0c             	sub    $0xc,%esp
80102e23:	68 d3 7c 10 80       	push   $0x80107cd3
80102e28:	e8 43 d5 ff ff       	call   80100370 <panic>
80102e2d:	83 ec 0c             	sub    $0xc,%esp
80102e30:	68 e9 7c 10 80       	push   $0x80107ce9
80102e35:	e8 36 d5 ff ff       	call   80100370 <panic>
80102e3a:	66 90                	xchg   %ax,%ax
80102e3c:	66 90                	xchg   %ax,%ax
80102e3e:	66 90                	xchg   %ax,%ax

80102e40 <mpmain>:
80102e40:	55                   	push   %ebp
80102e41:	89 e5                	mov    %esp,%ebp
80102e43:	53                   	push   %ebx
80102e44:	83 ec 04             	sub    $0x4,%esp
80102e47:	e8 84 09 00 00       	call   801037d0 <cpuid>
80102e4c:	89 c3                	mov    %eax,%ebx
80102e4e:	e8 7d 09 00 00       	call   801037d0 <cpuid>
80102e53:	83 ec 04             	sub    $0x4,%esp
80102e56:	53                   	push   %ebx
80102e57:	50                   	push   %eax
80102e58:	68 04 7d 10 80       	push   $0x80107d04
80102e5d:	e8 fe d7 ff ff       	call   80100660 <cprintf>
80102e62:	e8 99 31 00 00       	call   80106000 <idtinit>
80102e67:	e8 e4 08 00 00       	call   80103750 <mycpu>
80102e6c:	89 c2                	mov    %eax,%edx
80102e6e:	b8 01 00 00 00       	mov    $0x1,%eax
80102e73:	f0 87 82 a0 00 00 00 	lock xchg %eax,0xa0(%edx)
80102e7a:	e8 51 0d 00 00       	call   80103bd0 <scheduler>
80102e7f:	90                   	nop

80102e80 <mpenter>:
80102e80:	55                   	push   %ebp
80102e81:	89 e5                	mov    %esp,%ebp
80102e83:	83 ec 08             	sub    $0x8,%esp
80102e86:	e8 b5 42 00 00       	call   80107140 <switchkvm>
80102e8b:	e8 b0 41 00 00       	call   80107040 <seginit>
80102e90:	e8 9b f7 ff ff       	call   80102630 <lapicinit>
80102e95:	e8 a6 ff ff ff       	call   80102e40 <mpmain>
80102e9a:	66 90                	xchg   %ax,%ax
80102e9c:	66 90                	xchg   %ax,%ax
80102e9e:	66 90                	xchg   %ax,%ax

80102ea0 <main>:
80102ea0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
80102ea4:	83 e4 f0             	and    $0xfffffff0,%esp
80102ea7:	ff 71 fc             	pushl  -0x4(%ecx)
80102eaa:	55                   	push   %ebp
80102eab:	89 e5                	mov    %esp,%ebp
80102ead:	53                   	push   %ebx
80102eae:	51                   	push   %ecx
80102eaf:	bb 80 37 11 80       	mov    $0x80113780,%ebx
80102eb4:	83 ec 08             	sub    $0x8,%esp
80102eb7:	68 00 00 40 80       	push   $0x80400000
80102ebc:	68 a8 ab 11 80       	push   $0x8011aba8
80102ec1:	e8 3a f5 ff ff       	call   80102400 <kinit1>
80102ec6:	e8 15 47 00 00       	call   801075e0 <kvmalloc>
80102ecb:	e8 70 01 00 00       	call   80103040 <mpinit>
80102ed0:	e8 5b f7 ff ff       	call   80102630 <lapicinit>
80102ed5:	e8 66 41 00 00       	call   80107040 <seginit>
80102eda:	e8 31 03 00 00       	call   80103210 <picinit>
80102edf:	e8 4c f3 ff ff       	call   80102230 <ioapicinit>
80102ee4:	e8 b7 da ff ff       	call   801009a0 <consoleinit>
80102ee9:	e8 22 34 00 00       	call   80106310 <uartinit>
80102eee:	e8 3d 08 00 00       	call   80103730 <pinit>
80102ef3:	e8 68 30 00 00       	call   80105f60 <tvinit>
80102ef8:	e8 43 d1 ff ff       	call   80100040 <binit>
80102efd:	e8 8e de ff ff       	call   80100d90 <fileinit>
80102f02:	e8 09 f1 ff ff       	call   80102010 <ideinit>
80102f07:	83 c4 0c             	add    $0xc,%esp
80102f0a:	68 8a 00 00 00       	push   $0x8a
80102f0f:	68 8c b4 10 80       	push   $0x8010b48c
80102f14:	68 00 70 00 80       	push   $0x80007000
80102f19:	e8 d2 1d 00 00       	call   80104cf0 <memmove>
80102f1e:	69 05 00 3d 11 80 b0 	imul   $0xb0,0x80113d00,%eax
80102f25:	00 00 00 
80102f28:	83 c4 10             	add    $0x10,%esp
80102f2b:	05 80 37 11 80       	add    $0x80113780,%eax
80102f30:	39 d8                	cmp    %ebx,%eax
80102f32:	76 6f                	jbe    80102fa3 <main+0x103>
80102f34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80102f38:	e8 13 08 00 00       	call   80103750 <mycpu>
80102f3d:	39 d8                	cmp    %ebx,%eax
80102f3f:	74 49                	je     80102f8a <main+0xea>
80102f41:	e8 8a f5 ff ff       	call   801024d0 <kalloc>
80102f46:	05 00 10 00 00       	add    $0x1000,%eax
80102f4b:	c7 05 f8 6f 00 80 80 	movl   $0x80102e80,0x80006ff8
80102f52:	2e 10 80 
80102f55:	c7 05 f4 6f 00 80 00 	movl   $0x10a000,0x80006ff4
80102f5c:	a0 10 00 
80102f5f:	a3 fc 6f 00 80       	mov    %eax,0x80006ffc
80102f64:	0f b6 03             	movzbl (%ebx),%eax
80102f67:	83 ec 08             	sub    $0x8,%esp
80102f6a:	68 00 70 00 00       	push   $0x7000
80102f6f:	50                   	push   %eax
80102f70:	e8 0b f8 ff ff       	call   80102780 <lapicstartap>
80102f75:	83 c4 10             	add    $0x10,%esp
80102f78:	90                   	nop
80102f79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80102f80:	8b 83 a0 00 00 00    	mov    0xa0(%ebx),%eax
80102f86:	85 c0                	test   %eax,%eax
80102f88:	74 f6                	je     80102f80 <main+0xe0>
80102f8a:	69 05 00 3d 11 80 b0 	imul   $0xb0,0x80113d00,%eax
80102f91:	00 00 00 
80102f94:	81 c3 b0 00 00 00    	add    $0xb0,%ebx
80102f9a:	05 80 37 11 80       	add    $0x80113780,%eax
80102f9f:	39 c3                	cmp    %eax,%ebx
80102fa1:	72 95                	jb     80102f38 <main+0x98>
80102fa3:	83 ec 08             	sub    $0x8,%esp
80102fa6:	68 00 00 00 8e       	push   $0x8e000000
80102fab:	68 00 00 40 80       	push   $0x80400000
80102fb0:	e8 bb f4 ff ff       	call   80102470 <kinit2>
80102fb5:	e8 66 08 00 00       	call   80103820 <userinit>
80102fba:	e8 81 fe ff ff       	call   80102e40 <mpmain>
80102fbf:	90                   	nop

80102fc0 <mpsearch1>:
80102fc0:	55                   	push   %ebp
80102fc1:	89 e5                	mov    %esp,%ebp
80102fc3:	57                   	push   %edi
80102fc4:	56                   	push   %esi
80102fc5:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80102fcb:	53                   	push   %ebx
80102fcc:	8d 1c 16             	lea    (%esi,%edx,1),%ebx
80102fcf:	83 ec 0c             	sub    $0xc,%esp
80102fd2:	39 de                	cmp    %ebx,%esi
80102fd4:	73 48                	jae    8010301e <mpsearch1+0x5e>
80102fd6:	8d 76 00             	lea    0x0(%esi),%esi
80102fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80102fe0:	83 ec 04             	sub    $0x4,%esp
80102fe3:	8d 7e 10             	lea    0x10(%esi),%edi
80102fe6:	6a 04                	push   $0x4
80102fe8:	68 18 7d 10 80       	push   $0x80107d18
80102fed:	56                   	push   %esi
80102fee:	e8 9d 1c 00 00       	call   80104c90 <memcmp>
80102ff3:	83 c4 10             	add    $0x10,%esp
80102ff6:	85 c0                	test   %eax,%eax
80102ff8:	75 1e                	jne    80103018 <mpsearch1+0x58>
80102ffa:	8d 7e 10             	lea    0x10(%esi),%edi
80102ffd:	89 f2                	mov    %esi,%edx
80102fff:	31 c9                	xor    %ecx,%ecx
80103001:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103008:	0f b6 02             	movzbl (%edx),%eax
8010300b:	83 c2 01             	add    $0x1,%edx
8010300e:	01 c1                	add    %eax,%ecx
80103010:	39 fa                	cmp    %edi,%edx
80103012:	75 f4                	jne    80103008 <mpsearch1+0x48>
80103014:	84 c9                	test   %cl,%cl
80103016:	74 10                	je     80103028 <mpsearch1+0x68>
80103018:	39 fb                	cmp    %edi,%ebx
8010301a:	89 fe                	mov    %edi,%esi
8010301c:	77 c2                	ja     80102fe0 <mpsearch1+0x20>
8010301e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103021:	31 c0                	xor    %eax,%eax
80103023:	5b                   	pop    %ebx
80103024:	5e                   	pop    %esi
80103025:	5f                   	pop    %edi
80103026:	5d                   	pop    %ebp
80103027:	c3                   	ret    
80103028:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010302b:	89 f0                	mov    %esi,%eax
8010302d:	5b                   	pop    %ebx
8010302e:	5e                   	pop    %esi
8010302f:	5f                   	pop    %edi
80103030:	5d                   	pop    %ebp
80103031:	c3                   	ret    
80103032:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103040 <mpinit>:
80103040:	55                   	push   %ebp
80103041:	89 e5                	mov    %esp,%ebp
80103043:	57                   	push   %edi
80103044:	56                   	push   %esi
80103045:	53                   	push   %ebx
80103046:	83 ec 1c             	sub    $0x1c,%esp
80103049:	0f b6 05 0f 04 00 80 	movzbl 0x8000040f,%eax
80103050:	0f b6 15 0e 04 00 80 	movzbl 0x8000040e,%edx
80103057:	c1 e0 08             	shl    $0x8,%eax
8010305a:	09 d0                	or     %edx,%eax
8010305c:	c1 e0 04             	shl    $0x4,%eax
8010305f:	85 c0                	test   %eax,%eax
80103061:	75 1b                	jne    8010307e <mpinit+0x3e>
80103063:	0f b6 05 14 04 00 80 	movzbl 0x80000414,%eax
8010306a:	0f b6 15 13 04 00 80 	movzbl 0x80000413,%edx
80103071:	c1 e0 08             	shl    $0x8,%eax
80103074:	09 d0                	or     %edx,%eax
80103076:	c1 e0 0a             	shl    $0xa,%eax
80103079:	2d 00 04 00 00       	sub    $0x400,%eax
8010307e:	ba 00 04 00 00       	mov    $0x400,%edx
80103083:	e8 38 ff ff ff       	call   80102fc0 <mpsearch1>
80103088:	85 c0                	test   %eax,%eax
8010308a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010308d:	0f 84 37 01 00 00    	je     801031ca <mpinit+0x18a>
80103093:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103096:	8b 58 04             	mov    0x4(%eax),%ebx
80103099:	85 db                	test   %ebx,%ebx
8010309b:	0f 84 43 01 00 00    	je     801031e4 <mpinit+0x1a4>
801030a1:	8d b3 00 00 00 80    	lea    -0x80000000(%ebx),%esi
801030a7:	83 ec 04             	sub    $0x4,%esp
801030aa:	6a 04                	push   $0x4
801030ac:	68 1d 7d 10 80       	push   $0x80107d1d
801030b1:	56                   	push   %esi
801030b2:	e8 d9 1b 00 00       	call   80104c90 <memcmp>
801030b7:	83 c4 10             	add    $0x10,%esp
801030ba:	85 c0                	test   %eax,%eax
801030bc:	0f 85 22 01 00 00    	jne    801031e4 <mpinit+0x1a4>
801030c2:	0f b6 83 06 00 00 80 	movzbl -0x7ffffffa(%ebx),%eax
801030c9:	3c 01                	cmp    $0x1,%al
801030cb:	74 08                	je     801030d5 <mpinit+0x95>
801030cd:	3c 04                	cmp    $0x4,%al
801030cf:	0f 85 0f 01 00 00    	jne    801031e4 <mpinit+0x1a4>
801030d5:	0f b7 bb 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edi
801030dc:	85 ff                	test   %edi,%edi
801030de:	74 21                	je     80103101 <mpinit+0xc1>
801030e0:	31 d2                	xor    %edx,%edx
801030e2:	31 c0                	xor    %eax,%eax
801030e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801030e8:	0f b6 8c 03 00 00 00 	movzbl -0x80000000(%ebx,%eax,1),%ecx
801030ef:	80 
801030f0:	83 c0 01             	add    $0x1,%eax
801030f3:	01 ca                	add    %ecx,%edx
801030f5:	39 c7                	cmp    %eax,%edi
801030f7:	75 ef                	jne    801030e8 <mpinit+0xa8>
801030f9:	84 d2                	test   %dl,%dl
801030fb:	0f 85 e3 00 00 00    	jne    801031e4 <mpinit+0x1a4>
80103101:	85 f6                	test   %esi,%esi
80103103:	0f 84 db 00 00 00    	je     801031e4 <mpinit+0x1a4>
80103109:	8b 83 24 00 00 80    	mov    -0x7fffffdc(%ebx),%eax
8010310f:	a3 7c 36 11 80       	mov    %eax,0x8011367c
80103114:	0f b7 93 04 00 00 80 	movzwl -0x7ffffffc(%ebx),%edx
8010311b:	8d 83 2c 00 00 80    	lea    -0x7fffffd4(%ebx),%eax
80103121:	bb 01 00 00 00       	mov    $0x1,%ebx
80103126:	01 d6                	add    %edx,%esi
80103128:	90                   	nop
80103129:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103130:	39 c6                	cmp    %eax,%esi
80103132:	76 23                	jbe    80103157 <mpinit+0x117>
80103134:	0f b6 10             	movzbl (%eax),%edx
80103137:	80 fa 04             	cmp    $0x4,%dl
8010313a:	0f 87 c0 00 00 00    	ja     80103200 <mpinit+0x1c0>
80103140:	ff 24 95 5c 7d 10 80 	jmp    *-0x7fef82a4(,%edx,4)
80103147:	89 f6                	mov    %esi,%esi
80103149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80103150:	83 c0 08             	add    $0x8,%eax
80103153:	39 c6                	cmp    %eax,%esi
80103155:	77 dd                	ja     80103134 <mpinit+0xf4>
80103157:	85 db                	test   %ebx,%ebx
80103159:	0f 84 92 00 00 00    	je     801031f1 <mpinit+0x1b1>
8010315f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103162:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
80103166:	74 15                	je     8010317d <mpinit+0x13d>
80103168:	ba 22 00 00 00       	mov    $0x22,%edx
8010316d:	b8 70 00 00 00       	mov    $0x70,%eax
80103172:	ee                   	out    %al,(%dx)
80103173:	ba 23 00 00 00       	mov    $0x23,%edx
80103178:	ec                   	in     (%dx),%al
80103179:	83 c8 01             	or     $0x1,%eax
8010317c:	ee                   	out    %al,(%dx)
8010317d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103180:	5b                   	pop    %ebx
80103181:	5e                   	pop    %esi
80103182:	5f                   	pop    %edi
80103183:	5d                   	pop    %ebp
80103184:	c3                   	ret    
80103185:	8d 76 00             	lea    0x0(%esi),%esi
80103188:	8b 0d 00 3d 11 80    	mov    0x80113d00,%ecx
8010318e:	83 f9 07             	cmp    $0x7,%ecx
80103191:	7f 19                	jg     801031ac <mpinit+0x16c>
80103193:	0f b6 50 01          	movzbl 0x1(%eax),%edx
80103197:	69 f9 b0 00 00 00    	imul   $0xb0,%ecx,%edi
8010319d:	83 c1 01             	add    $0x1,%ecx
801031a0:	89 0d 00 3d 11 80    	mov    %ecx,0x80113d00
801031a6:	88 97 80 37 11 80    	mov    %dl,-0x7feec880(%edi)
801031ac:	83 c0 14             	add    $0x14,%eax
801031af:	e9 7c ff ff ff       	jmp    80103130 <mpinit+0xf0>
801031b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801031b8:	0f b6 50 01          	movzbl 0x1(%eax),%edx
801031bc:	83 c0 08             	add    $0x8,%eax
801031bf:	88 15 60 37 11 80    	mov    %dl,0x80113760
801031c5:	e9 66 ff ff ff       	jmp    80103130 <mpinit+0xf0>
801031ca:	ba 00 00 01 00       	mov    $0x10000,%edx
801031cf:	b8 00 00 0f 00       	mov    $0xf0000,%eax
801031d4:	e8 e7 fd ff ff       	call   80102fc0 <mpsearch1>
801031d9:	85 c0                	test   %eax,%eax
801031db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801031de:	0f 85 af fe ff ff    	jne    80103093 <mpinit+0x53>
801031e4:	83 ec 0c             	sub    $0xc,%esp
801031e7:	68 22 7d 10 80       	push   $0x80107d22
801031ec:	e8 7f d1 ff ff       	call   80100370 <panic>
801031f1:	83 ec 0c             	sub    $0xc,%esp
801031f4:	68 3c 7d 10 80       	push   $0x80107d3c
801031f9:	e8 72 d1 ff ff       	call   80100370 <panic>
801031fe:	66 90                	xchg   %ax,%ax
80103200:	31 db                	xor    %ebx,%ebx
80103202:	e9 30 ff ff ff       	jmp    80103137 <mpinit+0xf7>
80103207:	66 90                	xchg   %ax,%ax
80103209:	66 90                	xchg   %ax,%ax
8010320b:	66 90                	xchg   %ax,%ax
8010320d:	66 90                	xchg   %ax,%ax
8010320f:	90                   	nop

80103210 <picinit>:
80103210:	55                   	push   %ebp
80103211:	ba 21 00 00 00       	mov    $0x21,%edx
80103216:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010321b:	89 e5                	mov    %esp,%ebp
8010321d:	ee                   	out    %al,(%dx)
8010321e:	ba a1 00 00 00       	mov    $0xa1,%edx
80103223:	ee                   	out    %al,(%dx)
80103224:	5d                   	pop    %ebp
80103225:	c3                   	ret    
80103226:	66 90                	xchg   %ax,%ax
80103228:	66 90                	xchg   %ax,%ax
8010322a:	66 90                	xchg   %ax,%ax
8010322c:	66 90                	xchg   %ax,%ax
8010322e:	66 90                	xchg   %ax,%ax

80103230 <pipealloc>:
80103230:	55                   	push   %ebp
80103231:	89 e5                	mov    %esp,%ebp
80103233:	57                   	push   %edi
80103234:	56                   	push   %esi
80103235:	53                   	push   %ebx
80103236:	83 ec 0c             	sub    $0xc,%esp
80103239:	8b 75 08             	mov    0x8(%ebp),%esi
8010323c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
8010323f:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103245:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
8010324b:	e8 60 db ff ff       	call   80100db0 <filealloc>
80103250:	85 c0                	test   %eax,%eax
80103252:	89 06                	mov    %eax,(%esi)
80103254:	0f 84 a8 00 00 00    	je     80103302 <pipealloc+0xd2>
8010325a:	e8 51 db ff ff       	call   80100db0 <filealloc>
8010325f:	85 c0                	test   %eax,%eax
80103261:	89 03                	mov    %eax,(%ebx)
80103263:	0f 84 87 00 00 00    	je     801032f0 <pipealloc+0xc0>
80103269:	e8 62 f2 ff ff       	call   801024d0 <kalloc>
8010326e:	85 c0                	test   %eax,%eax
80103270:	89 c7                	mov    %eax,%edi
80103272:	0f 84 b0 00 00 00    	je     80103328 <pipealloc+0xf8>
80103278:	83 ec 08             	sub    $0x8,%esp
8010327b:	c7 80 3c 02 00 00 01 	movl   $0x1,0x23c(%eax)
80103282:	00 00 00 
80103285:	c7 80 40 02 00 00 01 	movl   $0x1,0x240(%eax)
8010328c:	00 00 00 
8010328f:	c7 80 38 02 00 00 00 	movl   $0x0,0x238(%eax)
80103296:	00 00 00 
80103299:	c7 80 34 02 00 00 00 	movl   $0x0,0x234(%eax)
801032a0:	00 00 00 
801032a3:	68 70 7d 10 80       	push   $0x80107d70
801032a8:	50                   	push   %eax
801032a9:	e8 32 17 00 00       	call   801049e0 <initlock>
801032ae:	8b 06                	mov    (%esi),%eax
801032b0:	83 c4 10             	add    $0x10,%esp
801032b3:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
801032b9:	8b 06                	mov    (%esi),%eax
801032bb:	c6 40 08 01          	movb   $0x1,0x8(%eax)
801032bf:	8b 06                	mov    (%esi),%eax
801032c1:	c6 40 09 00          	movb   $0x0,0x9(%eax)
801032c5:	8b 06                	mov    (%esi),%eax
801032c7:	89 78 0c             	mov    %edi,0xc(%eax)
801032ca:	8b 03                	mov    (%ebx),%eax
801032cc:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
801032d2:	8b 03                	mov    (%ebx),%eax
801032d4:	c6 40 08 00          	movb   $0x0,0x8(%eax)
801032d8:	8b 03                	mov    (%ebx),%eax
801032da:	c6 40 09 01          	movb   $0x1,0x9(%eax)
801032de:	8b 03                	mov    (%ebx),%eax
801032e0:	89 78 0c             	mov    %edi,0xc(%eax)
801032e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801032e6:	31 c0                	xor    %eax,%eax
801032e8:	5b                   	pop    %ebx
801032e9:	5e                   	pop    %esi
801032ea:	5f                   	pop    %edi
801032eb:	5d                   	pop    %ebp
801032ec:	c3                   	ret    
801032ed:	8d 76 00             	lea    0x0(%esi),%esi
801032f0:	8b 06                	mov    (%esi),%eax
801032f2:	85 c0                	test   %eax,%eax
801032f4:	74 1e                	je     80103314 <pipealloc+0xe4>
801032f6:	83 ec 0c             	sub    $0xc,%esp
801032f9:	50                   	push   %eax
801032fa:	e8 71 db ff ff       	call   80100e70 <fileclose>
801032ff:	83 c4 10             	add    $0x10,%esp
80103302:	8b 03                	mov    (%ebx),%eax
80103304:	85 c0                	test   %eax,%eax
80103306:	74 0c                	je     80103314 <pipealloc+0xe4>
80103308:	83 ec 0c             	sub    $0xc,%esp
8010330b:	50                   	push   %eax
8010330c:	e8 5f db ff ff       	call   80100e70 <fileclose>
80103311:	83 c4 10             	add    $0x10,%esp
80103314:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103317:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010331c:	5b                   	pop    %ebx
8010331d:	5e                   	pop    %esi
8010331e:	5f                   	pop    %edi
8010331f:	5d                   	pop    %ebp
80103320:	c3                   	ret    
80103321:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103328:	8b 06                	mov    (%esi),%eax
8010332a:	85 c0                	test   %eax,%eax
8010332c:	75 c8                	jne    801032f6 <pipealloc+0xc6>
8010332e:	eb d2                	jmp    80103302 <pipealloc+0xd2>

80103330 <pipeclose>:
80103330:	55                   	push   %ebp
80103331:	89 e5                	mov    %esp,%ebp
80103333:	56                   	push   %esi
80103334:	53                   	push   %ebx
80103335:	8b 5d 08             	mov    0x8(%ebp),%ebx
80103338:	8b 75 0c             	mov    0xc(%ebp),%esi
8010333b:	83 ec 0c             	sub    $0xc,%esp
8010333e:	53                   	push   %ebx
8010333f:	e8 fc 17 00 00       	call   80104b40 <acquire>
80103344:	83 c4 10             	add    $0x10,%esp
80103347:	85 f6                	test   %esi,%esi
80103349:	74 45                	je     80103390 <pipeclose+0x60>
8010334b:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
80103351:	83 ec 0c             	sub    $0xc,%esp
80103354:	c7 83 40 02 00 00 00 	movl   $0x0,0x240(%ebx)
8010335b:	00 00 00 
8010335e:	50                   	push   %eax
8010335f:	e8 ac 0d 00 00       	call   80104110 <wakeup>
80103364:	83 c4 10             	add    $0x10,%esp
80103367:	8b 93 3c 02 00 00    	mov    0x23c(%ebx),%edx
8010336d:	85 d2                	test   %edx,%edx
8010336f:	75 0a                	jne    8010337b <pipeclose+0x4b>
80103371:	8b 83 40 02 00 00    	mov    0x240(%ebx),%eax
80103377:	85 c0                	test   %eax,%eax
80103379:	74 35                	je     801033b0 <pipeclose+0x80>
8010337b:	89 5d 08             	mov    %ebx,0x8(%ebp)
8010337e:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103381:	5b                   	pop    %ebx
80103382:	5e                   	pop    %esi
80103383:	5d                   	pop    %ebp
80103384:	e9 67 18 00 00       	jmp    80104bf0 <release>
80103389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103390:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
80103396:	83 ec 0c             	sub    $0xc,%esp
80103399:	c7 83 3c 02 00 00 00 	movl   $0x0,0x23c(%ebx)
801033a0:	00 00 00 
801033a3:	50                   	push   %eax
801033a4:	e8 67 0d 00 00       	call   80104110 <wakeup>
801033a9:	83 c4 10             	add    $0x10,%esp
801033ac:	eb b9                	jmp    80103367 <pipeclose+0x37>
801033ae:	66 90                	xchg   %ax,%ax
801033b0:	83 ec 0c             	sub    $0xc,%esp
801033b3:	53                   	push   %ebx
801033b4:	e8 37 18 00 00       	call   80104bf0 <release>
801033b9:	89 5d 08             	mov    %ebx,0x8(%ebp)
801033bc:	83 c4 10             	add    $0x10,%esp
801033bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
801033c2:	5b                   	pop    %ebx
801033c3:	5e                   	pop    %esi
801033c4:	5d                   	pop    %ebp
801033c5:	e9 56 ef ff ff       	jmp    80102320 <kfree>
801033ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801033d0 <pipewrite>:
801033d0:	55                   	push   %ebp
801033d1:	89 e5                	mov    %esp,%ebp
801033d3:	57                   	push   %edi
801033d4:	56                   	push   %esi
801033d5:	53                   	push   %ebx
801033d6:	83 ec 28             	sub    $0x28,%esp
801033d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801033dc:	53                   	push   %ebx
801033dd:	e8 5e 17 00 00       	call   80104b40 <acquire>
801033e2:	8b 45 10             	mov    0x10(%ebp),%eax
801033e5:	83 c4 10             	add    $0x10,%esp
801033e8:	85 c0                	test   %eax,%eax
801033ea:	0f 8e b9 00 00 00    	jle    801034a9 <pipewrite+0xd9>
801033f0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
801033f3:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
801033f9:	8d bb 34 02 00 00    	lea    0x234(%ebx),%edi
801033ff:	8d b3 38 02 00 00    	lea    0x238(%ebx),%esi
80103405:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80103408:	03 4d 10             	add    0x10(%ebp),%ecx
8010340b:	89 4d e0             	mov    %ecx,-0x20(%ebp)
8010340e:	8b 8b 34 02 00 00    	mov    0x234(%ebx),%ecx
80103414:	8d 91 00 02 00 00    	lea    0x200(%ecx),%edx
8010341a:	39 d0                	cmp    %edx,%eax
8010341c:	74 38                	je     80103456 <pipewrite+0x86>
8010341e:	eb 59                	jmp    80103479 <pipewrite+0xa9>
80103420:	e8 cb 03 00 00       	call   801037f0 <myproc>
80103425:	8b 48 24             	mov    0x24(%eax),%ecx
80103428:	85 c9                	test   %ecx,%ecx
8010342a:	75 34                	jne    80103460 <pipewrite+0x90>
8010342c:	83 ec 0c             	sub    $0xc,%esp
8010342f:	57                   	push   %edi
80103430:	e8 db 0c 00 00       	call   80104110 <wakeup>
80103435:	58                   	pop    %eax
80103436:	5a                   	pop    %edx
80103437:	53                   	push   %ebx
80103438:	56                   	push   %esi
80103439:	e8 12 0b 00 00       	call   80103f50 <sleep>
8010343e:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
80103444:	8b 93 38 02 00 00    	mov    0x238(%ebx),%edx
8010344a:	83 c4 10             	add    $0x10,%esp
8010344d:	05 00 02 00 00       	add    $0x200,%eax
80103452:	39 c2                	cmp    %eax,%edx
80103454:	75 2a                	jne    80103480 <pipewrite+0xb0>
80103456:	8b 83 3c 02 00 00    	mov    0x23c(%ebx),%eax
8010345c:	85 c0                	test   %eax,%eax
8010345e:	75 c0                	jne    80103420 <pipewrite+0x50>
80103460:	83 ec 0c             	sub    $0xc,%esp
80103463:	53                   	push   %ebx
80103464:	e8 87 17 00 00       	call   80104bf0 <release>
80103469:	83 c4 10             	add    $0x10,%esp
8010346c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103471:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103474:	5b                   	pop    %ebx
80103475:	5e                   	pop    %esi
80103476:	5f                   	pop    %edi
80103477:	5d                   	pop    %ebp
80103478:	c3                   	ret    
80103479:	89 c2                	mov    %eax,%edx
8010347b:	90                   	nop
8010347c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103480:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103483:	8d 42 01             	lea    0x1(%edx),%eax
80103486:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
8010348a:	81 e2 ff 01 00 00    	and    $0x1ff,%edx
80103490:	89 83 38 02 00 00    	mov    %eax,0x238(%ebx)
80103496:	0f b6 09             	movzbl (%ecx),%ecx
80103499:	88 4c 13 34          	mov    %cl,0x34(%ebx,%edx,1)
8010349d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801034a0:	3b 4d e0             	cmp    -0x20(%ebp),%ecx
801034a3:	0f 85 65 ff ff ff    	jne    8010340e <pipewrite+0x3e>
801034a9:	8d 83 34 02 00 00    	lea    0x234(%ebx),%eax
801034af:	83 ec 0c             	sub    $0xc,%esp
801034b2:	50                   	push   %eax
801034b3:	e8 58 0c 00 00       	call   80104110 <wakeup>
801034b8:	89 1c 24             	mov    %ebx,(%esp)
801034bb:	e8 30 17 00 00       	call   80104bf0 <release>
801034c0:	83 c4 10             	add    $0x10,%esp
801034c3:	8b 45 10             	mov    0x10(%ebp),%eax
801034c6:	eb a9                	jmp    80103471 <pipewrite+0xa1>
801034c8:	90                   	nop
801034c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801034d0 <piperead>:
801034d0:	55                   	push   %ebp
801034d1:	89 e5                	mov    %esp,%ebp
801034d3:	57                   	push   %edi
801034d4:	56                   	push   %esi
801034d5:	53                   	push   %ebx
801034d6:	83 ec 18             	sub    $0x18,%esp
801034d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
801034dc:	8b 7d 0c             	mov    0xc(%ebp),%edi
801034df:	53                   	push   %ebx
801034e0:	e8 5b 16 00 00       	call   80104b40 <acquire>
801034e5:	83 c4 10             	add    $0x10,%esp
801034e8:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
801034ee:	39 83 38 02 00 00    	cmp    %eax,0x238(%ebx)
801034f4:	75 6a                	jne    80103560 <piperead+0x90>
801034f6:	8b b3 40 02 00 00    	mov    0x240(%ebx),%esi
801034fc:	85 f6                	test   %esi,%esi
801034fe:	0f 84 cc 00 00 00    	je     801035d0 <piperead+0x100>
80103504:	8d b3 34 02 00 00    	lea    0x234(%ebx),%esi
8010350a:	eb 2d                	jmp    80103539 <piperead+0x69>
8010350c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103510:	83 ec 08             	sub    $0x8,%esp
80103513:	53                   	push   %ebx
80103514:	56                   	push   %esi
80103515:	e8 36 0a 00 00       	call   80103f50 <sleep>
8010351a:	83 c4 10             	add    $0x10,%esp
8010351d:	8b 83 38 02 00 00    	mov    0x238(%ebx),%eax
80103523:	39 83 34 02 00 00    	cmp    %eax,0x234(%ebx)
80103529:	75 35                	jne    80103560 <piperead+0x90>
8010352b:	8b 93 40 02 00 00    	mov    0x240(%ebx),%edx
80103531:	85 d2                	test   %edx,%edx
80103533:	0f 84 97 00 00 00    	je     801035d0 <piperead+0x100>
80103539:	e8 b2 02 00 00       	call   801037f0 <myproc>
8010353e:	8b 48 24             	mov    0x24(%eax),%ecx
80103541:	85 c9                	test   %ecx,%ecx
80103543:	74 cb                	je     80103510 <piperead+0x40>
80103545:	83 ec 0c             	sub    $0xc,%esp
80103548:	53                   	push   %ebx
80103549:	e8 a2 16 00 00       	call   80104bf0 <release>
8010354e:	83 c4 10             	add    $0x10,%esp
80103551:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103554:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103559:	5b                   	pop    %ebx
8010355a:	5e                   	pop    %esi
8010355b:	5f                   	pop    %edi
8010355c:	5d                   	pop    %ebp
8010355d:	c3                   	ret    
8010355e:	66 90                	xchg   %ax,%ax
80103560:	8b 45 10             	mov    0x10(%ebp),%eax
80103563:	85 c0                	test   %eax,%eax
80103565:	7e 69                	jle    801035d0 <piperead+0x100>
80103567:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010356d:	31 c9                	xor    %ecx,%ecx
8010356f:	eb 15                	jmp    80103586 <piperead+0xb6>
80103571:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80103578:	8b 83 34 02 00 00    	mov    0x234(%ebx),%eax
8010357e:	3b 83 38 02 00 00    	cmp    0x238(%ebx),%eax
80103584:	74 5a                	je     801035e0 <piperead+0x110>
80103586:	8d 70 01             	lea    0x1(%eax),%esi
80103589:	25 ff 01 00 00       	and    $0x1ff,%eax
8010358e:	89 b3 34 02 00 00    	mov    %esi,0x234(%ebx)
80103594:	0f b6 44 03 34       	movzbl 0x34(%ebx,%eax,1),%eax
80103599:	88 04 0f             	mov    %al,(%edi,%ecx,1)
8010359c:	83 c1 01             	add    $0x1,%ecx
8010359f:	39 4d 10             	cmp    %ecx,0x10(%ebp)
801035a2:	75 d4                	jne    80103578 <piperead+0xa8>
801035a4:	8d 83 38 02 00 00    	lea    0x238(%ebx),%eax
801035aa:	83 ec 0c             	sub    $0xc,%esp
801035ad:	50                   	push   %eax
801035ae:	e8 5d 0b 00 00       	call   80104110 <wakeup>
801035b3:	89 1c 24             	mov    %ebx,(%esp)
801035b6:	e8 35 16 00 00       	call   80104bf0 <release>
801035bb:	8b 45 10             	mov    0x10(%ebp),%eax
801035be:	83 c4 10             	add    $0x10,%esp
801035c1:	8d 65 f4             	lea    -0xc(%ebp),%esp
801035c4:	5b                   	pop    %ebx
801035c5:	5e                   	pop    %esi
801035c6:	5f                   	pop    %edi
801035c7:	5d                   	pop    %ebp
801035c8:	c3                   	ret    
801035c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801035d0:	c7 45 10 00 00 00 00 	movl   $0x0,0x10(%ebp)
801035d7:	eb cb                	jmp    801035a4 <piperead+0xd4>
801035d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801035e0:	89 4d 10             	mov    %ecx,0x10(%ebp)
801035e3:	eb bf                	jmp    801035a4 <piperead+0xd4>
801035e5:	66 90                	xchg   %ax,%ax
801035e7:	66 90                	xchg   %ax,%ax
801035e9:	66 90                	xchg   %ax,%ax
801035eb:	66 90                	xchg   %ax,%ax
801035ed:	66 90                	xchg   %ax,%ax
801035ef:	90                   	nop

801035f0 <allocproc>:
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801035f0:	55                   	push   %ebp
801035f1:	89 e5                	mov    %esp,%ebp
801035f3:	53                   	push   %ebx
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
801035f4:	bb 54 3d 11 80       	mov    $0x80113d54,%ebx
// If found, change state to EMBRYO and initialize
// state required to run in the kernel.
// Otherwise return 0.
static struct proc*
allocproc(void)
{
801035f9:	83 ec 10             	sub    $0x10,%esp
  struct proc *p;
  char *sp;

  acquire(&ptable.lock);
801035fc:	68 20 3d 11 80       	push   $0x80113d20
80103601:	e8 3a 15 00 00       	call   80104b40 <acquire>
80103606:	83 c4 10             	add    $0x10,%esp
80103609:	eb 17                	jmp    80103622 <allocproc+0x32>
8010360b:	90                   	nop
8010360c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103610:	81 c3 98 01 00 00    	add    $0x198,%ebx
80103616:	81 fb 54 a3 11 80    	cmp    $0x8011a354,%ebx
8010361c:	0f 84 9e 00 00 00    	je     801036c0 <allocproc+0xd0>
    if(p->state == UNUSED)
80103622:	8b 43 0c             	mov    0xc(%ebx),%eax
80103625:	85 c0                	test   %eax,%eax
80103627:	75 e7                	jne    80103610 <allocproc+0x20>
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103629:	a1 04 b0 10 80       	mov    0x8010b004,%eax
	p->tid = 0;
	p->manager = p;
	p->start = 0;
	p->end = 0;

  release(&ptable.lock);
8010362e:	83 ec 0c             	sub    $0xc,%esp

  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
80103631:	c7 43 0c 01 00 00 00 	movl   $0x1,0xc(%ebx)
	p->tid = 0;
	p->manager = p;
	p->start = 0;
	p->end = 0;

  release(&ptable.lock);
80103638:	68 20 3d 11 80       	push   $0x80113d20
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
	p->tid = 0;
8010363d:	c7 43 7c 00 00 00 00 	movl   $0x0,0x7c(%ebx)
	p->manager = p;
80103644:	89 9b 80 00 00 00    	mov    %ebx,0x80(%ebx)
	p->start = 0;
8010364a:	c7 83 8c 01 00 00 00 	movl   $0x0,0x18c(%ebx)
80103651:	00 00 00 
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103654:	8d 50 01             	lea    0x1(%eax),%edx
80103657:	89 43 10             	mov    %eax,0x10(%ebx)
	p->tid = 0;
	p->manager = p;
	p->start = 0;
	p->end = 0;
8010365a:	c7 83 90 01 00 00 00 	movl   $0x0,0x190(%ebx)
80103661:	00 00 00 
  release(&ptable.lock);
  return 0;

found:
  p->state = EMBRYO;
  p->pid = nextpid++;
80103664:	89 15 04 b0 10 80    	mov    %edx,0x8010b004
	p->tid = 0;
	p->manager = p;
	p->start = 0;
	p->end = 0;

  release(&ptable.lock);
8010366a:	e8 81 15 00 00       	call   80104bf0 <release>

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
8010366f:	e8 5c ee ff ff       	call   801024d0 <kalloc>
80103674:	83 c4 10             	add    $0x10,%esp
80103677:	85 c0                	test   %eax,%eax
80103679:	89 43 08             	mov    %eax,0x8(%ebx)
8010367c:	74 59                	je     801036d7 <allocproc+0xe7>
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
8010367e:	8d 90 b4 0f 00 00    	lea    0xfb4(%eax),%edx
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103684:	83 ec 04             	sub    $0x4,%esp
  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
80103687:	05 9c 0f 00 00       	add    $0xf9c,%eax
    return 0;
  }
  sp = p->kstack + KSTACKSIZE;

  // Leave room for trap frame.
  sp -= sizeof *p->tf;
8010368c:	89 53 18             	mov    %edx,0x18(%ebx)
  p->tf = (struct trapframe*)sp;

  // Set up new context to start executing at forkret,
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;
8010368f:	c7 40 14 51 5f 10 80 	movl   $0x80105f51,0x14(%eax)

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
80103696:	6a 14                	push   $0x14
80103698:	6a 00                	push   $0x0
8010369a:	50                   	push   %eax
  // which returns to trapret.
  sp -= 4;
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
8010369b:	89 43 1c             	mov    %eax,0x1c(%ebx)
  memset(p->context, 0, sizeof *p->context);
8010369e:	e8 9d 15 00 00       	call   80104c40 <memset>
  p->context->eip = (uint)forkret;
801036a3:	8b 43 1c             	mov    0x1c(%ebx),%eax
	//cprintf("edi : %d, esi : %d, ebx : %d, ebp : %d, eip : %d\n", p->context->edi
	//						,p->context->esi, p->context->ebx, p->context->ebp, p->context->eip);



  return p;
801036a6:	83 c4 10             	add    $0x10,%esp
  *(uint*)sp = (uint)trapret;

  sp -= sizeof *p->context;
  p->context = (struct context*)sp;
  memset(p->context, 0, sizeof *p->context);
  p->context->eip = (uint)forkret;
801036a9:	c7 40 10 e0 36 10 80 	movl   $0x801036e0,0x10(%eax)
	//cprintf("edi : %d, esi : %d, ebx : %d, ebp : %d, eip : %d\n", p->context->edi
	//						,p->context->esi, p->context->ebx, p->context->ebp, p->context->eip);



  return p;
801036b0:	89 d8                	mov    %ebx,%eax
}
801036b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801036b5:	c9                   	leave  
801036b6:	c3                   	ret    
801036b7:	89 f6                	mov    %esi,%esi
801036b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
    if(p->state == UNUSED)
      goto found;

  release(&ptable.lock);
801036c0:	83 ec 0c             	sub    $0xc,%esp
801036c3:	68 20 3d 11 80       	push   $0x80113d20
801036c8:	e8 23 15 00 00       	call   80104bf0 <release>
  return 0;
801036cd:	83 c4 10             	add    $0x10,%esp
801036d0:	31 c0                	xor    %eax,%eax
	//						,p->context->esi, p->context->ebx, p->context->ebp, p->context->eip);



  return p;
}
801036d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801036d5:	c9                   	leave  
801036d6:	c3                   	ret    

  release(&ptable.lock);

  // Allocate kernel stack.
  if((p->kstack = kalloc()) == 0){
    p->state = UNUSED;
801036d7:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
    return 0;
801036de:	eb d2                	jmp    801036b2 <allocproc+0xc2>

801036e0 <forkret>:

// A fork child's very first scheduling by scheduler()
// will swtch here.  "Return" to user space.
void
forkret(void)
{
801036e0:	55                   	push   %ebp
801036e1:	89 e5                	mov    %esp,%ebp
801036e3:	83 ec 14             	sub    $0x14,%esp
	// cprintf("forkret\n");

	static int first = 1;
  // Still holding ptable.lock from scheduler.
  release(&ptable.lock);
801036e6:	68 20 3d 11 80       	push   $0x80113d20
801036eb:	e8 00 15 00 00       	call   80104bf0 <release>

  if (first) {
801036f0:	a1 00 b0 10 80       	mov    0x8010b000,%eax
801036f5:	83 c4 10             	add    $0x10,%esp
801036f8:	85 c0                	test   %eax,%eax
801036fa:	75 04                	jne    80103700 <forkret+0x20>
    iinit(ROOTDEV);
    initlog(ROOTDEV);
  }

  // Return to "caller", actually trapret (see allocproc).
}
801036fc:	c9                   	leave  
801036fd:	c3                   	ret    
801036fe:	66 90                	xchg   %ax,%ax
  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
    iinit(ROOTDEV);
80103700:	83 ec 0c             	sub    $0xc,%esp

  if (first) {
    // Some initialization functions must be run in the context
    // of a regular process (e.g., they call sleep), and thus cannot
    // be run from main().
    first = 0;
80103703:	c7 05 00 b0 10 80 00 	movl   $0x0,0x8010b000
8010370a:	00 00 00 
    iinit(ROOTDEV);
8010370d:	6a 01                	push   $0x1
8010370f:	e8 9c dd ff ff       	call   801014b0 <iinit>
    initlog(ROOTDEV);
80103714:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
8010371b:	e8 d0 f3 ff ff       	call   80102af0 <initlog>
80103720:	83 c4 10             	add    $0x10,%esp
  }

  // Return to "caller", actually trapret (see allocproc).
}
80103723:	c9                   	leave  
80103724:	c3                   	ret    
80103725:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103729:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103730 <pinit>:

static void wakeup1(void *chan);

void
pinit(void)
{
80103730:	55                   	push   %ebp
80103731:	89 e5                	mov    %esp,%ebp
80103733:	83 ec 10             	sub    $0x10,%esp
  initlock(&ptable.lock, "ptable");
80103736:	68 75 7d 10 80       	push   $0x80107d75
8010373b:	68 20 3d 11 80       	push   $0x80113d20
80103740:	e8 9b 12 00 00       	call   801049e0 <initlock>
}
80103745:	83 c4 10             	add    $0x10,%esp
80103748:	c9                   	leave  
80103749:	c3                   	ret    
8010374a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80103750 <mycpu>:

// Must be called with interrupts disabled to avoid the caller being
// rescheduled between reading lapicid and running through the loop.
struct cpu*
mycpu(void)
{
80103750:	55                   	push   %ebp
80103751:	89 e5                	mov    %esp,%ebp
80103753:	56                   	push   %esi
80103754:	53                   	push   %ebx

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103755:	9c                   	pushf  
80103756:	58                   	pop    %eax
  int apicid, i;
  
  if(readeflags()&FL_IF)
80103757:	f6 c4 02             	test   $0x2,%ah
8010375a:	75 5b                	jne    801037b7 <mycpu+0x67>
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
8010375c:	e8 cf ef ff ff       	call   80102730 <lapicid>
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103761:	8b 35 00 3d 11 80    	mov    0x80113d00,%esi
80103767:	85 f6                	test   %esi,%esi
80103769:	7e 3f                	jle    801037aa <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
8010376b:	0f b6 15 80 37 11 80 	movzbl 0x80113780,%edx
80103772:	39 d0                	cmp    %edx,%eax
80103774:	74 30                	je     801037a6 <mycpu+0x56>
80103776:	b9 30 38 11 80       	mov    $0x80113830,%ecx
8010377b:	31 d2                	xor    %edx,%edx
8010377d:	8d 76 00             	lea    0x0(%esi),%esi
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
80103780:	83 c2 01             	add    $0x1,%edx
80103783:	39 f2                	cmp    %esi,%edx
80103785:	74 23                	je     801037aa <mycpu+0x5a>
    if (cpus[i].apicid == apicid)
80103787:	0f b6 19             	movzbl (%ecx),%ebx
8010378a:	81 c1 b0 00 00 00    	add    $0xb0,%ecx
80103790:	39 d8                	cmp    %ebx,%eax
80103792:	75 ec                	jne    80103780 <mycpu+0x30>
      return &cpus[i];
80103794:	69 c2 b0 00 00 00    	imul   $0xb0,%edx,%eax
  }
  panic("unknown apicid\n");
}
8010379a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010379d:	5b                   	pop    %ebx
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
    if (cpus[i].apicid == apicid)
      return &cpus[i];
8010379e:	05 80 37 11 80       	add    $0x80113780,%eax
  }
  panic("unknown apicid\n");
}
801037a3:	5e                   	pop    %esi
801037a4:	5d                   	pop    %ebp
801037a5:	c3                   	ret    
    panic("mycpu called with interrupts enabled\n");
  
  apicid = lapicid();
  // APIC IDs are not guaranteed to be contiguous. Maybe we should have
  // a reverse map, or reserve a register to store &cpus[i].
  for (i = 0; i < ncpu; ++i) {
801037a6:	31 d2                	xor    %edx,%edx
801037a8:	eb ea                	jmp    80103794 <mycpu+0x44>
    if (cpus[i].apicid == apicid)
      return &cpus[i];
  }
  panic("unknown apicid\n");
801037aa:	83 ec 0c             	sub    $0xc,%esp
801037ad:	68 7c 7d 10 80       	push   $0x80107d7c
801037b2:	e8 b9 cb ff ff       	call   80100370 <panic>
mycpu(void)
{
  int apicid, i;
  
  if(readeflags()&FL_IF)
    panic("mycpu called with interrupts enabled\n");
801037b7:	83 ec 0c             	sub    $0xc,%esp
801037ba:	68 60 7e 10 80       	push   $0x80107e60
801037bf:	e8 ac cb ff ff       	call   80100370 <panic>
801037c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801037ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801037d0 <cpuid>:
  initlock(&ptable.lock, "ptable");
}

// Must be called with interrupts disabled
int
cpuid() {
801037d0:	55                   	push   %ebp
801037d1:	89 e5                	mov    %esp,%ebp
801037d3:	83 ec 08             	sub    $0x8,%esp
  return mycpu()-cpus;
801037d6:	e8 75 ff ff ff       	call   80103750 <mycpu>
801037db:	2d 80 37 11 80       	sub    $0x80113780,%eax
}
801037e0:	c9                   	leave  
}

// Must be called with interrupts disabled
int
cpuid() {
  return mycpu()-cpus;
801037e1:	c1 f8 04             	sar    $0x4,%eax
801037e4:	69 c0 a3 8b 2e ba    	imul   $0xba2e8ba3,%eax,%eax
}
801037ea:	c3                   	ret    
801037eb:	90                   	nop
801037ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801037f0 <myproc>:
}

// Disable interrupts so that we are not rescheduled
// while reading proc from the cpu structure
struct proc*
myproc(void) {
801037f0:	55                   	push   %ebp
801037f1:	89 e5                	mov    %esp,%ebp
801037f3:	53                   	push   %ebx
801037f4:	83 ec 04             	sub    $0x4,%esp
  struct cpu *c;
  struct proc *p;
  pushcli();
801037f7:	e8 64 12 00 00       	call   80104a60 <pushcli>
  c = mycpu();
801037fc:	e8 4f ff ff ff       	call   80103750 <mycpu>
  p = c->proc;
80103801:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103807:	e8 94 12 00 00       	call   80104aa0 <popcli>
  return p;
}
8010380c:	83 c4 04             	add    $0x4,%esp
8010380f:	89 d8                	mov    %ebx,%eax
80103811:	5b                   	pop    %ebx
80103812:	5d                   	pop    %ebp
80103813:	c3                   	ret    
80103814:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010381a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80103820 <userinit>:

//PAGEBREAK: 32
// Set up first user process.
void
userinit(void)
{
80103820:	55                   	push   %ebp
80103821:	89 e5                	mov    %esp,%ebp
80103823:	53                   	push   %ebx
80103824:	83 ec 04             	sub    $0x4,%esp
  struct proc *p;
  extern char _binary_initcode_start[], _binary_initcode_size[];

  p = allocproc();
80103827:	e8 c4 fd ff ff       	call   801035f0 <allocproc>
8010382c:	89 c3                	mov    %eax,%ebx
  
  initproc = p;
8010382e:	a3 b8 b5 10 80       	mov    %eax,0x8010b5b8
  if((p->pgdir = setupkvm()) == 0)
80103833:	e8 28 3d 00 00       	call   80107560 <setupkvm>
80103838:	85 c0                	test   %eax,%eax
8010383a:	89 43 04             	mov    %eax,0x4(%ebx)
8010383d:	0f 84 bd 00 00 00    	je     80103900 <userinit+0xe0>
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
80103843:	83 ec 04             	sub    $0x4,%esp
80103846:	68 2c 00 00 00       	push   $0x2c
8010384b:	68 60 b4 10 80       	push   $0x8010b460
80103850:	50                   	push   %eax
80103851:	e8 1a 3a 00 00       	call   80107270 <inituvm>
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
80103856:	83 c4 0c             	add    $0xc,%esp
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
80103859:	c7 03 00 10 00 00    	movl   $0x1000,(%ebx)
  memset(p->tf, 0, sizeof(*p->tf));
8010385f:	6a 4c                	push   $0x4c
80103861:	6a 00                	push   $0x0
80103863:	ff 73 18             	pushl  0x18(%ebx)
80103866:	e8 d5 13 00 00       	call   80104c40 <memset>
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010386b:	8b 43 18             	mov    0x18(%ebx),%eax
8010386e:	ba 1b 00 00 00       	mov    $0x1b,%edx
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
80103873:	b9 23 00 00 00       	mov    $0x23,%ecx
  p->tf->eflags = FL_IF;

  p->tf->esp = PGSIZE;
  p->tf->eip = 0;  // beginning of initcode.S

  safestrcpy(p->name, "initcode", sizeof(p->name));
80103878:	83 c4 0c             	add    $0xc,%esp
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
  inituvm(p->pgdir, _binary_initcode_start, (int)_binary_initcode_size);
  p->sz = PGSIZE;
  memset(p->tf, 0, sizeof(*p->tf));
  p->tf->cs = (SEG_UCODE << 3) | DPL_USER;
8010387b:	66 89 50 3c          	mov    %dx,0x3c(%eax)
  p->tf->ds = (SEG_UDATA << 3) | DPL_USER;
8010387f:	8b 43 18             	mov    0x18(%ebx),%eax
80103882:	66 89 48 2c          	mov    %cx,0x2c(%eax)
  p->tf->es = p->tf->ds;
80103886:	8b 43 18             	mov    0x18(%ebx),%eax
80103889:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
8010388d:	66 89 50 28          	mov    %dx,0x28(%eax)
  p->tf->ss = p->tf->ds;
80103891:	8b 43 18             	mov    0x18(%ebx),%eax
80103894:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
80103898:	66 89 50 48          	mov    %dx,0x48(%eax)
  p->tf->eflags = FL_IF;
8010389c:	8b 43 18             	mov    0x18(%ebx),%eax
8010389f:	c7 40 40 00 02 00 00 	movl   $0x200,0x40(%eax)

  p->tf->esp = PGSIZE;
801038a6:	8b 43 18             	mov    0x18(%ebx),%eax
801038a9:	c7 40 44 00 10 00 00 	movl   $0x1000,0x44(%eax)
  p->tf->eip = 0;  // beginning of initcode.S
801038b0:	8b 43 18             	mov    0x18(%ebx),%eax
801038b3:	c7 40 38 00 00 00 00 	movl   $0x0,0x38(%eax)

  safestrcpy(p->name, "initcode", sizeof(p->name));
801038ba:	8d 43 6c             	lea    0x6c(%ebx),%eax
801038bd:	6a 10                	push   $0x10
801038bf:	68 a5 7d 10 80       	push   $0x80107da5
801038c4:	50                   	push   %eax
801038c5:	e8 76 15 00 00       	call   80104e40 <safestrcpy>
  p->cwd = namei("/");
801038ca:	c7 04 24 ae 7d 10 80 	movl   $0x80107dae,(%esp)
801038d1:	e8 2a e6 ff ff       	call   80101f00 <namei>
801038d6:	89 43 68             	mov    %eax,0x68(%ebx)

  // this assignment to p->state lets other cores
  // run this process. the acquire forces the above
  // writes to be visible, and the lock is also needed
  // because the assignment might not be atomic.
  acquire(&ptable.lock);
801038d9:	c7 04 24 20 3d 11 80 	movl   $0x80113d20,(%esp)
801038e0:	e8 5b 12 00 00       	call   80104b40 <acquire>

  p->state = RUNNABLE;
801038e5:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)

  release(&ptable.lock);
801038ec:	c7 04 24 20 3d 11 80 	movl   $0x80113d20,(%esp)
801038f3:	e8 f8 12 00 00       	call   80104bf0 <release>
}
801038f8:	83 c4 10             	add    $0x10,%esp
801038fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801038fe:	c9                   	leave  
801038ff:	c3                   	ret    

  p = allocproc();
  
  initproc = p;
  if((p->pgdir = setupkvm()) == 0)
    panic("userinit: out of memory?");
80103900:	83 ec 0c             	sub    $0xc,%esp
80103903:	68 8c 7d 10 80       	push   $0x80107d8c
80103908:	e8 63 ca ff ff       	call   80100370 <panic>
8010390d:	8d 76 00             	lea    0x0(%esi),%esi

80103910 <growproc>:

// Grow current process's memory by n bytes.
// Return 0 on success, -1 on failure.
int
growproc(int n)
{
80103910:	55                   	push   %ebp
80103911:	89 e5                	mov    %esp,%ebp
80103913:	57                   	push   %edi
80103914:	56                   	push   %esi
80103915:	53                   	push   %ebx
80103916:	83 ec 0c             	sub    $0xc,%esp
80103919:	8b 7d 08             	mov    0x8(%ebp),%edi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
8010391c:	e8 3f 11 00 00       	call   80104a60 <pushcli>
  c = mycpu();
80103921:	e8 2a fe ff ff       	call   80103750 <mycpu>
  p = c->proc;
80103926:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
8010392c:	e8 6f 11 00 00       	call   80104aa0 <popcli>
  uint sz;
  struct proc *curproc = myproc();
	struct proc *p;

  sz = curproc->sz;
  if(n > 0){
80103931:	83 ff 00             	cmp    $0x0,%edi
{
  uint sz;
  struct proc *curproc = myproc();
	struct proc *p;

  sz = curproc->sz;
80103934:	8b 33                	mov    (%ebx),%esi
  if(n > 0){
80103936:	0f 8e 88 00 00 00    	jle    801039c4 <growproc+0xb4>
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
8010393c:	83 ec 04             	sub    $0x4,%esp
8010393f:	01 f7                	add    %esi,%edi
80103941:	57                   	push   %edi
80103942:	56                   	push   %esi
80103943:	ff 73 04             	pushl  0x4(%ebx)
80103946:	e8 65 3a 00 00       	call   801073b0 <allocuvm>
8010394b:	83 c4 10             	add    $0x10,%esp
8010394e:	85 c0                	test   %eax,%eax
80103950:	89 c6                	mov    %eax,%esi
80103952:	0f 84 8a 00 00 00    	je     801039e2 <growproc+0xd2>
  } else if(n < 0){
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }

	acquire(&ptable.lock);
80103958:	83 ec 0c             	sub    $0xc,%esp
8010395b:	68 20 3d 11 80       	push   $0x80113d20
80103960:	e8 db 11 00 00       	call   80104b40 <acquire>
80103965:	83 c4 10             	add    $0x10,%esp
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103968:	ba 54 3d 11 80       	mov    $0x80113d54,%edx
8010396d:	eb 0f                	jmp    8010397e <growproc+0x6e>
8010396f:	90                   	nop
80103970:	81 c2 98 01 00 00    	add    $0x198,%edx
80103976:	81 fa 54 a3 11 80    	cmp    $0x8011a354,%edx
8010397c:	74 22                	je     801039a0 <growproc+0x90>
		if(p->pid == 0)
8010397e:	8b 4a 10             	mov    0x10(%edx),%ecx
80103981:	85 c9                	test   %ecx,%ecx
80103983:	74 eb                	je     80103970 <growproc+0x60>
			continue;
		if(p->pid == curproc->pid)
80103985:	3b 4b 10             	cmp    0x10(%ebx),%ecx
80103988:	75 e6                	jne    80103970 <growproc+0x60>
			p->sz = sz;
8010398a:	89 32                	mov    %esi,(%edx)
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  }

	acquire(&ptable.lock);
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
8010398c:	81 c2 98 01 00 00    	add    $0x198,%edx
80103992:	81 fa 54 a3 11 80    	cmp    $0x8011a354,%edx
80103998:	75 e4                	jne    8010397e <growproc+0x6e>
8010399a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
			continue;
		if(p->pid == curproc->pid)
			p->sz = sz;
	}

	release(&ptable.lock);
801039a0:	83 ec 0c             	sub    $0xc,%esp
801039a3:	68 20 3d 11 80       	push   $0x80113d20
801039a8:	e8 43 12 00 00       	call   80104bf0 <release>




  curproc->sz = sz;
801039ad:	89 33                	mov    %esi,(%ebx)
  switchuvm(curproc);
801039af:	89 1c 24             	mov    %ebx,(%esp)
801039b2:	e8 a9 37 00 00       	call   80107160 <switchuvm>
  return 0;
801039b7:	83 c4 10             	add    $0x10,%esp
801039ba:	31 c0                	xor    %eax,%eax
}
801039bc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801039bf:	5b                   	pop    %ebx
801039c0:	5e                   	pop    %esi
801039c1:	5f                   	pop    %edi
801039c2:	5d                   	pop    %ebp
801039c3:	c3                   	ret    

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
  } else if(n < 0){
801039c4:	74 92                	je     80103958 <growproc+0x48>
    if((sz = deallocuvm(curproc->pgdir, sz, sz + n)) == 0)
801039c6:	83 ec 04             	sub    $0x4,%esp
801039c9:	01 f7                	add    %esi,%edi
801039cb:	57                   	push   %edi
801039cc:	56                   	push   %esi
801039cd:	ff 73 04             	pushl  0x4(%ebx)
801039d0:	e8 db 3a 00 00       	call   801074b0 <deallocuvm>
801039d5:	83 c4 10             	add    $0x10,%esp
801039d8:	85 c0                	test   %eax,%eax
801039da:	89 c6                	mov    %eax,%esi
801039dc:	0f 85 76 ff ff ff    	jne    80103958 <growproc+0x48>
	struct proc *p;

  sz = curproc->sz;
  if(n > 0){
    if((sz = allocuvm(curproc->pgdir, sz, sz + n)) == 0)
      return -1;
801039e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801039e7:	eb d3                	jmp    801039bc <growproc+0xac>
801039e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

801039f0 <fork>:
// Create a new process copying p as the parent.
// Sets up stack to return as if from system call.
// Caller must set state of returned proc to RUNNABLE.
int
fork(void)
{
801039f0:	55                   	push   %ebp
801039f1:	89 e5                	mov    %esp,%ebp
801039f3:	57                   	push   %edi
801039f4:	56                   	push   %esi
801039f5:	53                   	push   %ebx
801039f6:	83 ec 1c             	sub    $0x1c,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
801039f9:	e8 62 10 00 00       	call   80104a60 <pushcli>
  c = mycpu();
801039fe:	e8 4d fd ff ff       	call   80103750 <mycpu>
  p = c->proc;
80103a03:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103a09:	e8 92 10 00 00       	call   80104aa0 <popcli>
  struct proc *np;
  struct proc *curproc = myproc();
	struct proc *p;

  // Allocate process.
  if((np = allocproc()) == 0){
80103a0e:	e8 dd fb ff ff       	call   801035f0 <allocproc>
80103a13:	85 c0                	test   %eax,%eax
80103a15:	89 c7                	mov    %eax,%edi
80103a17:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80103a1a:	0f 84 82 01 00 00    	je     80103ba2 <fork+0x1b2>
    return -1;
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
80103a20:	83 ec 08             	sub    $0x8,%esp
80103a23:	ff 33                	pushl  (%ebx)
80103a25:	ff 73 04             	pushl  0x4(%ebx)
80103a28:	e8 03 3c 00 00       	call   80107630 <copyuvm>
80103a2d:	83 c4 10             	add    $0x10,%esp
80103a30:	85 c0                	test   %eax,%eax
80103a32:	89 47 04             	mov    %eax,0x4(%edi)
80103a35:	0f 84 6e 01 00 00    	je     80103ba9 <fork+0x1b9>
    np->state = UNUSED;
    return -1;
  }
	//if(curproc->tid != 0) {
		//cprintf("thread making\n");
		acquire(&ptable.lock);
80103a3b:	83 ec 0c             	sub    $0xc,%esp
		for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103a3e:	be 54 3d 11 80       	mov    $0x80113d54,%esi
			if(curproc->pid == p->pid && curproc->tid != p->tid) {
				deallocuvm(np->pgdir, p->sva + 2*PGSIZE, p->sva);
				np->stacklist[np->end] = p->sva;
				np->end = (np->end+1) % (NPROC + 1);
80103a43:	bf 7f e0 07 7e       	mov    $0x7e07e07f,%edi
    np->state = UNUSED;
    return -1;
  }
	//if(curproc->tid != 0) {
		//cprintf("thread making\n");
		acquire(&ptable.lock);
80103a48:	68 20 3d 11 80       	push   $0x80113d20
80103a4d:	e8 ee 10 00 00       	call   80104b40 <acquire>
80103a52:	83 c4 10             	add    $0x10,%esp
80103a55:	eb 17                	jmp    80103a6e <fork+0x7e>
80103a57:	89 f6                	mov    %esi,%esi
80103a59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
		for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103a60:	81 c6 98 01 00 00    	add    $0x198,%esi
80103a66:	81 fe 54 a3 11 80    	cmp    $0x8011a354,%esi
80103a6c:	74 7a                	je     80103ae8 <fork+0xf8>
			if(curproc->pid == p->pid && curproc->tid != p->tid) {
80103a6e:	8b 46 10             	mov    0x10(%esi),%eax
80103a71:	39 43 10             	cmp    %eax,0x10(%ebx)
80103a74:	75 ea                	jne    80103a60 <fork+0x70>
80103a76:	8b 46 7c             	mov    0x7c(%esi),%eax
80103a79:	39 43 7c             	cmp    %eax,0x7c(%ebx)
80103a7c:	74 e2                	je     80103a60 <fork+0x70>
				deallocuvm(np->pgdir, p->sva + 2*PGSIZE, p->sva);
80103a7e:	8b 86 94 01 00 00    	mov    0x194(%esi),%eax
80103a84:	83 ec 04             	sub    $0x4,%esp
    return -1;
  }
	//if(curproc->tid != 0) {
		//cprintf("thread making\n");
		acquire(&ptable.lock);
		for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103a87:	81 c6 98 01 00 00    	add    $0x198,%esi
			if(curproc->pid == p->pid && curproc->tid != p->tid) {
				deallocuvm(np->pgdir, p->sva + 2*PGSIZE, p->sva);
80103a8d:	50                   	push   %eax
80103a8e:	05 00 20 00 00       	add    $0x2000,%eax
80103a93:	50                   	push   %eax
80103a94:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80103a97:	ff 70 04             	pushl  0x4(%eax)
80103a9a:	e8 11 3a 00 00       	call   801074b0 <deallocuvm>
				np->stacklist[np->end] = p->sva;
80103a9f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103aa2:	8b 56 fc             	mov    -0x4(%esi),%edx
				np->end = (np->end+1) % (NPROC + 1);
80103aa5:	83 c4 10             	add    $0x10,%esp
		//cprintf("thread making\n");
		acquire(&ptable.lock);
		for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
			if(curproc->pid == p->pid && curproc->tid != p->tid) {
				deallocuvm(np->pgdir, p->sva + 2*PGSIZE, p->sva);
				np->stacklist[np->end] = p->sva;
80103aa8:	8b 81 90 01 00 00    	mov    0x190(%ecx),%eax
80103aae:	89 94 81 88 00 00 00 	mov    %edx,0x88(%ecx,%eax,4)
				np->end = (np->end+1) % (NPROC + 1);
80103ab5:	8d 48 01             	lea    0x1(%eax),%ecx
80103ab8:	89 c8                	mov    %ecx,%eax
80103aba:	f7 ef                	imul   %edi
80103abc:	89 c8                	mov    %ecx,%eax
80103abe:	c1 f8 1f             	sar    $0x1f,%eax
80103ac1:	c1 fa 05             	sar    $0x5,%edx
80103ac4:	29 c2                	sub    %eax,%edx
80103ac6:	89 d0                	mov    %edx,%eax
80103ac8:	c1 e0 06             	shl    $0x6,%eax
80103acb:	01 c2                	add    %eax,%edx
80103acd:	89 c8                	mov    %ecx,%eax
80103acf:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80103ad2:	29 d0                	sub    %edx,%eax
    return -1;
  }
	//if(curproc->tid != 0) {
		//cprintf("thread making\n");
		acquire(&ptable.lock);
		for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103ad4:	81 fe 54 a3 11 80    	cmp    $0x8011a354,%esi
			if(curproc->pid == p->pid && curproc->tid != p->tid) {
				deallocuvm(np->pgdir, p->sva + 2*PGSIZE, p->sva);
				np->stacklist[np->end] = p->sva;
				np->end = (np->end+1) % (NPROC + 1);
80103ada:	89 81 90 01 00 00    	mov    %eax,0x190(%ecx)
    return -1;
  }
	//if(curproc->tid != 0) {
		//cprintf("thread making\n");
		acquire(&ptable.lock);
		for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103ae0:	75 8c                	jne    80103a6e <fork+0x7e>
80103ae2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
				deallocuvm(np->pgdir, p->sva + 2*PGSIZE, p->sva);
				np->stacklist[np->end] = p->sva;
				np->end = (np->end+1) % (NPROC + 1);
			}
		}
		release(&ptable.lock);
80103ae8:	83 ec 0c             	sub    $0xc,%esp
80103aeb:	68 20 3d 11 80       	push   $0x80113d20
80103af0:	e8 fb 10 00 00       	call   80104bf0 <release>
	//}
	np->sva = curproc->sva;
80103af5:	8b 83 94 01 00 00    	mov    0x194(%ebx),%eax
80103afb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;
80103afe:	b9 13 00 00 00       	mov    $0x13,%ecx

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
80103b03:	83 c4 10             	add    $0x10,%esp
				np->end = (np->end+1) % (NPROC + 1);
			}
		}
		release(&ptable.lock);
	//}
	np->sva = curproc->sva;
80103b06:	89 87 94 01 00 00    	mov    %eax,0x194(%edi)
  np->sz = curproc->sz;
80103b0c:	8b 03                	mov    (%ebx),%eax
  np->parent = curproc;
80103b0e:	89 5f 14             	mov    %ebx,0x14(%edi)
			}
		}
		release(&ptable.lock);
	//}
	np->sva = curproc->sva;
  np->sz = curproc->sz;
80103b11:	89 07                	mov    %eax,(%edi)
  np->parent = curproc;
  *np->tf = *curproc->tf;
80103b13:	89 f8                	mov    %edi,%eax
80103b15:	8b 73 18             	mov    0x18(%ebx),%esi
80103b18:	8b 7f 18             	mov    0x18(%edi),%edi
80103b1b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
80103b1d:	89 c7                	mov    %eax,%edi

  for(i = 0; i < NOFILE; i++)
80103b1f:	31 f6                	xor    %esi,%esi
  np->sz = curproc->sz;
  np->parent = curproc;
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;
80103b21:	8b 40 18             	mov    0x18(%eax),%eax
80103b24:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
80103b2b:	90                   	nop
80103b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
80103b30:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
80103b34:	85 c0                	test   %eax,%eax
80103b36:	74 10                	je     80103b48 <fork+0x158>
      np->ofile[i] = filedup(curproc->ofile[i]);
80103b38:	83 ec 0c             	sub    $0xc,%esp
80103b3b:	50                   	push   %eax
80103b3c:	e8 df d2 ff ff       	call   80100e20 <filedup>
80103b41:	83 c4 10             	add    $0x10,%esp
80103b44:	89 44 b7 28          	mov    %eax,0x28(%edi,%esi,4)
  *np->tf = *curproc->tf;

  // Clear %eax so that fork returns 0 in the child.
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
80103b48:	83 c6 01             	add    $0x1,%esi
80103b4b:	83 fe 10             	cmp    $0x10,%esi
80103b4e:	75 e0                	jne    80103b30 <fork+0x140>
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
80103b50:	83 ec 0c             	sub    $0xc,%esp
80103b53:	ff 73 68             	pushl  0x68(%ebx)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b56:	83 c3 6c             	add    $0x6c,%ebx
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
80103b59:	e8 22 db ff ff       	call   80101680 <idup>
80103b5e:	8b 7d e4             	mov    -0x1c(%ebp),%edi

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b61:	83 c4 0c             	add    $0xc,%esp
  np->tf->eax = 0;

  for(i = 0; i < NOFILE; i++)
    if(curproc->ofile[i])
      np->ofile[i] = filedup(curproc->ofile[i]);
  np->cwd = idup(curproc->cwd);
80103b64:	89 47 68             	mov    %eax,0x68(%edi)

  safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80103b67:	8d 47 6c             	lea    0x6c(%edi),%eax
80103b6a:	6a 10                	push   $0x10
80103b6c:	53                   	push   %ebx
80103b6d:	50                   	push   %eax
80103b6e:	e8 cd 12 00 00       	call   80104e40 <safestrcpy>

  pid = np->pid;
80103b73:	8b 5f 10             	mov    0x10(%edi),%ebx

  acquire(&ptable.lock);
80103b76:	c7 04 24 20 3d 11 80 	movl   $0x80113d20,(%esp)
80103b7d:	e8 be 0f 00 00       	call   80104b40 <acquire>

  np->state = RUNNABLE;
80103b82:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)

  release(&ptable.lock);
80103b89:	c7 04 24 20 3d 11 80 	movl   $0x80113d20,(%esp)
80103b90:	e8 5b 10 00 00       	call   80104bf0 <release>

  return pid;
80103b95:	83 c4 10             	add    $0x10,%esp
80103b98:	89 d8                	mov    %ebx,%eax
}
80103b9a:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103b9d:	5b                   	pop    %ebx
80103b9e:	5e                   	pop    %esi
80103b9f:	5f                   	pop    %edi
80103ba0:	5d                   	pop    %ebp
80103ba1:	c3                   	ret    
  struct proc *curproc = myproc();
	struct proc *p;

  // Allocate process.
  if((np = allocproc()) == 0){
    return -1;
80103ba2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103ba7:	eb f1                	jmp    80103b9a <fork+0x1aa>
  }

  // Copy process state from proc.
  if((np->pgdir = copyuvm(curproc->pgdir, curproc->sz)) == 0){
    kfree(np->kstack);
80103ba9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80103bac:	83 ec 0c             	sub    $0xc,%esp
80103baf:	ff 77 08             	pushl  0x8(%edi)
80103bb2:	e8 69 e7 ff ff       	call   80102320 <kfree>
    np->kstack = 0;
80103bb7:	c7 47 08 00 00 00 00 	movl   $0x0,0x8(%edi)
    np->state = UNUSED;
80103bbe:	c7 47 0c 00 00 00 00 	movl   $0x0,0xc(%edi)
    return -1;
80103bc5:	83 c4 10             	add    $0x10,%esp
80103bc8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80103bcd:	eb cb                	jmp    80103b9a <fork+0x1aa>
80103bcf:	90                   	nop

80103bd0 <scheduler>:
//  - swtch to start running that process
//  - eventually that process transfers control
//      via swtch back to the scheduler.
void
scheduler(void)
{
80103bd0:	55                   	push   %ebp
80103bd1:	89 e5                	mov    %esp,%ebp
80103bd3:	57                   	push   %edi
80103bd4:	56                   	push   %esi
80103bd5:	53                   	push   %ebx
80103bd6:	83 ec 0c             	sub    $0xc,%esp
  struct proc *p;
  struct cpu *c = mycpu();
80103bd9:	e8 72 fb ff ff       	call   80103750 <mycpu>
80103bde:	8d 78 04             	lea    0x4(%eax),%edi
80103be1:	89 c6                	mov    %eax,%esi
  c->proc = 0;
80103be3:	c7 80 ac 00 00 00 00 	movl   $0x0,0xac(%eax)
80103bea:	00 00 00 
80103bed:	8d 76 00             	lea    0x0(%esi),%esi
}

static inline void
sti(void)
{
  asm volatile("sti");
80103bf0:	fb                   	sti    
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103bf1:	83 ec 0c             	sub    $0xc,%esp
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103bf4:	bb 54 3d 11 80       	mov    $0x80113d54,%ebx
  for(;;){
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
80103bf9:	68 20 3d 11 80       	push   $0x80113d20
80103bfe:	e8 3d 0f 00 00       	call   80104b40 <acquire>
80103c03:	83 c4 10             	add    $0x10,%esp
80103c06:	eb 16                	jmp    80103c1e <scheduler+0x4e>
80103c08:	90                   	nop
80103c09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c10:	81 c3 98 01 00 00    	add    $0x198,%ebx
80103c16:	81 fb 54 a3 11 80    	cmp    $0x8011a354,%ebx
80103c1c:	74 52                	je     80103c70 <scheduler+0xa0>
      if(p->state != RUNNABLE)
80103c1e:	83 7b 0c 03          	cmpl   $0x3,0xc(%ebx)
80103c22:	75 ec                	jne    80103c10 <scheduler+0x40>
			///*
      //cprintf("scheduling process\n");
			//cprintf("pid : %d, tid : %d, sva : %d\n", p->pid, p->tid, p->sva);
			//*/

			switchuvm(p);
80103c24:	83 ec 0c             	sub    $0xc,%esp
        continue;

      // Switch to chosen process.  It is the process's job
      // to release ptable.lock and then reacquire it
      // before jumping back to us.
      c->proc = p;
80103c27:	89 9e ac 00 00 00    	mov    %ebx,0xac(%esi)
			///*
      //cprintf("scheduling process\n");
			//cprintf("pid : %d, tid : %d, sva : %d\n", p->pid, p->tid, p->sva);
			//*/

			switchuvm(p);
80103c2d:	53                   	push   %ebx
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c2e:	81 c3 98 01 00 00    	add    $0x198,%ebx
			///*
      //cprintf("scheduling process\n");
			//cprintf("pid : %d, tid : %d, sva : %d\n", p->pid, p->tid, p->sva);
			//*/

			switchuvm(p);
80103c34:	e8 27 35 00 00       	call   80107160 <switchuvm>
			//				,p->context->esi, p->context->ebx, p->context->ebp, p->context->eip);

			//cprintf("esp : %d, eip : %d\n", p->tf->esp, p->tf->eip);


      swtch(&(c->scheduler), p->context);
80103c39:	58                   	pop    %eax
80103c3a:	5a                   	pop    %edx
80103c3b:	ff b3 84 fe ff ff    	pushl  -0x17c(%ebx)
80103c41:	57                   	push   %edi
      //cprintf("scheduling process\n");
			//cprintf("pid : %d, tid : %d, sva : %d\n", p->pid, p->tid, p->sva);
			//*/

			switchuvm(p);
      p->state = RUNNING;
80103c42:	c7 83 74 fe ff ff 04 	movl   $0x4,-0x18c(%ebx)
80103c49:	00 00 00 
			//				,p->context->esi, p->context->ebx, p->context->ebp, p->context->eip);

			//cprintf("esp : %d, eip : %d\n", p->tf->esp, p->tf->eip);


      swtch(&(c->scheduler), p->context);
80103c4c:	e8 4a 12 00 00       	call   80104e9b <swtch>
      //cprintf("after switch\n");
			switchkvm();
80103c51:	e8 ea 34 00 00       	call   80107140 <switchkvm>
			
      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103c56:	83 c4 10             	add    $0x10,%esp
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c59:	81 fb 54 a3 11 80    	cmp    $0x8011a354,%ebx
      //cprintf("after switch\n");
			switchkvm();
			
      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
80103c5f:	c7 86 ac 00 00 00 00 	movl   $0x0,0xac(%esi)
80103c66:	00 00 00 
    // Enable interrupts on this processor.
    sti();

    // Loop over process table looking for process to run.
    acquire(&ptable.lock);
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103c69:	75 b3                	jne    80103c1e <scheduler+0x4e>
80103c6b:	90                   	nop
80103c6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
			
      // Process is done running for now.
      // It should have changed its p->state before coming back.
      c->proc = 0;
    }
    release(&ptable.lock);
80103c70:	83 ec 0c             	sub    $0xc,%esp
80103c73:	68 20 3d 11 80       	push   $0x80113d20
80103c78:	e8 73 0f 00 00       	call   80104bf0 <release>

  }
80103c7d:	83 c4 10             	add    $0x10,%esp
80103c80:	e9 6b ff ff ff       	jmp    80103bf0 <scheduler+0x20>
80103c85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103c90 <sched>:
// be proc->intena and proc->ncli, but that would
// break in the few places where a lock is held but
// there's no process.
void
sched(void)
{
80103c90:	55                   	push   %ebp
80103c91:	89 e5                	mov    %esp,%ebp
80103c93:	56                   	push   %esi
80103c94:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103c95:	e8 c6 0d 00 00       	call   80104a60 <pushcli>
  c = mycpu();
80103c9a:	e8 b1 fa ff ff       	call   80103750 <mycpu>
  p = c->proc;
80103c9f:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103ca5:	e8 f6 0d 00 00       	call   80104aa0 <popcli>
sched(void)
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
80103caa:	83 ec 0c             	sub    $0xc,%esp
80103cad:	68 20 3d 11 80       	push   $0x80113d20
80103cb2:	e8 59 0e 00 00       	call   80104b10 <holding>
80103cb7:	83 c4 10             	add    $0x10,%esp
80103cba:	85 c0                	test   %eax,%eax
80103cbc:	74 4f                	je     80103d0d <sched+0x7d>
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
80103cbe:	e8 8d fa ff ff       	call   80103750 <mycpu>
80103cc3:	83 b8 a4 00 00 00 01 	cmpl   $0x1,0xa4(%eax)
80103cca:	75 68                	jne    80103d34 <sched+0xa4>
    panic("sched locks");
  if(p->state == RUNNING)
80103ccc:	83 7b 0c 04          	cmpl   $0x4,0xc(%ebx)
80103cd0:	74 55                	je     80103d27 <sched+0x97>

static inline uint
readeflags(void)
{
  uint eflags;
  asm volatile("pushfl; popl %0" : "=r" (eflags));
80103cd2:	9c                   	pushf  
80103cd3:	58                   	pop    %eax
    panic("sched running");
  if(readeflags()&FL_IF)
80103cd4:	f6 c4 02             	test   $0x2,%ah
80103cd7:	75 41                	jne    80103d1a <sched+0x8a>
    panic("sched interruptible");
  intena = mycpu()->intena;
80103cd9:	e8 72 fa ff ff       	call   80103750 <mycpu>
  swtch(&p->context, mycpu()->scheduler);
80103cde:	83 c3 1c             	add    $0x1c,%ebx
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
80103ce1:	8b b0 a8 00 00 00    	mov    0xa8(%eax),%esi
  swtch(&p->context, mycpu()->scheduler);
80103ce7:	e8 64 fa ff ff       	call   80103750 <mycpu>
80103cec:	83 ec 08             	sub    $0x8,%esp
80103cef:	ff 70 04             	pushl  0x4(%eax)
80103cf2:	53                   	push   %ebx
80103cf3:	e8 a3 11 00 00       	call   80104e9b <swtch>
  mycpu()->intena = intena;
80103cf8:	e8 53 fa ff ff       	call   80103750 <mycpu>
}
80103cfd:	83 c4 10             	add    $0x10,%esp
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
  intena = mycpu()->intena;
  swtch(&p->context, mycpu()->scheduler);
  mycpu()->intena = intena;
80103d00:	89 b0 a8 00 00 00    	mov    %esi,0xa8(%eax)
}
80103d06:	8d 65 f8             	lea    -0x8(%ebp),%esp
80103d09:	5b                   	pop    %ebx
80103d0a:	5e                   	pop    %esi
80103d0b:	5d                   	pop    %ebp
80103d0c:	c3                   	ret    
{
  int intena;
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
80103d0d:	83 ec 0c             	sub    $0xc,%esp
80103d10:	68 b0 7d 10 80       	push   $0x80107db0
80103d15:	e8 56 c6 ff ff       	call   80100370 <panic>
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
  if(readeflags()&FL_IF)
    panic("sched interruptible");
80103d1a:	83 ec 0c             	sub    $0xc,%esp
80103d1d:	68 dc 7d 10 80       	push   $0x80107ddc
80103d22:	e8 49 c6 ff ff       	call   80100370 <panic>
  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
  if(p->state == RUNNING)
    panic("sched running");
80103d27:	83 ec 0c             	sub    $0xc,%esp
80103d2a:	68 ce 7d 10 80       	push   $0x80107dce
80103d2f:	e8 3c c6 ff ff       	call   80100370 <panic>
  struct proc *p = myproc();

  if(!holding(&ptable.lock))
    panic("sched ptable.lock");
  if(mycpu()->ncli != 1)
    panic("sched locks");
80103d34:	83 ec 0c             	sub    $0xc,%esp
80103d37:	68 c2 7d 10 80       	push   $0x80107dc2
80103d3c:	e8 2f c6 ff ff       	call   80100370 <panic>
80103d41:	eb 0d                	jmp    80103d50 <exit>
80103d43:	90                   	nop
80103d44:	90                   	nop
80103d45:	90                   	nop
80103d46:	90                   	nop
80103d47:	90                   	nop
80103d48:	90                   	nop
80103d49:	90                   	nop
80103d4a:	90                   	nop
80103d4b:	90                   	nop
80103d4c:	90                   	nop
80103d4d:	90                   	nop
80103d4e:	90                   	nop
80103d4f:	90                   	nop

80103d50 <exit>:
// Exit the current process.  Does not return.
// An exited process remains in the zombie state
// until its parent calls wait() to find out it exited.
void
exit(void)
{
80103d50:	55                   	push   %ebp
80103d51:	89 e5                	mov    %esp,%ebp
80103d53:	57                   	push   %edi
80103d54:	56                   	push   %esi
80103d55:	53                   	push   %ebx
80103d56:	83 ec 0c             	sub    $0xc,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103d59:	e8 02 0d 00 00       	call   80104a60 <pushcli>
  c = mycpu();
80103d5e:	e8 ed f9 ff ff       	call   80103750 <mycpu>
  p = c->proc;
80103d63:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80103d69:	e8 32 0d 00 00       	call   80104aa0 <popcli>
{
  struct proc *curproc = myproc();
  struct proc *p;
	//struct proc *manager = curproc->manager;
  int fd;
  if(curproc == initproc)
80103d6e:	39 35 b8 b5 10 80    	cmp    %esi,0x8010b5b8
80103d74:	0f 84 77 01 00 00    	je     80103ef1 <exit+0x1a1>
    panic("init exiting");
	
	acquire(&ptable.lock);
80103d7a:	83 ec 0c             	sub    $0xc,%esp
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103d7d:	bb 54 3d 11 80       	mov    $0x80113d54,%ebx
	//struct proc *manager = curproc->manager;
  int fd;
  if(curproc == initproc)
    panic("init exiting");
	
	acquire(&ptable.lock);
80103d82:	68 20 3d 11 80       	push   $0x80113d20
80103d87:	e8 b4 0d 00 00       	call   80104b40 <acquire>
80103d8c:	83 c4 10             	add    $0x10,%esp
80103d8f:	90                   	nop
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
		//cprintf("pid : %d\n", p->pid);
		//cprintf("tid : %d\n", p->tid);
		if(p->pid == curproc->pid && p != curproc) {
80103d90:	8b 46 10             	mov    0x10(%esi),%eax
80103d93:	39 43 10             	cmp    %eax,0x10(%ebx)
80103d96:	75 39                	jne    80103dd1 <exit+0x81>
80103d98:	39 de                	cmp    %ebx,%esi
80103d9a:	74 35                	je     80103dd1 <exit+0x81>
			//cprintf("clean...\n");
			kfree(p->kstack);
80103d9c:	83 ec 0c             	sub    $0xc,%esp
80103d9f:	ff 73 08             	pushl  0x8(%ebx)
80103da2:	e8 79 e5 ff ff       	call   80102320 <kfree>
			p->kstack = 0;
80103da7:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
			p->pid = 0;
80103dae:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
			p->parent = 0;
			p->name[0] = 0;
			p->killed = 0;
			p->state = UNUSED;
80103db5:	83 c4 10             	add    $0x10,%esp
		if(p->pid == curproc->pid && p != curproc) {
			//cprintf("clean...\n");
			kfree(p->kstack);
			p->kstack = 0;
			p->pid = 0;
			p->parent = 0;
80103db8:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
			p->name[0] = 0;
80103dbf:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
			p->killed = 0;
80103dc3:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
			p->state = UNUSED;
80103dca:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
  int fd;
  if(curproc == initproc)
    panic("init exiting");
	
	acquire(&ptable.lock);
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80103dd1:	81 c3 98 01 00 00    	add    $0x198,%ebx
80103dd7:	81 fb 54 a3 11 80    	cmp    $0x8011a354,%ebx
80103ddd:	75 b1                	jne    80103d90 <exit+0x40>
			p->name[0] = 0;
			p->killed = 0;
			p->state = UNUSED;
		}
	}
	release(&ptable.lock);
80103ddf:	83 ec 0c             	sub    $0xc,%esp
80103de2:	8d 5e 28             	lea    0x28(%esi),%ebx
80103de5:	8d 7e 68             	lea    0x68(%esi),%edi
80103de8:	68 20 3d 11 80       	push   $0x80113d20
80103ded:	e8 fe 0d 00 00       	call   80104bf0 <release>
80103df2:	83 c4 10             	add    $0x10,%esp
80103df5:	8d 76 00             	lea    0x0(%esi),%esi
	
	//cprintf("in exit2\n");
  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
    if(curproc->ofile[fd]){
80103df8:	8b 03                	mov    (%ebx),%eax
80103dfa:	85 c0                	test   %eax,%eax
80103dfc:	74 12                	je     80103e10 <exit+0xc0>
      fileclose(curproc->ofile[fd]);
80103dfe:	83 ec 0c             	sub    $0xc,%esp
80103e01:	50                   	push   %eax
80103e02:	e8 69 d0 ff ff       	call   80100e70 <fileclose>
      curproc->ofile[fd] = 0;
80103e07:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80103e0d:	83 c4 10             	add    $0x10,%esp
80103e10:	83 c3 04             	add    $0x4,%ebx
	}
	release(&ptable.lock);
	
	//cprintf("in exit2\n");
  // Close all open files.
  for(fd = 0; fd < NOFILE; fd++){
80103e13:	39 fb                	cmp    %edi,%ebx
80103e15:	75 e1                	jne    80103df8 <exit+0xa8>
      fileclose(curproc->ofile[fd]);
      curproc->ofile[fd] = 0;
    }
  }
	//cprintf("in exit3\n");
  begin_op();
80103e17:	e8 74 ed ff ff       	call   80102b90 <begin_op>
  iput(curproc->cwd);
80103e1c:	83 ec 0c             	sub    $0xc,%esp
80103e1f:	ff 76 68             	pushl  0x68(%esi)
80103e22:	e8 b9 d9 ff ff       	call   801017e0 <iput>
  end_op();
80103e27:	e8 d4 ed ff ff       	call   80102c00 <end_op>
  curproc->cwd = 0;
80103e2c:	c7 46 68 00 00 00 00 	movl   $0x0,0x68(%esi)

  acquire(&ptable.lock);
80103e33:	c7 04 24 20 3d 11 80 	movl   $0x80113d20,(%esp)
80103e3a:	e8 01 0d 00 00       	call   80104b40 <acquire>

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);
80103e3f:	8b 56 14             	mov    0x14(%esi),%edx
80103e42:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e45:	b8 54 3d 11 80       	mov    $0x80113d54,%eax
80103e4a:	eb 10                	jmp    80103e5c <exit+0x10c>
80103e4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80103e50:	05 98 01 00 00       	add    $0x198,%eax
80103e55:	3d 54 a3 11 80       	cmp    $0x8011a354,%eax
80103e5a:	74 1e                	je     80103e7a <exit+0x12a>
    if(p->state == SLEEPING && p->chan == chan)
80103e5c:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103e60:	75 ee                	jne    80103e50 <exit+0x100>
80103e62:	3b 50 20             	cmp    0x20(%eax),%edx
80103e65:	75 e9                	jne    80103e50 <exit+0x100>
      p->state = RUNNABLE;
80103e67:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103e6e:	05 98 01 00 00       	add    $0x198,%eax
80103e73:	3d 54 a3 11 80       	cmp    $0x8011a354,%eax
80103e78:	75 e2                	jne    80103e5c <exit+0x10c>
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103e7a:	8b 0d b8 b5 10 80    	mov    0x8010b5b8,%ecx
80103e80:	ba 54 3d 11 80       	mov    $0x80113d54,%edx
80103e85:	eb 17                	jmp    80103e9e <exit+0x14e>
80103e87:	89 f6                	mov    %esi,%esi
80103e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  // Parent might be sleeping in wait().
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80103e90:	81 c2 98 01 00 00    	add    $0x198,%edx
80103e96:	81 fa 54 a3 11 80    	cmp    $0x8011a354,%edx
80103e9c:	74 3a                	je     80103ed8 <exit+0x188>
    if(p->parent == curproc){
80103e9e:	39 72 14             	cmp    %esi,0x14(%edx)
80103ea1:	75 ed                	jne    80103e90 <exit+0x140>
      p->parent = initproc;
      if(p->state == ZOMBIE)
80103ea3:	83 7a 0c 05          	cmpl   $0x5,0xc(%edx)
  wakeup1(curproc->parent);

  // Pass abandoned children to init.
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->parent == curproc){
      p->parent = initproc;
80103ea7:	89 4a 14             	mov    %ecx,0x14(%edx)
      if(p->state == ZOMBIE)
80103eaa:	75 e4                	jne    80103e90 <exit+0x140>
80103eac:	b8 54 3d 11 80       	mov    $0x80113d54,%eax
80103eb1:	eb 11                	jmp    80103ec4 <exit+0x174>
80103eb3:	90                   	nop
80103eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80103eb8:	05 98 01 00 00       	add    $0x198,%eax
80103ebd:	3d 54 a3 11 80       	cmp    $0x8011a354,%eax
80103ec2:	74 cc                	je     80103e90 <exit+0x140>
    if(p->state == SLEEPING && p->chan == chan)
80103ec4:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80103ec8:	75 ee                	jne    80103eb8 <exit+0x168>
80103eca:	3b 48 20             	cmp    0x20(%eax),%ecx
80103ecd:	75 e9                	jne    80103eb8 <exit+0x168>
      p->state = RUNNABLE;
80103ecf:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
80103ed6:	eb e0                	jmp    80103eb8 <exit+0x168>
        wakeup1(initproc);
    }
  }
	//cprintf("in exit5\n");
  // Jump into the scheduler, never to return.
  curproc->state = ZOMBIE;
80103ed8:	c7 46 0c 05 00 00 00 	movl   $0x5,0xc(%esi)
  sched();
80103edf:	e8 ac fd ff ff       	call   80103c90 <sched>
  panic("zombie exit");
80103ee4:	83 ec 0c             	sub    $0xc,%esp
80103ee7:	68 fd 7d 10 80       	push   $0x80107dfd
80103eec:	e8 7f c4 ff ff       	call   80100370 <panic>
  struct proc *curproc = myproc();
  struct proc *p;
	//struct proc *manager = curproc->manager;
  int fd;
  if(curproc == initproc)
    panic("init exiting");
80103ef1:	83 ec 0c             	sub    $0xc,%esp
80103ef4:	68 f0 7d 10 80       	push   $0x80107df0
80103ef9:	e8 72 c4 ff ff       	call   80100370 <panic>
80103efe:	66 90                	xchg   %ax,%ax

80103f00 <yield>:
}

// Give up the CPU for one scheduling round.
void
yield(void)
{
80103f00:	55                   	push   %ebp
80103f01:	89 e5                	mov    %esp,%ebp
80103f03:	53                   	push   %ebx
80103f04:	83 ec 10             	sub    $0x10,%esp
  acquire(&ptable.lock);  //DOC: yieldlock
80103f07:	68 20 3d 11 80       	push   $0x80113d20
80103f0c:	e8 2f 0c 00 00       	call   80104b40 <acquire>
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103f11:	e8 4a 0b 00 00       	call   80104a60 <pushcli>
  c = mycpu();
80103f16:	e8 35 f8 ff ff       	call   80103750 <mycpu>
  p = c->proc;
80103f1b:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103f21:	e8 7a 0b 00 00       	call   80104aa0 <popcli>
// Give up the CPU for one scheduling round.
void
yield(void)
{
  acquire(&ptable.lock);  //DOC: yieldlock
  myproc()->state = RUNNABLE;
80103f26:	c7 43 0c 03 00 00 00 	movl   $0x3,0xc(%ebx)
  sched();
80103f2d:	e8 5e fd ff ff       	call   80103c90 <sched>
  release(&ptable.lock);
80103f32:	c7 04 24 20 3d 11 80 	movl   $0x80113d20,(%esp)
80103f39:	e8 b2 0c 00 00       	call   80104bf0 <release>
}
80103f3e:	83 c4 10             	add    $0x10,%esp
80103f41:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80103f44:	c9                   	leave  
80103f45:	c3                   	ret    
80103f46:	8d 76 00             	lea    0x0(%esi),%esi
80103f49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80103f50 <sleep>:

// Atomically release lock and sleep on chan.
// Reacquires lock when awakened.
void
sleep(void *chan, struct spinlock *lk)
{
80103f50:	55                   	push   %ebp
80103f51:	89 e5                	mov    %esp,%ebp
80103f53:	57                   	push   %edi
80103f54:	56                   	push   %esi
80103f55:	53                   	push   %ebx
80103f56:	83 ec 0c             	sub    $0xc,%esp
80103f59:	8b 7d 08             	mov    0x8(%ebp),%edi
80103f5c:	8b 75 0c             	mov    0xc(%ebp),%esi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80103f5f:	e8 fc 0a 00 00       	call   80104a60 <pushcli>
  c = mycpu();
80103f64:	e8 e7 f7 ff ff       	call   80103750 <mycpu>
  p = c->proc;
80103f69:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80103f6f:	e8 2c 0b 00 00       	call   80104aa0 <popcli>
void
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
80103f74:	85 db                	test   %ebx,%ebx
80103f76:	0f 84 87 00 00 00    	je     80104003 <sleep+0xb3>
    panic("sleep");

  if(lk == 0)
80103f7c:	85 f6                	test   %esi,%esi
80103f7e:	74 76                	je     80103ff6 <sleep+0xa6>
  // change p->state and then call sched.
  // Once we hold ptable.lock, we can be
  // guaranteed that we won't miss any wakeup
  // (wakeup runs with ptable.lock locked),
  // so it's okay to release lk.
  if(lk != &ptable.lock){  //DOC: sleeplock0
80103f80:	81 fe 20 3d 11 80    	cmp    $0x80113d20,%esi
80103f86:	74 50                	je     80103fd8 <sleep+0x88>
    acquire(&ptable.lock);  //DOC: sleeplock1
80103f88:	83 ec 0c             	sub    $0xc,%esp
80103f8b:	68 20 3d 11 80       	push   $0x80113d20
80103f90:	e8 ab 0b 00 00       	call   80104b40 <acquire>
    release(lk);
80103f95:	89 34 24             	mov    %esi,(%esp)
80103f98:	e8 53 0c 00 00       	call   80104bf0 <release>
  }
  // Go to sleep.
  p->chan = chan;
80103f9d:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103fa0:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103fa7:	e8 e4 fc ff ff       	call   80103c90 <sched>

  // Tidy up.
  p->chan = 0;
80103fac:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
80103fb3:	c7 04 24 20 3d 11 80 	movl   $0x80113d20,(%esp)
80103fba:	e8 31 0c 00 00       	call   80104bf0 <release>
    acquire(lk);
80103fbf:	89 75 08             	mov    %esi,0x8(%ebp)
80103fc2:	83 c4 10             	add    $0x10,%esp
  }
}
80103fc5:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103fc8:	5b                   	pop    %ebx
80103fc9:	5e                   	pop    %esi
80103fca:	5f                   	pop    %edi
80103fcb:	5d                   	pop    %ebp
  p->chan = 0;

  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
80103fcc:	e9 6f 0b 00 00       	jmp    80104b40 <acquire>
80103fd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  if(lk != &ptable.lock){  //DOC: sleeplock0
    acquire(&ptable.lock);  //DOC: sleeplock1
    release(lk);
  }
  // Go to sleep.
  p->chan = chan;
80103fd8:	89 7b 20             	mov    %edi,0x20(%ebx)
  p->state = SLEEPING;
80103fdb:	c7 43 0c 02 00 00 00 	movl   $0x2,0xc(%ebx)

  sched();
80103fe2:	e8 a9 fc ff ff       	call   80103c90 <sched>

  // Tidy up.
  p->chan = 0;
80103fe7:	c7 43 20 00 00 00 00 	movl   $0x0,0x20(%ebx)
  // Reacquire original lock.
  if(lk != &ptable.lock){  //DOC: sleeplock2
    release(&ptable.lock);
    acquire(lk);
  }
}
80103fee:	8d 65 f4             	lea    -0xc(%ebp),%esp
80103ff1:	5b                   	pop    %ebx
80103ff2:	5e                   	pop    %esi
80103ff3:	5f                   	pop    %edi
80103ff4:	5d                   	pop    %ebp
80103ff5:	c3                   	ret    
  
  if(p == 0)
    panic("sleep");

  if(lk == 0)
    panic("sleep without lk");
80103ff6:	83 ec 0c             	sub    $0xc,%esp
80103ff9:	68 0f 7e 10 80       	push   $0x80107e0f
80103ffe:	e8 6d c3 ff ff       	call   80100370 <panic>
sleep(void *chan, struct spinlock *lk)
{
  struct proc *p = myproc();
  
  if(p == 0)
    panic("sleep");
80104003:	83 ec 0c             	sub    $0xc,%esp
80104006:	68 09 7e 10 80       	push   $0x80107e09
8010400b:	e8 60 c3 ff ff       	call   80100370 <panic>

80104010 <wait>:

// Wait for a child process to exit and return its pid.
// Return -1 if this process has no children.
int
wait(void)
{
80104010:	55                   	push   %ebp
80104011:	89 e5                	mov    %esp,%ebp
80104013:	56                   	push   %esi
80104014:	53                   	push   %ebx
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
80104015:	e8 46 0a 00 00       	call   80104a60 <pushcli>
  c = mycpu();
8010401a:	e8 31 f7 ff ff       	call   80103750 <mycpu>
  p = c->proc;
8010401f:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
80104025:	e8 76 0a 00 00       	call   80104aa0 <popcli>
{
  struct proc *p;
  int havekids, pid;
  struct proc *curproc = myproc();
  
  acquire(&ptable.lock);
8010402a:	83 ec 0c             	sub    $0xc,%esp
8010402d:	68 20 3d 11 80       	push   $0x80113d20
80104032:	e8 09 0b 00 00       	call   80104b40 <acquire>
80104037:	83 c4 10             	add    $0x10,%esp
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
8010403a:	31 c0                	xor    %eax,%eax
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010403c:	bb 54 3d 11 80       	mov    $0x80113d54,%ebx
80104041:	eb 13                	jmp    80104056 <wait+0x46>
80104043:	90                   	nop
80104044:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104048:	81 c3 98 01 00 00    	add    $0x198,%ebx
8010404e:	81 fb 54 a3 11 80    	cmp    $0x8011a354,%ebx
80104054:	74 22                	je     80104078 <wait+0x68>
      if(p->parent != curproc)
80104056:	39 73 14             	cmp    %esi,0x14(%ebx)
80104059:	75 ed                	jne    80104048 <wait+0x38>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
8010405b:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
8010405f:	74 35                	je     80104096 <wait+0x86>
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104061:	81 c3 98 01 00 00    	add    $0x198,%ebx
      if(p->parent != curproc)
        continue;
      havekids = 1;
80104067:	b8 01 00 00 00       	mov    $0x1,%eax
  
  acquire(&ptable.lock);
  for(;;){
    // Scan through table looking for exited children.
    havekids = 0;
    for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010406c:	81 fb 54 a3 11 80    	cmp    $0x8011a354,%ebx
80104072:	75 e2                	jne    80104056 <wait+0x46>
80104074:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        return pid;
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
80104078:	85 c0                	test   %eax,%eax
8010407a:	74 70                	je     801040ec <wait+0xdc>
8010407c:	8b 46 24             	mov    0x24(%esi),%eax
8010407f:	85 c0                	test   %eax,%eax
80104081:	75 69                	jne    801040ec <wait+0xdc>
      release(&ptable.lock);
      return -1;
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
80104083:	83 ec 08             	sub    $0x8,%esp
80104086:	68 20 3d 11 80       	push   $0x80113d20
8010408b:	56                   	push   %esi
8010408c:	e8 bf fe ff ff       	call   80103f50 <sleep>
  }
80104091:	83 c4 10             	add    $0x10,%esp
80104094:	eb a4                	jmp    8010403a <wait+0x2a>
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
80104096:	83 ec 0c             	sub    $0xc,%esp
80104099:	ff 73 08             	pushl  0x8(%ebx)
      if(p->parent != curproc)
        continue;
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
8010409c:	8b 73 10             	mov    0x10(%ebx),%esi
        kfree(p->kstack);
8010409f:	e8 7c e2 ff ff       	call   80102320 <kfree>
        p->kstack = 0;
        freevm(p->pgdir);
801040a4:	5a                   	pop    %edx
801040a5:	ff 73 04             	pushl  0x4(%ebx)
      havekids = 1;
      if(p->state == ZOMBIE){
        // Found one.
        pid = p->pid;
        kfree(p->kstack);
        p->kstack = 0;
801040a8:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
        freevm(p->pgdir);
801040af:	e8 2c 34 00 00       	call   801074e0 <freevm>
        p->pid = 0;
801040b4:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
        p->parent = 0;
801040bb:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
        p->name[0] = 0;
801040c2:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
        p->killed = 0;
801040c6:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
        p->state = UNUSED;
801040cd:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
        release(&ptable.lock);
801040d4:	c7 04 24 20 3d 11 80 	movl   $0x80113d20,(%esp)
801040db:	e8 10 0b 00 00       	call   80104bf0 <release>
        return pid;
801040e0:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
801040e3:	8d 65 f8             	lea    -0x8(%ebp),%esp
        p->parent = 0;
        p->name[0] = 0;
        p->killed = 0;
        p->state = UNUSED;
        release(&ptable.lock);
        return pid;
801040e6:	89 f0                	mov    %esi,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
801040e8:	5b                   	pop    %ebx
801040e9:	5e                   	pop    %esi
801040ea:	5d                   	pop    %ebp
801040eb:	c3                   	ret    
      }
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
801040ec:	83 ec 0c             	sub    $0xc,%esp
801040ef:	68 20 3d 11 80       	push   $0x80113d20
801040f4:	e8 f7 0a 00 00       	call   80104bf0 <release>
      return -1;
801040f9:	83 c4 10             	add    $0x10,%esp
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
801040fc:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }

    // No point waiting if we don't have any children.
    if(!havekids || curproc->killed){
      release(&ptable.lock);
      return -1;
801040ff:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }

    // Wait for children to exit.  (See wakeup1 call in proc_exit.)
    sleep(curproc, &ptable.lock);  //DOC: wait-sleep
  }
}
80104104:	5b                   	pop    %ebx
80104105:	5e                   	pop    %esi
80104106:	5d                   	pop    %ebp
80104107:	c3                   	ret    
80104108:	90                   	nop
80104109:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104110 <wakeup>:
}

// Wake up all processes sleeping on chan.
void
wakeup(void *chan)
{
80104110:	55                   	push   %ebp
80104111:	89 e5                	mov    %esp,%ebp
80104113:	53                   	push   %ebx
80104114:	83 ec 10             	sub    $0x10,%esp
80104117:	8b 5d 08             	mov    0x8(%ebp),%ebx
  acquire(&ptable.lock);
8010411a:	68 20 3d 11 80       	push   $0x80113d20
8010411f:	e8 1c 0a 00 00       	call   80104b40 <acquire>
80104124:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
80104127:	b8 54 3d 11 80       	mov    $0x80113d54,%eax
8010412c:	eb 0e                	jmp    8010413c <wakeup+0x2c>
8010412e:	66 90                	xchg   %ax,%ax
80104130:	05 98 01 00 00       	add    $0x198,%eax
80104135:	3d 54 a3 11 80       	cmp    $0x8011a354,%eax
8010413a:	74 1e                	je     8010415a <wakeup+0x4a>
    if(p->state == SLEEPING && p->chan == chan)
8010413c:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80104140:	75 ee                	jne    80104130 <wakeup+0x20>
80104142:	3b 58 20             	cmp    0x20(%eax),%ebx
80104145:	75 e9                	jne    80104130 <wakeup+0x20>
      p->state = RUNNABLE;
80104147:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010414e:	05 98 01 00 00       	add    $0x198,%eax
80104153:	3d 54 a3 11 80       	cmp    $0x8011a354,%eax
80104158:	75 e2                	jne    8010413c <wakeup+0x2c>
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
8010415a:	c7 45 08 20 3d 11 80 	movl   $0x80113d20,0x8(%ebp)
}
80104161:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104164:	c9                   	leave  
void
wakeup(void *chan)
{
  acquire(&ptable.lock);
  wakeup1(chan);
  release(&ptable.lock);
80104165:	e9 86 0a 00 00       	jmp    80104bf0 <release>
8010416a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104170 <kill>:
// Kill the process with the given pid.
// Process won't exit until it returns
// to user space (see trap in trap.c).
int
kill(int pid)
{
80104170:	55                   	push   %ebp
80104171:	89 e5                	mov    %esp,%ebp
80104173:	53                   	push   %ebx
80104174:	83 ec 10             	sub    $0x10,%esp
80104177:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct proc *p;

  acquire(&ptable.lock);
8010417a:	68 20 3d 11 80       	push   $0x80113d20
8010417f:	e8 bc 09 00 00       	call   80104b40 <acquire>
80104184:	83 c4 10             	add    $0x10,%esp
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104187:	b8 54 3d 11 80       	mov    $0x80113d54,%eax
8010418c:	eb 0e                	jmp    8010419c <kill+0x2c>
8010418e:	66 90                	xchg   %ax,%ax
80104190:	05 98 01 00 00       	add    $0x198,%eax
80104195:	3d 54 a3 11 80       	cmp    $0x8011a354,%eax
8010419a:	74 3c                	je     801041d8 <kill+0x68>
    if(p->pid == pid){
8010419c:	39 58 10             	cmp    %ebx,0x10(%eax)
8010419f:	75 ef                	jne    80104190 <kill+0x20>
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
801041a1:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
  struct proc *p;

  acquire(&ptable.lock);
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
801041a5:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
801041ac:	74 1a                	je     801041c8 <kill+0x58>
        p->state = RUNNABLE;
      release(&ptable.lock);
801041ae:	83 ec 0c             	sub    $0xc,%esp
801041b1:	68 20 3d 11 80       	push   $0x80113d20
801041b6:	e8 35 0a 00 00       	call   80104bf0 <release>
      return 0;
801041bb:	83 c4 10             	add    $0x10,%esp
801041be:	31 c0                	xor    %eax,%eax
    }
  }
  release(&ptable.lock);
  return -1;
}
801041c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801041c3:	c9                   	leave  
801041c4:	c3                   	ret    
801041c5:	8d 76 00             	lea    0x0(%esi),%esi
  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->pid == pid){
      p->killed = 1;
      // Wake process from sleep if necessary.
      if(p->state == SLEEPING)
        p->state = RUNNABLE;
801041c8:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801041cf:	eb dd                	jmp    801041ae <kill+0x3e>
801041d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      release(&ptable.lock);
      return 0;
    }
  }
  release(&ptable.lock);
801041d8:	83 ec 0c             	sub    $0xc,%esp
801041db:	68 20 3d 11 80       	push   $0x80113d20
801041e0:	e8 0b 0a 00 00       	call   80104bf0 <release>
  return -1;
801041e5:	83 c4 10             	add    $0x10,%esp
801041e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801041ed:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801041f0:	c9                   	leave  
801041f1:	c3                   	ret    
801041f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801041f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104200 <procdump>:
// Print a process listing to console.  For debugging.
// Runs when user types ^P on console.
// No lock to avoid wedging a stuck machine further.
void
procdump(void)
{
80104200:	55                   	push   %ebp
80104201:	89 e5                	mov    %esp,%ebp
80104203:	57                   	push   %edi
80104204:	56                   	push   %esi
80104205:	53                   	push   %ebx
80104206:	8d 75 e8             	lea    -0x18(%ebp),%esi
80104209:	bb c0 3d 11 80       	mov    $0x80113dc0,%ebx
8010420e:	83 ec 3c             	sub    $0x3c,%esp
80104211:	eb 27                	jmp    8010423a <procdump+0x3a>
80104213:	90                   	nop
80104214:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
80104218:	83 ec 0c             	sub    $0xc,%esp
8010421b:	68 e7 81 10 80       	push   $0x801081e7
80104220:	e8 3b c4 ff ff       	call   80100660 <cprintf>
80104225:	83 c4 10             	add    $0x10,%esp
80104228:	81 c3 98 01 00 00    	add    $0x198,%ebx
  int i;
  struct proc *p;
  char *state;
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010422e:	81 fb c0 a3 11 80    	cmp    $0x8011a3c0,%ebx
80104234:	0f 84 7e 00 00 00    	je     801042b8 <procdump+0xb8>
    if(p->state == UNUSED)
8010423a:	8b 43 a0             	mov    -0x60(%ebx),%eax
8010423d:	85 c0                	test   %eax,%eax
8010423f:	74 e7                	je     80104228 <procdump+0x28>
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104241:	83 f8 05             	cmp    $0x5,%eax
      state = states[p->state];
    else
      state = "???";
80104244:	ba 20 7e 10 80       	mov    $0x80107e20,%edx
  uint pc[10];

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
    if(p->state == UNUSED)
      continue;
    if(p->state >= 0 && p->state < NELEM(states) && states[p->state])
80104249:	77 11                	ja     8010425c <procdump+0x5c>
8010424b:	8b 14 85 d0 7e 10 80 	mov    -0x7fef8130(,%eax,4),%edx
      state = states[p->state];
    else
      state = "???";
80104252:	b8 20 7e 10 80       	mov    $0x80107e20,%eax
80104257:	85 d2                	test   %edx,%edx
80104259:	0f 44 d0             	cmove  %eax,%edx
    cprintf("%d %s %s", p->pid, state, p->name);
8010425c:	53                   	push   %ebx
8010425d:	52                   	push   %edx
8010425e:	ff 73 a4             	pushl  -0x5c(%ebx)
80104261:	68 24 7e 10 80       	push   $0x80107e24
80104266:	e8 f5 c3 ff ff       	call   80100660 <cprintf>
    if(p->state == SLEEPING){
8010426b:	83 c4 10             	add    $0x10,%esp
8010426e:	83 7b a0 02          	cmpl   $0x2,-0x60(%ebx)
80104272:	75 a4                	jne    80104218 <procdump+0x18>
      getcallerpcs((uint*)p->context->ebp+2, pc);
80104274:	8d 45 c0             	lea    -0x40(%ebp),%eax
80104277:	83 ec 08             	sub    $0x8,%esp
8010427a:	8d 7d c0             	lea    -0x40(%ebp),%edi
8010427d:	50                   	push   %eax
8010427e:	8b 43 b0             	mov    -0x50(%ebx),%eax
80104281:	8b 40 0c             	mov    0xc(%eax),%eax
80104284:	83 c0 08             	add    $0x8,%eax
80104287:	50                   	push   %eax
80104288:	e8 73 07 00 00       	call   80104a00 <getcallerpcs>
8010428d:	83 c4 10             	add    $0x10,%esp
      for(i=0; i<10 && pc[i] != 0; i++)
80104290:	8b 17                	mov    (%edi),%edx
80104292:	85 d2                	test   %edx,%edx
80104294:	74 82                	je     80104218 <procdump+0x18>
        cprintf(" %p", pc[i]);
80104296:	83 ec 08             	sub    $0x8,%esp
80104299:	83 c7 04             	add    $0x4,%edi
8010429c:	52                   	push   %edx
8010429d:	68 61 78 10 80       	push   $0x80107861
801042a2:	e8 b9 c3 ff ff       	call   80100660 <cprintf>
    else
      state = "???";
    cprintf("%d %s %s", p->pid, state, p->name);
    if(p->state == SLEEPING){
      getcallerpcs((uint*)p->context->ebp+2, pc);
      for(i=0; i<10 && pc[i] != 0; i++)
801042a7:	83 c4 10             	add    $0x10,%esp
801042aa:	39 f7                	cmp    %esi,%edi
801042ac:	75 e2                	jne    80104290 <procdump+0x90>
801042ae:	e9 65 ff ff ff       	jmp    80104218 <procdump+0x18>
801042b3:	90                   	nop
801042b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        cprintf(" %p", pc[i]);
    }
    cprintf("\n");
  }
}
801042b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801042bb:	5b                   	pop    %ebx
801042bc:	5e                   	pop    %esi
801042bd:	5f                   	pop    %edi
801042be:	5d                   	pop    %ebp
801042bf:	c3                   	ret    

801042c0 <thread_create>:

int
thread_create(thread_t *thread, void* (*start_routine)(void *), void *arg)
{ 
801042c0:	55                   	push   %ebp
801042c1:	89 e5                	mov    %esp,%ebp
801042c3:	57                   	push   %edi
801042c4:	56                   	push   %esi
801042c5:	53                   	push   %ebx
801042c6:	83 ec 2c             	sub    $0x2c,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
801042c9:	e8 92 07 00 00       	call   80104a60 <pushcli>
  c = mycpu();
801042ce:	e8 7d f4 ff ff       	call   80103750 <mycpu>
  p = c->proc;
801042d3:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
801042d9:	e8 c2 07 00 00       	call   80104aa0 <popcli>
	struct proc *np;
	struct proc *curproc = myproc();

	//cprintf("create\n");

	if(curproc->manager != curproc) {
801042de:	8b 9e 80 00 00 00    	mov    0x80(%esi),%ebx
801042e4:	39 f3                	cmp    %esi,%ebx
801042e6:	0f 85 db 01 00 00    	jne    801044c7 <thread_create+0x207>

	//////////////////////////////
	//
	// fork part
	//
	if((np = allocproc()) == 0) {
801042ec:	e8 ff f2 ff ff       	call   801035f0 <allocproc>
801042f1:	85 c0                	test   %eax,%eax
801042f3:	89 45 d0             	mov    %eax,-0x30(%ebp)
801042f6:	0f 84 cb 01 00 00    	je     801044c7 <thread_create+0x207>
		return -1;
	}

	pgdir = curproc->pgdir;
801042fc:	8b 43 04             	mov    0x4(%ebx),%eax

	if(pgdir == 0) {
801042ff:	85 c0                	test   %eax,%eax
	//
	if((np = allocproc()) == 0) {
		return -1;
	}

	pgdir = curproc->pgdir;
80104301:	89 45 d4             	mov    %eax,-0x2c(%ebp)

	if(pgdir == 0) {
80104304:	0f 84 b3 01 00 00    	je     801044bd <thread_create+0x1fd>
		np->state = UNUSED;
		return -1;
	}

	np->parent = curproc->parent;
8010430a:	8b 55 d0             	mov    -0x30(%ebp),%edx
8010430d:	8b 43 14             	mov    0x14(%ebx),%eax
	*np->tf = *curproc->tf;
80104310:	b9 13 00 00 00       	mov    $0x13,%ecx
	if(pgdir == 0) {
		np->state = UNUSED;
		return -1;
	}

	np->parent = curproc->parent;
80104315:	89 42 14             	mov    %eax,0x14(%edx)
	*np->tf = *curproc->tf;
80104318:	8b 7a 18             	mov    0x18(%edx),%edi
8010431b:	8b 73 18             	mov    0x18(%ebx),%esi
8010431e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	for(i = 0; i < NOFILE; i++) {
80104320:	31 f6                	xor    %esi,%esi
80104322:	89 d7                	mov    %edx,%edi
80104324:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		if(curproc->ofile[i])
80104328:	8b 44 b3 28          	mov    0x28(%ebx,%esi,4),%eax
8010432c:	85 c0                	test   %eax,%eax
8010432e:	74 10                	je     80104340 <thread_create+0x80>
			np->ofile[i] = filedup(curproc->ofile[i]);
80104330:	83 ec 0c             	sub    $0xc,%esp
80104333:	50                   	push   %eax
80104334:	e8 e7 ca ff ff       	call   80100e20 <filedup>
80104339:	83 c4 10             	add    $0x10,%esp
8010433c:	89 44 b7 28          	mov    %eax,0x28(%edi,%esi,4)
	}

	np->parent = curproc->parent;
	*np->tf = *curproc->tf;

	for(i = 0; i < NOFILE; i++) {
80104340:	83 c6 01             	add    $0x1,%esi
80104343:	83 fe 10             	cmp    $0x10,%esi
80104346:	75 e0                	jne    80104328 <thread_create+0x68>
		if(curproc->ofile[i])
			np->ofile[i] = filedup(curproc->ofile[i]);
	}
	np->cwd = idup(curproc->cwd);
80104348:	83 ec 0c             	sub    $0xc,%esp
8010434b:	ff 73 68             	pushl  0x68(%ebx)
8010434e:	e8 2d d3 ff ff       	call   80101680 <idup>
80104353:	8b 7d d0             	mov    -0x30(%ebp),%edi

	safestrcpy(np->name, curproc->name, sizeof(curproc->name));
80104356:	83 c4 0c             	add    $0xc,%esp

	for(i = 0; i < NOFILE; i++) {
		if(curproc->ofile[i])
			np->ofile[i] = filedup(curproc->ofile[i]);
	}
	np->cwd = idup(curproc->cwd);
80104359:	89 47 68             	mov    %eax,0x68(%edi)

	safestrcpy(np->name, curproc->name, sizeof(curproc->name));
8010435c:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010435f:	6a 10                	push   $0x10
80104361:	50                   	push   %eax
80104362:	8d 47 6c             	lea    0x6c(%edi),%eax
80104365:	50                   	push   %eax
80104366:	e8 d5 0a 00 00       	call   80104e40 <safestrcpy>

	acquire(&ptable.lock);
8010436b:	c7 04 24 20 3d 11 80 	movl   $0x80113d20,(%esp)
80104372:	e8 c9 07 00 00       	call   80104b40 <acquire>

	np->tf->eax = 0;
80104377:	8b 47 18             	mov    0x18(%edi),%eax
8010437a:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)

	np->pid = curproc->pid;
80104381:	8b 43 10             	mov    0x10(%ebx),%eax

	np->manager = curproc;
80104384:	89 9f 80 00 00 00    	mov    %ebx,0x80(%edi)

	acquire(&ptable.lock);

	np->tf->eax = 0;

	np->pid = curproc->pid;
8010438a:	89 47 10             	mov    %eax,0x10(%edi)

	np->manager = curproc;
	
	np->tid = nexttid++;
8010438d:	a1 08 b0 10 80       	mov    0x8010b008,%eax
80104392:	8d 50 01             	lea    0x1(%eax),%edx
80104395:	89 47 7c             	mov    %eax,0x7c(%edi)

	release(&ptable.lock);
80104398:	c7 04 24 20 3d 11 80 	movl   $0x80113d20,(%esp)

	np->pid = curproc->pid;

	np->manager = curproc;
	
	np->tid = nexttid++;
8010439f:	89 15 08 b0 10 80    	mov    %edx,0x8010b008

	release(&ptable.lock);
801043a5:	e8 46 08 00 00       	call   80104bf0 <release>

	//////////////////////////////
	//
	// exec part
	//
	if(curproc->start == curproc->end) {
801043aa:	8b 83 8c 01 00 00    	mov    0x18c(%ebx),%eax
801043b0:	83 c4 10             	add    $0x10,%esp
801043b3:	3b 83 90 01 00 00    	cmp    0x190(%ebx),%eax
801043b9:	0f 84 19 01 00 00    	je     801044d8 <thread_create+0x218>
		sz = curproc->sz;	
	} else {
		sz = curproc->stacklist[curproc->start];
801043bf:	8b 84 83 88 00 00 00 	mov    0x88(%ebx,%eax,4),%eax
	}
	//cprintf("alloc : %d\n", sz);
	//deallocuvm(pgdir, sz * 2*PGSIZE, sz);
	if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0) {
801043c6:	8b 75 d4             	mov    -0x2c(%ebp),%esi
801043c9:	8d 90 00 20 00 00    	lea    0x2000(%eax),%edx
801043cf:	83 ec 04             	sub    $0x4,%esp
801043d2:	52                   	push   %edx
801043d3:	50                   	push   %eax
801043d4:	56                   	push   %esi
801043d5:	e8 d6 2f 00 00       	call   801073b0 <allocuvm>
801043da:	83 c4 10             	add    $0x10,%esp
801043dd:	85 c0                	test   %eax,%eax
801043df:	89 c7                	mov    %eax,%edi
801043e1:	0f 84 d6 00 00 00    	je     801044bd <thread_create+0x1fd>
		goto bad;
	}
	//cprintf("error\n");
	clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
801043e7:	8d 90 00 e0 ff ff    	lea    -0x2000(%eax),%edx
801043ed:	83 ec 08             	sub    $0x8,%esp
801043f0:	89 75 d4             	mov    %esi,-0x2c(%ebp)
801043f3:	52                   	push   %edx
801043f4:	56                   	push   %esi
	sp = sz;

	ustack[0] = 0xffffffff;
	sp -= 4;
	ustack[1] = (uint)arg;
	sp -= 4;
801043f5:	8d 77 f8             	lea    -0x8(%edi),%esi
	//deallocuvm(pgdir, sz * 2*PGSIZE, sz);
	if((sz = allocuvm(pgdir, sz, sz + 2*PGSIZE)) == 0) {
		goto bad;
	}
	//cprintf("error\n");
	clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
801043f8:	89 55 cc             	mov    %edx,-0x34(%ebp)
801043fb:	e8 00 32 00 00       	call   80107600 <clearpteu>
	///*
	sp = sz;

	ustack[0] = 0xffffffff;
	sp -= 4;
	ustack[1] = (uint)arg;
80104400:	8b 45 10             	mov    0x10(%ebp),%eax
	sp -= 4;
	if(copyout(pgdir, sp, ustack, 2*4) < 0)
80104403:	6a 08                	push   $0x8
	//cprintf("error\n");
	clearpteu(pgdir, (char*)(sz - 2*PGSIZE));
	///*
	sp = sz;

	ustack[0] = 0xffffffff;
80104405:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
	sp -= 4;
	ustack[1] = (uint)arg;
8010440c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
	sp -= 4;
	if(copyout(pgdir, sp, ustack, 2*4) < 0)
8010440f:	8d 45 e0             	lea    -0x20(%ebp),%eax
80104412:	50                   	push   %eax
80104413:	56                   	push   %esi
80104414:	ff 75 d4             	pushl  -0x2c(%ebp)
80104417:	e8 54 33 00 00       	call   80107770 <copyout>
8010441c:	83 c4 20             	add    $0x20,%esp
8010441f:	85 c0                	test   %eax,%eax
80104421:	0f 88 96 00 00 00    	js     801044bd <thread_create+0x1fd>
		goto bad;
	//*/
	np->sva = sz - 2*PGSIZE;
80104427:	8b 45 d0             	mov    -0x30(%ebp),%eax
8010442a:	8b 55 cc             	mov    -0x34(%ebp),%edx
8010442d:	89 90 94 01 00 00    	mov    %edx,0x194(%eax)
	if(curproc->start == curproc->end) {
80104433:	8b 8b 8c 01 00 00    	mov    0x18c(%ebx),%ecx
80104439:	3b 8b 90 01 00 00    	cmp    0x190(%ebx),%ecx
8010443f:	0f 84 9b 00 00 00    	je     801044e0 <thread_create+0x220>
		curproc->sz = sz;
	} else {
		curproc->sz = curproc->sz;
		curproc->start = (curproc->start+1) % (NPROC+1);
80104445:	83 c1 01             	add    $0x1,%ecx
80104448:	ba 7f e0 07 7e       	mov    $0x7e07e07f,%edx
8010444d:	8b 3b                	mov    (%ebx),%edi
8010444f:	89 c8                	mov    %ecx,%eax
80104451:	f7 ea                	imul   %edx
80104453:	89 c8                	mov    %ecx,%eax
80104455:	c1 f8 1f             	sar    $0x1f,%eax
80104458:	c1 fa 05             	sar    $0x5,%edx
8010445b:	29 c2                	sub    %eax,%edx
8010445d:	89 d0                	mov    %edx,%eax
8010445f:	c1 e0 06             	shl    $0x6,%eax
80104462:	01 c2                	add    %eax,%edx
80104464:	29 d1                	sub    %edx,%ecx
80104466:	89 8b 8c 01 00 00    	mov    %ecx,0x18c(%ebx)
	}
	np->sz = curproc->sz;
8010446c:	8b 45 d0             	mov    -0x30(%ebp),%eax
	np->pgdir = pgdir;
8010446f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
	//
	//////////////////////////////

	*thread = np->tid;

	acquire(&ptable.lock);
80104472:	83 ec 0c             	sub    $0xc,%esp
		curproc->sz = sz;
	} else {
		curproc->sz = curproc->sz;
		curproc->start = (curproc->start+1) % (NPROC+1);
	}
	np->sz = curproc->sz;
80104475:	89 38                	mov    %edi,(%eax)
	np->pgdir = pgdir;
80104477:	89 50 04             	mov    %edx,0x4(%eax)
	np->tf->eip = (uint)start_routine;
8010447a:	89 c7                	mov    %eax,%edi
8010447c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010447f:	8b 40 18             	mov    0x18(%eax),%eax
80104482:	89 50 38             	mov    %edx,0x38(%eax)
	np->tf->esp = sp;
80104485:	8b 47 18             	mov    0x18(%edi),%eax
80104488:	89 70 44             	mov    %esi,0x44(%eax)
	//cprintf("eip : %d\n", np->tf->eip);
	
	//
	//////////////////////////////

	*thread = np->tid;
8010448b:	8b 45 08             	mov    0x8(%ebp),%eax
8010448e:	8b 57 7c             	mov    0x7c(%edi),%edx
80104491:	89 10                	mov    %edx,(%eax)

	acquire(&ptable.lock);
80104493:	68 20 3d 11 80       	push   $0x80113d20
80104498:	e8 a3 06 00 00       	call   80104b40 <acquire>

	np->state = RUNNABLE;
8010449d:	c7 47 0c 03 00 00 00 	movl   $0x3,0xc(%edi)

	release(&ptable.lock);
801044a4:	c7 04 24 20 3d 11 80 	movl   $0x80113d20,(%esp)
801044ab:	e8 40 07 00 00       	call   80104bf0 <release>

	return 0;
801044b0:	83 c4 10             	add    $0x10,%esp

bad :
	np->state = UNUSED;
	return -1;
}
801044b3:	8d 65 f4             	lea    -0xc(%ebp),%esp

	np->state = RUNNABLE;

	release(&ptable.lock);

	return 0;
801044b6:	31 c0                	xor    %eax,%eax

bad :
	np->state = UNUSED;
	return -1;
}
801044b8:	5b                   	pop    %ebx
801044b9:	5e                   	pop    %esi
801044ba:	5f                   	pop    %edi
801044bb:	5d                   	pop    %ebp
801044bc:	c3                   	ret    
	release(&ptable.lock);

	return 0;

bad :
	np->state = UNUSED;
801044bd:	8b 45 d0             	mov    -0x30(%ebp),%eax
801044c0:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
	return -1;
}
801044c7:	8d 65 f4             	lea    -0xc(%ebp),%esp

	return 0;

bad :
	np->state = UNUSED;
	return -1;
801044ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
801044cf:	5b                   	pop    %ebx
801044d0:	5e                   	pop    %esi
801044d1:	5f                   	pop    %edi
801044d2:	5d                   	pop    %ebp
801044d3:	c3                   	ret    
801044d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	//////////////////////////////
	//
	// exec part
	//
	if(curproc->start == curproc->end) {
		sz = curproc->sz;	
801044d8:	8b 03                	mov    (%ebx),%eax
801044da:	e9 e7 fe ff ff       	jmp    801043c6 <thread_create+0x106>
801044df:	90                   	nop
	if(copyout(pgdir, sp, ustack, 2*4) < 0)
		goto bad;
	//*/
	np->sva = sz - 2*PGSIZE;
	if(curproc->start == curproc->end) {
		curproc->sz = sz;
801044e0:	89 3b                	mov    %edi,(%ebx)
801044e2:	eb 88                	jmp    8010446c <thread_create+0x1ac>
801044e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801044ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801044f0 <thread_exit>:
	return -1;
}

void
thread_exit(void *retval)
{
801044f0:	55                   	push   %ebp
801044f1:	89 e5                	mov    %esp,%ebp
801044f3:	57                   	push   %edi
801044f4:	56                   	push   %esi
801044f5:	53                   	push   %ebx
801044f6:	83 ec 0c             	sub    $0xc,%esp
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
801044f9:	e8 62 05 00 00       	call   80104a60 <pushcli>
  c = mycpu();
801044fe:	e8 4d f2 ff ff       	call   80103750 <mycpu>
  p = c->proc;
80104503:	8b 98 ac 00 00 00    	mov    0xac(%eax),%ebx
  popcli();
80104509:	e8 92 05 00 00       	call   80104aa0 <popcli>
thread_exit(void *retval)
{
	struct proc *curproc = myproc();
	int fd;

	if(curproc->tid == 0) {
8010450e:	8b 43 7c             	mov    0x7c(%ebx),%eax
80104511:	85 c0                	test   %eax,%eax
80104513:	75 08                	jne    8010451d <thread_exit+0x2d>
	
	sched();
	panic("zombie exit");
	//
	//////////////////////////////
}
80104515:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104518:	5b                   	pop    %ebx
80104519:	5e                   	pop    %esi
8010451a:	5f                   	pop    %edi
8010451b:	5d                   	pop    %ebp
8010451c:	c3                   	ret    

	if(curproc->tid == 0) {
		return;
	}

	curproc->retval = retval;
8010451d:	8b 45 08             	mov    0x8(%ebp),%eax
80104520:	8d 73 28             	lea    0x28(%ebx),%esi
80104523:	8d 7b 68             	lea    0x68(%ebx),%edi
80104526:	89 83 84 00 00 00    	mov    %eax,0x84(%ebx)
	//////////////////////////////
	//
	// exit part
	//
	for(fd = 0; fd < NOFILE; fd++) {
		if(curproc->ofile[fd]) {
8010452c:	8b 06                	mov    (%esi),%eax
8010452e:	85 c0                	test   %eax,%eax
80104530:	74 12                	je     80104544 <thread_exit+0x54>
			fileclose(curproc->ofile[fd]);
80104532:	83 ec 0c             	sub    $0xc,%esp
80104535:	50                   	push   %eax
80104536:	e8 35 c9 ff ff       	call   80100e70 <fileclose>
			curproc->ofile[fd] = 0;
8010453b:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
80104541:	83 c4 10             	add    $0x10,%esp
80104544:	83 c6 04             	add    $0x4,%esi

	//////////////////////////////
	//
	// exit part
	//
	for(fd = 0; fd < NOFILE; fd++) {
80104547:	39 fe                	cmp    %edi,%esi
80104549:	75 e1                	jne    8010452c <thread_exit+0x3c>
			fileclose(curproc->ofile[fd]);
			curproc->ofile[fd] = 0;
		}
	}
	
	begin_op();
8010454b:	e8 40 e6 ff ff       	call   80102b90 <begin_op>
	iput(curproc->cwd);
80104550:	83 ec 0c             	sub    $0xc,%esp
80104553:	ff 73 68             	pushl  0x68(%ebx)
80104556:	e8 85 d2 ff ff       	call   801017e0 <iput>
	end_op();
8010455b:	e8 a0 e6 ff ff       	call   80102c00 <end_op>
	curproc->cwd = 0;
80104560:	c7 43 68 00 00 00 00 	movl   $0x0,0x68(%ebx)

	acquire(&ptable.lock);
80104567:	c7 04 24 20 3d 11 80 	movl   $0x80113d20,(%esp)
8010456e:	e8 cd 05 00 00       	call   80104b40 <acquire>

	wakeup1(curproc->manager);
80104573:	8b 93 80 00 00 00    	mov    0x80(%ebx),%edx
80104579:	83 c4 10             	add    $0x10,%esp
static void
wakeup1(void *chan)
{
  struct proc *p;

  for(p = ptable.proc; p < &ptable.proc[NPROC]; p++)
8010457c:	b8 54 3d 11 80       	mov    $0x80113d54,%eax
80104581:	eb 11                	jmp    80104594 <thread_exit+0xa4>
80104583:	90                   	nop
80104584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104588:	05 98 01 00 00       	add    $0x198,%eax
8010458d:	3d 54 a3 11 80       	cmp    $0x8011a354,%eax
80104592:	74 14                	je     801045a8 <thread_exit+0xb8>
    if(p->state == SLEEPING && p->chan == chan)
80104594:	83 78 0c 02          	cmpl   $0x2,0xc(%eax)
80104598:	75 ee                	jne    80104588 <thread_exit+0x98>
8010459a:	3b 50 20             	cmp    0x20(%eax),%edx
8010459d:	75 e9                	jne    80104588 <thread_exit+0x98>
      p->state = RUNNABLE;
8010459f:	c7 40 0c 03 00 00 00 	movl   $0x3,0xc(%eax)
801045a6:	eb e0                	jmp    80104588 <thread_exit+0x98>

	acquire(&ptable.lock);

	wakeup1(curproc->manager);

	curproc->state = ZOMBIE;
801045a8:	c7 43 0c 05 00 00 00 	movl   $0x5,0xc(%ebx)
	
	sched();
801045af:	e8 dc f6 ff ff       	call   80103c90 <sched>
	panic("zombie exit");
801045b4:	83 ec 0c             	sub    $0xc,%esp
801045b7:	68 fd 7d 10 80       	push   $0x80107dfd
801045bc:	e8 af bd ff ff       	call   80100370 <panic>
801045c1:	eb 0d                	jmp    801045d0 <thread_join>
801045c3:	90                   	nop
801045c4:	90                   	nop
801045c5:	90                   	nop
801045c6:	90                   	nop
801045c7:	90                   	nop
801045c8:	90                   	nop
801045c9:	90                   	nop
801045ca:	90                   	nop
801045cb:	90                   	nop
801045cc:	90                   	nop
801045cd:	90                   	nop
801045ce:	90                   	nop
801045cf:	90                   	nop

801045d0 <thread_join>:
	//////////////////////////////
}

int
thread_join(thread_t thread, void **retval)
{
801045d0:	55                   	push   %ebp
801045d1:	89 e5                	mov    %esp,%ebp
801045d3:	57                   	push   %edi
801045d4:	56                   	push   %esi
801045d5:	53                   	push   %ebx
801045d6:	83 ec 1c             	sub    $0x1c,%esp
801045d9:	8b 7d 08             	mov    0x8(%ebp),%edi
// while reading proc from the cpu structure
struct proc*
myproc(void) {
  struct cpu *c;
  struct proc *p;
  pushcli();
801045dc:	e8 7f 04 00 00       	call   80104a60 <pushcli>
  c = mycpu();
801045e1:	e8 6a f1 ff ff       	call   80103750 <mycpu>
  p = c->proc;
801045e6:	8b b0 ac 00 00 00    	mov    0xac(%eax),%esi
  popcli();
801045ec:	e8 af 04 00 00       	call   80104aa0 <popcli>

	//*retval = curproc->retval;

	//cprintf("join\n");

	if(curproc->tid != 0) {
801045f1:	8b 4e 7c             	mov    0x7c(%esi),%ecx
801045f4:	85 c9                	test   %ecx,%ecx
801045f6:	74 0f                	je     80104607 <thread_join+0x37>
		return -1;
801045f8:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
			return -1;
		}
		//cprintf("sleep\n");
		sleep(curproc, &ptable.lock);
	}
}
801045fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
80104600:	89 c8                	mov    %ecx,%eax
80104602:	5b                   	pop    %ebx
80104603:	5e                   	pop    %esi
80104604:	5f                   	pop    %edi
80104605:	5d                   	pop    %ebp
80104606:	c3                   	ret    

	if(curproc->tid != 0) {
		return -1;
	}

	acquire(&ptable.lock);
80104607:	83 ec 0c             	sub    $0xc,%esp
8010460a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010460d:	68 20 3d 11 80       	push   $0x80113d20
80104612:	e8 29 05 00 00       	call   80104b40 <acquire>
80104617:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010461a:	83 c4 10             	add    $0x10,%esp
8010461d:	8d 76 00             	lea    0x0(%esi),%esi
	for(;;){
		havekids = 0;
80104620:	31 c0                	xor    %eax,%eax
		for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104622:	bb 54 3d 11 80       	mov    $0x80113d54,%ebx
80104627:	eb 15                	jmp    8010463e <thread_join+0x6e>
80104629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104630:	81 c3 98 01 00 00    	add    $0x198,%ebx
80104636:	81 fb 54 a3 11 80    	cmp    $0x8011a354,%ebx
8010463c:	74 2a                	je     80104668 <thread_join+0x98>
			if(p->manager != curproc || p->tid != thread)
8010463e:	39 b3 80 00 00 00    	cmp    %esi,0x80(%ebx)
80104644:	75 ea                	jne    80104630 <thread_join+0x60>
80104646:	39 7b 7c             	cmp    %edi,0x7c(%ebx)
80104649:	75 e5                	jne    80104630 <thread_join+0x60>
				continue;
			//cprintf("have kids\n");
			havekids = 1;
			if(p->state == ZOMBIE){
8010464b:	83 7b 0c 05          	cmpl   $0x5,0xc(%ebx)
8010464f:	74 43                	je     80104694 <thread_join+0xc4>
	}

	acquire(&ptable.lock);
	for(;;){
		havekids = 0;
		for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
80104651:	81 c3 98 01 00 00    	add    $0x198,%ebx
			if(p->manager != curproc || p->tid != thread)
				continue;
			//cprintf("have kids\n");
			havekids = 1;
80104657:	b8 01 00 00 00       	mov    $0x1,%eax
	}

	acquire(&ptable.lock);
	for(;;){
		havekids = 0;
		for(p = ptable.proc; p < &ptable.proc[NPROC]; p++){
8010465c:	81 fb 54 a3 11 80    	cmp    $0x8011a354,%ebx
80104662:	75 da                	jne    8010463e <thread_join+0x6e>
80104664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

				return 0;
			}
		}

		if(!havekids || curproc->killed) {
80104668:	85 c0                	test   %eax,%eax
8010466a:	0f 84 e3 00 00 00    	je     80104753 <thread_join+0x183>
80104670:	8b 46 24             	mov    0x24(%esi),%eax
80104673:	85 c0                	test   %eax,%eax
80104675:	0f 85 d8 00 00 00    	jne    80104753 <thread_join+0x183>
			cprintf("error\n");
			release(&ptable.lock);
			return -1;
		}
		//cprintf("sleep\n");
		sleep(curproc, &ptable.lock);
8010467b:	83 ec 08             	sub    $0x8,%esp
8010467e:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
80104681:	68 20 3d 11 80       	push   $0x80113d20
80104686:	56                   	push   %esi
80104687:	e8 c4 f8 ff ff       	call   80103f50 <sleep>
	}
8010468c:	83 c4 10             	add    $0x10,%esp
8010468f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
80104692:	eb 8c                	jmp    80104620 <thread_join+0x50>
				continue;
			//cprintf("have kids\n");
			havekids = 1;
			if(p->state == ZOMBIE){
				//cprintf("zombie\n");
				kfree(p->kstack);
80104694:	83 ec 0c             	sub    $0xc,%esp
80104697:	ff 73 08             	pushl  0x8(%ebx)
8010469a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
8010469d:	e8 7e dc ff ff       	call   80102320 <kfree>
				p->killed = 0;
				p->state = UNUSED;

				p->manager = 0;
				p->tid = 0;
				sva = p->sva;
801046a2:	8b bb 94 01 00 00    	mov    0x194(%ebx),%edi
				p->sva = 0;

				//cprintf("sva : %d\n", sva);
				deallocuvm(p->pgdir, sva + 2*PGSIZE, sva);
801046a8:	83 c4 0c             	add    $0xc,%esp
			//cprintf("have kids\n");
			havekids = 1;
			if(p->state == ZOMBIE){
				//cprintf("zombie\n");
				kfree(p->kstack);
				p->kstack = 0;
801046ab:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
				p->pid = 0;
801046b2:	c7 43 10 00 00 00 00 	movl   $0x0,0x10(%ebx)
				p->parent = 0;
801046b9:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
				p->name[0] = 0;
801046c0:	c6 43 6c 00          	movb   $0x0,0x6c(%ebx)
				p->killed = 0;
801046c4:	c7 43 24 00 00 00 00 	movl   $0x0,0x24(%ebx)
				p->tid = 0;
				sva = p->sva;
				p->sva = 0;

				//cprintf("sva : %d\n", sva);
				deallocuvm(p->pgdir, sva + 2*PGSIZE, sva);
801046cb:	8d 87 00 20 00 00    	lea    0x2000(%edi),%eax
				p->kstack = 0;
				p->pid = 0;
				p->parent = 0;
				p->name[0] = 0;
				p->killed = 0;
				p->state = UNUSED;
801046d1:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)

				p->manager = 0;
801046d8:	c7 83 80 00 00 00 00 	movl   $0x0,0x80(%ebx)
801046df:	00 00 00 
				p->tid = 0;
801046e2:	c7 43 7c 00 00 00 00 	movl   $0x0,0x7c(%ebx)
				sva = p->sva;
				p->sva = 0;
801046e9:	c7 83 94 01 00 00 00 	movl   $0x0,0x194(%ebx)
801046f0:	00 00 00 

				//cprintf("sva : %d\n", sva);
				deallocuvm(p->pgdir, sva + 2*PGSIZE, sva);
801046f3:	57                   	push   %edi
801046f4:	50                   	push   %eax
801046f5:	ff 73 04             	pushl  0x4(%ebx)
801046f8:	e8 b3 2d 00 00       	call   801074b0 <deallocuvm>

				*retval = p->retval;
801046fd:	8b 93 84 00 00 00    	mov    0x84(%ebx),%edx
80104703:	8b 45 0c             	mov    0xc(%ebp),%eax
80104706:	89 10                	mov    %edx,(%eax)

				release(&ptable.lock);
80104708:	c7 04 24 20 3d 11 80 	movl   $0x80113d20,(%esp)
8010470f:	e8 dc 04 00 00       	call   80104bf0 <release>

				curproc->stacklist[curproc->end] = sva;
80104714:	8b 9e 90 01 00 00    	mov    0x190(%esi),%ebx
				curproc->end = (curproc->end+1) % (NPROC+1);				
8010471a:	ba 7f e0 07 7e       	mov    $0x7e07e07f,%edx

				return 0;
8010471f:	83 c4 10             	add    $0x10,%esp
80104722:	8b 4d e4             	mov    -0x1c(%ebp),%ecx

				*retval = p->retval;

				release(&ptable.lock);

				curproc->stacklist[curproc->end] = sva;
80104725:	89 bc 9e 88 00 00 00 	mov    %edi,0x88(%esi,%ebx,4)
				curproc->end = (curproc->end+1) % (NPROC+1);				
8010472c:	83 c3 01             	add    $0x1,%ebx
8010472f:	89 d8                	mov    %ebx,%eax
80104731:	f7 ea                	imul   %edx
80104733:	89 d0                	mov    %edx,%eax
80104735:	89 da                	mov    %ebx,%edx
80104737:	c1 fa 1f             	sar    $0x1f,%edx
8010473a:	c1 f8 05             	sar    $0x5,%eax
8010473d:	29 d0                	sub    %edx,%eax
8010473f:	89 c2                	mov    %eax,%edx
80104741:	c1 e2 06             	shl    $0x6,%edx
80104744:	01 d0                	add    %edx,%eax
80104746:	29 c3                	sub    %eax,%ebx
80104748:	89 9e 90 01 00 00    	mov    %ebx,0x190(%esi)

				return 0;
8010474e:	e9 aa fe ff ff       	jmp    801045fd <thread_join+0x2d>
			}
		}

		if(!havekids || curproc->killed) {
			cprintf("error\n");
80104753:	83 ec 0c             	sub    $0xc,%esp
80104756:	68 2d 7e 10 80       	push   $0x80107e2d
8010475b:	e8 00 bf ff ff       	call   80100660 <cprintf>
			release(&ptable.lock);
80104760:	c7 04 24 20 3d 11 80 	movl   $0x80113d20,(%esp)
80104767:	e8 84 04 00 00       	call   80104bf0 <release>
			return -1;
8010476c:	83 c4 10             	add    $0x10,%esp
8010476f:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
80104774:	e9 84 fe ff ff       	jmp    801045fd <thread_join+0x2d>
80104779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104780 <print_table>:
	}
}

void
print_table(void)
{
80104780:	55                   	push   %ebp
80104781:	89 e5                	mov    %esp,%ebp
80104783:	56                   	push   %esi
80104784:	53                   	push   %ebx
	int i;
	struct proc *p;
	acquire(&ptable.lock);
	for(i = 0, p = ptable.proc; p < &ptable.proc[NPROC]; p++, i++) {
80104785:	31 f6                	xor    %esi,%esi
80104787:	bb 54 3d 11 80       	mov    $0x80113d54,%ebx
void
print_table(void)
{
	int i;
	struct proc *p;
	acquire(&ptable.lock);
8010478c:	83 ec 0c             	sub    $0xc,%esp
8010478f:	68 20 3d 11 80       	push   $0x80113d20
80104794:	e8 a7 03 00 00       	call   80104b40 <acquire>
80104799:	83 c4 10             	add    $0x10,%esp
8010479c:	eb 13                	jmp    801047b1 <print_table+0x31>
8010479e:	66 90                	xchg   %ax,%ax
	for(i = 0, p = ptable.proc; p < &ptable.proc[NPROC]; p++, i++) {
801047a0:	81 c3 98 01 00 00    	add    $0x198,%ebx
801047a6:	83 c6 01             	add    $0x1,%esi
801047a9:	81 fb 54 a3 11 80    	cmp    $0x8011a354,%ebx
801047af:	74 37                	je     801047e8 <print_table+0x68>
		if(p->state == UNUSED) continue;
801047b1:	8b 43 0c             	mov    0xc(%ebx),%eax
801047b4:	85 c0                	test   %eax,%eax
801047b6:	74 e8                	je     801047a0 <print_table+0x20>
		cprintf("%d. pid : %d, tid : %d, parent pid : %d, manager pid : %d, state : %d\n",
801047b8:	83 ec 04             	sub    $0x4,%esp
801047bb:	50                   	push   %eax
801047bc:	8b 83 80 00 00 00    	mov    0x80(%ebx),%eax
801047c2:	ff 70 10             	pushl  0x10(%eax)
801047c5:	8b 43 14             	mov    0x14(%ebx),%eax
801047c8:	ff 70 10             	pushl  0x10(%eax)
801047cb:	ff 73 7c             	pushl  0x7c(%ebx)
801047ce:	ff 73 10             	pushl  0x10(%ebx)
801047d1:	56                   	push   %esi
801047d2:	68 88 7e 10 80       	push   $0x80107e88
801047d7:	e8 84 be ff ff       	call   80100660 <cprintf>
801047dc:	83 c4 20             	add    $0x20,%esp
801047df:	eb bf                	jmp    801047a0 <print_table+0x20>
801047e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
						i, p->pid, p->tid, p->parent->pid, p->manager->pid, p->state);
	}
	release(&ptable.lock);
801047e8:	83 ec 0c             	sub    $0xc,%esp
801047eb:	68 20 3d 11 80       	push   $0x80113d20
801047f0:	e8 fb 03 00 00       	call   80104bf0 <release>
}
801047f5:	83 c4 10             	add    $0x10,%esp
801047f8:	8d 65 f8             	lea    -0x8(%ebp),%esp
801047fb:	5b                   	pop    %ebx
801047fc:	5e                   	pop    %esi
801047fd:	5d                   	pop    %ebp
801047fe:	c3                   	ret    
801047ff:	90                   	nop

80104800 <exit_threads>:

void
exit_threads(int pid, int tid) {
80104800:	55                   	push   %ebp
80104801:	89 e5                	mov    %esp,%ebp
80104803:	57                   	push   %edi
80104804:	56                   	push   %esi
80104805:	53                   	push   %ebx
	struct proc *p;
		
	acquire(&ptable.lock);
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80104806:	bb 54 3d 11 80       	mov    $0x80113d54,%ebx
	}
	release(&ptable.lock);
}

void
exit_threads(int pid, int tid) {
8010480b:	83 ec 18             	sub    $0x18,%esp
8010480e:	8b 75 08             	mov    0x8(%ebp),%esi
80104811:	8b 7d 0c             	mov    0xc(%ebp),%edi
	struct proc *p;
		
	acquire(&ptable.lock);
80104814:	68 20 3d 11 80       	push   $0x80113d20
80104819:	e8 22 03 00 00       	call   80104b40 <acquire>
8010481e:	83 c4 10             	add    $0x10,%esp
80104821:	eb 13                	jmp    80104836 <exit_threads+0x36>
80104823:	90                   	nop
80104824:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80104828:	81 c3 98 01 00 00    	add    $0x198,%ebx
8010482e:	81 fb 54 a3 11 80    	cmp    $0x8011a354,%ebx
80104834:	74 63                	je     80104899 <exit_threads+0x99>
		if(pid == 0)
80104836:	85 f6                	test   %esi,%esi
80104838:	74 ee                	je     80104828 <exit_threads+0x28>
			continue;
		if(p->pid == pid && p->tid != tid) {
8010483a:	3b 73 10             	cmp    0x10(%ebx),%esi
8010483d:	75 e9                	jne    80104828 <exit_threads+0x28>
8010483f:	39 7b 7c             	cmp    %edi,0x7c(%ebx)
80104842:	74 e4                	je     80104828 <exit_threads+0x28>
			kfree(p->kstack);
80104844:	83 ec 0c             	sub    $0xc,%esp
80104847:	ff 73 08             	pushl  0x8(%ebx)
void
exit_threads(int pid, int tid) {
	struct proc *p;
		
	acquire(&ptable.lock);
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
8010484a:	81 c3 98 01 00 00    	add    $0x198,%ebx
		if(pid == 0)
			continue;
		if(p->pid == pid && p->tid != tid) {
			kfree(p->kstack);
80104850:	e8 cb da ff ff       	call   80102320 <kfree>
			p->kstack = 0;
80104855:	c7 83 70 fe ff ff 00 	movl   $0x0,-0x190(%ebx)
8010485c:	00 00 00 
			p->pid = 0;
8010485f:	c7 83 78 fe ff ff 00 	movl   $0x0,-0x188(%ebx)
80104866:	00 00 00 
			p->parent = 0;
			p->name[0] = 0;
			p->killed = 0;
			p->state = UNUSED;
80104869:	83 c4 10             	add    $0x10,%esp
			continue;
		if(p->pid == pid && p->tid != tid) {
			kfree(p->kstack);
			p->kstack = 0;
			p->pid = 0;
			p->parent = 0;
8010486c:	c7 83 7c fe ff ff 00 	movl   $0x0,-0x184(%ebx)
80104873:	00 00 00 
			p->name[0] = 0;
80104876:	c6 83 d4 fe ff ff 00 	movb   $0x0,-0x12c(%ebx)
			p->killed = 0;
8010487d:	c7 83 8c fe ff ff 00 	movl   $0x0,-0x174(%ebx)
80104884:	00 00 00 
			p->state = UNUSED;
80104887:	c7 83 74 fe ff ff 00 	movl   $0x0,-0x18c(%ebx)
8010488e:	00 00 00 
void
exit_threads(int pid, int tid) {
	struct proc *p;
		
	acquire(&ptable.lock);
	for(p = ptable.proc; p < &ptable.proc[NPROC]; p++) {
80104891:	81 fb 54 a3 11 80    	cmp    $0x8011a354,%ebx
80104897:	75 9d                	jne    80104836 <exit_threads+0x36>
			p->name[0] = 0;
			p->killed = 0;
			p->state = UNUSED;
		}
	}
	release(&ptable.lock);
80104899:	c7 45 08 20 3d 11 80 	movl   $0x80113d20,0x8(%ebp)
}
801048a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801048a3:	5b                   	pop    %ebx
801048a4:	5e                   	pop    %esi
801048a5:	5f                   	pop    %edi
801048a6:	5d                   	pop    %ebp
			p->name[0] = 0;
			p->killed = 0;
			p->state = UNUSED;
		}
	}
	release(&ptable.lock);
801048a7:	e9 44 03 00 00       	jmp    80104bf0 <release>
801048ac:	66 90                	xchg   %ax,%ax
801048ae:	66 90                	xchg   %ax,%ax

801048b0 <initsleeplock>:
801048b0:	55                   	push   %ebp
801048b1:	89 e5                	mov    %esp,%ebp
801048b3:	53                   	push   %ebx
801048b4:	83 ec 0c             	sub    $0xc,%esp
801048b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
801048ba:	68 e8 7e 10 80       	push   $0x80107ee8
801048bf:	8d 43 04             	lea    0x4(%ebx),%eax
801048c2:	50                   	push   %eax
801048c3:	e8 18 01 00 00       	call   801049e0 <initlock>
801048c8:	8b 45 0c             	mov    0xc(%ebp),%eax
801048cb:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
801048d1:	83 c4 10             	add    $0x10,%esp
801048d4:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
801048db:	89 43 38             	mov    %eax,0x38(%ebx)
801048de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
801048e1:	c9                   	leave  
801048e2:	c3                   	ret    
801048e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801048e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801048f0 <acquiresleep>:
801048f0:	55                   	push   %ebp
801048f1:	89 e5                	mov    %esp,%ebp
801048f3:	56                   	push   %esi
801048f4:	53                   	push   %ebx
801048f5:	8b 5d 08             	mov    0x8(%ebp),%ebx
801048f8:	83 ec 0c             	sub    $0xc,%esp
801048fb:	8d 73 04             	lea    0x4(%ebx),%esi
801048fe:	56                   	push   %esi
801048ff:	e8 3c 02 00 00       	call   80104b40 <acquire>
80104904:	8b 13                	mov    (%ebx),%edx
80104906:	83 c4 10             	add    $0x10,%esp
80104909:	85 d2                	test   %edx,%edx
8010490b:	74 16                	je     80104923 <acquiresleep+0x33>
8010490d:	8d 76 00             	lea    0x0(%esi),%esi
80104910:	83 ec 08             	sub    $0x8,%esp
80104913:	56                   	push   %esi
80104914:	53                   	push   %ebx
80104915:	e8 36 f6 ff ff       	call   80103f50 <sleep>
8010491a:	8b 03                	mov    (%ebx),%eax
8010491c:	83 c4 10             	add    $0x10,%esp
8010491f:	85 c0                	test   %eax,%eax
80104921:	75 ed                	jne    80104910 <acquiresleep+0x20>
80104923:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
80104929:	e8 c2 ee ff ff       	call   801037f0 <myproc>
8010492e:	8b 40 10             	mov    0x10(%eax),%eax
80104931:	89 43 3c             	mov    %eax,0x3c(%ebx)
80104934:	89 75 08             	mov    %esi,0x8(%ebp)
80104937:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010493a:	5b                   	pop    %ebx
8010493b:	5e                   	pop    %esi
8010493c:	5d                   	pop    %ebp
8010493d:	e9 ae 02 00 00       	jmp    80104bf0 <release>
80104942:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104949:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104950 <releasesleep>:
80104950:	55                   	push   %ebp
80104951:	89 e5                	mov    %esp,%ebp
80104953:	56                   	push   %esi
80104954:	53                   	push   %ebx
80104955:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104958:	83 ec 0c             	sub    $0xc,%esp
8010495b:	8d 73 04             	lea    0x4(%ebx),%esi
8010495e:	56                   	push   %esi
8010495f:	e8 dc 01 00 00       	call   80104b40 <acquire>
80104964:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
8010496a:	c7 43 3c 00 00 00 00 	movl   $0x0,0x3c(%ebx)
80104971:	89 1c 24             	mov    %ebx,(%esp)
80104974:	e8 97 f7 ff ff       	call   80104110 <wakeup>
80104979:	89 75 08             	mov    %esi,0x8(%ebp)
8010497c:	83 c4 10             	add    $0x10,%esp
8010497f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104982:	5b                   	pop    %ebx
80104983:	5e                   	pop    %esi
80104984:	5d                   	pop    %ebp
80104985:	e9 66 02 00 00       	jmp    80104bf0 <release>
8010498a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104990 <holdingsleep>:
80104990:	55                   	push   %ebp
80104991:	89 e5                	mov    %esp,%ebp
80104993:	57                   	push   %edi
80104994:	56                   	push   %esi
80104995:	53                   	push   %ebx
80104996:	31 ff                	xor    %edi,%edi
80104998:	83 ec 18             	sub    $0x18,%esp
8010499b:	8b 5d 08             	mov    0x8(%ebp),%ebx
8010499e:	8d 73 04             	lea    0x4(%ebx),%esi
801049a1:	56                   	push   %esi
801049a2:	e8 99 01 00 00       	call   80104b40 <acquire>
801049a7:	8b 03                	mov    (%ebx),%eax
801049a9:	83 c4 10             	add    $0x10,%esp
801049ac:	85 c0                	test   %eax,%eax
801049ae:	74 13                	je     801049c3 <holdingsleep+0x33>
801049b0:	8b 5b 3c             	mov    0x3c(%ebx),%ebx
801049b3:	e8 38 ee ff ff       	call   801037f0 <myproc>
801049b8:	39 58 10             	cmp    %ebx,0x10(%eax)
801049bb:	0f 94 c0             	sete   %al
801049be:	0f b6 c0             	movzbl %al,%eax
801049c1:	89 c7                	mov    %eax,%edi
801049c3:	83 ec 0c             	sub    $0xc,%esp
801049c6:	56                   	push   %esi
801049c7:	e8 24 02 00 00       	call   80104bf0 <release>
801049cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
801049cf:	89 f8                	mov    %edi,%eax
801049d1:	5b                   	pop    %ebx
801049d2:	5e                   	pop    %esi
801049d3:	5f                   	pop    %edi
801049d4:	5d                   	pop    %ebp
801049d5:	c3                   	ret    
801049d6:	66 90                	xchg   %ax,%ax
801049d8:	66 90                	xchg   %ax,%ax
801049da:	66 90                	xchg   %ax,%ax
801049dc:	66 90                	xchg   %ax,%ax
801049de:	66 90                	xchg   %ax,%ax

801049e0 <initlock>:
801049e0:	55                   	push   %ebp
801049e1:	89 e5                	mov    %esp,%ebp
801049e3:	8b 45 08             	mov    0x8(%ebp),%eax
801049e6:	8b 55 0c             	mov    0xc(%ebp),%edx
801049e9:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
801049ef:	89 50 04             	mov    %edx,0x4(%eax)
801049f2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
801049f9:	5d                   	pop    %ebp
801049fa:	c3                   	ret    
801049fb:	90                   	nop
801049fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104a00 <getcallerpcs>:
80104a00:	55                   	push   %ebp
80104a01:	89 e5                	mov    %esp,%ebp
80104a03:	53                   	push   %ebx
80104a04:	8b 45 08             	mov    0x8(%ebp),%eax
80104a07:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104a0a:	8d 50 f8             	lea    -0x8(%eax),%edx
80104a0d:	31 c0                	xor    %eax,%eax
80104a0f:	90                   	nop
80104a10:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104a16:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80104a1c:	77 1a                	ja     80104a38 <getcallerpcs+0x38>
80104a1e:	8b 5a 04             	mov    0x4(%edx),%ebx
80104a21:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
80104a24:	83 c0 01             	add    $0x1,%eax
80104a27:	8b 12                	mov    (%edx),%edx
80104a29:	83 f8 0a             	cmp    $0xa,%eax
80104a2c:	75 e2                	jne    80104a10 <getcallerpcs+0x10>
80104a2e:	5b                   	pop    %ebx
80104a2f:	5d                   	pop    %ebp
80104a30:	c3                   	ret    
80104a31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104a38:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
80104a3f:	83 c0 01             	add    $0x1,%eax
80104a42:	83 f8 0a             	cmp    $0xa,%eax
80104a45:	74 e7                	je     80104a2e <getcallerpcs+0x2e>
80104a47:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
80104a4e:	83 c0 01             	add    $0x1,%eax
80104a51:	83 f8 0a             	cmp    $0xa,%eax
80104a54:	75 e2                	jne    80104a38 <getcallerpcs+0x38>
80104a56:	eb d6                	jmp    80104a2e <getcallerpcs+0x2e>
80104a58:	90                   	nop
80104a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80104a60 <pushcli>:
80104a60:	55                   	push   %ebp
80104a61:	89 e5                	mov    %esp,%ebp
80104a63:	53                   	push   %ebx
80104a64:	83 ec 04             	sub    $0x4,%esp
80104a67:	9c                   	pushf  
80104a68:	5b                   	pop    %ebx
80104a69:	fa                   	cli    
80104a6a:	e8 e1 ec ff ff       	call   80103750 <mycpu>
80104a6f:	8b 80 a4 00 00 00    	mov    0xa4(%eax),%eax
80104a75:	85 c0                	test   %eax,%eax
80104a77:	75 11                	jne    80104a8a <pushcli+0x2a>
80104a79:	81 e3 00 02 00 00    	and    $0x200,%ebx
80104a7f:	e8 cc ec ff ff       	call   80103750 <mycpu>
80104a84:	89 98 a8 00 00 00    	mov    %ebx,0xa8(%eax)
80104a8a:	e8 c1 ec ff ff       	call   80103750 <mycpu>
80104a8f:	83 80 a4 00 00 00 01 	addl   $0x1,0xa4(%eax)
80104a96:	83 c4 04             	add    $0x4,%esp
80104a99:	5b                   	pop    %ebx
80104a9a:	5d                   	pop    %ebp
80104a9b:	c3                   	ret    
80104a9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104aa0 <popcli>:
80104aa0:	55                   	push   %ebp
80104aa1:	89 e5                	mov    %esp,%ebp
80104aa3:	83 ec 08             	sub    $0x8,%esp
80104aa6:	9c                   	pushf  
80104aa7:	58                   	pop    %eax
80104aa8:	f6 c4 02             	test   $0x2,%ah
80104aab:	75 52                	jne    80104aff <popcli+0x5f>
80104aad:	e8 9e ec ff ff       	call   80103750 <mycpu>
80104ab2:	8b 88 a4 00 00 00    	mov    0xa4(%eax),%ecx
80104ab8:	8d 51 ff             	lea    -0x1(%ecx),%edx
80104abb:	85 d2                	test   %edx,%edx
80104abd:	89 90 a4 00 00 00    	mov    %edx,0xa4(%eax)
80104ac3:	78 2d                	js     80104af2 <popcli+0x52>
80104ac5:	e8 86 ec ff ff       	call   80103750 <mycpu>
80104aca:	8b 90 a4 00 00 00    	mov    0xa4(%eax),%edx
80104ad0:	85 d2                	test   %edx,%edx
80104ad2:	74 0c                	je     80104ae0 <popcli+0x40>
80104ad4:	c9                   	leave  
80104ad5:	c3                   	ret    
80104ad6:	8d 76 00             	lea    0x0(%esi),%esi
80104ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104ae0:	e8 6b ec ff ff       	call   80103750 <mycpu>
80104ae5:	8b 80 a8 00 00 00    	mov    0xa8(%eax),%eax
80104aeb:	85 c0                	test   %eax,%eax
80104aed:	74 e5                	je     80104ad4 <popcli+0x34>
80104aef:	fb                   	sti    
80104af0:	c9                   	leave  
80104af1:	c3                   	ret    
80104af2:	83 ec 0c             	sub    $0xc,%esp
80104af5:	68 0a 7f 10 80       	push   $0x80107f0a
80104afa:	e8 71 b8 ff ff       	call   80100370 <panic>
80104aff:	83 ec 0c             	sub    $0xc,%esp
80104b02:	68 f3 7e 10 80       	push   $0x80107ef3
80104b07:	e8 64 b8 ff ff       	call   80100370 <panic>
80104b0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104b10 <holding>:
80104b10:	55                   	push   %ebp
80104b11:	89 e5                	mov    %esp,%ebp
80104b13:	56                   	push   %esi
80104b14:	53                   	push   %ebx
80104b15:	8b 75 08             	mov    0x8(%ebp),%esi
80104b18:	31 db                	xor    %ebx,%ebx
80104b1a:	e8 41 ff ff ff       	call   80104a60 <pushcli>
80104b1f:	8b 06                	mov    (%esi),%eax
80104b21:	85 c0                	test   %eax,%eax
80104b23:	74 10                	je     80104b35 <holding+0x25>
80104b25:	8b 5e 08             	mov    0x8(%esi),%ebx
80104b28:	e8 23 ec ff ff       	call   80103750 <mycpu>
80104b2d:	39 c3                	cmp    %eax,%ebx
80104b2f:	0f 94 c3             	sete   %bl
80104b32:	0f b6 db             	movzbl %bl,%ebx
80104b35:	e8 66 ff ff ff       	call   80104aa0 <popcli>
80104b3a:	89 d8                	mov    %ebx,%eax
80104b3c:	5b                   	pop    %ebx
80104b3d:	5e                   	pop    %esi
80104b3e:	5d                   	pop    %ebp
80104b3f:	c3                   	ret    

80104b40 <acquire>:
80104b40:	55                   	push   %ebp
80104b41:	89 e5                	mov    %esp,%ebp
80104b43:	53                   	push   %ebx
80104b44:	83 ec 04             	sub    $0x4,%esp
80104b47:	e8 14 ff ff ff       	call   80104a60 <pushcli>
80104b4c:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104b4f:	83 ec 0c             	sub    $0xc,%esp
80104b52:	53                   	push   %ebx
80104b53:	e8 b8 ff ff ff       	call   80104b10 <holding>
80104b58:	83 c4 10             	add    $0x10,%esp
80104b5b:	85 c0                	test   %eax,%eax
80104b5d:	0f 85 7d 00 00 00    	jne    80104be0 <acquire+0xa0>
80104b63:	ba 01 00 00 00       	mov    $0x1,%edx
80104b68:	eb 09                	jmp    80104b73 <acquire+0x33>
80104b6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104b70:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104b73:	89 d0                	mov    %edx,%eax
80104b75:	f0 87 03             	lock xchg %eax,(%ebx)
80104b78:	85 c0                	test   %eax,%eax
80104b7a:	75 f4                	jne    80104b70 <acquire+0x30>
80104b7c:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80104b81:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104b84:	e8 c7 eb ff ff       	call   80103750 <mycpu>
80104b89:	89 ea                	mov    %ebp,%edx
80104b8b:	8d 4b 0c             	lea    0xc(%ebx),%ecx
80104b8e:	89 43 08             	mov    %eax,0x8(%ebx)
80104b91:	31 c0                	xor    %eax,%eax
80104b93:	90                   	nop
80104b94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104b98:	8d 9a 00 00 00 80    	lea    -0x80000000(%edx),%ebx
80104b9e:	81 fb fe ff ff 7f    	cmp    $0x7ffffffe,%ebx
80104ba4:	77 1a                	ja     80104bc0 <acquire+0x80>
80104ba6:	8b 5a 04             	mov    0x4(%edx),%ebx
80104ba9:	89 1c 81             	mov    %ebx,(%ecx,%eax,4)
80104bac:	83 c0 01             	add    $0x1,%eax
80104baf:	8b 12                	mov    (%edx),%edx
80104bb1:	83 f8 0a             	cmp    $0xa,%eax
80104bb4:	75 e2                	jne    80104b98 <acquire+0x58>
80104bb6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104bb9:	c9                   	leave  
80104bba:	c3                   	ret    
80104bbb:	90                   	nop
80104bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104bc0:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
80104bc7:	83 c0 01             	add    $0x1,%eax
80104bca:	83 f8 0a             	cmp    $0xa,%eax
80104bcd:	74 e7                	je     80104bb6 <acquire+0x76>
80104bcf:	c7 04 81 00 00 00 00 	movl   $0x0,(%ecx,%eax,4)
80104bd6:	83 c0 01             	add    $0x1,%eax
80104bd9:	83 f8 0a             	cmp    $0xa,%eax
80104bdc:	75 e2                	jne    80104bc0 <acquire+0x80>
80104bde:	eb d6                	jmp    80104bb6 <acquire+0x76>
80104be0:	83 ec 0c             	sub    $0xc,%esp
80104be3:	68 11 7f 10 80       	push   $0x80107f11
80104be8:	e8 83 b7 ff ff       	call   80100370 <panic>
80104bed:	8d 76 00             	lea    0x0(%esi),%esi

80104bf0 <release>:
80104bf0:	55                   	push   %ebp
80104bf1:	89 e5                	mov    %esp,%ebp
80104bf3:	53                   	push   %ebx
80104bf4:	83 ec 10             	sub    $0x10,%esp
80104bf7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104bfa:	53                   	push   %ebx
80104bfb:	e8 10 ff ff ff       	call   80104b10 <holding>
80104c00:	83 c4 10             	add    $0x10,%esp
80104c03:	85 c0                	test   %eax,%eax
80104c05:	74 22                	je     80104c29 <release+0x39>
80104c07:	c7 43 0c 00 00 00 00 	movl   $0x0,0xc(%ebx)
80104c0e:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
80104c15:	f0 83 0c 24 00       	lock orl $0x0,(%esp)
80104c1a:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
80104c20:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80104c23:	c9                   	leave  
80104c24:	e9 77 fe ff ff       	jmp    80104aa0 <popcli>
80104c29:	83 ec 0c             	sub    $0xc,%esp
80104c2c:	68 19 7f 10 80       	push   $0x80107f19
80104c31:	e8 3a b7 ff ff       	call   80100370 <panic>
80104c36:	66 90                	xchg   %ax,%ax
80104c38:	66 90                	xchg   %ax,%ax
80104c3a:	66 90                	xchg   %ax,%ax
80104c3c:	66 90                	xchg   %ax,%ax
80104c3e:	66 90                	xchg   %ax,%ax

80104c40 <memset>:
80104c40:	55                   	push   %ebp
80104c41:	89 e5                	mov    %esp,%ebp
80104c43:	57                   	push   %edi
80104c44:	53                   	push   %ebx
80104c45:	8b 55 08             	mov    0x8(%ebp),%edx
80104c48:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104c4b:	f6 c2 03             	test   $0x3,%dl
80104c4e:	75 05                	jne    80104c55 <memset+0x15>
80104c50:	f6 c1 03             	test   $0x3,%cl
80104c53:	74 13                	je     80104c68 <memset+0x28>
80104c55:	89 d7                	mov    %edx,%edi
80104c57:	8b 45 0c             	mov    0xc(%ebp),%eax
80104c5a:	fc                   	cld    
80104c5b:	f3 aa                	rep stos %al,%es:(%edi)
80104c5d:	5b                   	pop    %ebx
80104c5e:	89 d0                	mov    %edx,%eax
80104c60:	5f                   	pop    %edi
80104c61:	5d                   	pop    %ebp
80104c62:	c3                   	ret    
80104c63:	90                   	nop
80104c64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104c68:	0f b6 7d 0c          	movzbl 0xc(%ebp),%edi
80104c6c:	c1 e9 02             	shr    $0x2,%ecx
80104c6f:	89 fb                	mov    %edi,%ebx
80104c71:	89 f8                	mov    %edi,%eax
80104c73:	c1 e3 18             	shl    $0x18,%ebx
80104c76:	c1 e0 10             	shl    $0x10,%eax
80104c79:	09 d8                	or     %ebx,%eax
80104c7b:	09 f8                	or     %edi,%eax
80104c7d:	c1 e7 08             	shl    $0x8,%edi
80104c80:	09 f8                	or     %edi,%eax
80104c82:	89 d7                	mov    %edx,%edi
80104c84:	fc                   	cld    
80104c85:	f3 ab                	rep stos %eax,%es:(%edi)
80104c87:	5b                   	pop    %ebx
80104c88:	89 d0                	mov    %edx,%eax
80104c8a:	5f                   	pop    %edi
80104c8b:	5d                   	pop    %ebp
80104c8c:	c3                   	ret    
80104c8d:	8d 76 00             	lea    0x0(%esi),%esi

80104c90 <memcmp>:
80104c90:	55                   	push   %ebp
80104c91:	89 e5                	mov    %esp,%ebp
80104c93:	57                   	push   %edi
80104c94:	56                   	push   %esi
80104c95:	8b 45 10             	mov    0x10(%ebp),%eax
80104c98:	53                   	push   %ebx
80104c99:	8b 75 0c             	mov    0xc(%ebp),%esi
80104c9c:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104c9f:	85 c0                	test   %eax,%eax
80104ca1:	74 29                	je     80104ccc <memcmp+0x3c>
80104ca3:	0f b6 13             	movzbl (%ebx),%edx
80104ca6:	0f b6 0e             	movzbl (%esi),%ecx
80104ca9:	38 d1                	cmp    %dl,%cl
80104cab:	75 2b                	jne    80104cd8 <memcmp+0x48>
80104cad:	8d 78 ff             	lea    -0x1(%eax),%edi
80104cb0:	31 c0                	xor    %eax,%eax
80104cb2:	eb 14                	jmp    80104cc8 <memcmp+0x38>
80104cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104cb8:	0f b6 54 03 01       	movzbl 0x1(%ebx,%eax,1),%edx
80104cbd:	83 c0 01             	add    $0x1,%eax
80104cc0:	0f b6 0c 06          	movzbl (%esi,%eax,1),%ecx
80104cc4:	38 ca                	cmp    %cl,%dl
80104cc6:	75 10                	jne    80104cd8 <memcmp+0x48>
80104cc8:	39 f8                	cmp    %edi,%eax
80104cca:	75 ec                	jne    80104cb8 <memcmp+0x28>
80104ccc:	5b                   	pop    %ebx
80104ccd:	31 c0                	xor    %eax,%eax
80104ccf:	5e                   	pop    %esi
80104cd0:	5f                   	pop    %edi
80104cd1:	5d                   	pop    %ebp
80104cd2:	c3                   	ret    
80104cd3:	90                   	nop
80104cd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104cd8:	0f b6 c2             	movzbl %dl,%eax
80104cdb:	5b                   	pop    %ebx
80104cdc:	29 c8                	sub    %ecx,%eax
80104cde:	5e                   	pop    %esi
80104cdf:	5f                   	pop    %edi
80104ce0:	5d                   	pop    %ebp
80104ce1:	c3                   	ret    
80104ce2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104ce9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104cf0 <memmove>:
80104cf0:	55                   	push   %ebp
80104cf1:	89 e5                	mov    %esp,%ebp
80104cf3:	56                   	push   %esi
80104cf4:	53                   	push   %ebx
80104cf5:	8b 45 08             	mov    0x8(%ebp),%eax
80104cf8:	8b 75 0c             	mov    0xc(%ebp),%esi
80104cfb:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104cfe:	39 c6                	cmp    %eax,%esi
80104d00:	73 2e                	jae    80104d30 <memmove+0x40>
80104d02:	8d 0c 1e             	lea    (%esi,%ebx,1),%ecx
80104d05:	39 c8                	cmp    %ecx,%eax
80104d07:	73 27                	jae    80104d30 <memmove+0x40>
80104d09:	85 db                	test   %ebx,%ebx
80104d0b:	8d 53 ff             	lea    -0x1(%ebx),%edx
80104d0e:	74 17                	je     80104d27 <memmove+0x37>
80104d10:	29 d9                	sub    %ebx,%ecx
80104d12:	89 cb                	mov    %ecx,%ebx
80104d14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104d18:	0f b6 0c 13          	movzbl (%ebx,%edx,1),%ecx
80104d1c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104d1f:	83 ea 01             	sub    $0x1,%edx
80104d22:	83 fa ff             	cmp    $0xffffffff,%edx
80104d25:	75 f1                	jne    80104d18 <memmove+0x28>
80104d27:	5b                   	pop    %ebx
80104d28:	5e                   	pop    %esi
80104d29:	5d                   	pop    %ebp
80104d2a:	c3                   	ret    
80104d2b:	90                   	nop
80104d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104d30:	31 d2                	xor    %edx,%edx
80104d32:	85 db                	test   %ebx,%ebx
80104d34:	74 f1                	je     80104d27 <memmove+0x37>
80104d36:	8d 76 00             	lea    0x0(%esi),%esi
80104d39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104d40:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
80104d44:	88 0c 10             	mov    %cl,(%eax,%edx,1)
80104d47:	83 c2 01             	add    $0x1,%edx
80104d4a:	39 d3                	cmp    %edx,%ebx
80104d4c:	75 f2                	jne    80104d40 <memmove+0x50>
80104d4e:	5b                   	pop    %ebx
80104d4f:	5e                   	pop    %esi
80104d50:	5d                   	pop    %ebp
80104d51:	c3                   	ret    
80104d52:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d60 <memcpy>:
80104d60:	55                   	push   %ebp
80104d61:	89 e5                	mov    %esp,%ebp
80104d63:	5d                   	pop    %ebp
80104d64:	eb 8a                	jmp    80104cf0 <memmove>
80104d66:	8d 76 00             	lea    0x0(%esi),%esi
80104d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104d70 <strncmp>:
80104d70:	55                   	push   %ebp
80104d71:	89 e5                	mov    %esp,%ebp
80104d73:	57                   	push   %edi
80104d74:	56                   	push   %esi
80104d75:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104d78:	53                   	push   %ebx
80104d79:	8b 7d 08             	mov    0x8(%ebp),%edi
80104d7c:	8b 75 0c             	mov    0xc(%ebp),%esi
80104d7f:	85 c9                	test   %ecx,%ecx
80104d81:	74 37                	je     80104dba <strncmp+0x4a>
80104d83:	0f b6 17             	movzbl (%edi),%edx
80104d86:	0f b6 1e             	movzbl (%esi),%ebx
80104d89:	84 d2                	test   %dl,%dl
80104d8b:	74 3f                	je     80104dcc <strncmp+0x5c>
80104d8d:	38 d3                	cmp    %dl,%bl
80104d8f:	75 3b                	jne    80104dcc <strncmp+0x5c>
80104d91:	8d 47 01             	lea    0x1(%edi),%eax
80104d94:	01 cf                	add    %ecx,%edi
80104d96:	eb 1b                	jmp    80104db3 <strncmp+0x43>
80104d98:	90                   	nop
80104d99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104da0:	0f b6 10             	movzbl (%eax),%edx
80104da3:	84 d2                	test   %dl,%dl
80104da5:	74 21                	je     80104dc8 <strncmp+0x58>
80104da7:	0f b6 19             	movzbl (%ecx),%ebx
80104daa:	83 c0 01             	add    $0x1,%eax
80104dad:	89 ce                	mov    %ecx,%esi
80104daf:	38 da                	cmp    %bl,%dl
80104db1:	75 19                	jne    80104dcc <strncmp+0x5c>
80104db3:	39 c7                	cmp    %eax,%edi
80104db5:	8d 4e 01             	lea    0x1(%esi),%ecx
80104db8:	75 e6                	jne    80104da0 <strncmp+0x30>
80104dba:	5b                   	pop    %ebx
80104dbb:	31 c0                	xor    %eax,%eax
80104dbd:	5e                   	pop    %esi
80104dbe:	5f                   	pop    %edi
80104dbf:	5d                   	pop    %ebp
80104dc0:	c3                   	ret    
80104dc1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104dc8:	0f b6 5e 01          	movzbl 0x1(%esi),%ebx
80104dcc:	0f b6 c2             	movzbl %dl,%eax
80104dcf:	29 d8                	sub    %ebx,%eax
80104dd1:	5b                   	pop    %ebx
80104dd2:	5e                   	pop    %esi
80104dd3:	5f                   	pop    %edi
80104dd4:	5d                   	pop    %ebp
80104dd5:	c3                   	ret    
80104dd6:	8d 76 00             	lea    0x0(%esi),%esi
80104dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104de0 <strncpy>:
80104de0:	55                   	push   %ebp
80104de1:	89 e5                	mov    %esp,%ebp
80104de3:	56                   	push   %esi
80104de4:	53                   	push   %ebx
80104de5:	8b 45 08             	mov    0x8(%ebp),%eax
80104de8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
80104deb:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104dee:	89 c2                	mov    %eax,%edx
80104df0:	eb 19                	jmp    80104e0b <strncpy+0x2b>
80104df2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104df8:	83 c3 01             	add    $0x1,%ebx
80104dfb:	0f b6 4b ff          	movzbl -0x1(%ebx),%ecx
80104dff:	83 c2 01             	add    $0x1,%edx
80104e02:	84 c9                	test   %cl,%cl
80104e04:	88 4a ff             	mov    %cl,-0x1(%edx)
80104e07:	74 09                	je     80104e12 <strncpy+0x32>
80104e09:	89 f1                	mov    %esi,%ecx
80104e0b:	85 c9                	test   %ecx,%ecx
80104e0d:	8d 71 ff             	lea    -0x1(%ecx),%esi
80104e10:	7f e6                	jg     80104df8 <strncpy+0x18>
80104e12:	31 c9                	xor    %ecx,%ecx
80104e14:	85 f6                	test   %esi,%esi
80104e16:	7e 17                	jle    80104e2f <strncpy+0x4f>
80104e18:	90                   	nop
80104e19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104e20:	c6 04 0a 00          	movb   $0x0,(%edx,%ecx,1)
80104e24:	89 f3                	mov    %esi,%ebx
80104e26:	83 c1 01             	add    $0x1,%ecx
80104e29:	29 cb                	sub    %ecx,%ebx
80104e2b:	85 db                	test   %ebx,%ebx
80104e2d:	7f f1                	jg     80104e20 <strncpy+0x40>
80104e2f:	5b                   	pop    %ebx
80104e30:	5e                   	pop    %esi
80104e31:	5d                   	pop    %ebp
80104e32:	c3                   	ret    
80104e33:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104e40 <safestrcpy>:
80104e40:	55                   	push   %ebp
80104e41:	89 e5                	mov    %esp,%ebp
80104e43:	56                   	push   %esi
80104e44:	53                   	push   %ebx
80104e45:	8b 4d 10             	mov    0x10(%ebp),%ecx
80104e48:	8b 45 08             	mov    0x8(%ebp),%eax
80104e4b:	8b 55 0c             	mov    0xc(%ebp),%edx
80104e4e:	85 c9                	test   %ecx,%ecx
80104e50:	7e 26                	jle    80104e78 <safestrcpy+0x38>
80104e52:	8d 74 0a ff          	lea    -0x1(%edx,%ecx,1),%esi
80104e56:	89 c1                	mov    %eax,%ecx
80104e58:	eb 17                	jmp    80104e71 <safestrcpy+0x31>
80104e5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80104e60:	83 c2 01             	add    $0x1,%edx
80104e63:	0f b6 5a ff          	movzbl -0x1(%edx),%ebx
80104e67:	83 c1 01             	add    $0x1,%ecx
80104e6a:	84 db                	test   %bl,%bl
80104e6c:	88 59 ff             	mov    %bl,-0x1(%ecx)
80104e6f:	74 04                	je     80104e75 <safestrcpy+0x35>
80104e71:	39 f2                	cmp    %esi,%edx
80104e73:	75 eb                	jne    80104e60 <safestrcpy+0x20>
80104e75:	c6 01 00             	movb   $0x0,(%ecx)
80104e78:	5b                   	pop    %ebx
80104e79:	5e                   	pop    %esi
80104e7a:	5d                   	pop    %ebp
80104e7b:	c3                   	ret    
80104e7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80104e80 <strlen>:
80104e80:	55                   	push   %ebp
80104e81:	31 c0                	xor    %eax,%eax
80104e83:	89 e5                	mov    %esp,%ebp
80104e85:	8b 55 08             	mov    0x8(%ebp),%edx
80104e88:	80 3a 00             	cmpb   $0x0,(%edx)
80104e8b:	74 0c                	je     80104e99 <strlen+0x19>
80104e8d:	8d 76 00             	lea    0x0(%esi),%esi
80104e90:	83 c0 01             	add    $0x1,%eax
80104e93:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
80104e97:	75 f7                	jne    80104e90 <strlen+0x10>
80104e99:	5d                   	pop    %ebp
80104e9a:	c3                   	ret    

80104e9b <swtch>:
80104e9b:	8b 44 24 04          	mov    0x4(%esp),%eax
80104e9f:	8b 54 24 08          	mov    0x8(%esp),%edx
80104ea3:	55                   	push   %ebp
80104ea4:	53                   	push   %ebx
80104ea5:	56                   	push   %esi
80104ea6:	57                   	push   %edi
80104ea7:	89 20                	mov    %esp,(%eax)
80104ea9:	89 d4                	mov    %edx,%esp
80104eab:	5f                   	pop    %edi
80104eac:	5e                   	pop    %esi
80104ead:	5b                   	pop    %ebx
80104eae:	5d                   	pop    %ebp
80104eaf:	c3                   	ret    

80104eb0 <fetchint>:
80104eb0:	55                   	push   %ebp
80104eb1:	89 e5                	mov    %esp,%ebp
80104eb3:	53                   	push   %ebx
80104eb4:	83 ec 04             	sub    $0x4,%esp
80104eb7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104eba:	e8 31 e9 ff ff       	call   801037f0 <myproc>
80104ebf:	8b 00                	mov    (%eax),%eax
80104ec1:	39 d8                	cmp    %ebx,%eax
80104ec3:	76 1b                	jbe    80104ee0 <fetchint+0x30>
80104ec5:	8d 53 04             	lea    0x4(%ebx),%edx
80104ec8:	39 d0                	cmp    %edx,%eax
80104eca:	72 14                	jb     80104ee0 <fetchint+0x30>
80104ecc:	8b 45 0c             	mov    0xc(%ebp),%eax
80104ecf:	8b 13                	mov    (%ebx),%edx
80104ed1:	89 10                	mov    %edx,(%eax)
80104ed3:	31 c0                	xor    %eax,%eax
80104ed5:	83 c4 04             	add    $0x4,%esp
80104ed8:	5b                   	pop    %ebx
80104ed9:	5d                   	pop    %ebp
80104eda:	c3                   	ret    
80104edb:	90                   	nop
80104edc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80104ee0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ee5:	eb ee                	jmp    80104ed5 <fetchint+0x25>
80104ee7:	89 f6                	mov    %esi,%esi
80104ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104ef0 <fetchstr>:
80104ef0:	55                   	push   %ebp
80104ef1:	89 e5                	mov    %esp,%ebp
80104ef3:	53                   	push   %ebx
80104ef4:	83 ec 04             	sub    $0x4,%esp
80104ef7:	8b 5d 08             	mov    0x8(%ebp),%ebx
80104efa:	e8 f1 e8 ff ff       	call   801037f0 <myproc>
80104eff:	39 18                	cmp    %ebx,(%eax)
80104f01:	76 29                	jbe    80104f2c <fetchstr+0x3c>
80104f03:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80104f06:	89 da                	mov    %ebx,%edx
80104f08:	89 19                	mov    %ebx,(%ecx)
80104f0a:	8b 00                	mov    (%eax),%eax
80104f0c:	39 c3                	cmp    %eax,%ebx
80104f0e:	73 1c                	jae    80104f2c <fetchstr+0x3c>
80104f10:	80 3b 00             	cmpb   $0x0,(%ebx)
80104f13:	75 10                	jne    80104f25 <fetchstr+0x35>
80104f15:	eb 29                	jmp    80104f40 <fetchstr+0x50>
80104f17:	89 f6                	mov    %esi,%esi
80104f19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104f20:	80 3a 00             	cmpb   $0x0,(%edx)
80104f23:	74 1b                	je     80104f40 <fetchstr+0x50>
80104f25:	83 c2 01             	add    $0x1,%edx
80104f28:	39 d0                	cmp    %edx,%eax
80104f2a:	77 f4                	ja     80104f20 <fetchstr+0x30>
80104f2c:	83 c4 04             	add    $0x4,%esp
80104f2f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f34:	5b                   	pop    %ebx
80104f35:	5d                   	pop    %ebp
80104f36:	c3                   	ret    
80104f37:	89 f6                	mov    %esi,%esi
80104f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80104f40:	83 c4 04             	add    $0x4,%esp
80104f43:	89 d0                	mov    %edx,%eax
80104f45:	29 d8                	sub    %ebx,%eax
80104f47:	5b                   	pop    %ebx
80104f48:	5d                   	pop    %ebp
80104f49:	c3                   	ret    
80104f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80104f50 <argint>:
80104f50:	55                   	push   %ebp
80104f51:	89 e5                	mov    %esp,%ebp
80104f53:	56                   	push   %esi
80104f54:	53                   	push   %ebx
80104f55:	e8 96 e8 ff ff       	call   801037f0 <myproc>
80104f5a:	8b 40 18             	mov    0x18(%eax),%eax
80104f5d:	8b 55 08             	mov    0x8(%ebp),%edx
80104f60:	8b 40 44             	mov    0x44(%eax),%eax
80104f63:	8d 1c 90             	lea    (%eax,%edx,4),%ebx
80104f66:	e8 85 e8 ff ff       	call   801037f0 <myproc>
80104f6b:	8b 00                	mov    (%eax),%eax
80104f6d:	8d 73 04             	lea    0x4(%ebx),%esi
80104f70:	39 c6                	cmp    %eax,%esi
80104f72:	73 1c                	jae    80104f90 <argint+0x40>
80104f74:	8d 53 08             	lea    0x8(%ebx),%edx
80104f77:	39 d0                	cmp    %edx,%eax
80104f79:	72 15                	jb     80104f90 <argint+0x40>
80104f7b:	8b 45 0c             	mov    0xc(%ebp),%eax
80104f7e:	8b 53 04             	mov    0x4(%ebx),%edx
80104f81:	89 10                	mov    %edx,(%eax)
80104f83:	31 c0                	xor    %eax,%eax
80104f85:	5b                   	pop    %ebx
80104f86:	5e                   	pop    %esi
80104f87:	5d                   	pop    %ebp
80104f88:	c3                   	ret    
80104f89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104f90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104f95:	eb ee                	jmp    80104f85 <argint+0x35>
80104f97:	89 f6                	mov    %esi,%esi
80104f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80104fa0 <argptr>:
80104fa0:	55                   	push   %ebp
80104fa1:	89 e5                	mov    %esp,%ebp
80104fa3:	56                   	push   %esi
80104fa4:	53                   	push   %ebx
80104fa5:	83 ec 10             	sub    $0x10,%esp
80104fa8:	8b 5d 10             	mov    0x10(%ebp),%ebx
80104fab:	e8 40 e8 ff ff       	call   801037f0 <myproc>
80104fb0:	89 c6                	mov    %eax,%esi
80104fb2:	8d 45 f4             	lea    -0xc(%ebp),%eax
80104fb5:	83 ec 08             	sub    $0x8,%esp
80104fb8:	50                   	push   %eax
80104fb9:	ff 75 08             	pushl  0x8(%ebp)
80104fbc:	e8 8f ff ff ff       	call   80104f50 <argint>
80104fc1:	c1 e8 1f             	shr    $0x1f,%eax
80104fc4:	83 c4 10             	add    $0x10,%esp
80104fc7:	84 c0                	test   %al,%al
80104fc9:	75 2d                	jne    80104ff8 <argptr+0x58>
80104fcb:	89 d8                	mov    %ebx,%eax
80104fcd:	c1 e8 1f             	shr    $0x1f,%eax
80104fd0:	84 c0                	test   %al,%al
80104fd2:	75 24                	jne    80104ff8 <argptr+0x58>
80104fd4:	8b 16                	mov    (%esi),%edx
80104fd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
80104fd9:	39 c2                	cmp    %eax,%edx
80104fdb:	76 1b                	jbe    80104ff8 <argptr+0x58>
80104fdd:	01 c3                	add    %eax,%ebx
80104fdf:	39 da                	cmp    %ebx,%edx
80104fe1:	72 15                	jb     80104ff8 <argptr+0x58>
80104fe3:	8b 55 0c             	mov    0xc(%ebp),%edx
80104fe6:	89 02                	mov    %eax,(%edx)
80104fe8:	31 c0                	xor    %eax,%eax
80104fea:	8d 65 f8             	lea    -0x8(%ebp),%esp
80104fed:	5b                   	pop    %ebx
80104fee:	5e                   	pop    %esi
80104fef:	5d                   	pop    %ebp
80104ff0:	c3                   	ret    
80104ff1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80104ff8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80104ffd:	eb eb                	jmp    80104fea <argptr+0x4a>
80104fff:	90                   	nop

80105000 <argstr>:
80105000:	55                   	push   %ebp
80105001:	89 e5                	mov    %esp,%ebp
80105003:	83 ec 20             	sub    $0x20,%esp
80105006:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105009:	50                   	push   %eax
8010500a:	ff 75 08             	pushl  0x8(%ebp)
8010500d:	e8 3e ff ff ff       	call   80104f50 <argint>
80105012:	83 c4 10             	add    $0x10,%esp
80105015:	85 c0                	test   %eax,%eax
80105017:	78 17                	js     80105030 <argstr+0x30>
80105019:	83 ec 08             	sub    $0x8,%esp
8010501c:	ff 75 0c             	pushl  0xc(%ebp)
8010501f:	ff 75 f4             	pushl  -0xc(%ebp)
80105022:	e8 c9 fe ff ff       	call   80104ef0 <fetchstr>
80105027:	83 c4 10             	add    $0x10,%esp
8010502a:	c9                   	leave  
8010502b:	c3                   	ret    
8010502c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105030:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105035:	c9                   	leave  
80105036:	c3                   	ret    
80105037:	89 f6                	mov    %esi,%esi
80105039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105040 <syscall>:
80105040:	55                   	push   %ebp
80105041:	89 e5                	mov    %esp,%ebp
80105043:	56                   	push   %esi
80105044:	53                   	push   %ebx
80105045:	e8 a6 e7 ff ff       	call   801037f0 <myproc>
8010504a:	8b 70 18             	mov    0x18(%eax),%esi
8010504d:	89 c3                	mov    %eax,%ebx
8010504f:	8b 46 1c             	mov    0x1c(%esi),%eax
80105052:	8d 50 ff             	lea    -0x1(%eax),%edx
80105055:	83 fa 18             	cmp    $0x18,%edx
80105058:	77 1e                	ja     80105078 <syscall+0x38>
8010505a:	8b 14 85 40 7f 10 80 	mov    -0x7fef80c0(,%eax,4),%edx
80105061:	85 d2                	test   %edx,%edx
80105063:	74 13                	je     80105078 <syscall+0x38>
80105065:	ff d2                	call   *%edx
80105067:	89 46 1c             	mov    %eax,0x1c(%esi)
8010506a:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010506d:	5b                   	pop    %ebx
8010506e:	5e                   	pop    %esi
8010506f:	5d                   	pop    %ebp
80105070:	c3                   	ret    
80105071:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105078:	50                   	push   %eax
80105079:	8d 43 6c             	lea    0x6c(%ebx),%eax
8010507c:	50                   	push   %eax
8010507d:	ff 73 10             	pushl  0x10(%ebx)
80105080:	68 21 7f 10 80       	push   $0x80107f21
80105085:	e8 d6 b5 ff ff       	call   80100660 <cprintf>
8010508a:	8b 43 18             	mov    0x18(%ebx),%eax
8010508d:	83 c4 10             	add    $0x10,%esp
80105090:	c7 40 1c ff ff ff ff 	movl   $0xffffffff,0x1c(%eax)
80105097:	8d 65 f8             	lea    -0x8(%ebp),%esp
8010509a:	5b                   	pop    %ebx
8010509b:	5e                   	pop    %esi
8010509c:	5d                   	pop    %ebp
8010509d:	c3                   	ret    
8010509e:	66 90                	xchg   %ax,%ax

801050a0 <create>:
801050a0:	55                   	push   %ebp
801050a1:	89 e5                	mov    %esp,%ebp
801050a3:	57                   	push   %edi
801050a4:	56                   	push   %esi
801050a5:	53                   	push   %ebx
801050a6:	8d 75 da             	lea    -0x26(%ebp),%esi
801050a9:	83 ec 44             	sub    $0x44,%esp
801050ac:	89 4d c0             	mov    %ecx,-0x40(%ebp)
801050af:	8b 4d 08             	mov    0x8(%ebp),%ecx
801050b2:	56                   	push   %esi
801050b3:	50                   	push   %eax
801050b4:	89 55 c4             	mov    %edx,-0x3c(%ebp)
801050b7:	89 4d bc             	mov    %ecx,-0x44(%ebp)
801050ba:	e8 61 ce ff ff       	call   80101f20 <nameiparent>
801050bf:	83 c4 10             	add    $0x10,%esp
801050c2:	85 c0                	test   %eax,%eax
801050c4:	0f 84 f6 00 00 00    	je     801051c0 <create+0x120>
801050ca:	83 ec 0c             	sub    $0xc,%esp
801050cd:	89 c7                	mov    %eax,%edi
801050cf:	50                   	push   %eax
801050d0:	e8 db c5 ff ff       	call   801016b0 <ilock>
801050d5:	8d 45 d4             	lea    -0x2c(%ebp),%eax
801050d8:	83 c4 0c             	add    $0xc,%esp
801050db:	50                   	push   %eax
801050dc:	56                   	push   %esi
801050dd:	57                   	push   %edi
801050de:	e8 fd ca ff ff       	call   80101be0 <dirlookup>
801050e3:	83 c4 10             	add    $0x10,%esp
801050e6:	85 c0                	test   %eax,%eax
801050e8:	89 c3                	mov    %eax,%ebx
801050ea:	74 54                	je     80105140 <create+0xa0>
801050ec:	83 ec 0c             	sub    $0xc,%esp
801050ef:	57                   	push   %edi
801050f0:	e8 4b c8 ff ff       	call   80101940 <iunlockput>
801050f5:	89 1c 24             	mov    %ebx,(%esp)
801050f8:	e8 b3 c5 ff ff       	call   801016b0 <ilock>
801050fd:	83 c4 10             	add    $0x10,%esp
80105100:	66 83 7d c4 02       	cmpw   $0x2,-0x3c(%ebp)
80105105:	75 19                	jne    80105120 <create+0x80>
80105107:	66 83 7b 50 02       	cmpw   $0x2,0x50(%ebx)
8010510c:	89 d8                	mov    %ebx,%eax
8010510e:	75 10                	jne    80105120 <create+0x80>
80105110:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105113:	5b                   	pop    %ebx
80105114:	5e                   	pop    %esi
80105115:	5f                   	pop    %edi
80105116:	5d                   	pop    %ebp
80105117:	c3                   	ret    
80105118:	90                   	nop
80105119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105120:	83 ec 0c             	sub    $0xc,%esp
80105123:	53                   	push   %ebx
80105124:	e8 17 c8 ff ff       	call   80101940 <iunlockput>
80105129:	83 c4 10             	add    $0x10,%esp
8010512c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010512f:	31 c0                	xor    %eax,%eax
80105131:	5b                   	pop    %ebx
80105132:	5e                   	pop    %esi
80105133:	5f                   	pop    %edi
80105134:	5d                   	pop    %ebp
80105135:	c3                   	ret    
80105136:	8d 76 00             	lea    0x0(%esi),%esi
80105139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105140:	0f bf 45 c4          	movswl -0x3c(%ebp),%eax
80105144:	83 ec 08             	sub    $0x8,%esp
80105147:	50                   	push   %eax
80105148:	ff 37                	pushl  (%edi)
8010514a:	e8 f1 c3 ff ff       	call   80101540 <ialloc>
8010514f:	83 c4 10             	add    $0x10,%esp
80105152:	85 c0                	test   %eax,%eax
80105154:	89 c3                	mov    %eax,%ebx
80105156:	0f 84 cc 00 00 00    	je     80105228 <create+0x188>
8010515c:	83 ec 0c             	sub    $0xc,%esp
8010515f:	50                   	push   %eax
80105160:	e8 4b c5 ff ff       	call   801016b0 <ilock>
80105165:	0f b7 45 c0          	movzwl -0x40(%ebp),%eax
80105169:	66 89 43 52          	mov    %ax,0x52(%ebx)
8010516d:	0f b7 45 bc          	movzwl -0x44(%ebp),%eax
80105171:	66 89 43 54          	mov    %ax,0x54(%ebx)
80105175:	b8 01 00 00 00       	mov    $0x1,%eax
8010517a:	66 89 43 56          	mov    %ax,0x56(%ebx)
8010517e:	89 1c 24             	mov    %ebx,(%esp)
80105181:	e8 7a c4 ff ff       	call   80101600 <iupdate>
80105186:	83 c4 10             	add    $0x10,%esp
80105189:	66 83 7d c4 01       	cmpw   $0x1,-0x3c(%ebp)
8010518e:	74 40                	je     801051d0 <create+0x130>
80105190:	83 ec 04             	sub    $0x4,%esp
80105193:	ff 73 04             	pushl  0x4(%ebx)
80105196:	56                   	push   %esi
80105197:	57                   	push   %edi
80105198:	e8 a3 cc ff ff       	call   80101e40 <dirlink>
8010519d:	83 c4 10             	add    $0x10,%esp
801051a0:	85 c0                	test   %eax,%eax
801051a2:	78 77                	js     8010521b <create+0x17b>
801051a4:	83 ec 0c             	sub    $0xc,%esp
801051a7:	57                   	push   %edi
801051a8:	e8 93 c7 ff ff       	call   80101940 <iunlockput>
801051ad:	83 c4 10             	add    $0x10,%esp
801051b0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801051b3:	89 d8                	mov    %ebx,%eax
801051b5:	5b                   	pop    %ebx
801051b6:	5e                   	pop    %esi
801051b7:	5f                   	pop    %edi
801051b8:	5d                   	pop    %ebp
801051b9:	c3                   	ret    
801051ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801051c0:	31 c0                	xor    %eax,%eax
801051c2:	e9 49 ff ff ff       	jmp    80105110 <create+0x70>
801051c7:	89 f6                	mov    %esi,%esi
801051c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801051d0:	66 83 47 56 01       	addw   $0x1,0x56(%edi)
801051d5:	83 ec 0c             	sub    $0xc,%esp
801051d8:	57                   	push   %edi
801051d9:	e8 22 c4 ff ff       	call   80101600 <iupdate>
801051de:	83 c4 0c             	add    $0xc,%esp
801051e1:	ff 73 04             	pushl  0x4(%ebx)
801051e4:	68 c4 7f 10 80       	push   $0x80107fc4
801051e9:	53                   	push   %ebx
801051ea:	e8 51 cc ff ff       	call   80101e40 <dirlink>
801051ef:	83 c4 10             	add    $0x10,%esp
801051f2:	85 c0                	test   %eax,%eax
801051f4:	78 18                	js     8010520e <create+0x16e>
801051f6:	83 ec 04             	sub    $0x4,%esp
801051f9:	ff 77 04             	pushl  0x4(%edi)
801051fc:	68 c3 7f 10 80       	push   $0x80107fc3
80105201:	53                   	push   %ebx
80105202:	e8 39 cc ff ff       	call   80101e40 <dirlink>
80105207:	83 c4 10             	add    $0x10,%esp
8010520a:	85 c0                	test   %eax,%eax
8010520c:	79 82                	jns    80105190 <create+0xf0>
8010520e:	83 ec 0c             	sub    $0xc,%esp
80105211:	68 b7 7f 10 80       	push   $0x80107fb7
80105216:	e8 55 b1 ff ff       	call   80100370 <panic>
8010521b:	83 ec 0c             	sub    $0xc,%esp
8010521e:	68 c6 7f 10 80       	push   $0x80107fc6
80105223:	e8 48 b1 ff ff       	call   80100370 <panic>
80105228:	83 ec 0c             	sub    $0xc,%esp
8010522b:	68 a8 7f 10 80       	push   $0x80107fa8
80105230:	e8 3b b1 ff ff       	call   80100370 <panic>
80105235:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105240 <argfd.constprop.0>:
80105240:	55                   	push   %ebp
80105241:	89 e5                	mov    %esp,%ebp
80105243:	56                   	push   %esi
80105244:	53                   	push   %ebx
80105245:	89 c6                	mov    %eax,%esi
80105247:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010524a:	89 d3                	mov    %edx,%ebx
8010524c:	83 ec 18             	sub    $0x18,%esp
8010524f:	50                   	push   %eax
80105250:	6a 00                	push   $0x0
80105252:	e8 f9 fc ff ff       	call   80104f50 <argint>
80105257:	83 c4 10             	add    $0x10,%esp
8010525a:	85 c0                	test   %eax,%eax
8010525c:	78 32                	js     80105290 <argfd.constprop.0+0x50>
8010525e:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
80105262:	77 2c                	ja     80105290 <argfd.constprop.0+0x50>
80105264:	e8 87 e5 ff ff       	call   801037f0 <myproc>
80105269:	8b 55 f4             	mov    -0xc(%ebp),%edx
8010526c:	8b 44 90 28          	mov    0x28(%eax,%edx,4),%eax
80105270:	85 c0                	test   %eax,%eax
80105272:	74 1c                	je     80105290 <argfd.constprop.0+0x50>
80105274:	85 f6                	test   %esi,%esi
80105276:	74 02                	je     8010527a <argfd.constprop.0+0x3a>
80105278:	89 16                	mov    %edx,(%esi)
8010527a:	85 db                	test   %ebx,%ebx
8010527c:	74 22                	je     801052a0 <argfd.constprop.0+0x60>
8010527e:	89 03                	mov    %eax,(%ebx)
80105280:	31 c0                	xor    %eax,%eax
80105282:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105285:	5b                   	pop    %ebx
80105286:	5e                   	pop    %esi
80105287:	5d                   	pop    %ebp
80105288:	c3                   	ret    
80105289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105290:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105293:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105298:	5b                   	pop    %ebx
80105299:	5e                   	pop    %esi
8010529a:	5d                   	pop    %ebp
8010529b:	c3                   	ret    
8010529c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801052a0:	31 c0                	xor    %eax,%eax
801052a2:	eb de                	jmp    80105282 <argfd.constprop.0+0x42>
801052a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801052aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801052b0 <sys_dup>:
801052b0:	55                   	push   %ebp
801052b1:	31 c0                	xor    %eax,%eax
801052b3:	89 e5                	mov    %esp,%ebp
801052b5:	56                   	push   %esi
801052b6:	53                   	push   %ebx
801052b7:	8d 55 f4             	lea    -0xc(%ebp),%edx
801052ba:	83 ec 10             	sub    $0x10,%esp
801052bd:	e8 7e ff ff ff       	call   80105240 <argfd.constprop.0>
801052c2:	85 c0                	test   %eax,%eax
801052c4:	78 1a                	js     801052e0 <sys_dup+0x30>
801052c6:	31 db                	xor    %ebx,%ebx
801052c8:	8b 75 f4             	mov    -0xc(%ebp),%esi
801052cb:	e8 20 e5 ff ff       	call   801037f0 <myproc>
801052d0:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
801052d4:	85 d2                	test   %edx,%edx
801052d6:	74 18                	je     801052f0 <sys_dup+0x40>
801052d8:	83 c3 01             	add    $0x1,%ebx
801052db:	83 fb 10             	cmp    $0x10,%ebx
801052de:	75 f0                	jne    801052d0 <sys_dup+0x20>
801052e0:	8d 65 f8             	lea    -0x8(%ebp),%esp
801052e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801052e8:	5b                   	pop    %ebx
801052e9:	5e                   	pop    %esi
801052ea:	5d                   	pop    %ebp
801052eb:	c3                   	ret    
801052ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801052f0:	89 74 98 28          	mov    %esi,0x28(%eax,%ebx,4)
801052f4:	83 ec 0c             	sub    $0xc,%esp
801052f7:	ff 75 f4             	pushl  -0xc(%ebp)
801052fa:	e8 21 bb ff ff       	call   80100e20 <filedup>
801052ff:	83 c4 10             	add    $0x10,%esp
80105302:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105305:	89 d8                	mov    %ebx,%eax
80105307:	5b                   	pop    %ebx
80105308:	5e                   	pop    %esi
80105309:	5d                   	pop    %ebp
8010530a:	c3                   	ret    
8010530b:	90                   	nop
8010530c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105310 <sys_read>:
80105310:	55                   	push   %ebp
80105311:	31 c0                	xor    %eax,%eax
80105313:	89 e5                	mov    %esp,%ebp
80105315:	83 ec 18             	sub    $0x18,%esp
80105318:	8d 55 ec             	lea    -0x14(%ebp),%edx
8010531b:	e8 20 ff ff ff       	call   80105240 <argfd.constprop.0>
80105320:	85 c0                	test   %eax,%eax
80105322:	78 4c                	js     80105370 <sys_read+0x60>
80105324:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105327:	83 ec 08             	sub    $0x8,%esp
8010532a:	50                   	push   %eax
8010532b:	6a 02                	push   $0x2
8010532d:	e8 1e fc ff ff       	call   80104f50 <argint>
80105332:	83 c4 10             	add    $0x10,%esp
80105335:	85 c0                	test   %eax,%eax
80105337:	78 37                	js     80105370 <sys_read+0x60>
80105339:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010533c:	83 ec 04             	sub    $0x4,%esp
8010533f:	ff 75 f0             	pushl  -0x10(%ebp)
80105342:	50                   	push   %eax
80105343:	6a 01                	push   $0x1
80105345:	e8 56 fc ff ff       	call   80104fa0 <argptr>
8010534a:	83 c4 10             	add    $0x10,%esp
8010534d:	85 c0                	test   %eax,%eax
8010534f:	78 1f                	js     80105370 <sys_read+0x60>
80105351:	83 ec 04             	sub    $0x4,%esp
80105354:	ff 75 f0             	pushl  -0x10(%ebp)
80105357:	ff 75 f4             	pushl  -0xc(%ebp)
8010535a:	ff 75 ec             	pushl  -0x14(%ebp)
8010535d:	e8 2e bc ff ff       	call   80100f90 <fileread>
80105362:	83 c4 10             	add    $0x10,%esp
80105365:	c9                   	leave  
80105366:	c3                   	ret    
80105367:	89 f6                	mov    %esi,%esi
80105369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105370:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105375:	c9                   	leave  
80105376:	c3                   	ret    
80105377:	89 f6                	mov    %esi,%esi
80105379:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105380 <sys_write>:
80105380:	55                   	push   %ebp
80105381:	31 c0                	xor    %eax,%eax
80105383:	89 e5                	mov    %esp,%ebp
80105385:	83 ec 18             	sub    $0x18,%esp
80105388:	8d 55 ec             	lea    -0x14(%ebp),%edx
8010538b:	e8 b0 fe ff ff       	call   80105240 <argfd.constprop.0>
80105390:	85 c0                	test   %eax,%eax
80105392:	78 4c                	js     801053e0 <sys_write+0x60>
80105394:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105397:	83 ec 08             	sub    $0x8,%esp
8010539a:	50                   	push   %eax
8010539b:	6a 02                	push   $0x2
8010539d:	e8 ae fb ff ff       	call   80104f50 <argint>
801053a2:	83 c4 10             	add    $0x10,%esp
801053a5:	85 c0                	test   %eax,%eax
801053a7:	78 37                	js     801053e0 <sys_write+0x60>
801053a9:	8d 45 f4             	lea    -0xc(%ebp),%eax
801053ac:	83 ec 04             	sub    $0x4,%esp
801053af:	ff 75 f0             	pushl  -0x10(%ebp)
801053b2:	50                   	push   %eax
801053b3:	6a 01                	push   $0x1
801053b5:	e8 e6 fb ff ff       	call   80104fa0 <argptr>
801053ba:	83 c4 10             	add    $0x10,%esp
801053bd:	85 c0                	test   %eax,%eax
801053bf:	78 1f                	js     801053e0 <sys_write+0x60>
801053c1:	83 ec 04             	sub    $0x4,%esp
801053c4:	ff 75 f0             	pushl  -0x10(%ebp)
801053c7:	ff 75 f4             	pushl  -0xc(%ebp)
801053ca:	ff 75 ec             	pushl  -0x14(%ebp)
801053cd:	e8 4e bc ff ff       	call   80101020 <filewrite>
801053d2:	83 c4 10             	add    $0x10,%esp
801053d5:	c9                   	leave  
801053d6:	c3                   	ret    
801053d7:	89 f6                	mov    %esi,%esi
801053d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801053e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801053e5:	c9                   	leave  
801053e6:	c3                   	ret    
801053e7:	89 f6                	mov    %esi,%esi
801053e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801053f0 <sys_close>:
801053f0:	55                   	push   %ebp
801053f1:	89 e5                	mov    %esp,%ebp
801053f3:	83 ec 18             	sub    $0x18,%esp
801053f6:	8d 55 f4             	lea    -0xc(%ebp),%edx
801053f9:	8d 45 f0             	lea    -0x10(%ebp),%eax
801053fc:	e8 3f fe ff ff       	call   80105240 <argfd.constprop.0>
80105401:	85 c0                	test   %eax,%eax
80105403:	78 2b                	js     80105430 <sys_close+0x40>
80105405:	e8 e6 e3 ff ff       	call   801037f0 <myproc>
8010540a:	8b 55 f0             	mov    -0x10(%ebp),%edx
8010540d:	83 ec 0c             	sub    $0xc,%esp
80105410:	c7 44 90 28 00 00 00 	movl   $0x0,0x28(%eax,%edx,4)
80105417:	00 
80105418:	ff 75 f4             	pushl  -0xc(%ebp)
8010541b:	e8 50 ba ff ff       	call   80100e70 <fileclose>
80105420:	83 c4 10             	add    $0x10,%esp
80105423:	31 c0                	xor    %eax,%eax
80105425:	c9                   	leave  
80105426:	c3                   	ret    
80105427:	89 f6                	mov    %esi,%esi
80105429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105430:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105435:	c9                   	leave  
80105436:	c3                   	ret    
80105437:	89 f6                	mov    %esi,%esi
80105439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105440 <sys_fstat>:
80105440:	55                   	push   %ebp
80105441:	31 c0                	xor    %eax,%eax
80105443:	89 e5                	mov    %esp,%ebp
80105445:	83 ec 18             	sub    $0x18,%esp
80105448:	8d 55 f0             	lea    -0x10(%ebp),%edx
8010544b:	e8 f0 fd ff ff       	call   80105240 <argfd.constprop.0>
80105450:	85 c0                	test   %eax,%eax
80105452:	78 2c                	js     80105480 <sys_fstat+0x40>
80105454:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105457:	83 ec 04             	sub    $0x4,%esp
8010545a:	6a 14                	push   $0x14
8010545c:	50                   	push   %eax
8010545d:	6a 01                	push   $0x1
8010545f:	e8 3c fb ff ff       	call   80104fa0 <argptr>
80105464:	83 c4 10             	add    $0x10,%esp
80105467:	85 c0                	test   %eax,%eax
80105469:	78 15                	js     80105480 <sys_fstat+0x40>
8010546b:	83 ec 08             	sub    $0x8,%esp
8010546e:	ff 75 f4             	pushl  -0xc(%ebp)
80105471:	ff 75 f0             	pushl  -0x10(%ebp)
80105474:	e8 c7 ba ff ff       	call   80100f40 <filestat>
80105479:	83 c4 10             	add    $0x10,%esp
8010547c:	c9                   	leave  
8010547d:	c3                   	ret    
8010547e:	66 90                	xchg   %ax,%ax
80105480:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105485:	c9                   	leave  
80105486:	c3                   	ret    
80105487:	89 f6                	mov    %esi,%esi
80105489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105490 <sys_link>:
80105490:	55                   	push   %ebp
80105491:	89 e5                	mov    %esp,%ebp
80105493:	57                   	push   %edi
80105494:	56                   	push   %esi
80105495:	53                   	push   %ebx
80105496:	8d 45 d4             	lea    -0x2c(%ebp),%eax
80105499:	83 ec 34             	sub    $0x34,%esp
8010549c:	50                   	push   %eax
8010549d:	6a 00                	push   $0x0
8010549f:	e8 5c fb ff ff       	call   80105000 <argstr>
801054a4:	83 c4 10             	add    $0x10,%esp
801054a7:	85 c0                	test   %eax,%eax
801054a9:	0f 88 fb 00 00 00    	js     801055aa <sys_link+0x11a>
801054af:	8d 45 d0             	lea    -0x30(%ebp),%eax
801054b2:	83 ec 08             	sub    $0x8,%esp
801054b5:	50                   	push   %eax
801054b6:	6a 01                	push   $0x1
801054b8:	e8 43 fb ff ff       	call   80105000 <argstr>
801054bd:	83 c4 10             	add    $0x10,%esp
801054c0:	85 c0                	test   %eax,%eax
801054c2:	0f 88 e2 00 00 00    	js     801055aa <sys_link+0x11a>
801054c8:	e8 c3 d6 ff ff       	call   80102b90 <begin_op>
801054cd:	83 ec 0c             	sub    $0xc,%esp
801054d0:	ff 75 d4             	pushl  -0x2c(%ebp)
801054d3:	e8 28 ca ff ff       	call   80101f00 <namei>
801054d8:	83 c4 10             	add    $0x10,%esp
801054db:	85 c0                	test   %eax,%eax
801054dd:	89 c3                	mov    %eax,%ebx
801054df:	0f 84 f3 00 00 00    	je     801055d8 <sys_link+0x148>
801054e5:	83 ec 0c             	sub    $0xc,%esp
801054e8:	50                   	push   %eax
801054e9:	e8 c2 c1 ff ff       	call   801016b0 <ilock>
801054ee:	83 c4 10             	add    $0x10,%esp
801054f1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801054f6:	0f 84 c4 00 00 00    	je     801055c0 <sys_link+0x130>
801054fc:	66 83 43 56 01       	addw   $0x1,0x56(%ebx)
80105501:	83 ec 0c             	sub    $0xc,%esp
80105504:	8d 7d da             	lea    -0x26(%ebp),%edi
80105507:	53                   	push   %ebx
80105508:	e8 f3 c0 ff ff       	call   80101600 <iupdate>
8010550d:	89 1c 24             	mov    %ebx,(%esp)
80105510:	e8 7b c2 ff ff       	call   80101790 <iunlock>
80105515:	58                   	pop    %eax
80105516:	5a                   	pop    %edx
80105517:	57                   	push   %edi
80105518:	ff 75 d0             	pushl  -0x30(%ebp)
8010551b:	e8 00 ca ff ff       	call   80101f20 <nameiparent>
80105520:	83 c4 10             	add    $0x10,%esp
80105523:	85 c0                	test   %eax,%eax
80105525:	89 c6                	mov    %eax,%esi
80105527:	74 5b                	je     80105584 <sys_link+0xf4>
80105529:	83 ec 0c             	sub    $0xc,%esp
8010552c:	50                   	push   %eax
8010552d:	e8 7e c1 ff ff       	call   801016b0 <ilock>
80105532:	83 c4 10             	add    $0x10,%esp
80105535:	8b 03                	mov    (%ebx),%eax
80105537:	39 06                	cmp    %eax,(%esi)
80105539:	75 3d                	jne    80105578 <sys_link+0xe8>
8010553b:	83 ec 04             	sub    $0x4,%esp
8010553e:	ff 73 04             	pushl  0x4(%ebx)
80105541:	57                   	push   %edi
80105542:	56                   	push   %esi
80105543:	e8 f8 c8 ff ff       	call   80101e40 <dirlink>
80105548:	83 c4 10             	add    $0x10,%esp
8010554b:	85 c0                	test   %eax,%eax
8010554d:	78 29                	js     80105578 <sys_link+0xe8>
8010554f:	83 ec 0c             	sub    $0xc,%esp
80105552:	56                   	push   %esi
80105553:	e8 e8 c3 ff ff       	call   80101940 <iunlockput>
80105558:	89 1c 24             	mov    %ebx,(%esp)
8010555b:	e8 80 c2 ff ff       	call   801017e0 <iput>
80105560:	e8 9b d6 ff ff       	call   80102c00 <end_op>
80105565:	83 c4 10             	add    $0x10,%esp
80105568:	31 c0                	xor    %eax,%eax
8010556a:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010556d:	5b                   	pop    %ebx
8010556e:	5e                   	pop    %esi
8010556f:	5f                   	pop    %edi
80105570:	5d                   	pop    %ebp
80105571:	c3                   	ret    
80105572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105578:	83 ec 0c             	sub    $0xc,%esp
8010557b:	56                   	push   %esi
8010557c:	e8 bf c3 ff ff       	call   80101940 <iunlockput>
80105581:	83 c4 10             	add    $0x10,%esp
80105584:	83 ec 0c             	sub    $0xc,%esp
80105587:	53                   	push   %ebx
80105588:	e8 23 c1 ff ff       	call   801016b0 <ilock>
8010558d:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
80105592:	89 1c 24             	mov    %ebx,(%esp)
80105595:	e8 66 c0 ff ff       	call   80101600 <iupdate>
8010559a:	89 1c 24             	mov    %ebx,(%esp)
8010559d:	e8 9e c3 ff ff       	call   80101940 <iunlockput>
801055a2:	e8 59 d6 ff ff       	call   80102c00 <end_op>
801055a7:	83 c4 10             	add    $0x10,%esp
801055aa:	8d 65 f4             	lea    -0xc(%ebp),%esp
801055ad:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055b2:	5b                   	pop    %ebx
801055b3:	5e                   	pop    %esi
801055b4:	5f                   	pop    %edi
801055b5:	5d                   	pop    %ebp
801055b6:	c3                   	ret    
801055b7:	89 f6                	mov    %esi,%esi
801055b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801055c0:	83 ec 0c             	sub    $0xc,%esp
801055c3:	53                   	push   %ebx
801055c4:	e8 77 c3 ff ff       	call   80101940 <iunlockput>
801055c9:	e8 32 d6 ff ff       	call   80102c00 <end_op>
801055ce:	83 c4 10             	add    $0x10,%esp
801055d1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055d6:	eb 92                	jmp    8010556a <sys_link+0xda>
801055d8:	e8 23 d6 ff ff       	call   80102c00 <end_op>
801055dd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801055e2:	eb 86                	jmp    8010556a <sys_link+0xda>
801055e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801055ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801055f0 <sys_unlink>:
801055f0:	55                   	push   %ebp
801055f1:	89 e5                	mov    %esp,%ebp
801055f3:	57                   	push   %edi
801055f4:	56                   	push   %esi
801055f5:	53                   	push   %ebx
801055f6:	8d 45 c0             	lea    -0x40(%ebp),%eax
801055f9:	83 ec 54             	sub    $0x54,%esp
801055fc:	50                   	push   %eax
801055fd:	6a 00                	push   $0x0
801055ff:	e8 fc f9 ff ff       	call   80105000 <argstr>
80105604:	83 c4 10             	add    $0x10,%esp
80105607:	85 c0                	test   %eax,%eax
80105609:	0f 88 82 01 00 00    	js     80105791 <sys_unlink+0x1a1>
8010560f:	8d 5d ca             	lea    -0x36(%ebp),%ebx
80105612:	e8 79 d5 ff ff       	call   80102b90 <begin_op>
80105617:	83 ec 08             	sub    $0x8,%esp
8010561a:	53                   	push   %ebx
8010561b:	ff 75 c0             	pushl  -0x40(%ebp)
8010561e:	e8 fd c8 ff ff       	call   80101f20 <nameiparent>
80105623:	83 c4 10             	add    $0x10,%esp
80105626:	85 c0                	test   %eax,%eax
80105628:	89 45 b4             	mov    %eax,-0x4c(%ebp)
8010562b:	0f 84 6a 01 00 00    	je     8010579b <sys_unlink+0x1ab>
80105631:	8b 75 b4             	mov    -0x4c(%ebp),%esi
80105634:	83 ec 0c             	sub    $0xc,%esp
80105637:	56                   	push   %esi
80105638:	e8 73 c0 ff ff       	call   801016b0 <ilock>
8010563d:	58                   	pop    %eax
8010563e:	5a                   	pop    %edx
8010563f:	68 c4 7f 10 80       	push   $0x80107fc4
80105644:	53                   	push   %ebx
80105645:	e8 76 c5 ff ff       	call   80101bc0 <namecmp>
8010564a:	83 c4 10             	add    $0x10,%esp
8010564d:	85 c0                	test   %eax,%eax
8010564f:	0f 84 fc 00 00 00    	je     80105751 <sys_unlink+0x161>
80105655:	83 ec 08             	sub    $0x8,%esp
80105658:	68 c3 7f 10 80       	push   $0x80107fc3
8010565d:	53                   	push   %ebx
8010565e:	e8 5d c5 ff ff       	call   80101bc0 <namecmp>
80105663:	83 c4 10             	add    $0x10,%esp
80105666:	85 c0                	test   %eax,%eax
80105668:	0f 84 e3 00 00 00    	je     80105751 <sys_unlink+0x161>
8010566e:	8d 45 c4             	lea    -0x3c(%ebp),%eax
80105671:	83 ec 04             	sub    $0x4,%esp
80105674:	50                   	push   %eax
80105675:	53                   	push   %ebx
80105676:	56                   	push   %esi
80105677:	e8 64 c5 ff ff       	call   80101be0 <dirlookup>
8010567c:	83 c4 10             	add    $0x10,%esp
8010567f:	85 c0                	test   %eax,%eax
80105681:	89 c3                	mov    %eax,%ebx
80105683:	0f 84 c8 00 00 00    	je     80105751 <sys_unlink+0x161>
80105689:	83 ec 0c             	sub    $0xc,%esp
8010568c:	50                   	push   %eax
8010568d:	e8 1e c0 ff ff       	call   801016b0 <ilock>
80105692:	83 c4 10             	add    $0x10,%esp
80105695:	66 83 7b 56 00       	cmpw   $0x0,0x56(%ebx)
8010569a:	0f 8e 24 01 00 00    	jle    801057c4 <sys_unlink+0x1d4>
801056a0:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801056a5:	8d 75 d8             	lea    -0x28(%ebp),%esi
801056a8:	74 66                	je     80105710 <sys_unlink+0x120>
801056aa:	83 ec 04             	sub    $0x4,%esp
801056ad:	6a 10                	push   $0x10
801056af:	6a 00                	push   $0x0
801056b1:	56                   	push   %esi
801056b2:	e8 89 f5 ff ff       	call   80104c40 <memset>
801056b7:	6a 10                	push   $0x10
801056b9:	ff 75 c4             	pushl  -0x3c(%ebp)
801056bc:	56                   	push   %esi
801056bd:	ff 75 b4             	pushl  -0x4c(%ebp)
801056c0:	e8 cb c3 ff ff       	call   80101a90 <writei>
801056c5:	83 c4 20             	add    $0x20,%esp
801056c8:	83 f8 10             	cmp    $0x10,%eax
801056cb:	0f 85 e6 00 00 00    	jne    801057b7 <sys_unlink+0x1c7>
801056d1:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
801056d6:	0f 84 9c 00 00 00    	je     80105778 <sys_unlink+0x188>
801056dc:	83 ec 0c             	sub    $0xc,%esp
801056df:	ff 75 b4             	pushl  -0x4c(%ebp)
801056e2:	e8 59 c2 ff ff       	call   80101940 <iunlockput>
801056e7:	66 83 6b 56 01       	subw   $0x1,0x56(%ebx)
801056ec:	89 1c 24             	mov    %ebx,(%esp)
801056ef:	e8 0c bf ff ff       	call   80101600 <iupdate>
801056f4:	89 1c 24             	mov    %ebx,(%esp)
801056f7:	e8 44 c2 ff ff       	call   80101940 <iunlockput>
801056fc:	e8 ff d4 ff ff       	call   80102c00 <end_op>
80105701:	83 c4 10             	add    $0x10,%esp
80105704:	31 c0                	xor    %eax,%eax
80105706:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105709:	5b                   	pop    %ebx
8010570a:	5e                   	pop    %esi
8010570b:	5f                   	pop    %edi
8010570c:	5d                   	pop    %ebp
8010570d:	c3                   	ret    
8010570e:	66 90                	xchg   %ax,%ax
80105710:	83 7b 58 20          	cmpl   $0x20,0x58(%ebx)
80105714:	76 94                	jbe    801056aa <sys_unlink+0xba>
80105716:	bf 20 00 00 00       	mov    $0x20,%edi
8010571b:	eb 0f                	jmp    8010572c <sys_unlink+0x13c>
8010571d:	8d 76 00             	lea    0x0(%esi),%esi
80105720:	83 c7 10             	add    $0x10,%edi
80105723:	3b 7b 58             	cmp    0x58(%ebx),%edi
80105726:	0f 83 7e ff ff ff    	jae    801056aa <sys_unlink+0xba>
8010572c:	6a 10                	push   $0x10
8010572e:	57                   	push   %edi
8010572f:	56                   	push   %esi
80105730:	53                   	push   %ebx
80105731:	e8 5a c2 ff ff       	call   80101990 <readi>
80105736:	83 c4 10             	add    $0x10,%esp
80105739:	83 f8 10             	cmp    $0x10,%eax
8010573c:	75 6c                	jne    801057aa <sys_unlink+0x1ba>
8010573e:	66 83 7d d8 00       	cmpw   $0x0,-0x28(%ebp)
80105743:	74 db                	je     80105720 <sys_unlink+0x130>
80105745:	83 ec 0c             	sub    $0xc,%esp
80105748:	53                   	push   %ebx
80105749:	e8 f2 c1 ff ff       	call   80101940 <iunlockput>
8010574e:	83 c4 10             	add    $0x10,%esp
80105751:	83 ec 0c             	sub    $0xc,%esp
80105754:	ff 75 b4             	pushl  -0x4c(%ebp)
80105757:	e8 e4 c1 ff ff       	call   80101940 <iunlockput>
8010575c:	e8 9f d4 ff ff       	call   80102c00 <end_op>
80105761:	83 c4 10             	add    $0x10,%esp
80105764:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105767:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010576c:	5b                   	pop    %ebx
8010576d:	5e                   	pop    %esi
8010576e:	5f                   	pop    %edi
8010576f:	5d                   	pop    %ebp
80105770:	c3                   	ret    
80105771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105778:	8b 45 b4             	mov    -0x4c(%ebp),%eax
8010577b:	83 ec 0c             	sub    $0xc,%esp
8010577e:	66 83 68 56 01       	subw   $0x1,0x56(%eax)
80105783:	50                   	push   %eax
80105784:	e8 77 be ff ff       	call   80101600 <iupdate>
80105789:	83 c4 10             	add    $0x10,%esp
8010578c:	e9 4b ff ff ff       	jmp    801056dc <sys_unlink+0xec>
80105791:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105796:	e9 6b ff ff ff       	jmp    80105706 <sys_unlink+0x116>
8010579b:	e8 60 d4 ff ff       	call   80102c00 <end_op>
801057a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801057a5:	e9 5c ff ff ff       	jmp    80105706 <sys_unlink+0x116>
801057aa:	83 ec 0c             	sub    $0xc,%esp
801057ad:	68 e8 7f 10 80       	push   $0x80107fe8
801057b2:	e8 b9 ab ff ff       	call   80100370 <panic>
801057b7:	83 ec 0c             	sub    $0xc,%esp
801057ba:	68 fa 7f 10 80       	push   $0x80107ffa
801057bf:	e8 ac ab ff ff       	call   80100370 <panic>
801057c4:	83 ec 0c             	sub    $0xc,%esp
801057c7:	68 d6 7f 10 80       	push   $0x80107fd6
801057cc:	e8 9f ab ff ff       	call   80100370 <panic>
801057d1:	eb 0d                	jmp    801057e0 <sys_open>
801057d3:	90                   	nop
801057d4:	90                   	nop
801057d5:	90                   	nop
801057d6:	90                   	nop
801057d7:	90                   	nop
801057d8:	90                   	nop
801057d9:	90                   	nop
801057da:	90                   	nop
801057db:	90                   	nop
801057dc:	90                   	nop
801057dd:	90                   	nop
801057de:	90                   	nop
801057df:	90                   	nop

801057e0 <sys_open>:
801057e0:	55                   	push   %ebp
801057e1:	89 e5                	mov    %esp,%ebp
801057e3:	57                   	push   %edi
801057e4:	56                   	push   %esi
801057e5:	53                   	push   %ebx
801057e6:	8d 45 e0             	lea    -0x20(%ebp),%eax
801057e9:	83 ec 24             	sub    $0x24,%esp
801057ec:	50                   	push   %eax
801057ed:	6a 00                	push   $0x0
801057ef:	e8 0c f8 ff ff       	call   80105000 <argstr>
801057f4:	83 c4 10             	add    $0x10,%esp
801057f7:	85 c0                	test   %eax,%eax
801057f9:	0f 88 9e 00 00 00    	js     8010589d <sys_open+0xbd>
801057ff:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105802:	83 ec 08             	sub    $0x8,%esp
80105805:	50                   	push   %eax
80105806:	6a 01                	push   $0x1
80105808:	e8 43 f7 ff ff       	call   80104f50 <argint>
8010580d:	83 c4 10             	add    $0x10,%esp
80105810:	85 c0                	test   %eax,%eax
80105812:	0f 88 85 00 00 00    	js     8010589d <sys_open+0xbd>
80105818:	e8 73 d3 ff ff       	call   80102b90 <begin_op>
8010581d:	f6 45 e5 02          	testb  $0x2,-0x1b(%ebp)
80105821:	0f 85 89 00 00 00    	jne    801058b0 <sys_open+0xd0>
80105827:	83 ec 0c             	sub    $0xc,%esp
8010582a:	ff 75 e0             	pushl  -0x20(%ebp)
8010582d:	e8 ce c6 ff ff       	call   80101f00 <namei>
80105832:	83 c4 10             	add    $0x10,%esp
80105835:	85 c0                	test   %eax,%eax
80105837:	89 c6                	mov    %eax,%esi
80105839:	0f 84 8e 00 00 00    	je     801058cd <sys_open+0xed>
8010583f:	83 ec 0c             	sub    $0xc,%esp
80105842:	50                   	push   %eax
80105843:	e8 68 be ff ff       	call   801016b0 <ilock>
80105848:	83 c4 10             	add    $0x10,%esp
8010584b:	66 83 7e 50 01       	cmpw   $0x1,0x50(%esi)
80105850:	0f 84 d2 00 00 00    	je     80105928 <sys_open+0x148>
80105856:	e8 55 b5 ff ff       	call   80100db0 <filealloc>
8010585b:	85 c0                	test   %eax,%eax
8010585d:	89 c7                	mov    %eax,%edi
8010585f:	74 2b                	je     8010588c <sys_open+0xac>
80105861:	31 db                	xor    %ebx,%ebx
80105863:	e8 88 df ff ff       	call   801037f0 <myproc>
80105868:	90                   	nop
80105869:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105870:	8b 54 98 28          	mov    0x28(%eax,%ebx,4),%edx
80105874:	85 d2                	test   %edx,%edx
80105876:	74 68                	je     801058e0 <sys_open+0x100>
80105878:	83 c3 01             	add    $0x1,%ebx
8010587b:	83 fb 10             	cmp    $0x10,%ebx
8010587e:	75 f0                	jne    80105870 <sys_open+0x90>
80105880:	83 ec 0c             	sub    $0xc,%esp
80105883:	57                   	push   %edi
80105884:	e8 e7 b5 ff ff       	call   80100e70 <fileclose>
80105889:	83 c4 10             	add    $0x10,%esp
8010588c:	83 ec 0c             	sub    $0xc,%esp
8010588f:	56                   	push   %esi
80105890:	e8 ab c0 ff ff       	call   80101940 <iunlockput>
80105895:	e8 66 d3 ff ff       	call   80102c00 <end_op>
8010589a:	83 c4 10             	add    $0x10,%esp
8010589d:	8d 65 f4             	lea    -0xc(%ebp),%esp
801058a0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058a5:	5b                   	pop    %ebx
801058a6:	5e                   	pop    %esi
801058a7:	5f                   	pop    %edi
801058a8:	5d                   	pop    %ebp
801058a9:	c3                   	ret    
801058aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801058b0:	83 ec 0c             	sub    $0xc,%esp
801058b3:	8b 45 e0             	mov    -0x20(%ebp),%eax
801058b6:	31 c9                	xor    %ecx,%ecx
801058b8:	6a 00                	push   $0x0
801058ba:	ba 02 00 00 00       	mov    $0x2,%edx
801058bf:	e8 dc f7 ff ff       	call   801050a0 <create>
801058c4:	83 c4 10             	add    $0x10,%esp
801058c7:	85 c0                	test   %eax,%eax
801058c9:	89 c6                	mov    %eax,%esi
801058cb:	75 89                	jne    80105856 <sys_open+0x76>
801058cd:	e8 2e d3 ff ff       	call   80102c00 <end_op>
801058d2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801058d7:	eb 43                	jmp    8010591c <sys_open+0x13c>
801058d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801058e0:	83 ec 0c             	sub    $0xc,%esp
801058e3:	89 7c 98 28          	mov    %edi,0x28(%eax,%ebx,4)
801058e7:	56                   	push   %esi
801058e8:	e8 a3 be ff ff       	call   80101790 <iunlock>
801058ed:	e8 0e d3 ff ff       	call   80102c00 <end_op>
801058f2:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
801058f8:	8b 55 e4             	mov    -0x1c(%ebp),%edx
801058fb:	83 c4 10             	add    $0x10,%esp
801058fe:	89 77 10             	mov    %esi,0x10(%edi)
80105901:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
80105908:	89 d0                	mov    %edx,%eax
8010590a:	83 e0 01             	and    $0x1,%eax
8010590d:	83 f0 01             	xor    $0x1,%eax
80105910:	83 e2 03             	and    $0x3,%edx
80105913:	88 47 08             	mov    %al,0x8(%edi)
80105916:	0f 95 47 09          	setne  0x9(%edi)
8010591a:	89 d8                	mov    %ebx,%eax
8010591c:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010591f:	5b                   	pop    %ebx
80105920:	5e                   	pop    %esi
80105921:	5f                   	pop    %edi
80105922:	5d                   	pop    %ebp
80105923:	c3                   	ret    
80105924:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105928:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
8010592b:	85 c9                	test   %ecx,%ecx
8010592d:	0f 84 23 ff ff ff    	je     80105856 <sys_open+0x76>
80105933:	e9 54 ff ff ff       	jmp    8010588c <sys_open+0xac>
80105938:	90                   	nop
80105939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105940 <sys_mkdir>:
80105940:	55                   	push   %ebp
80105941:	89 e5                	mov    %esp,%ebp
80105943:	83 ec 18             	sub    $0x18,%esp
80105946:	e8 45 d2 ff ff       	call   80102b90 <begin_op>
8010594b:	8d 45 f4             	lea    -0xc(%ebp),%eax
8010594e:	83 ec 08             	sub    $0x8,%esp
80105951:	50                   	push   %eax
80105952:	6a 00                	push   $0x0
80105954:	e8 a7 f6 ff ff       	call   80105000 <argstr>
80105959:	83 c4 10             	add    $0x10,%esp
8010595c:	85 c0                	test   %eax,%eax
8010595e:	78 30                	js     80105990 <sys_mkdir+0x50>
80105960:	83 ec 0c             	sub    $0xc,%esp
80105963:	8b 45 f4             	mov    -0xc(%ebp),%eax
80105966:	31 c9                	xor    %ecx,%ecx
80105968:	6a 00                	push   $0x0
8010596a:	ba 01 00 00 00       	mov    $0x1,%edx
8010596f:	e8 2c f7 ff ff       	call   801050a0 <create>
80105974:	83 c4 10             	add    $0x10,%esp
80105977:	85 c0                	test   %eax,%eax
80105979:	74 15                	je     80105990 <sys_mkdir+0x50>
8010597b:	83 ec 0c             	sub    $0xc,%esp
8010597e:	50                   	push   %eax
8010597f:	e8 bc bf ff ff       	call   80101940 <iunlockput>
80105984:	e8 77 d2 ff ff       	call   80102c00 <end_op>
80105989:	83 c4 10             	add    $0x10,%esp
8010598c:	31 c0                	xor    %eax,%eax
8010598e:	c9                   	leave  
8010598f:	c3                   	ret    
80105990:	e8 6b d2 ff ff       	call   80102c00 <end_op>
80105995:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
8010599a:	c9                   	leave  
8010599b:	c3                   	ret    
8010599c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801059a0 <sys_mknod>:
801059a0:	55                   	push   %ebp
801059a1:	89 e5                	mov    %esp,%ebp
801059a3:	83 ec 18             	sub    $0x18,%esp
801059a6:	e8 e5 d1 ff ff       	call   80102b90 <begin_op>
801059ab:	8d 45 ec             	lea    -0x14(%ebp),%eax
801059ae:	83 ec 08             	sub    $0x8,%esp
801059b1:	50                   	push   %eax
801059b2:	6a 00                	push   $0x0
801059b4:	e8 47 f6 ff ff       	call   80105000 <argstr>
801059b9:	83 c4 10             	add    $0x10,%esp
801059bc:	85 c0                	test   %eax,%eax
801059be:	78 60                	js     80105a20 <sys_mknod+0x80>
801059c0:	8d 45 f0             	lea    -0x10(%ebp),%eax
801059c3:	83 ec 08             	sub    $0x8,%esp
801059c6:	50                   	push   %eax
801059c7:	6a 01                	push   $0x1
801059c9:	e8 82 f5 ff ff       	call   80104f50 <argint>
801059ce:	83 c4 10             	add    $0x10,%esp
801059d1:	85 c0                	test   %eax,%eax
801059d3:	78 4b                	js     80105a20 <sys_mknod+0x80>
801059d5:	8d 45 f4             	lea    -0xc(%ebp),%eax
801059d8:	83 ec 08             	sub    $0x8,%esp
801059db:	50                   	push   %eax
801059dc:	6a 02                	push   $0x2
801059de:	e8 6d f5 ff ff       	call   80104f50 <argint>
801059e3:	83 c4 10             	add    $0x10,%esp
801059e6:	85 c0                	test   %eax,%eax
801059e8:	78 36                	js     80105a20 <sys_mknod+0x80>
801059ea:	0f bf 45 f4          	movswl -0xc(%ebp),%eax
801059ee:	83 ec 0c             	sub    $0xc,%esp
801059f1:	0f bf 4d f0          	movswl -0x10(%ebp),%ecx
801059f5:	ba 03 00 00 00       	mov    $0x3,%edx
801059fa:	50                   	push   %eax
801059fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
801059fe:	e8 9d f6 ff ff       	call   801050a0 <create>
80105a03:	83 c4 10             	add    $0x10,%esp
80105a06:	85 c0                	test   %eax,%eax
80105a08:	74 16                	je     80105a20 <sys_mknod+0x80>
80105a0a:	83 ec 0c             	sub    $0xc,%esp
80105a0d:	50                   	push   %eax
80105a0e:	e8 2d bf ff ff       	call   80101940 <iunlockput>
80105a13:	e8 e8 d1 ff ff       	call   80102c00 <end_op>
80105a18:	83 c4 10             	add    $0x10,%esp
80105a1b:	31 c0                	xor    %eax,%eax
80105a1d:	c9                   	leave  
80105a1e:	c3                   	ret    
80105a1f:	90                   	nop
80105a20:	e8 db d1 ff ff       	call   80102c00 <end_op>
80105a25:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105a2a:	c9                   	leave  
80105a2b:	c3                   	ret    
80105a2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105a30 <sys_chdir>:
80105a30:	55                   	push   %ebp
80105a31:	89 e5                	mov    %esp,%ebp
80105a33:	56                   	push   %esi
80105a34:	53                   	push   %ebx
80105a35:	83 ec 10             	sub    $0x10,%esp
80105a38:	e8 b3 dd ff ff       	call   801037f0 <myproc>
80105a3d:	89 c6                	mov    %eax,%esi
80105a3f:	e8 4c d1 ff ff       	call   80102b90 <begin_op>
80105a44:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105a47:	83 ec 08             	sub    $0x8,%esp
80105a4a:	50                   	push   %eax
80105a4b:	6a 00                	push   $0x0
80105a4d:	e8 ae f5 ff ff       	call   80105000 <argstr>
80105a52:	83 c4 10             	add    $0x10,%esp
80105a55:	85 c0                	test   %eax,%eax
80105a57:	78 77                	js     80105ad0 <sys_chdir+0xa0>
80105a59:	83 ec 0c             	sub    $0xc,%esp
80105a5c:	ff 75 f4             	pushl  -0xc(%ebp)
80105a5f:	e8 9c c4 ff ff       	call   80101f00 <namei>
80105a64:	83 c4 10             	add    $0x10,%esp
80105a67:	85 c0                	test   %eax,%eax
80105a69:	89 c3                	mov    %eax,%ebx
80105a6b:	74 63                	je     80105ad0 <sys_chdir+0xa0>
80105a6d:	83 ec 0c             	sub    $0xc,%esp
80105a70:	50                   	push   %eax
80105a71:	e8 3a bc ff ff       	call   801016b0 <ilock>
80105a76:	83 c4 10             	add    $0x10,%esp
80105a79:	66 83 7b 50 01       	cmpw   $0x1,0x50(%ebx)
80105a7e:	75 30                	jne    80105ab0 <sys_chdir+0x80>
80105a80:	83 ec 0c             	sub    $0xc,%esp
80105a83:	53                   	push   %ebx
80105a84:	e8 07 bd ff ff       	call   80101790 <iunlock>
80105a89:	58                   	pop    %eax
80105a8a:	ff 76 68             	pushl  0x68(%esi)
80105a8d:	e8 4e bd ff ff       	call   801017e0 <iput>
80105a92:	e8 69 d1 ff ff       	call   80102c00 <end_op>
80105a97:	89 5e 68             	mov    %ebx,0x68(%esi)
80105a9a:	83 c4 10             	add    $0x10,%esp
80105a9d:	31 c0                	xor    %eax,%eax
80105a9f:	8d 65 f8             	lea    -0x8(%ebp),%esp
80105aa2:	5b                   	pop    %ebx
80105aa3:	5e                   	pop    %esi
80105aa4:	5d                   	pop    %ebp
80105aa5:	c3                   	ret    
80105aa6:	8d 76 00             	lea    0x0(%esi),%esi
80105aa9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105ab0:	83 ec 0c             	sub    $0xc,%esp
80105ab3:	53                   	push   %ebx
80105ab4:	e8 87 be ff ff       	call   80101940 <iunlockput>
80105ab9:	e8 42 d1 ff ff       	call   80102c00 <end_op>
80105abe:	83 c4 10             	add    $0x10,%esp
80105ac1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105ac6:	eb d7                	jmp    80105a9f <sys_chdir+0x6f>
80105ac8:	90                   	nop
80105ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105ad0:	e8 2b d1 ff ff       	call   80102c00 <end_op>
80105ad5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105ada:	eb c3                	jmp    80105a9f <sys_chdir+0x6f>
80105adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105ae0 <sys_exec>:
80105ae0:	55                   	push   %ebp
80105ae1:	89 e5                	mov    %esp,%ebp
80105ae3:	57                   	push   %edi
80105ae4:	56                   	push   %esi
80105ae5:	53                   	push   %ebx
80105ae6:	8d 85 5c ff ff ff    	lea    -0xa4(%ebp),%eax
80105aec:	81 ec a4 00 00 00    	sub    $0xa4,%esp
80105af2:	50                   	push   %eax
80105af3:	6a 00                	push   $0x0
80105af5:	e8 06 f5 ff ff       	call   80105000 <argstr>
80105afa:	83 c4 10             	add    $0x10,%esp
80105afd:	85 c0                	test   %eax,%eax
80105aff:	78 7f                	js     80105b80 <sys_exec+0xa0>
80105b01:	8d 85 60 ff ff ff    	lea    -0xa0(%ebp),%eax
80105b07:	83 ec 08             	sub    $0x8,%esp
80105b0a:	50                   	push   %eax
80105b0b:	6a 01                	push   $0x1
80105b0d:	e8 3e f4 ff ff       	call   80104f50 <argint>
80105b12:	83 c4 10             	add    $0x10,%esp
80105b15:	85 c0                	test   %eax,%eax
80105b17:	78 67                	js     80105b80 <sys_exec+0xa0>
80105b19:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105b1f:	83 ec 04             	sub    $0x4,%esp
80105b22:	8d b5 68 ff ff ff    	lea    -0x98(%ebp),%esi
80105b28:	68 80 00 00 00       	push   $0x80
80105b2d:	6a 00                	push   $0x0
80105b2f:	8d bd 64 ff ff ff    	lea    -0x9c(%ebp),%edi
80105b35:	50                   	push   %eax
80105b36:	31 db                	xor    %ebx,%ebx
80105b38:	e8 03 f1 ff ff       	call   80104c40 <memset>
80105b3d:	83 c4 10             	add    $0x10,%esp
80105b40:	8b 85 60 ff ff ff    	mov    -0xa0(%ebp),%eax
80105b46:	83 ec 08             	sub    $0x8,%esp
80105b49:	57                   	push   %edi
80105b4a:	8d 04 98             	lea    (%eax,%ebx,4),%eax
80105b4d:	50                   	push   %eax
80105b4e:	e8 5d f3 ff ff       	call   80104eb0 <fetchint>
80105b53:	83 c4 10             	add    $0x10,%esp
80105b56:	85 c0                	test   %eax,%eax
80105b58:	78 26                	js     80105b80 <sys_exec+0xa0>
80105b5a:	8b 85 64 ff ff ff    	mov    -0x9c(%ebp),%eax
80105b60:	85 c0                	test   %eax,%eax
80105b62:	74 2c                	je     80105b90 <sys_exec+0xb0>
80105b64:	83 ec 08             	sub    $0x8,%esp
80105b67:	56                   	push   %esi
80105b68:	50                   	push   %eax
80105b69:	e8 82 f3 ff ff       	call   80104ef0 <fetchstr>
80105b6e:	83 c4 10             	add    $0x10,%esp
80105b71:	85 c0                	test   %eax,%eax
80105b73:	78 0b                	js     80105b80 <sys_exec+0xa0>
80105b75:	83 c3 01             	add    $0x1,%ebx
80105b78:	83 c6 04             	add    $0x4,%esi
80105b7b:	83 fb 20             	cmp    $0x20,%ebx
80105b7e:	75 c0                	jne    80105b40 <sys_exec+0x60>
80105b80:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105b83:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105b88:	5b                   	pop    %ebx
80105b89:	5e                   	pop    %esi
80105b8a:	5f                   	pop    %edi
80105b8b:	5d                   	pop    %ebp
80105b8c:	c3                   	ret    
80105b8d:	8d 76 00             	lea    0x0(%esi),%esi
80105b90:	8d 85 68 ff ff ff    	lea    -0x98(%ebp),%eax
80105b96:	83 ec 08             	sub    $0x8,%esp
80105b99:	c7 84 9d 68 ff ff ff 	movl   $0x0,-0x98(%ebp,%ebx,4)
80105ba0:	00 00 00 00 
80105ba4:	50                   	push   %eax
80105ba5:	ff b5 5c ff ff ff    	pushl  -0xa4(%ebp)
80105bab:	e8 40 ae ff ff       	call   801009f0 <exec>
80105bb0:	83 c4 10             	add    $0x10,%esp
80105bb3:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105bb6:	5b                   	pop    %ebx
80105bb7:	5e                   	pop    %esi
80105bb8:	5f                   	pop    %edi
80105bb9:	5d                   	pop    %ebp
80105bba:	c3                   	ret    
80105bbb:	90                   	nop
80105bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80105bc0 <sys_pipe>:
80105bc0:	55                   	push   %ebp
80105bc1:	89 e5                	mov    %esp,%ebp
80105bc3:	57                   	push   %edi
80105bc4:	56                   	push   %esi
80105bc5:	53                   	push   %ebx
80105bc6:	8d 45 dc             	lea    -0x24(%ebp),%eax
80105bc9:	83 ec 20             	sub    $0x20,%esp
80105bcc:	6a 08                	push   $0x8
80105bce:	50                   	push   %eax
80105bcf:	6a 00                	push   $0x0
80105bd1:	e8 ca f3 ff ff       	call   80104fa0 <argptr>
80105bd6:	83 c4 10             	add    $0x10,%esp
80105bd9:	85 c0                	test   %eax,%eax
80105bdb:	78 4a                	js     80105c27 <sys_pipe+0x67>
80105bdd:	8d 45 e4             	lea    -0x1c(%ebp),%eax
80105be0:	83 ec 08             	sub    $0x8,%esp
80105be3:	50                   	push   %eax
80105be4:	8d 45 e0             	lea    -0x20(%ebp),%eax
80105be7:	50                   	push   %eax
80105be8:	e8 43 d6 ff ff       	call   80103230 <pipealloc>
80105bed:	83 c4 10             	add    $0x10,%esp
80105bf0:	85 c0                	test   %eax,%eax
80105bf2:	78 33                	js     80105c27 <sys_pipe+0x67>
80105bf4:	31 db                	xor    %ebx,%ebx
80105bf6:	8b 7d e0             	mov    -0x20(%ebp),%edi
80105bf9:	e8 f2 db ff ff       	call   801037f0 <myproc>
80105bfe:	66 90                	xchg   %ax,%ax
80105c00:	8b 74 98 28          	mov    0x28(%eax,%ebx,4),%esi
80105c04:	85 f6                	test   %esi,%esi
80105c06:	74 30                	je     80105c38 <sys_pipe+0x78>
80105c08:	83 c3 01             	add    $0x1,%ebx
80105c0b:	83 fb 10             	cmp    $0x10,%ebx
80105c0e:	75 f0                	jne    80105c00 <sys_pipe+0x40>
80105c10:	83 ec 0c             	sub    $0xc,%esp
80105c13:	ff 75 e0             	pushl  -0x20(%ebp)
80105c16:	e8 55 b2 ff ff       	call   80100e70 <fileclose>
80105c1b:	58                   	pop    %eax
80105c1c:	ff 75 e4             	pushl  -0x1c(%ebp)
80105c1f:	e8 4c b2 ff ff       	call   80100e70 <fileclose>
80105c24:	83 c4 10             	add    $0x10,%esp
80105c27:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c2a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105c2f:	5b                   	pop    %ebx
80105c30:	5e                   	pop    %esi
80105c31:	5f                   	pop    %edi
80105c32:	5d                   	pop    %ebp
80105c33:	c3                   	ret    
80105c34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105c38:	8d 73 08             	lea    0x8(%ebx),%esi
80105c3b:	89 7c b0 08          	mov    %edi,0x8(%eax,%esi,4)
80105c3f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
80105c42:	e8 a9 db ff ff       	call   801037f0 <myproc>
80105c47:	31 d2                	xor    %edx,%edx
80105c49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105c50:	8b 4c 90 28          	mov    0x28(%eax,%edx,4),%ecx
80105c54:	85 c9                	test   %ecx,%ecx
80105c56:	74 18                	je     80105c70 <sys_pipe+0xb0>
80105c58:	83 c2 01             	add    $0x1,%edx
80105c5b:	83 fa 10             	cmp    $0x10,%edx
80105c5e:	75 f0                	jne    80105c50 <sys_pipe+0x90>
80105c60:	e8 8b db ff ff       	call   801037f0 <myproc>
80105c65:	c7 44 b0 08 00 00 00 	movl   $0x0,0x8(%eax,%esi,4)
80105c6c:	00 
80105c6d:	eb a1                	jmp    80105c10 <sys_pipe+0x50>
80105c6f:	90                   	nop
80105c70:	89 7c 90 28          	mov    %edi,0x28(%eax,%edx,4)
80105c74:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105c77:	89 18                	mov    %ebx,(%eax)
80105c79:	8b 45 dc             	mov    -0x24(%ebp),%eax
80105c7c:	89 50 04             	mov    %edx,0x4(%eax)
80105c7f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80105c82:	31 c0                	xor    %eax,%eax
80105c84:	5b                   	pop    %ebx
80105c85:	5e                   	pop    %esi
80105c86:	5f                   	pop    %edi
80105c87:	5d                   	pop    %ebp
80105c88:	c3                   	ret    
80105c89:	66 90                	xchg   %ax,%ax
80105c8b:	66 90                	xchg   %ax,%ax
80105c8d:	66 90                	xchg   %ax,%ax
80105c8f:	90                   	nop

80105c90 <sys_fork>:
80105c90:	55                   	push   %ebp
80105c91:	89 e5                	mov    %esp,%ebp
80105c93:	5d                   	pop    %ebp
80105c94:	e9 57 dd ff ff       	jmp    801039f0 <fork>
80105c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105ca0 <sys_exit>:
80105ca0:	55                   	push   %ebp
80105ca1:	89 e5                	mov    %esp,%ebp
80105ca3:	83 ec 08             	sub    $0x8,%esp
80105ca6:	e8 a5 e0 ff ff       	call   80103d50 <exit>
80105cab:	31 c0                	xor    %eax,%eax
80105cad:	c9                   	leave  
80105cae:	c3                   	ret    
80105caf:	90                   	nop

80105cb0 <sys_wait>:
80105cb0:	55                   	push   %ebp
80105cb1:	89 e5                	mov    %esp,%ebp
80105cb3:	5d                   	pop    %ebp
80105cb4:	e9 57 e3 ff ff       	jmp    80104010 <wait>
80105cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105cc0 <sys_kill>:
80105cc0:	55                   	push   %ebp
80105cc1:	89 e5                	mov    %esp,%ebp
80105cc3:	83 ec 20             	sub    $0x20,%esp
80105cc6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105cc9:	50                   	push   %eax
80105cca:	6a 00                	push   $0x0
80105ccc:	e8 7f f2 ff ff       	call   80104f50 <argint>
80105cd1:	83 c4 10             	add    $0x10,%esp
80105cd4:	85 c0                	test   %eax,%eax
80105cd6:	78 18                	js     80105cf0 <sys_kill+0x30>
80105cd8:	83 ec 0c             	sub    $0xc,%esp
80105cdb:	ff 75 f4             	pushl  -0xc(%ebp)
80105cde:	e8 8d e4 ff ff       	call   80104170 <kill>
80105ce3:	83 c4 10             	add    $0x10,%esp
80105ce6:	c9                   	leave  
80105ce7:	c3                   	ret    
80105ce8:	90                   	nop
80105ce9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105cf0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105cf5:	c9                   	leave  
80105cf6:	c3                   	ret    
80105cf7:	89 f6                	mov    %esi,%esi
80105cf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105d00 <sys_getpid>:
80105d00:	55                   	push   %ebp
80105d01:	89 e5                	mov    %esp,%ebp
80105d03:	83 ec 08             	sub    $0x8,%esp
80105d06:	e8 e5 da ff ff       	call   801037f0 <myproc>
80105d0b:	8b 40 10             	mov    0x10(%eax),%eax
80105d0e:	c9                   	leave  
80105d0f:	c3                   	ret    

80105d10 <sys_sbrk>:
80105d10:	55                   	push   %ebp
80105d11:	89 e5                	mov    %esp,%ebp
80105d13:	53                   	push   %ebx
80105d14:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105d17:	83 ec 1c             	sub    $0x1c,%esp
80105d1a:	50                   	push   %eax
80105d1b:	6a 00                	push   $0x0
80105d1d:	e8 2e f2 ff ff       	call   80104f50 <argint>
80105d22:	83 c4 10             	add    $0x10,%esp
80105d25:	85 c0                	test   %eax,%eax
80105d27:	78 27                	js     80105d50 <sys_sbrk+0x40>
80105d29:	e8 c2 da ff ff       	call   801037f0 <myproc>
80105d2e:	83 ec 0c             	sub    $0xc,%esp
80105d31:	8b 18                	mov    (%eax),%ebx
80105d33:	ff 75 f4             	pushl  -0xc(%ebp)
80105d36:	e8 d5 db ff ff       	call   80103910 <growproc>
80105d3b:	83 c4 10             	add    $0x10,%esp
80105d3e:	85 c0                	test   %eax,%eax
80105d40:	78 0e                	js     80105d50 <sys_sbrk+0x40>
80105d42:	89 d8                	mov    %ebx,%eax
80105d44:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105d47:	c9                   	leave  
80105d48:	c3                   	ret    
80105d49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105d50:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105d55:	eb ed                	jmp    80105d44 <sys_sbrk+0x34>
80105d57:	89 f6                	mov    %esi,%esi
80105d59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105d60 <sys_sleep>:
80105d60:	55                   	push   %ebp
80105d61:	89 e5                	mov    %esp,%ebp
80105d63:	53                   	push   %ebx
80105d64:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105d67:	83 ec 1c             	sub    $0x1c,%esp
80105d6a:	50                   	push   %eax
80105d6b:	6a 00                	push   $0x0
80105d6d:	e8 de f1 ff ff       	call   80104f50 <argint>
80105d72:	83 c4 10             	add    $0x10,%esp
80105d75:	85 c0                	test   %eax,%eax
80105d77:	0f 88 8a 00 00 00    	js     80105e07 <sys_sleep+0xa7>
80105d7d:	83 ec 0c             	sub    $0xc,%esp
80105d80:	68 60 a3 11 80       	push   $0x8011a360
80105d85:	e8 b6 ed ff ff       	call   80104b40 <acquire>
80105d8a:	8b 55 f4             	mov    -0xc(%ebp),%edx
80105d8d:	83 c4 10             	add    $0x10,%esp
80105d90:	8b 1d a0 ab 11 80    	mov    0x8011aba0,%ebx
80105d96:	85 d2                	test   %edx,%edx
80105d98:	75 27                	jne    80105dc1 <sys_sleep+0x61>
80105d9a:	eb 54                	jmp    80105df0 <sys_sleep+0x90>
80105d9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80105da0:	83 ec 08             	sub    $0x8,%esp
80105da3:	68 60 a3 11 80       	push   $0x8011a360
80105da8:	68 a0 ab 11 80       	push   $0x8011aba0
80105dad:	e8 9e e1 ff ff       	call   80103f50 <sleep>
80105db2:	a1 a0 ab 11 80       	mov    0x8011aba0,%eax
80105db7:	83 c4 10             	add    $0x10,%esp
80105dba:	29 d8                	sub    %ebx,%eax
80105dbc:	3b 45 f4             	cmp    -0xc(%ebp),%eax
80105dbf:	73 2f                	jae    80105df0 <sys_sleep+0x90>
80105dc1:	e8 2a da ff ff       	call   801037f0 <myproc>
80105dc6:	8b 40 24             	mov    0x24(%eax),%eax
80105dc9:	85 c0                	test   %eax,%eax
80105dcb:	74 d3                	je     80105da0 <sys_sleep+0x40>
80105dcd:	83 ec 0c             	sub    $0xc,%esp
80105dd0:	68 60 a3 11 80       	push   $0x8011a360
80105dd5:	e8 16 ee ff ff       	call   80104bf0 <release>
80105dda:	83 c4 10             	add    $0x10,%esp
80105ddd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105de2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105de5:	c9                   	leave  
80105de6:	c3                   	ret    
80105de7:	89 f6                	mov    %esi,%esi
80105de9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80105df0:	83 ec 0c             	sub    $0xc,%esp
80105df3:	68 60 a3 11 80       	push   $0x8011a360
80105df8:	e8 f3 ed ff ff       	call   80104bf0 <release>
80105dfd:	83 c4 10             	add    $0x10,%esp
80105e00:	31 c0                	xor    %eax,%eax
80105e02:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105e05:	c9                   	leave  
80105e06:	c3                   	ret    
80105e07:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105e0c:	eb d4                	jmp    80105de2 <sys_sleep+0x82>
80105e0e:	66 90                	xchg   %ax,%ax

80105e10 <sys_uptime>:
80105e10:	55                   	push   %ebp
80105e11:	89 e5                	mov    %esp,%ebp
80105e13:	53                   	push   %ebx
80105e14:	83 ec 10             	sub    $0x10,%esp
80105e17:	68 60 a3 11 80       	push   $0x8011a360
80105e1c:	e8 1f ed ff ff       	call   80104b40 <acquire>
80105e21:	8b 1d a0 ab 11 80    	mov    0x8011aba0,%ebx
80105e27:	c7 04 24 60 a3 11 80 	movl   $0x8011a360,(%esp)
80105e2e:	e8 bd ed ff ff       	call   80104bf0 <release>
80105e33:	89 d8                	mov    %ebx,%eax
80105e35:	8b 5d fc             	mov    -0x4(%ebp),%ebx
80105e38:	c9                   	leave  
80105e39:	c3                   	ret    
80105e3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80105e40 <sys_thread_create>:
80105e40:	55                   	push   %ebp
80105e41:	89 e5                	mov    %esp,%ebp
80105e43:	83 ec 20             	sub    $0x20,%esp
80105e46:	8d 45 ec             	lea    -0x14(%ebp),%eax
80105e49:	50                   	push   %eax
80105e4a:	6a 00                	push   $0x0
80105e4c:	e8 ff f0 ff ff       	call   80104f50 <argint>
80105e51:	83 c4 10             	add    $0x10,%esp
80105e54:	85 c0                	test   %eax,%eax
80105e56:	78 48                	js     80105ea0 <sys_thread_create+0x60>
80105e58:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105e5b:	83 ec 08             	sub    $0x8,%esp
80105e5e:	50                   	push   %eax
80105e5f:	6a 01                	push   $0x1
80105e61:	e8 ea f0 ff ff       	call   80104f50 <argint>
80105e66:	83 c4 10             	add    $0x10,%esp
80105e69:	85 c0                	test   %eax,%eax
80105e6b:	78 33                	js     80105ea0 <sys_thread_create+0x60>
80105e6d:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105e70:	83 ec 08             	sub    $0x8,%esp
80105e73:	50                   	push   %eax
80105e74:	6a 02                	push   $0x2
80105e76:	e8 d5 f0 ff ff       	call   80104f50 <argint>
80105e7b:	83 c4 10             	add    $0x10,%esp
80105e7e:	85 c0                	test   %eax,%eax
80105e80:	78 1e                	js     80105ea0 <sys_thread_create+0x60>
80105e82:	83 ec 04             	sub    $0x4,%esp
80105e85:	ff 75 f4             	pushl  -0xc(%ebp)
80105e88:	ff 75 f0             	pushl  -0x10(%ebp)
80105e8b:	ff 75 ec             	pushl  -0x14(%ebp)
80105e8e:	e8 2d e4 ff ff       	call   801042c0 <thread_create>
80105e93:	83 c4 10             	add    $0x10,%esp
80105e96:	c9                   	leave  
80105e97:	c3                   	ret    
80105e98:	90                   	nop
80105e99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80105ea0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105ea5:	c9                   	leave  
80105ea6:	c3                   	ret    
80105ea7:	89 f6                	mov    %esi,%esi
80105ea9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105eb0 <sys_thread_exit>:
80105eb0:	55                   	push   %ebp
80105eb1:	89 e5                	mov    %esp,%ebp
80105eb3:	83 ec 20             	sub    $0x20,%esp
80105eb6:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105eb9:	50                   	push   %eax
80105eba:	6a 00                	push   $0x0
80105ebc:	e8 8f f0 ff ff       	call   80104f50 <argint>
80105ec1:	83 c4 10             	add    $0x10,%esp
80105ec4:	85 c0                	test   %eax,%eax
80105ec6:	78 0e                	js     80105ed6 <sys_thread_exit+0x26>
80105ec8:	83 ec 0c             	sub    $0xc,%esp
80105ecb:	ff 75 f4             	pushl  -0xc(%ebp)
80105ece:	e8 1d e6 ff ff       	call   801044f0 <thread_exit>
80105ed3:	83 c4 10             	add    $0x10,%esp
80105ed6:	c9                   	leave  
80105ed7:	c3                   	ret    
80105ed8:	90                   	nop
80105ed9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80105ee0 <sys_thread_join>:
80105ee0:	55                   	push   %ebp
80105ee1:	89 e5                	mov    %esp,%ebp
80105ee3:	83 ec 20             	sub    $0x20,%esp
80105ee6:	8d 45 f0             	lea    -0x10(%ebp),%eax
80105ee9:	50                   	push   %eax
80105eea:	6a 00                	push   $0x0
80105eec:	e8 5f f0 ff ff       	call   80104f50 <argint>
80105ef1:	83 c4 10             	add    $0x10,%esp
80105ef4:	85 c0                	test   %eax,%eax
80105ef6:	78 28                	js     80105f20 <sys_thread_join+0x40>
80105ef8:	8d 45 f4             	lea    -0xc(%ebp),%eax
80105efb:	83 ec 08             	sub    $0x8,%esp
80105efe:	50                   	push   %eax
80105eff:	6a 01                	push   $0x1
80105f01:	e8 4a f0 ff ff       	call   80104f50 <argint>
80105f06:	83 c4 10             	add    $0x10,%esp
80105f09:	85 c0                	test   %eax,%eax
80105f0b:	78 13                	js     80105f20 <sys_thread_join+0x40>
80105f0d:	83 ec 08             	sub    $0x8,%esp
80105f10:	ff 75 f4             	pushl  -0xc(%ebp)
80105f13:	ff 75 f0             	pushl  -0x10(%ebp)
80105f16:	e8 b5 e6 ff ff       	call   801045d0 <thread_join>
80105f1b:	83 c4 10             	add    $0x10,%esp
80105f1e:	c9                   	leave  
80105f1f:	c3                   	ret    
80105f20:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80105f25:	c9                   	leave  
80105f26:	c3                   	ret    
80105f27:	89 f6                	mov    %esi,%esi
80105f29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80105f30 <sys_ex>:
80105f30:	55                   	push   %ebp
80105f31:	89 e5                	mov    %esp,%ebp
80105f33:	5d                   	pop    %ebp
80105f34:	e9 47 e8 ff ff       	jmp    80104780 <print_table>

80105f39 <alltraps>:
80105f39:	1e                   	push   %ds
80105f3a:	06                   	push   %es
80105f3b:	0f a0                	push   %fs
80105f3d:	0f a8                	push   %gs
80105f3f:	60                   	pusha  
80105f40:	66 b8 10 00          	mov    $0x10,%ax
80105f44:	8e d8                	mov    %eax,%ds
80105f46:	8e c0                	mov    %eax,%es
80105f48:	54                   	push   %esp
80105f49:	e8 e2 00 00 00       	call   80106030 <trap>
80105f4e:	83 c4 04             	add    $0x4,%esp

80105f51 <trapret>:
80105f51:	61                   	popa   
80105f52:	0f a9                	pop    %gs
80105f54:	0f a1                	pop    %fs
80105f56:	07                   	pop    %es
80105f57:	1f                   	pop    %ds
80105f58:	83 c4 08             	add    $0x8,%esp
80105f5b:	cf                   	iret   
80105f5c:	66 90                	xchg   %ax,%ax
80105f5e:	66 90                	xchg   %ax,%ax

80105f60 <tvinit>:
80105f60:	31 c0                	xor    %eax,%eax
80105f62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80105f68:	8b 14 85 0c b0 10 80 	mov    -0x7fef4ff4(,%eax,4),%edx
80105f6f:	b9 08 00 00 00       	mov    $0x8,%ecx
80105f74:	c6 04 c5 a4 a3 11 80 	movb   $0x0,-0x7fee5c5c(,%eax,8)
80105f7b:	00 
80105f7c:	66 89 0c c5 a2 a3 11 	mov    %cx,-0x7fee5c5e(,%eax,8)
80105f83:	80 
80105f84:	c6 04 c5 a5 a3 11 80 	movb   $0x8e,-0x7fee5c5b(,%eax,8)
80105f8b:	8e 
80105f8c:	66 89 14 c5 a0 a3 11 	mov    %dx,-0x7fee5c60(,%eax,8)
80105f93:	80 
80105f94:	c1 ea 10             	shr    $0x10,%edx
80105f97:	66 89 14 c5 a6 a3 11 	mov    %dx,-0x7fee5c5a(,%eax,8)
80105f9e:	80 
80105f9f:	83 c0 01             	add    $0x1,%eax
80105fa2:	3d 00 01 00 00       	cmp    $0x100,%eax
80105fa7:	75 bf                	jne    80105f68 <tvinit+0x8>
80105fa9:	55                   	push   %ebp
80105faa:	ba 08 00 00 00       	mov    $0x8,%edx
80105faf:	89 e5                	mov    %esp,%ebp
80105fb1:	83 ec 10             	sub    $0x10,%esp
80105fb4:	a1 0c b1 10 80       	mov    0x8010b10c,%eax
80105fb9:	68 09 80 10 80       	push   $0x80108009
80105fbe:	68 60 a3 11 80       	push   $0x8011a360
80105fc3:	66 89 15 a2 a5 11 80 	mov    %dx,0x8011a5a2
80105fca:	c6 05 a4 a5 11 80 00 	movb   $0x0,0x8011a5a4
80105fd1:	66 a3 a0 a5 11 80    	mov    %ax,0x8011a5a0
80105fd7:	c1 e8 10             	shr    $0x10,%eax
80105fda:	c6 05 a5 a5 11 80 ef 	movb   $0xef,0x8011a5a5
80105fe1:	66 a3 a6 a5 11 80    	mov    %ax,0x8011a5a6
80105fe7:	e8 f4 e9 ff ff       	call   801049e0 <initlock>
80105fec:	83 c4 10             	add    $0x10,%esp
80105fef:	c9                   	leave  
80105ff0:	c3                   	ret    
80105ff1:	eb 0d                	jmp    80106000 <idtinit>
80105ff3:	90                   	nop
80105ff4:	90                   	nop
80105ff5:	90                   	nop
80105ff6:	90                   	nop
80105ff7:	90                   	nop
80105ff8:	90                   	nop
80105ff9:	90                   	nop
80105ffa:	90                   	nop
80105ffb:	90                   	nop
80105ffc:	90                   	nop
80105ffd:	90                   	nop
80105ffe:	90                   	nop
80105fff:	90                   	nop

80106000 <idtinit>:
80106000:	55                   	push   %ebp
80106001:	b8 ff 07 00 00       	mov    $0x7ff,%eax
80106006:	89 e5                	mov    %esp,%ebp
80106008:	83 ec 10             	sub    $0x10,%esp
8010600b:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
8010600f:	b8 a0 a3 11 80       	mov    $0x8011a3a0,%eax
80106014:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
80106018:	c1 e8 10             	shr    $0x10,%eax
8010601b:	66 89 45 fe          	mov    %ax,-0x2(%ebp)
8010601f:	8d 45 fa             	lea    -0x6(%ebp),%eax
80106022:	0f 01 18             	lidtl  (%eax)
80106025:	c9                   	leave  
80106026:	c3                   	ret    
80106027:	89 f6                	mov    %esi,%esi
80106029:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106030 <trap>:
80106030:	55                   	push   %ebp
80106031:	89 e5                	mov    %esp,%ebp
80106033:	57                   	push   %edi
80106034:	56                   	push   %esi
80106035:	53                   	push   %ebx
80106036:	83 ec 1c             	sub    $0x1c,%esp
80106039:	8b 7d 08             	mov    0x8(%ebp),%edi
8010603c:	8b 47 30             	mov    0x30(%edi),%eax
8010603f:	83 f8 40             	cmp    $0x40,%eax
80106042:	0f 84 a8 01 00 00    	je     801061f0 <trap+0x1c0>
80106048:	83 e8 20             	sub    $0x20,%eax
8010604b:	83 f8 1f             	cmp    $0x1f,%eax
8010604e:	77 10                	ja     80106060 <trap+0x30>
80106050:	ff 24 85 b0 80 10 80 	jmp    *-0x7fef7f50(,%eax,4)
80106057:	89 f6                	mov    %esi,%esi
80106059:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106060:	e8 8b d7 ff ff       	call   801037f0 <myproc>
80106065:	85 c0                	test   %eax,%eax
80106067:	0f 84 f7 01 00 00    	je     80106264 <trap+0x234>
8010606d:	f6 47 3c 03          	testb  $0x3,0x3c(%edi)
80106071:	0f 84 ed 01 00 00    	je     80106264 <trap+0x234>
80106077:	0f 20 d1             	mov    %cr2,%ecx
8010607a:	8b 57 38             	mov    0x38(%edi),%edx
8010607d:	89 4d d8             	mov    %ecx,-0x28(%ebp)
80106080:	89 55 dc             	mov    %edx,-0x24(%ebp)
80106083:	e8 48 d7 ff ff       	call   801037d0 <cpuid>
80106088:	8b 77 34             	mov    0x34(%edi),%esi
8010608b:	8b 5f 30             	mov    0x30(%edi),%ebx
8010608e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106091:	e8 5a d7 ff ff       	call   801037f0 <myproc>
80106096:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106099:	e8 52 d7 ff ff       	call   801037f0 <myproc>
8010609e:	8b 4d d8             	mov    -0x28(%ebp),%ecx
801060a1:	8b 55 dc             	mov    -0x24(%ebp),%edx
801060a4:	51                   	push   %ecx
801060a5:	52                   	push   %edx
801060a6:	8b 55 e0             	mov    -0x20(%ebp),%edx
801060a9:	ff 75 e4             	pushl  -0x1c(%ebp)
801060ac:	56                   	push   %esi
801060ad:	53                   	push   %ebx
801060ae:	83 c2 6c             	add    $0x6c,%edx
801060b1:	52                   	push   %edx
801060b2:	ff 70 10             	pushl  0x10(%eax)
801060b5:	68 6c 80 10 80       	push   $0x8010806c
801060ba:	e8 a1 a5 ff ff       	call   80100660 <cprintf>
801060bf:	83 c4 20             	add    $0x20,%esp
801060c2:	e8 29 d7 ff ff       	call   801037f0 <myproc>
801060c7:	c7 40 24 01 00 00 00 	movl   $0x1,0x24(%eax)
801060ce:	66 90                	xchg   %ax,%ax
801060d0:	e8 1b d7 ff ff       	call   801037f0 <myproc>
801060d5:	85 c0                	test   %eax,%eax
801060d7:	74 0c                	je     801060e5 <trap+0xb5>
801060d9:	e8 12 d7 ff ff       	call   801037f0 <myproc>
801060de:	8b 50 24             	mov    0x24(%eax),%edx
801060e1:	85 d2                	test   %edx,%edx
801060e3:	75 4b                	jne    80106130 <trap+0x100>
801060e5:	e8 06 d7 ff ff       	call   801037f0 <myproc>
801060ea:	85 c0                	test   %eax,%eax
801060ec:	74 0b                	je     801060f9 <trap+0xc9>
801060ee:	e8 fd d6 ff ff       	call   801037f0 <myproc>
801060f3:	83 78 0c 04          	cmpl   $0x4,0xc(%eax)
801060f7:	74 4f                	je     80106148 <trap+0x118>
801060f9:	e8 f2 d6 ff ff       	call   801037f0 <myproc>
801060fe:	85 c0                	test   %eax,%eax
80106100:	74 1d                	je     8010611f <trap+0xef>
80106102:	e8 e9 d6 ff ff       	call   801037f0 <myproc>
80106107:	8b 40 24             	mov    0x24(%eax),%eax
8010610a:	85 c0                	test   %eax,%eax
8010610c:	74 11                	je     8010611f <trap+0xef>
8010610e:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80106112:	83 e0 03             	and    $0x3,%eax
80106115:	66 83 f8 03          	cmp    $0x3,%ax
80106119:	0f 84 fa 00 00 00    	je     80106219 <trap+0x1e9>
8010611f:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106122:	5b                   	pop    %ebx
80106123:	5e                   	pop    %esi
80106124:	5f                   	pop    %edi
80106125:	5d                   	pop    %ebp
80106126:	c3                   	ret    
80106127:	89 f6                	mov    %esi,%esi
80106129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106130:	0f b7 47 3c          	movzwl 0x3c(%edi),%eax
80106134:	83 e0 03             	and    $0x3,%eax
80106137:	66 83 f8 03          	cmp    $0x3,%ax
8010613b:	75 a8                	jne    801060e5 <trap+0xb5>
8010613d:	e8 0e dc ff ff       	call   80103d50 <exit>
80106142:	eb a1                	jmp    801060e5 <trap+0xb5>
80106144:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80106148:	83 7f 30 20          	cmpl   $0x20,0x30(%edi)
8010614c:	75 ab                	jne    801060f9 <trap+0xc9>
8010614e:	8b 0d a0 ab 11 80    	mov    0x8011aba0,%ecx
80106154:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
80106159:	89 c8                	mov    %ecx,%eax
8010615b:	f7 e2                	mul    %edx
8010615d:	c1 ea 03             	shr    $0x3,%edx
80106160:	8d 04 92             	lea    (%edx,%edx,4),%eax
80106163:	01 c0                	add    %eax,%eax
80106165:	39 c1                	cmp    %eax,%ecx
80106167:	75 90                	jne    801060f9 <trap+0xc9>
80106169:	e8 92 dd ff ff       	call   80103f00 <yield>
8010616e:	eb 89                	jmp    801060f9 <trap+0xc9>
80106170:	e8 5b d6 ff ff       	call   801037d0 <cpuid>
80106175:	85 c0                	test   %eax,%eax
80106177:	0f 84 b3 00 00 00    	je     80106230 <trap+0x200>
8010617d:	e8 ce c5 ff ff       	call   80102750 <lapiceoi>
80106182:	e9 49 ff ff ff       	jmp    801060d0 <trap+0xa0>
80106187:	89 f6                	mov    %esi,%esi
80106189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106190:	e8 7b c4 ff ff       	call   80102610 <kbdintr>
80106195:	e8 b6 c5 ff ff       	call   80102750 <lapiceoi>
8010619a:	e9 31 ff ff ff       	jmp    801060d0 <trap+0xa0>
8010619f:	90                   	nop
801061a0:	e8 5b 02 00 00       	call   80106400 <uartintr>
801061a5:	e8 a6 c5 ff ff       	call   80102750 <lapiceoi>
801061aa:	e9 21 ff ff ff       	jmp    801060d0 <trap+0xa0>
801061af:	90                   	nop
801061b0:	0f b7 5f 3c          	movzwl 0x3c(%edi),%ebx
801061b4:	8b 77 38             	mov    0x38(%edi),%esi
801061b7:	e8 14 d6 ff ff       	call   801037d0 <cpuid>
801061bc:	56                   	push   %esi
801061bd:	53                   	push   %ebx
801061be:	50                   	push   %eax
801061bf:	68 14 80 10 80       	push   $0x80108014
801061c4:	e8 97 a4 ff ff       	call   80100660 <cprintf>
801061c9:	e8 82 c5 ff ff       	call   80102750 <lapiceoi>
801061ce:	83 c4 10             	add    $0x10,%esp
801061d1:	e9 fa fe ff ff       	jmp    801060d0 <trap+0xa0>
801061d6:	8d 76 00             	lea    0x0(%esi),%esi
801061d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801061e0:	e8 ab be ff ff       	call   80102090 <ideintr>
801061e5:	eb 96                	jmp    8010617d <trap+0x14d>
801061e7:	89 f6                	mov    %esi,%esi
801061e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801061f0:	e8 fb d5 ff ff       	call   801037f0 <myproc>
801061f5:	8b 58 24             	mov    0x24(%eax),%ebx
801061f8:	85 db                	test   %ebx,%ebx
801061fa:	75 2c                	jne    80106228 <trap+0x1f8>
801061fc:	e8 ef d5 ff ff       	call   801037f0 <myproc>
80106201:	89 78 18             	mov    %edi,0x18(%eax)
80106204:	e8 37 ee ff ff       	call   80105040 <syscall>
80106209:	e8 e2 d5 ff ff       	call   801037f0 <myproc>
8010620e:	8b 48 24             	mov    0x24(%eax),%ecx
80106211:	85 c9                	test   %ecx,%ecx
80106213:	0f 84 06 ff ff ff    	je     8010611f <trap+0xef>
80106219:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010621c:	5b                   	pop    %ebx
8010621d:	5e                   	pop    %esi
8010621e:	5f                   	pop    %edi
8010621f:	5d                   	pop    %ebp
80106220:	e9 2b db ff ff       	jmp    80103d50 <exit>
80106225:	8d 76 00             	lea    0x0(%esi),%esi
80106228:	e8 23 db ff ff       	call   80103d50 <exit>
8010622d:	eb cd                	jmp    801061fc <trap+0x1cc>
8010622f:	90                   	nop
80106230:	83 ec 0c             	sub    $0xc,%esp
80106233:	68 60 a3 11 80       	push   $0x8011a360
80106238:	e8 03 e9 ff ff       	call   80104b40 <acquire>
8010623d:	c7 04 24 a0 ab 11 80 	movl   $0x8011aba0,(%esp)
80106244:	83 05 a0 ab 11 80 01 	addl   $0x1,0x8011aba0
8010624b:	e8 c0 de ff ff       	call   80104110 <wakeup>
80106250:	c7 04 24 60 a3 11 80 	movl   $0x8011a360,(%esp)
80106257:	e8 94 e9 ff ff       	call   80104bf0 <release>
8010625c:	83 c4 10             	add    $0x10,%esp
8010625f:	e9 19 ff ff ff       	jmp    8010617d <trap+0x14d>
80106264:	0f 20 d6             	mov    %cr2,%esi
80106267:	8b 5f 38             	mov    0x38(%edi),%ebx
8010626a:	e8 61 d5 ff ff       	call   801037d0 <cpuid>
8010626f:	83 ec 0c             	sub    $0xc,%esp
80106272:	56                   	push   %esi
80106273:	53                   	push   %ebx
80106274:	50                   	push   %eax
80106275:	ff 77 30             	pushl  0x30(%edi)
80106278:	68 38 80 10 80       	push   $0x80108038
8010627d:	e8 de a3 ff ff       	call   80100660 <cprintf>
80106282:	83 c4 14             	add    $0x14,%esp
80106285:	68 0e 80 10 80       	push   $0x8010800e
8010628a:	e8 e1 a0 ff ff       	call   80100370 <panic>
8010628f:	90                   	nop

80106290 <uartgetc>:
80106290:	a1 bc b5 10 80       	mov    0x8010b5bc,%eax
80106295:	55                   	push   %ebp
80106296:	89 e5                	mov    %esp,%ebp
80106298:	85 c0                	test   %eax,%eax
8010629a:	74 1c                	je     801062b8 <uartgetc+0x28>
8010629c:	ba fd 03 00 00       	mov    $0x3fd,%edx
801062a1:	ec                   	in     (%dx),%al
801062a2:	a8 01                	test   $0x1,%al
801062a4:	74 12                	je     801062b8 <uartgetc+0x28>
801062a6:	ba f8 03 00 00       	mov    $0x3f8,%edx
801062ab:	ec                   	in     (%dx),%al
801062ac:	0f b6 c0             	movzbl %al,%eax
801062af:	5d                   	pop    %ebp
801062b0:	c3                   	ret    
801062b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801062b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801062bd:	5d                   	pop    %ebp
801062be:	c3                   	ret    
801062bf:	90                   	nop

801062c0 <uartputc.part.0>:
801062c0:	55                   	push   %ebp
801062c1:	89 e5                	mov    %esp,%ebp
801062c3:	57                   	push   %edi
801062c4:	56                   	push   %esi
801062c5:	53                   	push   %ebx
801062c6:	89 c7                	mov    %eax,%edi
801062c8:	bb 80 00 00 00       	mov    $0x80,%ebx
801062cd:	be fd 03 00 00       	mov    $0x3fd,%esi
801062d2:	83 ec 0c             	sub    $0xc,%esp
801062d5:	eb 1b                	jmp    801062f2 <uartputc.part.0+0x32>
801062d7:	89 f6                	mov    %esi,%esi
801062d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801062e0:	83 ec 0c             	sub    $0xc,%esp
801062e3:	6a 0a                	push   $0xa
801062e5:	e8 86 c4 ff ff       	call   80102770 <microdelay>
801062ea:	83 c4 10             	add    $0x10,%esp
801062ed:	83 eb 01             	sub    $0x1,%ebx
801062f0:	74 07                	je     801062f9 <uartputc.part.0+0x39>
801062f2:	89 f2                	mov    %esi,%edx
801062f4:	ec                   	in     (%dx),%al
801062f5:	a8 20                	test   $0x20,%al
801062f7:	74 e7                	je     801062e0 <uartputc.part.0+0x20>
801062f9:	ba f8 03 00 00       	mov    $0x3f8,%edx
801062fe:	89 f8                	mov    %edi,%eax
80106300:	ee                   	out    %al,(%dx)
80106301:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106304:	5b                   	pop    %ebx
80106305:	5e                   	pop    %esi
80106306:	5f                   	pop    %edi
80106307:	5d                   	pop    %ebp
80106308:	c3                   	ret    
80106309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80106310 <uartinit>:
80106310:	55                   	push   %ebp
80106311:	31 c9                	xor    %ecx,%ecx
80106313:	89 c8                	mov    %ecx,%eax
80106315:	89 e5                	mov    %esp,%ebp
80106317:	57                   	push   %edi
80106318:	56                   	push   %esi
80106319:	53                   	push   %ebx
8010631a:	bb fa 03 00 00       	mov    $0x3fa,%ebx
8010631f:	89 da                	mov    %ebx,%edx
80106321:	83 ec 0c             	sub    $0xc,%esp
80106324:	ee                   	out    %al,(%dx)
80106325:	bf fb 03 00 00       	mov    $0x3fb,%edi
8010632a:	b8 80 ff ff ff       	mov    $0xffffff80,%eax
8010632f:	89 fa                	mov    %edi,%edx
80106331:	ee                   	out    %al,(%dx)
80106332:	b8 0c 00 00 00       	mov    $0xc,%eax
80106337:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010633c:	ee                   	out    %al,(%dx)
8010633d:	be f9 03 00 00       	mov    $0x3f9,%esi
80106342:	89 c8                	mov    %ecx,%eax
80106344:	89 f2                	mov    %esi,%edx
80106346:	ee                   	out    %al,(%dx)
80106347:	b8 03 00 00 00       	mov    $0x3,%eax
8010634c:	89 fa                	mov    %edi,%edx
8010634e:	ee                   	out    %al,(%dx)
8010634f:	ba fc 03 00 00       	mov    $0x3fc,%edx
80106354:	89 c8                	mov    %ecx,%eax
80106356:	ee                   	out    %al,(%dx)
80106357:	b8 01 00 00 00       	mov    $0x1,%eax
8010635c:	89 f2                	mov    %esi,%edx
8010635e:	ee                   	out    %al,(%dx)
8010635f:	ba fd 03 00 00       	mov    $0x3fd,%edx
80106364:	ec                   	in     (%dx),%al
80106365:	3c ff                	cmp    $0xff,%al
80106367:	74 5a                	je     801063c3 <uartinit+0xb3>
80106369:	c7 05 bc b5 10 80 01 	movl   $0x1,0x8010b5bc
80106370:	00 00 00 
80106373:	89 da                	mov    %ebx,%edx
80106375:	ec                   	in     (%dx),%al
80106376:	ba f8 03 00 00       	mov    $0x3f8,%edx
8010637b:	ec                   	in     (%dx),%al
8010637c:	83 ec 08             	sub    $0x8,%esp
8010637f:	bb 30 81 10 80       	mov    $0x80108130,%ebx
80106384:	6a 00                	push   $0x0
80106386:	6a 04                	push   $0x4
80106388:	e8 53 bf ff ff       	call   801022e0 <ioapicenable>
8010638d:	83 c4 10             	add    $0x10,%esp
80106390:	b8 78 00 00 00       	mov    $0x78,%eax
80106395:	eb 13                	jmp    801063aa <uartinit+0x9a>
80106397:	89 f6                	mov    %esi,%esi
80106399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801063a0:	83 c3 01             	add    $0x1,%ebx
801063a3:	0f be 03             	movsbl (%ebx),%eax
801063a6:	84 c0                	test   %al,%al
801063a8:	74 19                	je     801063c3 <uartinit+0xb3>
801063aa:	8b 15 bc b5 10 80    	mov    0x8010b5bc,%edx
801063b0:	85 d2                	test   %edx,%edx
801063b2:	74 ec                	je     801063a0 <uartinit+0x90>
801063b4:	83 c3 01             	add    $0x1,%ebx
801063b7:	e8 04 ff ff ff       	call   801062c0 <uartputc.part.0>
801063bc:	0f be 03             	movsbl (%ebx),%eax
801063bf:	84 c0                	test   %al,%al
801063c1:	75 e7                	jne    801063aa <uartinit+0x9a>
801063c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801063c6:	5b                   	pop    %ebx
801063c7:	5e                   	pop    %esi
801063c8:	5f                   	pop    %edi
801063c9:	5d                   	pop    %ebp
801063ca:	c3                   	ret    
801063cb:	90                   	nop
801063cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801063d0 <uartputc>:
801063d0:	8b 15 bc b5 10 80    	mov    0x8010b5bc,%edx
801063d6:	55                   	push   %ebp
801063d7:	89 e5                	mov    %esp,%ebp
801063d9:	85 d2                	test   %edx,%edx
801063db:	8b 45 08             	mov    0x8(%ebp),%eax
801063de:	74 10                	je     801063f0 <uartputc+0x20>
801063e0:	5d                   	pop    %ebp
801063e1:	e9 da fe ff ff       	jmp    801062c0 <uartputc.part.0>
801063e6:	8d 76 00             	lea    0x0(%esi),%esi
801063e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801063f0:	5d                   	pop    %ebp
801063f1:	c3                   	ret    
801063f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801063f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106400 <uartintr>:
80106400:	55                   	push   %ebp
80106401:	89 e5                	mov    %esp,%ebp
80106403:	83 ec 14             	sub    $0x14,%esp
80106406:	68 90 62 10 80       	push   $0x80106290
8010640b:	e8 e0 a3 ff ff       	call   801007f0 <consoleintr>
80106410:	83 c4 10             	add    $0x10,%esp
80106413:	c9                   	leave  
80106414:	c3                   	ret    

80106415 <vector0>:
80106415:	6a 00                	push   $0x0
80106417:	6a 00                	push   $0x0
80106419:	e9 1b fb ff ff       	jmp    80105f39 <alltraps>

8010641e <vector1>:
8010641e:	6a 00                	push   $0x0
80106420:	6a 01                	push   $0x1
80106422:	e9 12 fb ff ff       	jmp    80105f39 <alltraps>

80106427 <vector2>:
80106427:	6a 00                	push   $0x0
80106429:	6a 02                	push   $0x2
8010642b:	e9 09 fb ff ff       	jmp    80105f39 <alltraps>

80106430 <vector3>:
80106430:	6a 00                	push   $0x0
80106432:	6a 03                	push   $0x3
80106434:	e9 00 fb ff ff       	jmp    80105f39 <alltraps>

80106439 <vector4>:
80106439:	6a 00                	push   $0x0
8010643b:	6a 04                	push   $0x4
8010643d:	e9 f7 fa ff ff       	jmp    80105f39 <alltraps>

80106442 <vector5>:
80106442:	6a 00                	push   $0x0
80106444:	6a 05                	push   $0x5
80106446:	e9 ee fa ff ff       	jmp    80105f39 <alltraps>

8010644b <vector6>:
8010644b:	6a 00                	push   $0x0
8010644d:	6a 06                	push   $0x6
8010644f:	e9 e5 fa ff ff       	jmp    80105f39 <alltraps>

80106454 <vector7>:
80106454:	6a 00                	push   $0x0
80106456:	6a 07                	push   $0x7
80106458:	e9 dc fa ff ff       	jmp    80105f39 <alltraps>

8010645d <vector8>:
8010645d:	6a 08                	push   $0x8
8010645f:	e9 d5 fa ff ff       	jmp    80105f39 <alltraps>

80106464 <vector9>:
80106464:	6a 00                	push   $0x0
80106466:	6a 09                	push   $0x9
80106468:	e9 cc fa ff ff       	jmp    80105f39 <alltraps>

8010646d <vector10>:
8010646d:	6a 0a                	push   $0xa
8010646f:	e9 c5 fa ff ff       	jmp    80105f39 <alltraps>

80106474 <vector11>:
80106474:	6a 0b                	push   $0xb
80106476:	e9 be fa ff ff       	jmp    80105f39 <alltraps>

8010647b <vector12>:
8010647b:	6a 0c                	push   $0xc
8010647d:	e9 b7 fa ff ff       	jmp    80105f39 <alltraps>

80106482 <vector13>:
80106482:	6a 0d                	push   $0xd
80106484:	e9 b0 fa ff ff       	jmp    80105f39 <alltraps>

80106489 <vector14>:
80106489:	6a 0e                	push   $0xe
8010648b:	e9 a9 fa ff ff       	jmp    80105f39 <alltraps>

80106490 <vector15>:
80106490:	6a 00                	push   $0x0
80106492:	6a 0f                	push   $0xf
80106494:	e9 a0 fa ff ff       	jmp    80105f39 <alltraps>

80106499 <vector16>:
80106499:	6a 00                	push   $0x0
8010649b:	6a 10                	push   $0x10
8010649d:	e9 97 fa ff ff       	jmp    80105f39 <alltraps>

801064a2 <vector17>:
801064a2:	6a 11                	push   $0x11
801064a4:	e9 90 fa ff ff       	jmp    80105f39 <alltraps>

801064a9 <vector18>:
801064a9:	6a 00                	push   $0x0
801064ab:	6a 12                	push   $0x12
801064ad:	e9 87 fa ff ff       	jmp    80105f39 <alltraps>

801064b2 <vector19>:
801064b2:	6a 00                	push   $0x0
801064b4:	6a 13                	push   $0x13
801064b6:	e9 7e fa ff ff       	jmp    80105f39 <alltraps>

801064bb <vector20>:
801064bb:	6a 00                	push   $0x0
801064bd:	6a 14                	push   $0x14
801064bf:	e9 75 fa ff ff       	jmp    80105f39 <alltraps>

801064c4 <vector21>:
801064c4:	6a 00                	push   $0x0
801064c6:	6a 15                	push   $0x15
801064c8:	e9 6c fa ff ff       	jmp    80105f39 <alltraps>

801064cd <vector22>:
801064cd:	6a 00                	push   $0x0
801064cf:	6a 16                	push   $0x16
801064d1:	e9 63 fa ff ff       	jmp    80105f39 <alltraps>

801064d6 <vector23>:
801064d6:	6a 00                	push   $0x0
801064d8:	6a 17                	push   $0x17
801064da:	e9 5a fa ff ff       	jmp    80105f39 <alltraps>

801064df <vector24>:
801064df:	6a 00                	push   $0x0
801064e1:	6a 18                	push   $0x18
801064e3:	e9 51 fa ff ff       	jmp    80105f39 <alltraps>

801064e8 <vector25>:
801064e8:	6a 00                	push   $0x0
801064ea:	6a 19                	push   $0x19
801064ec:	e9 48 fa ff ff       	jmp    80105f39 <alltraps>

801064f1 <vector26>:
801064f1:	6a 00                	push   $0x0
801064f3:	6a 1a                	push   $0x1a
801064f5:	e9 3f fa ff ff       	jmp    80105f39 <alltraps>

801064fa <vector27>:
801064fa:	6a 00                	push   $0x0
801064fc:	6a 1b                	push   $0x1b
801064fe:	e9 36 fa ff ff       	jmp    80105f39 <alltraps>

80106503 <vector28>:
80106503:	6a 00                	push   $0x0
80106505:	6a 1c                	push   $0x1c
80106507:	e9 2d fa ff ff       	jmp    80105f39 <alltraps>

8010650c <vector29>:
8010650c:	6a 00                	push   $0x0
8010650e:	6a 1d                	push   $0x1d
80106510:	e9 24 fa ff ff       	jmp    80105f39 <alltraps>

80106515 <vector30>:
80106515:	6a 00                	push   $0x0
80106517:	6a 1e                	push   $0x1e
80106519:	e9 1b fa ff ff       	jmp    80105f39 <alltraps>

8010651e <vector31>:
8010651e:	6a 00                	push   $0x0
80106520:	6a 1f                	push   $0x1f
80106522:	e9 12 fa ff ff       	jmp    80105f39 <alltraps>

80106527 <vector32>:
80106527:	6a 00                	push   $0x0
80106529:	6a 20                	push   $0x20
8010652b:	e9 09 fa ff ff       	jmp    80105f39 <alltraps>

80106530 <vector33>:
80106530:	6a 00                	push   $0x0
80106532:	6a 21                	push   $0x21
80106534:	e9 00 fa ff ff       	jmp    80105f39 <alltraps>

80106539 <vector34>:
80106539:	6a 00                	push   $0x0
8010653b:	6a 22                	push   $0x22
8010653d:	e9 f7 f9 ff ff       	jmp    80105f39 <alltraps>

80106542 <vector35>:
80106542:	6a 00                	push   $0x0
80106544:	6a 23                	push   $0x23
80106546:	e9 ee f9 ff ff       	jmp    80105f39 <alltraps>

8010654b <vector36>:
8010654b:	6a 00                	push   $0x0
8010654d:	6a 24                	push   $0x24
8010654f:	e9 e5 f9 ff ff       	jmp    80105f39 <alltraps>

80106554 <vector37>:
80106554:	6a 00                	push   $0x0
80106556:	6a 25                	push   $0x25
80106558:	e9 dc f9 ff ff       	jmp    80105f39 <alltraps>

8010655d <vector38>:
8010655d:	6a 00                	push   $0x0
8010655f:	6a 26                	push   $0x26
80106561:	e9 d3 f9 ff ff       	jmp    80105f39 <alltraps>

80106566 <vector39>:
80106566:	6a 00                	push   $0x0
80106568:	6a 27                	push   $0x27
8010656a:	e9 ca f9 ff ff       	jmp    80105f39 <alltraps>

8010656f <vector40>:
8010656f:	6a 00                	push   $0x0
80106571:	6a 28                	push   $0x28
80106573:	e9 c1 f9 ff ff       	jmp    80105f39 <alltraps>

80106578 <vector41>:
80106578:	6a 00                	push   $0x0
8010657a:	6a 29                	push   $0x29
8010657c:	e9 b8 f9 ff ff       	jmp    80105f39 <alltraps>

80106581 <vector42>:
80106581:	6a 00                	push   $0x0
80106583:	6a 2a                	push   $0x2a
80106585:	e9 af f9 ff ff       	jmp    80105f39 <alltraps>

8010658a <vector43>:
8010658a:	6a 00                	push   $0x0
8010658c:	6a 2b                	push   $0x2b
8010658e:	e9 a6 f9 ff ff       	jmp    80105f39 <alltraps>

80106593 <vector44>:
80106593:	6a 00                	push   $0x0
80106595:	6a 2c                	push   $0x2c
80106597:	e9 9d f9 ff ff       	jmp    80105f39 <alltraps>

8010659c <vector45>:
8010659c:	6a 00                	push   $0x0
8010659e:	6a 2d                	push   $0x2d
801065a0:	e9 94 f9 ff ff       	jmp    80105f39 <alltraps>

801065a5 <vector46>:
801065a5:	6a 00                	push   $0x0
801065a7:	6a 2e                	push   $0x2e
801065a9:	e9 8b f9 ff ff       	jmp    80105f39 <alltraps>

801065ae <vector47>:
801065ae:	6a 00                	push   $0x0
801065b0:	6a 2f                	push   $0x2f
801065b2:	e9 82 f9 ff ff       	jmp    80105f39 <alltraps>

801065b7 <vector48>:
801065b7:	6a 00                	push   $0x0
801065b9:	6a 30                	push   $0x30
801065bb:	e9 79 f9 ff ff       	jmp    80105f39 <alltraps>

801065c0 <vector49>:
801065c0:	6a 00                	push   $0x0
801065c2:	6a 31                	push   $0x31
801065c4:	e9 70 f9 ff ff       	jmp    80105f39 <alltraps>

801065c9 <vector50>:
801065c9:	6a 00                	push   $0x0
801065cb:	6a 32                	push   $0x32
801065cd:	e9 67 f9 ff ff       	jmp    80105f39 <alltraps>

801065d2 <vector51>:
801065d2:	6a 00                	push   $0x0
801065d4:	6a 33                	push   $0x33
801065d6:	e9 5e f9 ff ff       	jmp    80105f39 <alltraps>

801065db <vector52>:
801065db:	6a 00                	push   $0x0
801065dd:	6a 34                	push   $0x34
801065df:	e9 55 f9 ff ff       	jmp    80105f39 <alltraps>

801065e4 <vector53>:
801065e4:	6a 00                	push   $0x0
801065e6:	6a 35                	push   $0x35
801065e8:	e9 4c f9 ff ff       	jmp    80105f39 <alltraps>

801065ed <vector54>:
801065ed:	6a 00                	push   $0x0
801065ef:	6a 36                	push   $0x36
801065f1:	e9 43 f9 ff ff       	jmp    80105f39 <alltraps>

801065f6 <vector55>:
801065f6:	6a 00                	push   $0x0
801065f8:	6a 37                	push   $0x37
801065fa:	e9 3a f9 ff ff       	jmp    80105f39 <alltraps>

801065ff <vector56>:
801065ff:	6a 00                	push   $0x0
80106601:	6a 38                	push   $0x38
80106603:	e9 31 f9 ff ff       	jmp    80105f39 <alltraps>

80106608 <vector57>:
80106608:	6a 00                	push   $0x0
8010660a:	6a 39                	push   $0x39
8010660c:	e9 28 f9 ff ff       	jmp    80105f39 <alltraps>

80106611 <vector58>:
80106611:	6a 00                	push   $0x0
80106613:	6a 3a                	push   $0x3a
80106615:	e9 1f f9 ff ff       	jmp    80105f39 <alltraps>

8010661a <vector59>:
8010661a:	6a 00                	push   $0x0
8010661c:	6a 3b                	push   $0x3b
8010661e:	e9 16 f9 ff ff       	jmp    80105f39 <alltraps>

80106623 <vector60>:
80106623:	6a 00                	push   $0x0
80106625:	6a 3c                	push   $0x3c
80106627:	e9 0d f9 ff ff       	jmp    80105f39 <alltraps>

8010662c <vector61>:
8010662c:	6a 00                	push   $0x0
8010662e:	6a 3d                	push   $0x3d
80106630:	e9 04 f9 ff ff       	jmp    80105f39 <alltraps>

80106635 <vector62>:
80106635:	6a 00                	push   $0x0
80106637:	6a 3e                	push   $0x3e
80106639:	e9 fb f8 ff ff       	jmp    80105f39 <alltraps>

8010663e <vector63>:
8010663e:	6a 00                	push   $0x0
80106640:	6a 3f                	push   $0x3f
80106642:	e9 f2 f8 ff ff       	jmp    80105f39 <alltraps>

80106647 <vector64>:
80106647:	6a 00                	push   $0x0
80106649:	6a 40                	push   $0x40
8010664b:	e9 e9 f8 ff ff       	jmp    80105f39 <alltraps>

80106650 <vector65>:
80106650:	6a 00                	push   $0x0
80106652:	6a 41                	push   $0x41
80106654:	e9 e0 f8 ff ff       	jmp    80105f39 <alltraps>

80106659 <vector66>:
80106659:	6a 00                	push   $0x0
8010665b:	6a 42                	push   $0x42
8010665d:	e9 d7 f8 ff ff       	jmp    80105f39 <alltraps>

80106662 <vector67>:
80106662:	6a 00                	push   $0x0
80106664:	6a 43                	push   $0x43
80106666:	e9 ce f8 ff ff       	jmp    80105f39 <alltraps>

8010666b <vector68>:
8010666b:	6a 00                	push   $0x0
8010666d:	6a 44                	push   $0x44
8010666f:	e9 c5 f8 ff ff       	jmp    80105f39 <alltraps>

80106674 <vector69>:
80106674:	6a 00                	push   $0x0
80106676:	6a 45                	push   $0x45
80106678:	e9 bc f8 ff ff       	jmp    80105f39 <alltraps>

8010667d <vector70>:
8010667d:	6a 00                	push   $0x0
8010667f:	6a 46                	push   $0x46
80106681:	e9 b3 f8 ff ff       	jmp    80105f39 <alltraps>

80106686 <vector71>:
80106686:	6a 00                	push   $0x0
80106688:	6a 47                	push   $0x47
8010668a:	e9 aa f8 ff ff       	jmp    80105f39 <alltraps>

8010668f <vector72>:
8010668f:	6a 00                	push   $0x0
80106691:	6a 48                	push   $0x48
80106693:	e9 a1 f8 ff ff       	jmp    80105f39 <alltraps>

80106698 <vector73>:
80106698:	6a 00                	push   $0x0
8010669a:	6a 49                	push   $0x49
8010669c:	e9 98 f8 ff ff       	jmp    80105f39 <alltraps>

801066a1 <vector74>:
801066a1:	6a 00                	push   $0x0
801066a3:	6a 4a                	push   $0x4a
801066a5:	e9 8f f8 ff ff       	jmp    80105f39 <alltraps>

801066aa <vector75>:
801066aa:	6a 00                	push   $0x0
801066ac:	6a 4b                	push   $0x4b
801066ae:	e9 86 f8 ff ff       	jmp    80105f39 <alltraps>

801066b3 <vector76>:
801066b3:	6a 00                	push   $0x0
801066b5:	6a 4c                	push   $0x4c
801066b7:	e9 7d f8 ff ff       	jmp    80105f39 <alltraps>

801066bc <vector77>:
801066bc:	6a 00                	push   $0x0
801066be:	6a 4d                	push   $0x4d
801066c0:	e9 74 f8 ff ff       	jmp    80105f39 <alltraps>

801066c5 <vector78>:
801066c5:	6a 00                	push   $0x0
801066c7:	6a 4e                	push   $0x4e
801066c9:	e9 6b f8 ff ff       	jmp    80105f39 <alltraps>

801066ce <vector79>:
801066ce:	6a 00                	push   $0x0
801066d0:	6a 4f                	push   $0x4f
801066d2:	e9 62 f8 ff ff       	jmp    80105f39 <alltraps>

801066d7 <vector80>:
801066d7:	6a 00                	push   $0x0
801066d9:	6a 50                	push   $0x50
801066db:	e9 59 f8 ff ff       	jmp    80105f39 <alltraps>

801066e0 <vector81>:
801066e0:	6a 00                	push   $0x0
801066e2:	6a 51                	push   $0x51
801066e4:	e9 50 f8 ff ff       	jmp    80105f39 <alltraps>

801066e9 <vector82>:
801066e9:	6a 00                	push   $0x0
801066eb:	6a 52                	push   $0x52
801066ed:	e9 47 f8 ff ff       	jmp    80105f39 <alltraps>

801066f2 <vector83>:
801066f2:	6a 00                	push   $0x0
801066f4:	6a 53                	push   $0x53
801066f6:	e9 3e f8 ff ff       	jmp    80105f39 <alltraps>

801066fb <vector84>:
801066fb:	6a 00                	push   $0x0
801066fd:	6a 54                	push   $0x54
801066ff:	e9 35 f8 ff ff       	jmp    80105f39 <alltraps>

80106704 <vector85>:
80106704:	6a 00                	push   $0x0
80106706:	6a 55                	push   $0x55
80106708:	e9 2c f8 ff ff       	jmp    80105f39 <alltraps>

8010670d <vector86>:
8010670d:	6a 00                	push   $0x0
8010670f:	6a 56                	push   $0x56
80106711:	e9 23 f8 ff ff       	jmp    80105f39 <alltraps>

80106716 <vector87>:
80106716:	6a 00                	push   $0x0
80106718:	6a 57                	push   $0x57
8010671a:	e9 1a f8 ff ff       	jmp    80105f39 <alltraps>

8010671f <vector88>:
8010671f:	6a 00                	push   $0x0
80106721:	6a 58                	push   $0x58
80106723:	e9 11 f8 ff ff       	jmp    80105f39 <alltraps>

80106728 <vector89>:
80106728:	6a 00                	push   $0x0
8010672a:	6a 59                	push   $0x59
8010672c:	e9 08 f8 ff ff       	jmp    80105f39 <alltraps>

80106731 <vector90>:
80106731:	6a 00                	push   $0x0
80106733:	6a 5a                	push   $0x5a
80106735:	e9 ff f7 ff ff       	jmp    80105f39 <alltraps>

8010673a <vector91>:
8010673a:	6a 00                	push   $0x0
8010673c:	6a 5b                	push   $0x5b
8010673e:	e9 f6 f7 ff ff       	jmp    80105f39 <alltraps>

80106743 <vector92>:
80106743:	6a 00                	push   $0x0
80106745:	6a 5c                	push   $0x5c
80106747:	e9 ed f7 ff ff       	jmp    80105f39 <alltraps>

8010674c <vector93>:
8010674c:	6a 00                	push   $0x0
8010674e:	6a 5d                	push   $0x5d
80106750:	e9 e4 f7 ff ff       	jmp    80105f39 <alltraps>

80106755 <vector94>:
80106755:	6a 00                	push   $0x0
80106757:	6a 5e                	push   $0x5e
80106759:	e9 db f7 ff ff       	jmp    80105f39 <alltraps>

8010675e <vector95>:
8010675e:	6a 00                	push   $0x0
80106760:	6a 5f                	push   $0x5f
80106762:	e9 d2 f7 ff ff       	jmp    80105f39 <alltraps>

80106767 <vector96>:
80106767:	6a 00                	push   $0x0
80106769:	6a 60                	push   $0x60
8010676b:	e9 c9 f7 ff ff       	jmp    80105f39 <alltraps>

80106770 <vector97>:
80106770:	6a 00                	push   $0x0
80106772:	6a 61                	push   $0x61
80106774:	e9 c0 f7 ff ff       	jmp    80105f39 <alltraps>

80106779 <vector98>:
80106779:	6a 00                	push   $0x0
8010677b:	6a 62                	push   $0x62
8010677d:	e9 b7 f7 ff ff       	jmp    80105f39 <alltraps>

80106782 <vector99>:
80106782:	6a 00                	push   $0x0
80106784:	6a 63                	push   $0x63
80106786:	e9 ae f7 ff ff       	jmp    80105f39 <alltraps>

8010678b <vector100>:
8010678b:	6a 00                	push   $0x0
8010678d:	6a 64                	push   $0x64
8010678f:	e9 a5 f7 ff ff       	jmp    80105f39 <alltraps>

80106794 <vector101>:
80106794:	6a 00                	push   $0x0
80106796:	6a 65                	push   $0x65
80106798:	e9 9c f7 ff ff       	jmp    80105f39 <alltraps>

8010679d <vector102>:
8010679d:	6a 00                	push   $0x0
8010679f:	6a 66                	push   $0x66
801067a1:	e9 93 f7 ff ff       	jmp    80105f39 <alltraps>

801067a6 <vector103>:
801067a6:	6a 00                	push   $0x0
801067a8:	6a 67                	push   $0x67
801067aa:	e9 8a f7 ff ff       	jmp    80105f39 <alltraps>

801067af <vector104>:
801067af:	6a 00                	push   $0x0
801067b1:	6a 68                	push   $0x68
801067b3:	e9 81 f7 ff ff       	jmp    80105f39 <alltraps>

801067b8 <vector105>:
801067b8:	6a 00                	push   $0x0
801067ba:	6a 69                	push   $0x69
801067bc:	e9 78 f7 ff ff       	jmp    80105f39 <alltraps>

801067c1 <vector106>:
801067c1:	6a 00                	push   $0x0
801067c3:	6a 6a                	push   $0x6a
801067c5:	e9 6f f7 ff ff       	jmp    80105f39 <alltraps>

801067ca <vector107>:
801067ca:	6a 00                	push   $0x0
801067cc:	6a 6b                	push   $0x6b
801067ce:	e9 66 f7 ff ff       	jmp    80105f39 <alltraps>

801067d3 <vector108>:
801067d3:	6a 00                	push   $0x0
801067d5:	6a 6c                	push   $0x6c
801067d7:	e9 5d f7 ff ff       	jmp    80105f39 <alltraps>

801067dc <vector109>:
801067dc:	6a 00                	push   $0x0
801067de:	6a 6d                	push   $0x6d
801067e0:	e9 54 f7 ff ff       	jmp    80105f39 <alltraps>

801067e5 <vector110>:
801067e5:	6a 00                	push   $0x0
801067e7:	6a 6e                	push   $0x6e
801067e9:	e9 4b f7 ff ff       	jmp    80105f39 <alltraps>

801067ee <vector111>:
801067ee:	6a 00                	push   $0x0
801067f0:	6a 6f                	push   $0x6f
801067f2:	e9 42 f7 ff ff       	jmp    80105f39 <alltraps>

801067f7 <vector112>:
801067f7:	6a 00                	push   $0x0
801067f9:	6a 70                	push   $0x70
801067fb:	e9 39 f7 ff ff       	jmp    80105f39 <alltraps>

80106800 <vector113>:
80106800:	6a 00                	push   $0x0
80106802:	6a 71                	push   $0x71
80106804:	e9 30 f7 ff ff       	jmp    80105f39 <alltraps>

80106809 <vector114>:
80106809:	6a 00                	push   $0x0
8010680b:	6a 72                	push   $0x72
8010680d:	e9 27 f7 ff ff       	jmp    80105f39 <alltraps>

80106812 <vector115>:
80106812:	6a 00                	push   $0x0
80106814:	6a 73                	push   $0x73
80106816:	e9 1e f7 ff ff       	jmp    80105f39 <alltraps>

8010681b <vector116>:
8010681b:	6a 00                	push   $0x0
8010681d:	6a 74                	push   $0x74
8010681f:	e9 15 f7 ff ff       	jmp    80105f39 <alltraps>

80106824 <vector117>:
80106824:	6a 00                	push   $0x0
80106826:	6a 75                	push   $0x75
80106828:	e9 0c f7 ff ff       	jmp    80105f39 <alltraps>

8010682d <vector118>:
8010682d:	6a 00                	push   $0x0
8010682f:	6a 76                	push   $0x76
80106831:	e9 03 f7 ff ff       	jmp    80105f39 <alltraps>

80106836 <vector119>:
80106836:	6a 00                	push   $0x0
80106838:	6a 77                	push   $0x77
8010683a:	e9 fa f6 ff ff       	jmp    80105f39 <alltraps>

8010683f <vector120>:
8010683f:	6a 00                	push   $0x0
80106841:	6a 78                	push   $0x78
80106843:	e9 f1 f6 ff ff       	jmp    80105f39 <alltraps>

80106848 <vector121>:
80106848:	6a 00                	push   $0x0
8010684a:	6a 79                	push   $0x79
8010684c:	e9 e8 f6 ff ff       	jmp    80105f39 <alltraps>

80106851 <vector122>:
80106851:	6a 00                	push   $0x0
80106853:	6a 7a                	push   $0x7a
80106855:	e9 df f6 ff ff       	jmp    80105f39 <alltraps>

8010685a <vector123>:
8010685a:	6a 00                	push   $0x0
8010685c:	6a 7b                	push   $0x7b
8010685e:	e9 d6 f6 ff ff       	jmp    80105f39 <alltraps>

80106863 <vector124>:
80106863:	6a 00                	push   $0x0
80106865:	6a 7c                	push   $0x7c
80106867:	e9 cd f6 ff ff       	jmp    80105f39 <alltraps>

8010686c <vector125>:
8010686c:	6a 00                	push   $0x0
8010686e:	6a 7d                	push   $0x7d
80106870:	e9 c4 f6 ff ff       	jmp    80105f39 <alltraps>

80106875 <vector126>:
80106875:	6a 00                	push   $0x0
80106877:	6a 7e                	push   $0x7e
80106879:	e9 bb f6 ff ff       	jmp    80105f39 <alltraps>

8010687e <vector127>:
8010687e:	6a 00                	push   $0x0
80106880:	6a 7f                	push   $0x7f
80106882:	e9 b2 f6 ff ff       	jmp    80105f39 <alltraps>

80106887 <vector128>:
80106887:	6a 00                	push   $0x0
80106889:	68 80 00 00 00       	push   $0x80
8010688e:	e9 a6 f6 ff ff       	jmp    80105f39 <alltraps>

80106893 <vector129>:
80106893:	6a 00                	push   $0x0
80106895:	68 81 00 00 00       	push   $0x81
8010689a:	e9 9a f6 ff ff       	jmp    80105f39 <alltraps>

8010689f <vector130>:
8010689f:	6a 00                	push   $0x0
801068a1:	68 82 00 00 00       	push   $0x82
801068a6:	e9 8e f6 ff ff       	jmp    80105f39 <alltraps>

801068ab <vector131>:
801068ab:	6a 00                	push   $0x0
801068ad:	68 83 00 00 00       	push   $0x83
801068b2:	e9 82 f6 ff ff       	jmp    80105f39 <alltraps>

801068b7 <vector132>:
801068b7:	6a 00                	push   $0x0
801068b9:	68 84 00 00 00       	push   $0x84
801068be:	e9 76 f6 ff ff       	jmp    80105f39 <alltraps>

801068c3 <vector133>:
801068c3:	6a 00                	push   $0x0
801068c5:	68 85 00 00 00       	push   $0x85
801068ca:	e9 6a f6 ff ff       	jmp    80105f39 <alltraps>

801068cf <vector134>:
801068cf:	6a 00                	push   $0x0
801068d1:	68 86 00 00 00       	push   $0x86
801068d6:	e9 5e f6 ff ff       	jmp    80105f39 <alltraps>

801068db <vector135>:
801068db:	6a 00                	push   $0x0
801068dd:	68 87 00 00 00       	push   $0x87
801068e2:	e9 52 f6 ff ff       	jmp    80105f39 <alltraps>

801068e7 <vector136>:
801068e7:	6a 00                	push   $0x0
801068e9:	68 88 00 00 00       	push   $0x88
801068ee:	e9 46 f6 ff ff       	jmp    80105f39 <alltraps>

801068f3 <vector137>:
801068f3:	6a 00                	push   $0x0
801068f5:	68 89 00 00 00       	push   $0x89
801068fa:	e9 3a f6 ff ff       	jmp    80105f39 <alltraps>

801068ff <vector138>:
801068ff:	6a 00                	push   $0x0
80106901:	68 8a 00 00 00       	push   $0x8a
80106906:	e9 2e f6 ff ff       	jmp    80105f39 <alltraps>

8010690b <vector139>:
8010690b:	6a 00                	push   $0x0
8010690d:	68 8b 00 00 00       	push   $0x8b
80106912:	e9 22 f6 ff ff       	jmp    80105f39 <alltraps>

80106917 <vector140>:
80106917:	6a 00                	push   $0x0
80106919:	68 8c 00 00 00       	push   $0x8c
8010691e:	e9 16 f6 ff ff       	jmp    80105f39 <alltraps>

80106923 <vector141>:
80106923:	6a 00                	push   $0x0
80106925:	68 8d 00 00 00       	push   $0x8d
8010692a:	e9 0a f6 ff ff       	jmp    80105f39 <alltraps>

8010692f <vector142>:
8010692f:	6a 00                	push   $0x0
80106931:	68 8e 00 00 00       	push   $0x8e
80106936:	e9 fe f5 ff ff       	jmp    80105f39 <alltraps>

8010693b <vector143>:
8010693b:	6a 00                	push   $0x0
8010693d:	68 8f 00 00 00       	push   $0x8f
80106942:	e9 f2 f5 ff ff       	jmp    80105f39 <alltraps>

80106947 <vector144>:
80106947:	6a 00                	push   $0x0
80106949:	68 90 00 00 00       	push   $0x90
8010694e:	e9 e6 f5 ff ff       	jmp    80105f39 <alltraps>

80106953 <vector145>:
80106953:	6a 00                	push   $0x0
80106955:	68 91 00 00 00       	push   $0x91
8010695a:	e9 da f5 ff ff       	jmp    80105f39 <alltraps>

8010695f <vector146>:
8010695f:	6a 00                	push   $0x0
80106961:	68 92 00 00 00       	push   $0x92
80106966:	e9 ce f5 ff ff       	jmp    80105f39 <alltraps>

8010696b <vector147>:
8010696b:	6a 00                	push   $0x0
8010696d:	68 93 00 00 00       	push   $0x93
80106972:	e9 c2 f5 ff ff       	jmp    80105f39 <alltraps>

80106977 <vector148>:
80106977:	6a 00                	push   $0x0
80106979:	68 94 00 00 00       	push   $0x94
8010697e:	e9 b6 f5 ff ff       	jmp    80105f39 <alltraps>

80106983 <vector149>:
80106983:	6a 00                	push   $0x0
80106985:	68 95 00 00 00       	push   $0x95
8010698a:	e9 aa f5 ff ff       	jmp    80105f39 <alltraps>

8010698f <vector150>:
8010698f:	6a 00                	push   $0x0
80106991:	68 96 00 00 00       	push   $0x96
80106996:	e9 9e f5 ff ff       	jmp    80105f39 <alltraps>

8010699b <vector151>:
8010699b:	6a 00                	push   $0x0
8010699d:	68 97 00 00 00       	push   $0x97
801069a2:	e9 92 f5 ff ff       	jmp    80105f39 <alltraps>

801069a7 <vector152>:
801069a7:	6a 00                	push   $0x0
801069a9:	68 98 00 00 00       	push   $0x98
801069ae:	e9 86 f5 ff ff       	jmp    80105f39 <alltraps>

801069b3 <vector153>:
801069b3:	6a 00                	push   $0x0
801069b5:	68 99 00 00 00       	push   $0x99
801069ba:	e9 7a f5 ff ff       	jmp    80105f39 <alltraps>

801069bf <vector154>:
801069bf:	6a 00                	push   $0x0
801069c1:	68 9a 00 00 00       	push   $0x9a
801069c6:	e9 6e f5 ff ff       	jmp    80105f39 <alltraps>

801069cb <vector155>:
801069cb:	6a 00                	push   $0x0
801069cd:	68 9b 00 00 00       	push   $0x9b
801069d2:	e9 62 f5 ff ff       	jmp    80105f39 <alltraps>

801069d7 <vector156>:
801069d7:	6a 00                	push   $0x0
801069d9:	68 9c 00 00 00       	push   $0x9c
801069de:	e9 56 f5 ff ff       	jmp    80105f39 <alltraps>

801069e3 <vector157>:
801069e3:	6a 00                	push   $0x0
801069e5:	68 9d 00 00 00       	push   $0x9d
801069ea:	e9 4a f5 ff ff       	jmp    80105f39 <alltraps>

801069ef <vector158>:
801069ef:	6a 00                	push   $0x0
801069f1:	68 9e 00 00 00       	push   $0x9e
801069f6:	e9 3e f5 ff ff       	jmp    80105f39 <alltraps>

801069fb <vector159>:
801069fb:	6a 00                	push   $0x0
801069fd:	68 9f 00 00 00       	push   $0x9f
80106a02:	e9 32 f5 ff ff       	jmp    80105f39 <alltraps>

80106a07 <vector160>:
80106a07:	6a 00                	push   $0x0
80106a09:	68 a0 00 00 00       	push   $0xa0
80106a0e:	e9 26 f5 ff ff       	jmp    80105f39 <alltraps>

80106a13 <vector161>:
80106a13:	6a 00                	push   $0x0
80106a15:	68 a1 00 00 00       	push   $0xa1
80106a1a:	e9 1a f5 ff ff       	jmp    80105f39 <alltraps>

80106a1f <vector162>:
80106a1f:	6a 00                	push   $0x0
80106a21:	68 a2 00 00 00       	push   $0xa2
80106a26:	e9 0e f5 ff ff       	jmp    80105f39 <alltraps>

80106a2b <vector163>:
80106a2b:	6a 00                	push   $0x0
80106a2d:	68 a3 00 00 00       	push   $0xa3
80106a32:	e9 02 f5 ff ff       	jmp    80105f39 <alltraps>

80106a37 <vector164>:
80106a37:	6a 00                	push   $0x0
80106a39:	68 a4 00 00 00       	push   $0xa4
80106a3e:	e9 f6 f4 ff ff       	jmp    80105f39 <alltraps>

80106a43 <vector165>:
80106a43:	6a 00                	push   $0x0
80106a45:	68 a5 00 00 00       	push   $0xa5
80106a4a:	e9 ea f4 ff ff       	jmp    80105f39 <alltraps>

80106a4f <vector166>:
80106a4f:	6a 00                	push   $0x0
80106a51:	68 a6 00 00 00       	push   $0xa6
80106a56:	e9 de f4 ff ff       	jmp    80105f39 <alltraps>

80106a5b <vector167>:
80106a5b:	6a 00                	push   $0x0
80106a5d:	68 a7 00 00 00       	push   $0xa7
80106a62:	e9 d2 f4 ff ff       	jmp    80105f39 <alltraps>

80106a67 <vector168>:
80106a67:	6a 00                	push   $0x0
80106a69:	68 a8 00 00 00       	push   $0xa8
80106a6e:	e9 c6 f4 ff ff       	jmp    80105f39 <alltraps>

80106a73 <vector169>:
80106a73:	6a 00                	push   $0x0
80106a75:	68 a9 00 00 00       	push   $0xa9
80106a7a:	e9 ba f4 ff ff       	jmp    80105f39 <alltraps>

80106a7f <vector170>:
80106a7f:	6a 00                	push   $0x0
80106a81:	68 aa 00 00 00       	push   $0xaa
80106a86:	e9 ae f4 ff ff       	jmp    80105f39 <alltraps>

80106a8b <vector171>:
80106a8b:	6a 00                	push   $0x0
80106a8d:	68 ab 00 00 00       	push   $0xab
80106a92:	e9 a2 f4 ff ff       	jmp    80105f39 <alltraps>

80106a97 <vector172>:
80106a97:	6a 00                	push   $0x0
80106a99:	68 ac 00 00 00       	push   $0xac
80106a9e:	e9 96 f4 ff ff       	jmp    80105f39 <alltraps>

80106aa3 <vector173>:
80106aa3:	6a 00                	push   $0x0
80106aa5:	68 ad 00 00 00       	push   $0xad
80106aaa:	e9 8a f4 ff ff       	jmp    80105f39 <alltraps>

80106aaf <vector174>:
80106aaf:	6a 00                	push   $0x0
80106ab1:	68 ae 00 00 00       	push   $0xae
80106ab6:	e9 7e f4 ff ff       	jmp    80105f39 <alltraps>

80106abb <vector175>:
80106abb:	6a 00                	push   $0x0
80106abd:	68 af 00 00 00       	push   $0xaf
80106ac2:	e9 72 f4 ff ff       	jmp    80105f39 <alltraps>

80106ac7 <vector176>:
80106ac7:	6a 00                	push   $0x0
80106ac9:	68 b0 00 00 00       	push   $0xb0
80106ace:	e9 66 f4 ff ff       	jmp    80105f39 <alltraps>

80106ad3 <vector177>:
80106ad3:	6a 00                	push   $0x0
80106ad5:	68 b1 00 00 00       	push   $0xb1
80106ada:	e9 5a f4 ff ff       	jmp    80105f39 <alltraps>

80106adf <vector178>:
80106adf:	6a 00                	push   $0x0
80106ae1:	68 b2 00 00 00       	push   $0xb2
80106ae6:	e9 4e f4 ff ff       	jmp    80105f39 <alltraps>

80106aeb <vector179>:
80106aeb:	6a 00                	push   $0x0
80106aed:	68 b3 00 00 00       	push   $0xb3
80106af2:	e9 42 f4 ff ff       	jmp    80105f39 <alltraps>

80106af7 <vector180>:
80106af7:	6a 00                	push   $0x0
80106af9:	68 b4 00 00 00       	push   $0xb4
80106afe:	e9 36 f4 ff ff       	jmp    80105f39 <alltraps>

80106b03 <vector181>:
80106b03:	6a 00                	push   $0x0
80106b05:	68 b5 00 00 00       	push   $0xb5
80106b0a:	e9 2a f4 ff ff       	jmp    80105f39 <alltraps>

80106b0f <vector182>:
80106b0f:	6a 00                	push   $0x0
80106b11:	68 b6 00 00 00       	push   $0xb6
80106b16:	e9 1e f4 ff ff       	jmp    80105f39 <alltraps>

80106b1b <vector183>:
80106b1b:	6a 00                	push   $0x0
80106b1d:	68 b7 00 00 00       	push   $0xb7
80106b22:	e9 12 f4 ff ff       	jmp    80105f39 <alltraps>

80106b27 <vector184>:
80106b27:	6a 00                	push   $0x0
80106b29:	68 b8 00 00 00       	push   $0xb8
80106b2e:	e9 06 f4 ff ff       	jmp    80105f39 <alltraps>

80106b33 <vector185>:
80106b33:	6a 00                	push   $0x0
80106b35:	68 b9 00 00 00       	push   $0xb9
80106b3a:	e9 fa f3 ff ff       	jmp    80105f39 <alltraps>

80106b3f <vector186>:
80106b3f:	6a 00                	push   $0x0
80106b41:	68 ba 00 00 00       	push   $0xba
80106b46:	e9 ee f3 ff ff       	jmp    80105f39 <alltraps>

80106b4b <vector187>:
80106b4b:	6a 00                	push   $0x0
80106b4d:	68 bb 00 00 00       	push   $0xbb
80106b52:	e9 e2 f3 ff ff       	jmp    80105f39 <alltraps>

80106b57 <vector188>:
80106b57:	6a 00                	push   $0x0
80106b59:	68 bc 00 00 00       	push   $0xbc
80106b5e:	e9 d6 f3 ff ff       	jmp    80105f39 <alltraps>

80106b63 <vector189>:
80106b63:	6a 00                	push   $0x0
80106b65:	68 bd 00 00 00       	push   $0xbd
80106b6a:	e9 ca f3 ff ff       	jmp    80105f39 <alltraps>

80106b6f <vector190>:
80106b6f:	6a 00                	push   $0x0
80106b71:	68 be 00 00 00       	push   $0xbe
80106b76:	e9 be f3 ff ff       	jmp    80105f39 <alltraps>

80106b7b <vector191>:
80106b7b:	6a 00                	push   $0x0
80106b7d:	68 bf 00 00 00       	push   $0xbf
80106b82:	e9 b2 f3 ff ff       	jmp    80105f39 <alltraps>

80106b87 <vector192>:
80106b87:	6a 00                	push   $0x0
80106b89:	68 c0 00 00 00       	push   $0xc0
80106b8e:	e9 a6 f3 ff ff       	jmp    80105f39 <alltraps>

80106b93 <vector193>:
80106b93:	6a 00                	push   $0x0
80106b95:	68 c1 00 00 00       	push   $0xc1
80106b9a:	e9 9a f3 ff ff       	jmp    80105f39 <alltraps>

80106b9f <vector194>:
80106b9f:	6a 00                	push   $0x0
80106ba1:	68 c2 00 00 00       	push   $0xc2
80106ba6:	e9 8e f3 ff ff       	jmp    80105f39 <alltraps>

80106bab <vector195>:
80106bab:	6a 00                	push   $0x0
80106bad:	68 c3 00 00 00       	push   $0xc3
80106bb2:	e9 82 f3 ff ff       	jmp    80105f39 <alltraps>

80106bb7 <vector196>:
80106bb7:	6a 00                	push   $0x0
80106bb9:	68 c4 00 00 00       	push   $0xc4
80106bbe:	e9 76 f3 ff ff       	jmp    80105f39 <alltraps>

80106bc3 <vector197>:
80106bc3:	6a 00                	push   $0x0
80106bc5:	68 c5 00 00 00       	push   $0xc5
80106bca:	e9 6a f3 ff ff       	jmp    80105f39 <alltraps>

80106bcf <vector198>:
80106bcf:	6a 00                	push   $0x0
80106bd1:	68 c6 00 00 00       	push   $0xc6
80106bd6:	e9 5e f3 ff ff       	jmp    80105f39 <alltraps>

80106bdb <vector199>:
80106bdb:	6a 00                	push   $0x0
80106bdd:	68 c7 00 00 00       	push   $0xc7
80106be2:	e9 52 f3 ff ff       	jmp    80105f39 <alltraps>

80106be7 <vector200>:
80106be7:	6a 00                	push   $0x0
80106be9:	68 c8 00 00 00       	push   $0xc8
80106bee:	e9 46 f3 ff ff       	jmp    80105f39 <alltraps>

80106bf3 <vector201>:
80106bf3:	6a 00                	push   $0x0
80106bf5:	68 c9 00 00 00       	push   $0xc9
80106bfa:	e9 3a f3 ff ff       	jmp    80105f39 <alltraps>

80106bff <vector202>:
80106bff:	6a 00                	push   $0x0
80106c01:	68 ca 00 00 00       	push   $0xca
80106c06:	e9 2e f3 ff ff       	jmp    80105f39 <alltraps>

80106c0b <vector203>:
80106c0b:	6a 00                	push   $0x0
80106c0d:	68 cb 00 00 00       	push   $0xcb
80106c12:	e9 22 f3 ff ff       	jmp    80105f39 <alltraps>

80106c17 <vector204>:
80106c17:	6a 00                	push   $0x0
80106c19:	68 cc 00 00 00       	push   $0xcc
80106c1e:	e9 16 f3 ff ff       	jmp    80105f39 <alltraps>

80106c23 <vector205>:
80106c23:	6a 00                	push   $0x0
80106c25:	68 cd 00 00 00       	push   $0xcd
80106c2a:	e9 0a f3 ff ff       	jmp    80105f39 <alltraps>

80106c2f <vector206>:
80106c2f:	6a 00                	push   $0x0
80106c31:	68 ce 00 00 00       	push   $0xce
80106c36:	e9 fe f2 ff ff       	jmp    80105f39 <alltraps>

80106c3b <vector207>:
80106c3b:	6a 00                	push   $0x0
80106c3d:	68 cf 00 00 00       	push   $0xcf
80106c42:	e9 f2 f2 ff ff       	jmp    80105f39 <alltraps>

80106c47 <vector208>:
80106c47:	6a 00                	push   $0x0
80106c49:	68 d0 00 00 00       	push   $0xd0
80106c4e:	e9 e6 f2 ff ff       	jmp    80105f39 <alltraps>

80106c53 <vector209>:
80106c53:	6a 00                	push   $0x0
80106c55:	68 d1 00 00 00       	push   $0xd1
80106c5a:	e9 da f2 ff ff       	jmp    80105f39 <alltraps>

80106c5f <vector210>:
80106c5f:	6a 00                	push   $0x0
80106c61:	68 d2 00 00 00       	push   $0xd2
80106c66:	e9 ce f2 ff ff       	jmp    80105f39 <alltraps>

80106c6b <vector211>:
80106c6b:	6a 00                	push   $0x0
80106c6d:	68 d3 00 00 00       	push   $0xd3
80106c72:	e9 c2 f2 ff ff       	jmp    80105f39 <alltraps>

80106c77 <vector212>:
80106c77:	6a 00                	push   $0x0
80106c79:	68 d4 00 00 00       	push   $0xd4
80106c7e:	e9 b6 f2 ff ff       	jmp    80105f39 <alltraps>

80106c83 <vector213>:
80106c83:	6a 00                	push   $0x0
80106c85:	68 d5 00 00 00       	push   $0xd5
80106c8a:	e9 aa f2 ff ff       	jmp    80105f39 <alltraps>

80106c8f <vector214>:
80106c8f:	6a 00                	push   $0x0
80106c91:	68 d6 00 00 00       	push   $0xd6
80106c96:	e9 9e f2 ff ff       	jmp    80105f39 <alltraps>

80106c9b <vector215>:
80106c9b:	6a 00                	push   $0x0
80106c9d:	68 d7 00 00 00       	push   $0xd7
80106ca2:	e9 92 f2 ff ff       	jmp    80105f39 <alltraps>

80106ca7 <vector216>:
80106ca7:	6a 00                	push   $0x0
80106ca9:	68 d8 00 00 00       	push   $0xd8
80106cae:	e9 86 f2 ff ff       	jmp    80105f39 <alltraps>

80106cb3 <vector217>:
80106cb3:	6a 00                	push   $0x0
80106cb5:	68 d9 00 00 00       	push   $0xd9
80106cba:	e9 7a f2 ff ff       	jmp    80105f39 <alltraps>

80106cbf <vector218>:
80106cbf:	6a 00                	push   $0x0
80106cc1:	68 da 00 00 00       	push   $0xda
80106cc6:	e9 6e f2 ff ff       	jmp    80105f39 <alltraps>

80106ccb <vector219>:
80106ccb:	6a 00                	push   $0x0
80106ccd:	68 db 00 00 00       	push   $0xdb
80106cd2:	e9 62 f2 ff ff       	jmp    80105f39 <alltraps>

80106cd7 <vector220>:
80106cd7:	6a 00                	push   $0x0
80106cd9:	68 dc 00 00 00       	push   $0xdc
80106cde:	e9 56 f2 ff ff       	jmp    80105f39 <alltraps>

80106ce3 <vector221>:
80106ce3:	6a 00                	push   $0x0
80106ce5:	68 dd 00 00 00       	push   $0xdd
80106cea:	e9 4a f2 ff ff       	jmp    80105f39 <alltraps>

80106cef <vector222>:
80106cef:	6a 00                	push   $0x0
80106cf1:	68 de 00 00 00       	push   $0xde
80106cf6:	e9 3e f2 ff ff       	jmp    80105f39 <alltraps>

80106cfb <vector223>:
80106cfb:	6a 00                	push   $0x0
80106cfd:	68 df 00 00 00       	push   $0xdf
80106d02:	e9 32 f2 ff ff       	jmp    80105f39 <alltraps>

80106d07 <vector224>:
80106d07:	6a 00                	push   $0x0
80106d09:	68 e0 00 00 00       	push   $0xe0
80106d0e:	e9 26 f2 ff ff       	jmp    80105f39 <alltraps>

80106d13 <vector225>:
80106d13:	6a 00                	push   $0x0
80106d15:	68 e1 00 00 00       	push   $0xe1
80106d1a:	e9 1a f2 ff ff       	jmp    80105f39 <alltraps>

80106d1f <vector226>:
80106d1f:	6a 00                	push   $0x0
80106d21:	68 e2 00 00 00       	push   $0xe2
80106d26:	e9 0e f2 ff ff       	jmp    80105f39 <alltraps>

80106d2b <vector227>:
80106d2b:	6a 00                	push   $0x0
80106d2d:	68 e3 00 00 00       	push   $0xe3
80106d32:	e9 02 f2 ff ff       	jmp    80105f39 <alltraps>

80106d37 <vector228>:
80106d37:	6a 00                	push   $0x0
80106d39:	68 e4 00 00 00       	push   $0xe4
80106d3e:	e9 f6 f1 ff ff       	jmp    80105f39 <alltraps>

80106d43 <vector229>:
80106d43:	6a 00                	push   $0x0
80106d45:	68 e5 00 00 00       	push   $0xe5
80106d4a:	e9 ea f1 ff ff       	jmp    80105f39 <alltraps>

80106d4f <vector230>:
80106d4f:	6a 00                	push   $0x0
80106d51:	68 e6 00 00 00       	push   $0xe6
80106d56:	e9 de f1 ff ff       	jmp    80105f39 <alltraps>

80106d5b <vector231>:
80106d5b:	6a 00                	push   $0x0
80106d5d:	68 e7 00 00 00       	push   $0xe7
80106d62:	e9 d2 f1 ff ff       	jmp    80105f39 <alltraps>

80106d67 <vector232>:
80106d67:	6a 00                	push   $0x0
80106d69:	68 e8 00 00 00       	push   $0xe8
80106d6e:	e9 c6 f1 ff ff       	jmp    80105f39 <alltraps>

80106d73 <vector233>:
80106d73:	6a 00                	push   $0x0
80106d75:	68 e9 00 00 00       	push   $0xe9
80106d7a:	e9 ba f1 ff ff       	jmp    80105f39 <alltraps>

80106d7f <vector234>:
80106d7f:	6a 00                	push   $0x0
80106d81:	68 ea 00 00 00       	push   $0xea
80106d86:	e9 ae f1 ff ff       	jmp    80105f39 <alltraps>

80106d8b <vector235>:
80106d8b:	6a 00                	push   $0x0
80106d8d:	68 eb 00 00 00       	push   $0xeb
80106d92:	e9 a2 f1 ff ff       	jmp    80105f39 <alltraps>

80106d97 <vector236>:
80106d97:	6a 00                	push   $0x0
80106d99:	68 ec 00 00 00       	push   $0xec
80106d9e:	e9 96 f1 ff ff       	jmp    80105f39 <alltraps>

80106da3 <vector237>:
80106da3:	6a 00                	push   $0x0
80106da5:	68 ed 00 00 00       	push   $0xed
80106daa:	e9 8a f1 ff ff       	jmp    80105f39 <alltraps>

80106daf <vector238>:
80106daf:	6a 00                	push   $0x0
80106db1:	68 ee 00 00 00       	push   $0xee
80106db6:	e9 7e f1 ff ff       	jmp    80105f39 <alltraps>

80106dbb <vector239>:
80106dbb:	6a 00                	push   $0x0
80106dbd:	68 ef 00 00 00       	push   $0xef
80106dc2:	e9 72 f1 ff ff       	jmp    80105f39 <alltraps>

80106dc7 <vector240>:
80106dc7:	6a 00                	push   $0x0
80106dc9:	68 f0 00 00 00       	push   $0xf0
80106dce:	e9 66 f1 ff ff       	jmp    80105f39 <alltraps>

80106dd3 <vector241>:
80106dd3:	6a 00                	push   $0x0
80106dd5:	68 f1 00 00 00       	push   $0xf1
80106dda:	e9 5a f1 ff ff       	jmp    80105f39 <alltraps>

80106ddf <vector242>:
80106ddf:	6a 00                	push   $0x0
80106de1:	68 f2 00 00 00       	push   $0xf2
80106de6:	e9 4e f1 ff ff       	jmp    80105f39 <alltraps>

80106deb <vector243>:
80106deb:	6a 00                	push   $0x0
80106ded:	68 f3 00 00 00       	push   $0xf3
80106df2:	e9 42 f1 ff ff       	jmp    80105f39 <alltraps>

80106df7 <vector244>:
80106df7:	6a 00                	push   $0x0
80106df9:	68 f4 00 00 00       	push   $0xf4
80106dfe:	e9 36 f1 ff ff       	jmp    80105f39 <alltraps>

80106e03 <vector245>:
80106e03:	6a 00                	push   $0x0
80106e05:	68 f5 00 00 00       	push   $0xf5
80106e0a:	e9 2a f1 ff ff       	jmp    80105f39 <alltraps>

80106e0f <vector246>:
80106e0f:	6a 00                	push   $0x0
80106e11:	68 f6 00 00 00       	push   $0xf6
80106e16:	e9 1e f1 ff ff       	jmp    80105f39 <alltraps>

80106e1b <vector247>:
80106e1b:	6a 00                	push   $0x0
80106e1d:	68 f7 00 00 00       	push   $0xf7
80106e22:	e9 12 f1 ff ff       	jmp    80105f39 <alltraps>

80106e27 <vector248>:
80106e27:	6a 00                	push   $0x0
80106e29:	68 f8 00 00 00       	push   $0xf8
80106e2e:	e9 06 f1 ff ff       	jmp    80105f39 <alltraps>

80106e33 <vector249>:
80106e33:	6a 00                	push   $0x0
80106e35:	68 f9 00 00 00       	push   $0xf9
80106e3a:	e9 fa f0 ff ff       	jmp    80105f39 <alltraps>

80106e3f <vector250>:
80106e3f:	6a 00                	push   $0x0
80106e41:	68 fa 00 00 00       	push   $0xfa
80106e46:	e9 ee f0 ff ff       	jmp    80105f39 <alltraps>

80106e4b <vector251>:
80106e4b:	6a 00                	push   $0x0
80106e4d:	68 fb 00 00 00       	push   $0xfb
80106e52:	e9 e2 f0 ff ff       	jmp    80105f39 <alltraps>

80106e57 <vector252>:
80106e57:	6a 00                	push   $0x0
80106e59:	68 fc 00 00 00       	push   $0xfc
80106e5e:	e9 d6 f0 ff ff       	jmp    80105f39 <alltraps>

80106e63 <vector253>:
80106e63:	6a 00                	push   $0x0
80106e65:	68 fd 00 00 00       	push   $0xfd
80106e6a:	e9 ca f0 ff ff       	jmp    80105f39 <alltraps>

80106e6f <vector254>:
80106e6f:	6a 00                	push   $0x0
80106e71:	68 fe 00 00 00       	push   $0xfe
80106e76:	e9 be f0 ff ff       	jmp    80105f39 <alltraps>

80106e7b <vector255>:
80106e7b:	6a 00                	push   $0x0
80106e7d:	68 ff 00 00 00       	push   $0xff
80106e82:	e9 b2 f0 ff ff       	jmp    80105f39 <alltraps>
80106e87:	66 90                	xchg   %ax,%ax
80106e89:	66 90                	xchg   %ax,%ax
80106e8b:	66 90                	xchg   %ax,%ax
80106e8d:	66 90                	xchg   %ax,%ax
80106e8f:	90                   	nop

80106e90 <walkpgdir>:
80106e90:	55                   	push   %ebp
80106e91:	89 e5                	mov    %esp,%ebp
80106e93:	57                   	push   %edi
80106e94:	56                   	push   %esi
80106e95:	53                   	push   %ebx
80106e96:	89 d3                	mov    %edx,%ebx
80106e98:	c1 ea 16             	shr    $0x16,%edx
80106e9b:	8d 3c 90             	lea    (%eax,%edx,4),%edi
80106e9e:	83 ec 0c             	sub    $0xc,%esp
80106ea1:	8b 07                	mov    (%edi),%eax
80106ea3:	a8 01                	test   $0x1,%al
80106ea5:	74 29                	je     80106ed0 <walkpgdir+0x40>
80106ea7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106eac:	8d b0 00 00 00 80    	lea    -0x80000000(%eax),%esi
80106eb2:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106eb5:	c1 eb 0a             	shr    $0xa,%ebx
80106eb8:	81 e3 fc 0f 00 00    	and    $0xffc,%ebx
80106ebe:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
80106ec1:	5b                   	pop    %ebx
80106ec2:	5e                   	pop    %esi
80106ec3:	5f                   	pop    %edi
80106ec4:	5d                   	pop    %ebp
80106ec5:	c3                   	ret    
80106ec6:	8d 76 00             	lea    0x0(%esi),%esi
80106ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
80106ed0:	85 c9                	test   %ecx,%ecx
80106ed2:	74 2c                	je     80106f00 <walkpgdir+0x70>
80106ed4:	e8 f7 b5 ff ff       	call   801024d0 <kalloc>
80106ed9:	85 c0                	test   %eax,%eax
80106edb:	89 c6                	mov    %eax,%esi
80106edd:	74 21                	je     80106f00 <walkpgdir+0x70>
80106edf:	83 ec 04             	sub    $0x4,%esp
80106ee2:	68 00 10 00 00       	push   $0x1000
80106ee7:	6a 00                	push   $0x0
80106ee9:	50                   	push   %eax
80106eea:	e8 51 dd ff ff       	call   80104c40 <memset>
80106eef:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
80106ef5:	83 c4 10             	add    $0x10,%esp
80106ef8:	83 c8 07             	or     $0x7,%eax
80106efb:	89 07                	mov    %eax,(%edi)
80106efd:	eb b3                	jmp    80106eb2 <walkpgdir+0x22>
80106eff:	90                   	nop
80106f00:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f03:	31 c0                	xor    %eax,%eax
80106f05:	5b                   	pop    %ebx
80106f06:	5e                   	pop    %esi
80106f07:	5f                   	pop    %edi
80106f08:	5d                   	pop    %ebp
80106f09:	c3                   	ret    
80106f0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80106f10 <mappages>:
80106f10:	55                   	push   %ebp
80106f11:	89 e5                	mov    %esp,%ebp
80106f13:	57                   	push   %edi
80106f14:	56                   	push   %esi
80106f15:	53                   	push   %ebx
80106f16:	89 d3                	mov    %edx,%ebx
80106f18:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106f1e:	83 ec 1c             	sub    $0x1c,%esp
80106f21:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106f24:	8d 44 0a ff          	lea    -0x1(%edx,%ecx,1),%eax
80106f28:	8b 7d 08             	mov    0x8(%ebp),%edi
80106f2b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80106f30:	89 45 e0             	mov    %eax,-0x20(%ebp)
80106f33:	8b 45 0c             	mov    0xc(%ebp),%eax
80106f36:	29 df                	sub    %ebx,%edi
80106f38:	83 c8 01             	or     $0x1,%eax
80106f3b:	89 45 dc             	mov    %eax,-0x24(%ebp)
80106f3e:	eb 15                	jmp    80106f55 <mappages+0x45>
80106f40:	f6 00 01             	testb  $0x1,(%eax)
80106f43:	75 45                	jne    80106f8a <mappages+0x7a>
80106f45:	0b 75 dc             	or     -0x24(%ebp),%esi
80106f48:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
80106f4b:	89 30                	mov    %esi,(%eax)
80106f4d:	74 31                	je     80106f80 <mappages+0x70>
80106f4f:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106f55:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106f58:	b9 01 00 00 00       	mov    $0x1,%ecx
80106f5d:	89 da                	mov    %ebx,%edx
80106f5f:	8d 34 3b             	lea    (%ebx,%edi,1),%esi
80106f62:	e8 29 ff ff ff       	call   80106e90 <walkpgdir>
80106f67:	85 c0                	test   %eax,%eax
80106f69:	75 d5                	jne    80106f40 <mappages+0x30>
80106f6b:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f6e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80106f73:	5b                   	pop    %ebx
80106f74:	5e                   	pop    %esi
80106f75:	5f                   	pop    %edi
80106f76:	5d                   	pop    %ebp
80106f77:	c3                   	ret    
80106f78:	90                   	nop
80106f79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80106f80:	8d 65 f4             	lea    -0xc(%ebp),%esp
80106f83:	31 c0                	xor    %eax,%eax
80106f85:	5b                   	pop    %ebx
80106f86:	5e                   	pop    %esi
80106f87:	5f                   	pop    %edi
80106f88:	5d                   	pop    %ebp
80106f89:	c3                   	ret    
80106f8a:	83 ec 0c             	sub    $0xc,%esp
80106f8d:	68 38 81 10 80       	push   $0x80108138
80106f92:	e8 d9 93 ff ff       	call   80100370 <panic>
80106f97:	89 f6                	mov    %esi,%esi
80106f99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80106fa0 <deallocuvm.part.0>:
80106fa0:	55                   	push   %ebp
80106fa1:	89 e5                	mov    %esp,%ebp
80106fa3:	57                   	push   %edi
80106fa4:	56                   	push   %esi
80106fa5:	53                   	push   %ebx
80106fa6:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
80106fac:	89 c7                	mov    %eax,%edi
80106fae:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
80106fb4:	83 ec 1c             	sub    $0x1c,%esp
80106fb7:	89 4d e0             	mov    %ecx,-0x20(%ebp)
80106fba:	39 d3                	cmp    %edx,%ebx
80106fbc:	73 66                	jae    80107024 <deallocuvm.part.0+0x84>
80106fbe:	89 d6                	mov    %edx,%esi
80106fc0:	eb 3d                	jmp    80106fff <deallocuvm.part.0+0x5f>
80106fc2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80106fc8:	8b 10                	mov    (%eax),%edx
80106fca:	f6 c2 01             	test   $0x1,%dl
80106fcd:	74 26                	je     80106ff5 <deallocuvm.part.0+0x55>
80106fcf:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
80106fd5:	74 58                	je     8010702f <deallocuvm.part.0+0x8f>
80106fd7:	83 ec 0c             	sub    $0xc,%esp
80106fda:	81 c2 00 00 00 80    	add    $0x80000000,%edx
80106fe0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
80106fe3:	52                   	push   %edx
80106fe4:	e8 37 b3 ff ff       	call   80102320 <kfree>
80106fe9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
80106fec:	83 c4 10             	add    $0x10,%esp
80106fef:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
80106ff5:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80106ffb:	39 f3                	cmp    %esi,%ebx
80106ffd:	73 25                	jae    80107024 <deallocuvm.part.0+0x84>
80106fff:	31 c9                	xor    %ecx,%ecx
80107001:	89 da                	mov    %ebx,%edx
80107003:	89 f8                	mov    %edi,%eax
80107005:	e8 86 fe ff ff       	call   80106e90 <walkpgdir>
8010700a:	85 c0                	test   %eax,%eax
8010700c:	75 ba                	jne    80106fc8 <deallocuvm.part.0+0x28>
8010700e:	81 e3 00 00 c0 ff    	and    $0xffc00000,%ebx
80107014:	81 c3 00 f0 3f 00    	add    $0x3ff000,%ebx
8010701a:	81 c3 00 10 00 00    	add    $0x1000,%ebx
80107020:	39 f3                	cmp    %esi,%ebx
80107022:	72 db                	jb     80106fff <deallocuvm.part.0+0x5f>
80107024:	8b 45 e0             	mov    -0x20(%ebp),%eax
80107027:	8d 65 f4             	lea    -0xc(%ebp),%esp
8010702a:	5b                   	pop    %ebx
8010702b:	5e                   	pop    %esi
8010702c:	5f                   	pop    %edi
8010702d:	5d                   	pop    %ebp
8010702e:	c3                   	ret    
8010702f:	83 ec 0c             	sub    $0xc,%esp
80107032:	68 86 7a 10 80       	push   $0x80107a86
80107037:	e8 34 93 ff ff       	call   80100370 <panic>
8010703c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107040 <seginit>:
80107040:	55                   	push   %ebp
80107041:	89 e5                	mov    %esp,%ebp
80107043:	83 ec 18             	sub    $0x18,%esp
80107046:	e8 85 c7 ff ff       	call   801037d0 <cpuid>
8010704b:	69 c0 b0 00 00 00    	imul   $0xb0,%eax,%eax
80107051:	31 c9                	xor    %ecx,%ecx
80107053:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80107058:	66 89 90 f8 37 11 80 	mov    %dx,-0x7feec808(%eax)
8010705f:	66 89 88 fa 37 11 80 	mov    %cx,-0x7feec806(%eax)
80107066:	ba ff ff ff ff       	mov    $0xffffffff,%edx
8010706b:	31 c9                	xor    %ecx,%ecx
8010706d:	66 89 90 00 38 11 80 	mov    %dx,-0x7feec800(%eax)
80107074:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80107079:	66 89 88 02 38 11 80 	mov    %cx,-0x7feec7fe(%eax)
80107080:	31 c9                	xor    %ecx,%ecx
80107082:	66 89 90 08 38 11 80 	mov    %dx,-0x7feec7f8(%eax)
80107089:	66 89 88 0a 38 11 80 	mov    %cx,-0x7feec7f6(%eax)
80107090:	ba ff ff ff ff       	mov    $0xffffffff,%edx
80107095:	31 c9                	xor    %ecx,%ecx
80107097:	66 89 90 10 38 11 80 	mov    %dx,-0x7feec7f0(%eax)
8010709e:	c6 80 fc 37 11 80 00 	movb   $0x0,-0x7feec804(%eax)
801070a5:	ba 2f 00 00 00       	mov    $0x2f,%edx
801070aa:	c6 80 fd 37 11 80 9a 	movb   $0x9a,-0x7feec803(%eax)
801070b1:	c6 80 fe 37 11 80 cf 	movb   $0xcf,-0x7feec802(%eax)
801070b8:	c6 80 ff 37 11 80 00 	movb   $0x0,-0x7feec801(%eax)
801070bf:	c6 80 04 38 11 80 00 	movb   $0x0,-0x7feec7fc(%eax)
801070c6:	c6 80 05 38 11 80 92 	movb   $0x92,-0x7feec7fb(%eax)
801070cd:	c6 80 06 38 11 80 cf 	movb   $0xcf,-0x7feec7fa(%eax)
801070d4:	c6 80 07 38 11 80 00 	movb   $0x0,-0x7feec7f9(%eax)
801070db:	c6 80 0c 38 11 80 00 	movb   $0x0,-0x7feec7f4(%eax)
801070e2:	c6 80 0d 38 11 80 fa 	movb   $0xfa,-0x7feec7f3(%eax)
801070e9:	c6 80 0e 38 11 80 cf 	movb   $0xcf,-0x7feec7f2(%eax)
801070f0:	c6 80 0f 38 11 80 00 	movb   $0x0,-0x7feec7f1(%eax)
801070f7:	66 89 88 12 38 11 80 	mov    %cx,-0x7feec7ee(%eax)
801070fe:	c6 80 14 38 11 80 00 	movb   $0x0,-0x7feec7ec(%eax)
80107105:	c6 80 15 38 11 80 f2 	movb   $0xf2,-0x7feec7eb(%eax)
8010710c:	c6 80 16 38 11 80 cf 	movb   $0xcf,-0x7feec7ea(%eax)
80107113:	c6 80 17 38 11 80 00 	movb   $0x0,-0x7feec7e9(%eax)
8010711a:	05 f0 37 11 80       	add    $0x801137f0,%eax
8010711f:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
80107123:	66 89 45 f4          	mov    %ax,-0xc(%ebp)
80107127:	c1 e8 10             	shr    $0x10,%eax
8010712a:	66 89 45 f6          	mov    %ax,-0xa(%ebp)
8010712e:	8d 45 f2             	lea    -0xe(%ebp),%eax
80107131:	0f 01 10             	lgdtl  (%eax)
80107134:	c9                   	leave  
80107135:	c3                   	ret    
80107136:	8d 76 00             	lea    0x0(%esi),%esi
80107139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107140 <switchkvm>:
80107140:	a1 a4 ab 11 80       	mov    0x8011aba4,%eax
80107145:	55                   	push   %ebp
80107146:	89 e5                	mov    %esp,%ebp
80107148:	05 00 00 00 80       	add    $0x80000000,%eax
8010714d:	0f 22 d8             	mov    %eax,%cr3
80107150:	5d                   	pop    %ebp
80107151:	c3                   	ret    
80107152:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107160 <switchuvm>:
80107160:	55                   	push   %ebp
80107161:	89 e5                	mov    %esp,%ebp
80107163:	57                   	push   %edi
80107164:	56                   	push   %esi
80107165:	53                   	push   %ebx
80107166:	83 ec 1c             	sub    $0x1c,%esp
80107169:	8b 75 08             	mov    0x8(%ebp),%esi
8010716c:	85 f6                	test   %esi,%esi
8010716e:	0f 84 cd 00 00 00    	je     80107241 <switchuvm+0xe1>
80107174:	8b 46 08             	mov    0x8(%esi),%eax
80107177:	85 c0                	test   %eax,%eax
80107179:	0f 84 dc 00 00 00    	je     8010725b <switchuvm+0xfb>
8010717f:	8b 7e 04             	mov    0x4(%esi),%edi
80107182:	85 ff                	test   %edi,%edi
80107184:	0f 84 c4 00 00 00    	je     8010724e <switchuvm+0xee>
8010718a:	e8 d1 d8 ff ff       	call   80104a60 <pushcli>
8010718f:	e8 bc c5 ff ff       	call   80103750 <mycpu>
80107194:	89 c3                	mov    %eax,%ebx
80107196:	e8 b5 c5 ff ff       	call   80103750 <mycpu>
8010719b:	89 c7                	mov    %eax,%edi
8010719d:	e8 ae c5 ff ff       	call   80103750 <mycpu>
801071a2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801071a5:	83 c7 08             	add    $0x8,%edi
801071a8:	e8 a3 c5 ff ff       	call   80103750 <mycpu>
801071ad:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801071b0:	83 c0 08             	add    $0x8,%eax
801071b3:	ba 67 00 00 00       	mov    $0x67,%edx
801071b8:	c1 e8 18             	shr    $0x18,%eax
801071bb:	66 89 93 98 00 00 00 	mov    %dx,0x98(%ebx)
801071c2:	66 89 bb 9a 00 00 00 	mov    %di,0x9a(%ebx)
801071c9:	c6 83 9d 00 00 00 99 	movb   $0x99,0x9d(%ebx)
801071d0:	c6 83 9e 00 00 00 40 	movb   $0x40,0x9e(%ebx)
801071d7:	83 c1 08             	add    $0x8,%ecx
801071da:	88 83 9f 00 00 00    	mov    %al,0x9f(%ebx)
801071e0:	c1 e9 10             	shr    $0x10,%ecx
801071e3:	88 8b 9c 00 00 00    	mov    %cl,0x9c(%ebx)
801071e9:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
801071ee:	e8 5d c5 ff ff       	call   80103750 <mycpu>
801071f3:	80 a0 9d 00 00 00 ef 	andb   $0xef,0x9d(%eax)
801071fa:	e8 51 c5 ff ff       	call   80103750 <mycpu>
801071ff:	b9 10 00 00 00       	mov    $0x10,%ecx
80107204:	66 89 48 10          	mov    %cx,0x10(%eax)
80107208:	e8 43 c5 ff ff       	call   80103750 <mycpu>
8010720d:	8b 56 08             	mov    0x8(%esi),%edx
80107210:	8d 8a 00 10 00 00    	lea    0x1000(%edx),%ecx
80107216:	89 48 0c             	mov    %ecx,0xc(%eax)
80107219:	e8 32 c5 ff ff       	call   80103750 <mycpu>
8010721e:	66 89 58 6e          	mov    %bx,0x6e(%eax)
80107222:	b8 28 00 00 00       	mov    $0x28,%eax
80107227:	0f 00 d8             	ltr    %ax
8010722a:	8b 46 04             	mov    0x4(%esi),%eax
8010722d:	05 00 00 00 80       	add    $0x80000000,%eax
80107232:	0f 22 d8             	mov    %eax,%cr3
80107235:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107238:	5b                   	pop    %ebx
80107239:	5e                   	pop    %esi
8010723a:	5f                   	pop    %edi
8010723b:	5d                   	pop    %ebp
8010723c:	e9 5f d8 ff ff       	jmp    80104aa0 <popcli>
80107241:	83 ec 0c             	sub    $0xc,%esp
80107244:	68 3e 81 10 80       	push   $0x8010813e
80107249:	e8 22 91 ff ff       	call   80100370 <panic>
8010724e:	83 ec 0c             	sub    $0xc,%esp
80107251:	68 69 81 10 80       	push   $0x80108169
80107256:	e8 15 91 ff ff       	call   80100370 <panic>
8010725b:	83 ec 0c             	sub    $0xc,%esp
8010725e:	68 54 81 10 80       	push   $0x80108154
80107263:	e8 08 91 ff ff       	call   80100370 <panic>
80107268:	90                   	nop
80107269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107270 <inituvm>:
80107270:	55                   	push   %ebp
80107271:	89 e5                	mov    %esp,%ebp
80107273:	57                   	push   %edi
80107274:	56                   	push   %esi
80107275:	53                   	push   %ebx
80107276:	83 ec 1c             	sub    $0x1c,%esp
80107279:	8b 75 10             	mov    0x10(%ebp),%esi
8010727c:	8b 45 08             	mov    0x8(%ebp),%eax
8010727f:	8b 7d 0c             	mov    0xc(%ebp),%edi
80107282:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80107288:	89 45 e4             	mov    %eax,-0x1c(%ebp)
8010728b:	77 49                	ja     801072d6 <inituvm+0x66>
8010728d:	e8 3e b2 ff ff       	call   801024d0 <kalloc>
80107292:	83 ec 04             	sub    $0x4,%esp
80107295:	89 c3                	mov    %eax,%ebx
80107297:	68 00 10 00 00       	push   $0x1000
8010729c:	6a 00                	push   $0x0
8010729e:	50                   	push   %eax
8010729f:	e8 9c d9 ff ff       	call   80104c40 <memset>
801072a4:	58                   	pop    %eax
801072a5:	8d 83 00 00 00 80    	lea    -0x80000000(%ebx),%eax
801072ab:	b9 00 10 00 00       	mov    $0x1000,%ecx
801072b0:	5a                   	pop    %edx
801072b1:	6a 06                	push   $0x6
801072b3:	50                   	push   %eax
801072b4:	31 d2                	xor    %edx,%edx
801072b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
801072b9:	e8 52 fc ff ff       	call   80106f10 <mappages>
801072be:	89 75 10             	mov    %esi,0x10(%ebp)
801072c1:	89 7d 0c             	mov    %edi,0xc(%ebp)
801072c4:	83 c4 10             	add    $0x10,%esp
801072c7:	89 5d 08             	mov    %ebx,0x8(%ebp)
801072ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
801072cd:	5b                   	pop    %ebx
801072ce:	5e                   	pop    %esi
801072cf:	5f                   	pop    %edi
801072d0:	5d                   	pop    %ebp
801072d1:	e9 1a da ff ff       	jmp    80104cf0 <memmove>
801072d6:	83 ec 0c             	sub    $0xc,%esp
801072d9:	68 7d 81 10 80       	push   $0x8010817d
801072de:	e8 8d 90 ff ff       	call   80100370 <panic>
801072e3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801072e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

801072f0 <loaduvm>:
801072f0:	55                   	push   %ebp
801072f1:	89 e5                	mov    %esp,%ebp
801072f3:	57                   	push   %edi
801072f4:	56                   	push   %esi
801072f5:	53                   	push   %ebx
801072f6:	83 ec 0c             	sub    $0xc,%esp
801072f9:	f7 45 0c ff 0f 00 00 	testl  $0xfff,0xc(%ebp)
80107300:	0f 85 91 00 00 00    	jne    80107397 <loaduvm+0xa7>
80107306:	8b 75 18             	mov    0x18(%ebp),%esi
80107309:	31 db                	xor    %ebx,%ebx
8010730b:	85 f6                	test   %esi,%esi
8010730d:	75 1a                	jne    80107329 <loaduvm+0x39>
8010730f:	eb 6f                	jmp    80107380 <loaduvm+0x90>
80107311:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107318:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010731e:	81 ee 00 10 00 00    	sub    $0x1000,%esi
80107324:	39 5d 18             	cmp    %ebx,0x18(%ebp)
80107327:	76 57                	jbe    80107380 <loaduvm+0x90>
80107329:	8b 55 0c             	mov    0xc(%ebp),%edx
8010732c:	8b 45 08             	mov    0x8(%ebp),%eax
8010732f:	31 c9                	xor    %ecx,%ecx
80107331:	01 da                	add    %ebx,%edx
80107333:	e8 58 fb ff ff       	call   80106e90 <walkpgdir>
80107338:	85 c0                	test   %eax,%eax
8010733a:	74 4e                	je     8010738a <loaduvm+0x9a>
8010733c:	8b 00                	mov    (%eax),%eax
8010733e:	8b 4d 14             	mov    0x14(%ebp),%ecx
80107341:	bf 00 10 00 00       	mov    $0x1000,%edi
80107346:	25 00 f0 ff ff       	and    $0xfffff000,%eax
8010734b:	81 fe ff 0f 00 00    	cmp    $0xfff,%esi
80107351:	0f 46 fe             	cmovbe %esi,%edi
80107354:	01 d9                	add    %ebx,%ecx
80107356:	05 00 00 00 80       	add    $0x80000000,%eax
8010735b:	57                   	push   %edi
8010735c:	51                   	push   %ecx
8010735d:	50                   	push   %eax
8010735e:	ff 75 10             	pushl  0x10(%ebp)
80107361:	e8 2a a6 ff ff       	call   80101990 <readi>
80107366:	83 c4 10             	add    $0x10,%esp
80107369:	39 c7                	cmp    %eax,%edi
8010736b:	74 ab                	je     80107318 <loaduvm+0x28>
8010736d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107370:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
80107375:	5b                   	pop    %ebx
80107376:	5e                   	pop    %esi
80107377:	5f                   	pop    %edi
80107378:	5d                   	pop    %ebp
80107379:	c3                   	ret    
8010737a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107380:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107383:	31 c0                	xor    %eax,%eax
80107385:	5b                   	pop    %ebx
80107386:	5e                   	pop    %esi
80107387:	5f                   	pop    %edi
80107388:	5d                   	pop    %ebp
80107389:	c3                   	ret    
8010738a:	83 ec 0c             	sub    $0xc,%esp
8010738d:	68 97 81 10 80       	push   $0x80108197
80107392:	e8 d9 8f ff ff       	call   80100370 <panic>
80107397:	83 ec 0c             	sub    $0xc,%esp
8010739a:	68 38 82 10 80       	push   $0x80108238
8010739f:	e8 cc 8f ff ff       	call   80100370 <panic>
801073a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801073aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801073b0 <allocuvm>:
801073b0:	55                   	push   %ebp
801073b1:	89 e5                	mov    %esp,%ebp
801073b3:	57                   	push   %edi
801073b4:	56                   	push   %esi
801073b5:	53                   	push   %ebx
801073b6:	83 ec 0c             	sub    $0xc,%esp
801073b9:	8b 7d 10             	mov    0x10(%ebp),%edi
801073bc:	85 ff                	test   %edi,%edi
801073be:	0f 88 ca 00 00 00    	js     8010748e <allocuvm+0xde>
801073c4:	3b 7d 0c             	cmp    0xc(%ebp),%edi
801073c7:	8b 45 0c             	mov    0xc(%ebp),%eax
801073ca:	0f 82 82 00 00 00    	jb     80107452 <allocuvm+0xa2>
801073d0:	8d 98 ff 0f 00 00    	lea    0xfff(%eax),%ebx
801073d6:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801073dc:	39 df                	cmp    %ebx,%edi
801073de:	77 43                	ja     80107423 <allocuvm+0x73>
801073e0:	e9 bb 00 00 00       	jmp    801074a0 <allocuvm+0xf0>
801073e5:	8d 76 00             	lea    0x0(%esi),%esi
801073e8:	83 ec 04             	sub    $0x4,%esp
801073eb:	68 00 10 00 00       	push   $0x1000
801073f0:	6a 00                	push   $0x0
801073f2:	50                   	push   %eax
801073f3:	e8 48 d8 ff ff       	call   80104c40 <memset>
801073f8:	58                   	pop    %eax
801073f9:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
801073ff:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107404:	5a                   	pop    %edx
80107405:	6a 06                	push   $0x6
80107407:	50                   	push   %eax
80107408:	89 da                	mov    %ebx,%edx
8010740a:	8b 45 08             	mov    0x8(%ebp),%eax
8010740d:	e8 fe fa ff ff       	call   80106f10 <mappages>
80107412:	83 c4 10             	add    $0x10,%esp
80107415:	85 c0                	test   %eax,%eax
80107417:	78 47                	js     80107460 <allocuvm+0xb0>
80107419:	81 c3 00 10 00 00    	add    $0x1000,%ebx
8010741f:	39 df                	cmp    %ebx,%edi
80107421:	76 7d                	jbe    801074a0 <allocuvm+0xf0>
80107423:	e8 a8 b0 ff ff       	call   801024d0 <kalloc>
80107428:	85 c0                	test   %eax,%eax
8010742a:	89 c6                	mov    %eax,%esi
8010742c:	75 ba                	jne    801073e8 <allocuvm+0x38>
8010742e:	83 ec 0c             	sub    $0xc,%esp
80107431:	68 b5 81 10 80       	push   $0x801081b5
80107436:	e8 25 92 ff ff       	call   80100660 <cprintf>
8010743b:	83 c4 10             	add    $0x10,%esp
8010743e:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80107441:	76 4b                	jbe    8010748e <allocuvm+0xde>
80107443:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80107446:	8b 45 08             	mov    0x8(%ebp),%eax
80107449:	89 fa                	mov    %edi,%edx
8010744b:	e8 50 fb ff ff       	call   80106fa0 <deallocuvm.part.0>
80107450:	31 c0                	xor    %eax,%eax
80107452:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107455:	5b                   	pop    %ebx
80107456:	5e                   	pop    %esi
80107457:	5f                   	pop    %edi
80107458:	5d                   	pop    %ebp
80107459:	c3                   	ret    
8010745a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
80107460:	83 ec 0c             	sub    $0xc,%esp
80107463:	68 cd 81 10 80       	push   $0x801081cd
80107468:	e8 f3 91 ff ff       	call   80100660 <cprintf>
8010746d:	83 c4 10             	add    $0x10,%esp
80107470:	3b 7d 0c             	cmp    0xc(%ebp),%edi
80107473:	76 0d                	jbe    80107482 <allocuvm+0xd2>
80107475:	8b 4d 0c             	mov    0xc(%ebp),%ecx
80107478:	8b 45 08             	mov    0x8(%ebp),%eax
8010747b:	89 fa                	mov    %edi,%edx
8010747d:	e8 1e fb ff ff       	call   80106fa0 <deallocuvm.part.0>
80107482:	83 ec 0c             	sub    $0xc,%esp
80107485:	56                   	push   %esi
80107486:	e8 95 ae ff ff       	call   80102320 <kfree>
8010748b:	83 c4 10             	add    $0x10,%esp
8010748e:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107491:	31 c0                	xor    %eax,%eax
80107493:	5b                   	pop    %ebx
80107494:	5e                   	pop    %esi
80107495:	5f                   	pop    %edi
80107496:	5d                   	pop    %ebp
80107497:	c3                   	ret    
80107498:	90                   	nop
80107499:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801074a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
801074a3:	89 f8                	mov    %edi,%eax
801074a5:	5b                   	pop    %ebx
801074a6:	5e                   	pop    %esi
801074a7:	5f                   	pop    %edi
801074a8:	5d                   	pop    %ebp
801074a9:	c3                   	ret    
801074aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

801074b0 <deallocuvm>:
801074b0:	55                   	push   %ebp
801074b1:	89 e5                	mov    %esp,%ebp
801074b3:	8b 55 0c             	mov    0xc(%ebp),%edx
801074b6:	8b 4d 10             	mov    0x10(%ebp),%ecx
801074b9:	8b 45 08             	mov    0x8(%ebp),%eax
801074bc:	39 d1                	cmp    %edx,%ecx
801074be:	73 10                	jae    801074d0 <deallocuvm+0x20>
801074c0:	5d                   	pop    %ebp
801074c1:	e9 da fa ff ff       	jmp    80106fa0 <deallocuvm.part.0>
801074c6:	8d 76 00             	lea    0x0(%esi),%esi
801074c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
801074d0:	89 d0                	mov    %edx,%eax
801074d2:	5d                   	pop    %ebp
801074d3:	c3                   	ret    
801074d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
801074da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

801074e0 <freevm>:
801074e0:	55                   	push   %ebp
801074e1:	89 e5                	mov    %esp,%ebp
801074e3:	57                   	push   %edi
801074e4:	56                   	push   %esi
801074e5:	53                   	push   %ebx
801074e6:	83 ec 0c             	sub    $0xc,%esp
801074e9:	8b 75 08             	mov    0x8(%ebp),%esi
801074ec:	85 f6                	test   %esi,%esi
801074ee:	74 59                	je     80107549 <freevm+0x69>
801074f0:	31 c9                	xor    %ecx,%ecx
801074f2:	ba 00 00 00 80       	mov    $0x80000000,%edx
801074f7:	89 f0                	mov    %esi,%eax
801074f9:	e8 a2 fa ff ff       	call   80106fa0 <deallocuvm.part.0>
801074fe:	89 f3                	mov    %esi,%ebx
80107500:	8d be 00 10 00 00    	lea    0x1000(%esi),%edi
80107506:	eb 0f                	jmp    80107517 <freevm+0x37>
80107508:	90                   	nop
80107509:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107510:	83 c3 04             	add    $0x4,%ebx
80107513:	39 fb                	cmp    %edi,%ebx
80107515:	74 23                	je     8010753a <freevm+0x5a>
80107517:	8b 03                	mov    (%ebx),%eax
80107519:	a8 01                	test   $0x1,%al
8010751b:	74 f3                	je     80107510 <freevm+0x30>
8010751d:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107522:	83 ec 0c             	sub    $0xc,%esp
80107525:	83 c3 04             	add    $0x4,%ebx
80107528:	05 00 00 00 80       	add    $0x80000000,%eax
8010752d:	50                   	push   %eax
8010752e:	e8 ed ad ff ff       	call   80102320 <kfree>
80107533:	83 c4 10             	add    $0x10,%esp
80107536:	39 fb                	cmp    %edi,%ebx
80107538:	75 dd                	jne    80107517 <freevm+0x37>
8010753a:	89 75 08             	mov    %esi,0x8(%ebp)
8010753d:	8d 65 f4             	lea    -0xc(%ebp),%esp
80107540:	5b                   	pop    %ebx
80107541:	5e                   	pop    %esi
80107542:	5f                   	pop    %edi
80107543:	5d                   	pop    %ebp
80107544:	e9 d7 ad ff ff       	jmp    80102320 <kfree>
80107549:	83 ec 0c             	sub    $0xc,%esp
8010754c:	68 e9 81 10 80       	push   $0x801081e9
80107551:	e8 1a 8e ff ff       	call   80100370 <panic>
80107556:	8d 76 00             	lea    0x0(%esi),%esi
80107559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

80107560 <setupkvm>:
80107560:	55                   	push   %ebp
80107561:	89 e5                	mov    %esp,%ebp
80107563:	56                   	push   %esi
80107564:	53                   	push   %ebx
80107565:	e8 66 af ff ff       	call   801024d0 <kalloc>
8010756a:	85 c0                	test   %eax,%eax
8010756c:	74 6a                	je     801075d8 <setupkvm+0x78>
8010756e:	83 ec 04             	sub    $0x4,%esp
80107571:	89 c6                	mov    %eax,%esi
80107573:	bb 20 b4 10 80       	mov    $0x8010b420,%ebx
80107578:	68 00 10 00 00       	push   $0x1000
8010757d:	6a 00                	push   $0x0
8010757f:	50                   	push   %eax
80107580:	e8 bb d6 ff ff       	call   80104c40 <memset>
80107585:	83 c4 10             	add    $0x10,%esp
80107588:	8b 43 04             	mov    0x4(%ebx),%eax
8010758b:	8b 4b 08             	mov    0x8(%ebx),%ecx
8010758e:	83 ec 08             	sub    $0x8,%esp
80107591:	8b 13                	mov    (%ebx),%edx
80107593:	ff 73 0c             	pushl  0xc(%ebx)
80107596:	50                   	push   %eax
80107597:	29 c1                	sub    %eax,%ecx
80107599:	89 f0                	mov    %esi,%eax
8010759b:	e8 70 f9 ff ff       	call   80106f10 <mappages>
801075a0:	83 c4 10             	add    $0x10,%esp
801075a3:	85 c0                	test   %eax,%eax
801075a5:	78 19                	js     801075c0 <setupkvm+0x60>
801075a7:	83 c3 10             	add    $0x10,%ebx
801075aa:	81 fb 60 b4 10 80    	cmp    $0x8010b460,%ebx
801075b0:	75 d6                	jne    80107588 <setupkvm+0x28>
801075b2:	89 f0                	mov    %esi,%eax
801075b4:	8d 65 f8             	lea    -0x8(%ebp),%esp
801075b7:	5b                   	pop    %ebx
801075b8:	5e                   	pop    %esi
801075b9:	5d                   	pop    %ebp
801075ba:	c3                   	ret    
801075bb:	90                   	nop
801075bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801075c0:	83 ec 0c             	sub    $0xc,%esp
801075c3:	56                   	push   %esi
801075c4:	e8 17 ff ff ff       	call   801074e0 <freevm>
801075c9:	83 c4 10             	add    $0x10,%esp
801075cc:	8d 65 f8             	lea    -0x8(%ebp),%esp
801075cf:	31 c0                	xor    %eax,%eax
801075d1:	5b                   	pop    %ebx
801075d2:	5e                   	pop    %esi
801075d3:	5d                   	pop    %ebp
801075d4:	c3                   	ret    
801075d5:	8d 76 00             	lea    0x0(%esi),%esi
801075d8:	31 c0                	xor    %eax,%eax
801075da:	eb d8                	jmp    801075b4 <setupkvm+0x54>
801075dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

801075e0 <kvmalloc>:
801075e0:	55                   	push   %ebp
801075e1:	89 e5                	mov    %esp,%ebp
801075e3:	83 ec 08             	sub    $0x8,%esp
801075e6:	e8 75 ff ff ff       	call   80107560 <setupkvm>
801075eb:	a3 a4 ab 11 80       	mov    %eax,0x8011aba4
801075f0:	05 00 00 00 80       	add    $0x80000000,%eax
801075f5:	0f 22 d8             	mov    %eax,%cr3
801075f8:	c9                   	leave  
801075f9:	c3                   	ret    
801075fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

80107600 <clearpteu>:
80107600:	55                   	push   %ebp
80107601:	31 c9                	xor    %ecx,%ecx
80107603:	89 e5                	mov    %esp,%ebp
80107605:	83 ec 08             	sub    $0x8,%esp
80107608:	8b 55 0c             	mov    0xc(%ebp),%edx
8010760b:	8b 45 08             	mov    0x8(%ebp),%eax
8010760e:	e8 7d f8 ff ff       	call   80106e90 <walkpgdir>
80107613:	85 c0                	test   %eax,%eax
80107615:	74 05                	je     8010761c <clearpteu+0x1c>
80107617:	83 20 fb             	andl   $0xfffffffb,(%eax)
8010761a:	c9                   	leave  
8010761b:	c3                   	ret    
8010761c:	83 ec 0c             	sub    $0xc,%esp
8010761f:	68 fa 81 10 80       	push   $0x801081fa
80107624:	e8 47 8d ff ff       	call   80100370 <panic>
80107629:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

80107630 <copyuvm>:
80107630:	55                   	push   %ebp
80107631:	89 e5                	mov    %esp,%ebp
80107633:	57                   	push   %edi
80107634:	56                   	push   %esi
80107635:	53                   	push   %ebx
80107636:	83 ec 1c             	sub    $0x1c,%esp
80107639:	e8 22 ff ff ff       	call   80107560 <setupkvm>
8010763e:	85 c0                	test   %eax,%eax
80107640:	89 45 e0             	mov    %eax,-0x20(%ebp)
80107643:	0f 84 c5 00 00 00    	je     8010770e <copyuvm+0xde>
80107649:	8b 4d 0c             	mov    0xc(%ebp),%ecx
8010764c:	85 c9                	test   %ecx,%ecx
8010764e:	0f 84 9c 00 00 00    	je     801076f0 <copyuvm+0xc0>
80107654:	31 ff                	xor    %edi,%edi
80107656:	eb 4a                	jmp    801076a2 <copyuvm+0x72>
80107658:	90                   	nop
80107659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107660:	83 ec 04             	sub    $0x4,%esp
80107663:	81 c3 00 00 00 80    	add    $0x80000000,%ebx
80107669:	68 00 10 00 00       	push   $0x1000
8010766e:	53                   	push   %ebx
8010766f:	50                   	push   %eax
80107670:	e8 7b d6 ff ff       	call   80104cf0 <memmove>
80107675:	58                   	pop    %eax
80107676:	8d 86 00 00 00 80    	lea    -0x80000000(%esi),%eax
8010767c:	b9 00 10 00 00       	mov    $0x1000,%ecx
80107681:	5a                   	pop    %edx
80107682:	ff 75 e4             	pushl  -0x1c(%ebp)
80107685:	50                   	push   %eax
80107686:	89 fa                	mov    %edi,%edx
80107688:	8b 45 e0             	mov    -0x20(%ebp),%eax
8010768b:	e8 80 f8 ff ff       	call   80106f10 <mappages>
80107690:	83 c4 10             	add    $0x10,%esp
80107693:	85 c0                	test   %eax,%eax
80107695:	78 69                	js     80107700 <copyuvm+0xd0>
80107697:	81 c7 00 10 00 00    	add    $0x1000,%edi
8010769d:	39 7d 0c             	cmp    %edi,0xc(%ebp)
801076a0:	76 4e                	jbe    801076f0 <copyuvm+0xc0>
801076a2:	8b 45 08             	mov    0x8(%ebp),%eax
801076a5:	31 c9                	xor    %ecx,%ecx
801076a7:	89 fa                	mov    %edi,%edx
801076a9:	e8 e2 f7 ff ff       	call   80106e90 <walkpgdir>
801076ae:	85 c0                	test   %eax,%eax
801076b0:	74 6d                	je     8010771f <copyuvm+0xef>
801076b2:	8b 00                	mov    (%eax),%eax
801076b4:	a8 01                	test   $0x1,%al
801076b6:	74 5a                	je     80107712 <copyuvm+0xe2>
801076b8:	89 c3                	mov    %eax,%ebx
801076ba:	25 ff 0f 00 00       	and    $0xfff,%eax
801076bf:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
801076c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
801076c8:	e8 03 ae ff ff       	call   801024d0 <kalloc>
801076cd:	85 c0                	test   %eax,%eax
801076cf:	89 c6                	mov    %eax,%esi
801076d1:	75 8d                	jne    80107660 <copyuvm+0x30>
801076d3:	83 ec 0c             	sub    $0xc,%esp
801076d6:	ff 75 e0             	pushl  -0x20(%ebp)
801076d9:	e8 02 fe ff ff       	call   801074e0 <freevm>
801076de:	83 c4 10             	add    $0x10,%esp
801076e1:	31 c0                	xor    %eax,%eax
801076e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801076e6:	5b                   	pop    %ebx
801076e7:	5e                   	pop    %esi
801076e8:	5f                   	pop    %edi
801076e9:	5d                   	pop    %ebp
801076ea:	c3                   	ret    
801076eb:	90                   	nop
801076ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
801076f0:	8b 45 e0             	mov    -0x20(%ebp),%eax
801076f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
801076f6:	5b                   	pop    %ebx
801076f7:	5e                   	pop    %esi
801076f8:	5f                   	pop    %edi
801076f9:	5d                   	pop    %ebp
801076fa:	c3                   	ret    
801076fb:	90                   	nop
801076fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107700:	83 ec 0c             	sub    $0xc,%esp
80107703:	56                   	push   %esi
80107704:	e8 17 ac ff ff       	call   80102320 <kfree>
80107709:	83 c4 10             	add    $0x10,%esp
8010770c:	eb c5                	jmp    801076d3 <copyuvm+0xa3>
8010770e:	31 c0                	xor    %eax,%eax
80107710:	eb d1                	jmp    801076e3 <copyuvm+0xb3>
80107712:	83 ec 0c             	sub    $0xc,%esp
80107715:	68 1e 82 10 80       	push   $0x8010821e
8010771a:	e8 51 8c ff ff       	call   80100370 <panic>
8010771f:	83 ec 0c             	sub    $0xc,%esp
80107722:	68 04 82 10 80       	push   $0x80108204
80107727:	e8 44 8c ff ff       	call   80100370 <panic>
8010772c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

80107730 <uva2ka>:
80107730:	55                   	push   %ebp
80107731:	31 c9                	xor    %ecx,%ecx
80107733:	89 e5                	mov    %esp,%ebp
80107735:	83 ec 08             	sub    $0x8,%esp
80107738:	8b 55 0c             	mov    0xc(%ebp),%edx
8010773b:	8b 45 08             	mov    0x8(%ebp),%eax
8010773e:	e8 4d f7 ff ff       	call   80106e90 <walkpgdir>
80107743:	8b 00                	mov    (%eax),%eax
80107745:	89 c2                	mov    %eax,%edx
80107747:	83 e2 05             	and    $0x5,%edx
8010774a:	83 fa 05             	cmp    $0x5,%edx
8010774d:	75 11                	jne    80107760 <uva2ka+0x30>
8010774f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
80107754:	c9                   	leave  
80107755:	05 00 00 00 80       	add    $0x80000000,%eax
8010775a:	c3                   	ret    
8010775b:	90                   	nop
8010775c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
80107760:	31 c0                	xor    %eax,%eax
80107762:	c9                   	leave  
80107763:	c3                   	ret    
80107764:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
8010776a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

80107770 <copyout>:
80107770:	55                   	push   %ebp
80107771:	89 e5                	mov    %esp,%ebp
80107773:	57                   	push   %edi
80107774:	56                   	push   %esi
80107775:	53                   	push   %ebx
80107776:	83 ec 1c             	sub    $0x1c,%esp
80107779:	8b 5d 14             	mov    0x14(%ebp),%ebx
8010777c:	8b 55 0c             	mov    0xc(%ebp),%edx
8010777f:	8b 7d 10             	mov    0x10(%ebp),%edi
80107782:	85 db                	test   %ebx,%ebx
80107784:	75 40                	jne    801077c6 <copyout+0x56>
80107786:	eb 70                	jmp    801077f8 <copyout+0x88>
80107788:	90                   	nop
80107789:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
80107790:	8b 55 e4             	mov    -0x1c(%ebp),%edx
80107793:	89 f1                	mov    %esi,%ecx
80107795:	29 d1                	sub    %edx,%ecx
80107797:	81 c1 00 10 00 00    	add    $0x1000,%ecx
8010779d:	39 d9                	cmp    %ebx,%ecx
8010779f:	0f 47 cb             	cmova  %ebx,%ecx
801077a2:	29 f2                	sub    %esi,%edx
801077a4:	83 ec 04             	sub    $0x4,%esp
801077a7:	01 d0                	add    %edx,%eax
801077a9:	51                   	push   %ecx
801077aa:	57                   	push   %edi
801077ab:	50                   	push   %eax
801077ac:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
801077af:	e8 3c d5 ff ff       	call   80104cf0 <memmove>
801077b4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
801077b7:	83 c4 10             	add    $0x10,%esp
801077ba:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
801077c0:	01 cf                	add    %ecx,%edi
801077c2:	29 cb                	sub    %ecx,%ebx
801077c4:	74 32                	je     801077f8 <copyout+0x88>
801077c6:	89 d6                	mov    %edx,%esi
801077c8:	83 ec 08             	sub    $0x8,%esp
801077cb:	89 55 e4             	mov    %edx,-0x1c(%ebp)
801077ce:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
801077d4:	56                   	push   %esi
801077d5:	ff 75 08             	pushl  0x8(%ebp)
801077d8:	e8 53 ff ff ff       	call   80107730 <uva2ka>
801077dd:	83 c4 10             	add    $0x10,%esp
801077e0:	85 c0                	test   %eax,%eax
801077e2:	75 ac                	jne    80107790 <copyout+0x20>
801077e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
801077e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
801077ec:	5b                   	pop    %ebx
801077ed:	5e                   	pop    %esi
801077ee:	5f                   	pop    %edi
801077ef:	5d                   	pop    %ebp
801077f0:	c3                   	ret    
801077f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
801077f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
801077fb:	31 c0                	xor    %eax,%eax
801077fd:	5b                   	pop    %ebx
801077fe:	5e                   	pop    %esi
801077ff:	5f                   	pop    %edi
80107800:	5d                   	pop    %ebp
80107801:	c3                   	ret    
