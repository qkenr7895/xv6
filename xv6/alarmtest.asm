
_alarmtest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return a;
}

int
main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  // alarm test 1 : basic
  printf(1, "alarmtest1\n");

  alarm(5, alarm1);

  for(int i = 0; i < 25 * 5000000; i++) {
  10:	31 db                	xor    %ebx,%ebx
    if((i % 250000) == 0)
  12:	be 83 de 1b 43       	mov    $0x431bde83,%esi
{
  17:	83 ec 14             	sub    $0x14,%esp
  printf(1, "alarmtest1\n");
  1a:	68 6e 0a 00 00       	push   $0xa6e
  1f:	6a 01                	push   $0x1
  21:	e8 da 06 00 00       	call   700 <printf>
  alarm(5, alarm1);
  26:	58                   	pop    %eax
  27:	5a                   	pop    %edx
  28:	68 00 02 00 00       	push   $0x200
  2d:	6a 05                	push   $0x5
  2f:	e8 16 06 00 00       	call   64a <alarm>
  34:	83 c4 10             	add    $0x10,%esp
  37:	eb 12                	jmp    4b <main+0x4b>
  39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(int i = 0; i < 25 * 5000000; i++) {
  40:	83 c3 01             	add    $0x1,%ebx
  43:	81 fb 40 59 73 07    	cmp    $0x7735940,%ebx
  49:	74 30                	je     7b <main+0x7b>
    if((i % 250000) == 0)
  4b:	89 d8                	mov    %ebx,%eax
  4d:	f7 e6                	mul    %esi
  4f:	c1 ea 10             	shr    $0x10,%edx
  52:	69 d2 90 d0 03 00    	imul   $0x3d090,%edx,%edx
  58:	39 d3                	cmp    %edx,%ebx
  5a:	75 e4                	jne    40 <main+0x40>
      write(2, ".", 1);
  5c:	83 ec 04             	sub    $0x4,%esp
  for(int i = 0; i < 25 * 5000000; i++) {
  5f:	83 c3 01             	add    $0x1,%ebx
      write(2, ".", 1);
  62:	6a 01                	push   $0x1
  64:	68 60 0a 00 00       	push   $0xa60
  69:	6a 02                	push   $0x2
  6b:	e8 52 05 00 00       	call   5c2 <write>
  70:	83 c4 10             	add    $0x10,%esp
  for(int i = 0; i < 25 * 5000000; i++) {
  73:	81 fb 40 59 73 07    	cmp    $0x7735940,%ebx
  79:	75 d0                	jne    4b <main+0x4b>
  }

  if(alarm_valid == 0) {
  7b:	a1 4c 0e 00 00       	mov    0xe4c,%eax
  80:	85 c0                	test   %eax,%eax
  82:	0f 84 58 01 00 00    	je     1e0 <main+0x1e0>
    printf(1, "error : alarm doesn't work\n");
    exit();
  }
  
  printf(1, "\nalarmtest1 OK\n");
  88:	50                   	push   %eax
  89:	50                   	push   %eax
  8a:	68 96 0a 00 00       	push   $0xa96
  8f:	6a 01                	push   $0x1
  91:	e8 6a 06 00 00       	call   700 <printf>
  alarm_valid = 0;
  alarm(-1, alarm1);
  96:	58                   	pop    %eax
  97:	5a                   	pop    %edx
  98:	68 00 02 00 00       	push   $0x200
  9d:	6a ff                	push   $0xffffffff
  alarm_valid = 0;
  9f:	c7 05 4c 0e 00 00 00 	movl   $0x0,0xe4c
  a6:	00 00 00 
  alarm(-1, alarm1);
  a9:	e8 9c 05 00 00       	call   64a <alarm>

  // alarm test 2 : check if it is reenterant or not 
  printf(1, "\nalarmtest2\n");
  ae:	59                   	pop    %ecx
  af:	5b                   	pop    %ebx
  b0:	68 a6 0a 00 00       	push   $0xaa6
  b5:	6a 01                	push   $0x1

  alarm(5, alarm2);

  for(int i = 0; i < 25 * 5000000; i++) {
  b7:	31 db                	xor    %ebx,%ebx
  printf(1, "\nalarmtest2\n");
  b9:	e8 42 06 00 00       	call   700 <printf>
  alarm(5, alarm2);
  be:	5e                   	pop    %esi
  bf:	58                   	pop    %eax
  c0:	68 30 02 00 00       	push   $0x230
  c5:	6a 05                	push   $0x5
    if((i % 250000) == 0)
  c7:	be 83 de 1b 43       	mov    $0x431bde83,%esi
  alarm(5, alarm2);
  cc:	e8 79 05 00 00       	call   64a <alarm>
  d1:	83 c4 10             	add    $0x10,%esp
  d4:	eb 15                	jmp    eb <main+0xeb>
  d6:	8d 76 00             	lea    0x0(%esi),%esi
  d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for(int i = 0; i < 25 * 5000000; i++) {
  e0:	83 c3 01             	add    $0x1,%ebx
  e3:	81 fb 40 59 73 07    	cmp    $0x7735940,%ebx
  e9:	74 30                	je     11b <main+0x11b>
    if((i % 250000) == 0)
  eb:	89 d8                	mov    %ebx,%eax
  ed:	f7 e6                	mul    %esi
  ef:	c1 ea 10             	shr    $0x10,%edx
  f2:	69 d2 90 d0 03 00    	imul   $0x3d090,%edx,%edx
  f8:	39 d3                	cmp    %edx,%ebx
  fa:	75 e4                	jne    e0 <main+0xe0>
      write(2, ".", 1);
  fc:	83 ec 04             	sub    $0x4,%esp
  for(int i = 0; i < 25 * 5000000; i++) {
  ff:	83 c3 01             	add    $0x1,%ebx
      write(2, ".", 1);
 102:	6a 01                	push   $0x1
 104:	68 60 0a 00 00       	push   $0xa60
 109:	6a 02                	push   $0x2
 10b:	e8 b2 04 00 00       	call   5c2 <write>
 110:	83 c4 10             	add    $0x10,%esp
  for(int i = 0; i < 25 * 5000000; i++) {
 113:	81 fb 40 59 73 07    	cmp    $0x7735940,%ebx
 119:	75 d0                	jne    eb <main+0xeb>
  }

  if(alarm_valid == 0) {
 11b:	83 3d 4c 0e 00 00 00 	cmpl   $0x0,0xe4c
 122:	0f 84 b8 00 00 00    	je     1e0 <main+0x1e0>
    printf(1, "error : alarm doesn't work\n");
    exit();
  }

  printf(1, "\nalarmtest2 OK\n");
 128:	56                   	push   %esi
 129:	56                   	push   %esi
 12a:	68 b3 0a 00 00       	push   $0xab3
 12f:	6a 01                	push   $0x1
 131:	e8 ca 05 00 00       	call   700 <printf>
  alarm_valid = 0;
  alarm(-1, alarm2);
 136:	58                   	pop    %eax
 137:	5a                   	pop    %edx
 138:	68 30 02 00 00       	push   $0x230
 13d:	6a ff                	push   $0xffffffff
  alarm_valid = 0;
 13f:	c7 05 4c 0e 00 00 00 	movl   $0x0,0xe4c
 146:	00 00 00 
  alarm(-1, alarm2);
 149:	e8 fc 04 00 00       	call   64a <alarm>

  // alarm test 3 : check caller saved registers
  printf(1, "\nalarmtest3\n");
 14e:	59                   	pop    %ecx
 14f:	5b                   	pop    %ebx
 150:	68 c3 0a 00 00       	push   $0xac3
 155:	6a 01                	push   $0x1
 157:	e8 a4 05 00 00       	call   700 <printf>

  alarm(5, alarm3);
 15c:	5e                   	pop    %esi
 15d:	58                   	pop    %eax
 15e:	68 c0 02 00 00       	push   $0x2c0
 163:	6a 05                	push   $0x5
 165:	e8 e0 04 00 00       	call   64a <alarm>
 16a:	83 c4 10             	add    $0x10,%esp
 16d:	b9 e8 03 00 00       	mov    $0x3e8,%ecx

  int result = 0;
 172:	31 d2                	xor    %edx,%edx
  for(int i = 0; i < 25 * 5000000; i++) {
 174:	b8 70 fe ff ff       	mov    $0xfffffe70,%eax
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        exit();
      } else if(j > 1000 || i > 125000 || j < 0 || i < 0) {
        printf(1, "error : caller saved changed\n");
        exit();
      } else {
        result += a + b;
 180:	8d 14 42             	lea    (%edx,%eax,2),%edx
 183:	05 2d 01 00 00       	add    $0x12d,%eax
    for(int i = 0; i < 25 * 5000; i++) {
 188:	3d 18 1b 3e 02       	cmp    $0x23e1b18,%eax
 18d:	75 f1                	jne    180 <main+0x180>
  for(int j = 0; j < 1000; j++) {
 18f:	83 e9 01             	sub    $0x1,%ecx
 192:	75 e0                	jne    174 <main+0x174>
      }
    }
  }
    
  printf(1, "result : %d\n", result);
 194:	53                   	push   %ebx
 195:	52                   	push   %edx
 196:	68 d0 0a 00 00       	push   $0xad0
 19b:	6a 01                	push   $0x1
 19d:	e8 5e 05 00 00       	call   700 <printf>

  if(alarm_valid == 0) {
 1a2:	83 c4 10             	add    $0x10,%esp
 1a5:	83 3d 4c 0e 00 00 00 	cmpl   $0x0,0xe4c
 1ac:	74 32                	je     1e0 <main+0x1e0>
    printf(1, "error : alarm doesn't work\n");
    exit();
  }

  printf(1, "\nalarmtest3 OK\n");
 1ae:	50                   	push   %eax
 1af:	50                   	push   %eax
 1b0:	68 dd 0a 00 00       	push   $0xadd
 1b5:	6a 01                	push   $0x1
 1b7:	e8 44 05 00 00       	call   700 <printf>
  alarm_valid = 0;
  alarm(-1, alarm3);
 1bc:	5a                   	pop    %edx
 1bd:	59                   	pop    %ecx
 1be:	68 c0 02 00 00       	push   $0x2c0
 1c3:	6a ff                	push   $0xffffffff
  alarm_valid = 0;
 1c5:	c7 05 4c 0e 00 00 00 	movl   $0x0,0xe4c
 1cc:	00 00 00 
  alarm(-1, alarm3);
 1cf:	e8 76 04 00 00       	call   64a <alarm>

  exit();
 1d4:	e8 c9 03 00 00       	call   5a2 <exit>
 1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "error : alarm doesn't work\n");
 1e0:	83 ec 08             	sub    $0x8,%esp
 1e3:	68 7a 0a 00 00       	push   $0xa7a
 1e8:	6a 01                	push   $0x1
 1ea:	e8 11 05 00 00       	call   700 <printf>
    exit();
 1ef:	e8 ae 03 00 00       	call   5a2 <exit>
 1f4:	66 90                	xchg   %ax,%ax
 1f6:	66 90                	xchg   %ax,%ax
 1f8:	66 90                	xchg   %ax,%ax
 1fa:	66 90                	xchg   %ax,%ax
 1fc:	66 90                	xchg   %ax,%ax
 1fe:	66 90                	xchg   %ax,%ax

00000200 <alarm1>:
void alarm1() {
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	83 ec 10             	sub    $0x10,%esp
  alarm_valid = 1;
 206:	c7 05 4c 0e 00 00 01 	movl   $0x1,0xe4c
 20d:	00 00 00 
  printf(1, "alarm!\n");
 210:	68 58 0a 00 00       	push   $0xa58
 215:	6a 01                	push   $0x1
 217:	e8 e4 04 00 00       	call   700 <printf>
}
 21c:	83 c4 10             	add    $0x10,%esp
 21f:	c9                   	leave  
 220:	c3                   	ret    
 221:	eb 0d                	jmp    230 <alarm2>
 223:	90                   	nop
 224:	90                   	nop
 225:	90                   	nop
 226:	90                   	nop
 227:	90                   	nop
 228:	90                   	nop
 229:	90                   	nop
 22a:	90                   	nop
 22b:	90                   	nop
 22c:	90                   	nop
 22d:	90                   	nop
 22e:	90                   	nop
 22f:	90                   	nop

00000230 <alarm2>:
void alarm2() {
 230:	55                   	push   %ebp
  alarm_valid = 1;
 231:	c7 05 4c 0e 00 00 01 	movl   $0x1,0xe4c
 238:	00 00 00 
void alarm2() {
 23b:	89 e5                	mov    %esp,%ebp
 23d:	56                   	push   %esi
 23e:	53                   	push   %ebx
    if((i % 500000) == 0) {
 23f:	be 83 de 1b 43       	mov    $0x431bde83,%esi
  for(int i = 0; i < 25 * 20000000; i++) {
 244:	31 db                	xor    %ebx,%ebx
  printf(1, "alarm!\n");
 246:	83 ec 08             	sub    $0x8,%esp
 249:	68 58 0a 00 00       	push   $0xa58
 24e:	6a 01                	push   $0x1
 250:	e8 ab 04 00 00       	call   700 <printf>
 255:	83 c4 10             	add    $0x10,%esp
 258:	eb 11                	jmp    26b <alarm2+0x3b>
 25a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(int i = 0; i < 25 * 20000000; i++) {
 260:	83 c3 01             	add    $0x1,%ebx
 263:	81 fb 00 65 cd 1d    	cmp    $0x1dcd6500,%ebx
 269:	74 2e                	je     299 <alarm2+0x69>
    if((i % 500000) == 0) {
 26b:	89 d8                	mov    %ebx,%eax
 26d:	f7 e6                	mul    %esi
 26f:	c1 ea 11             	shr    $0x11,%edx
 272:	69 d2 20 a1 07 00    	imul   $0x7a120,%edx,%edx
 278:	39 d3                	cmp    %edx,%ebx
 27a:	75 e4                	jne    260 <alarm2+0x30>
      printf(1, ".");
 27c:	83 ec 08             	sub    $0x8,%esp
  for(int i = 0; i < 25 * 20000000; i++) {
 27f:	83 c3 01             	add    $0x1,%ebx
      printf(1, ".");
 282:	68 60 0a 00 00       	push   $0xa60
 287:	6a 01                	push   $0x1
 289:	e8 72 04 00 00       	call   700 <printf>
 28e:	83 c4 10             	add    $0x10,%esp
  for(int i = 0; i < 25 * 20000000; i++) {
 291:	81 fb 00 65 cd 1d    	cmp    $0x1dcd6500,%ebx
 297:	75 d2                	jne    26b <alarm2+0x3b>
  printf(1, "alarm end!\n");
 299:	83 ec 08             	sub    $0x8,%esp
 29c:	68 62 0a 00 00       	push   $0xa62
 2a1:	6a 01                	push   $0x1
 2a3:	e8 58 04 00 00       	call   700 <printf>
}
 2a8:	83 c4 10             	add    $0x10,%esp
 2ab:	8d 65 f8             	lea    -0x8(%ebp),%esp
 2ae:	5b                   	pop    %ebx
 2af:	5e                   	pop    %esi
 2b0:	5d                   	pop    %ebp
 2b1:	c3                   	ret    
 2b2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <alarm3>:
void alarm3() {
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	83 ec 10             	sub    $0x10,%esp
  alarm_valid = 1;
 2c6:	c7 05 4c 0e 00 00 01 	movl   $0x1,0xe4c
 2cd:	00 00 00 
  printf(1, "alarm!\n");
 2d0:	68 58 0a 00 00       	push   $0xa58
 2d5:	6a 01                	push   $0x1
 2d7:	e8 24 04 00 00       	call   700 <printf>
  asm ("mov $3, %eax");
 2dc:	b8 03 00 00 00       	mov    $0x3,%eax
  asm ("mov $111807, %edx");
 2e1:	ba bf b4 01 00       	mov    $0x1b4bf,%edx
  asm ("mov $0x44f, %ecx");
 2e6:	b9 4f 04 00 00       	mov    $0x44f,%ecx
  printf(1, "alarm end!\n");
 2eb:	58                   	pop    %eax
 2ec:	5a                   	pop    %edx
 2ed:	68 62 0a 00 00       	push   $0xa62
 2f2:	6a 01                	push   $0x1
 2f4:	e8 07 04 00 00       	call   700 <printf>
}
 2f9:	83 c4 10             	add    $0x10,%esp
 2fc:	c9                   	leave  
 2fd:	c3                   	ret    
 2fe:	66 90                	xchg   %ax,%ax

00000300 <foo1>:
int foo1(int a, int b, int c) {
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	8b 45 10             	mov    0x10(%ebp),%eax
 306:	03 45 0c             	add    0xc(%ebp),%eax
  return a;
 309:	6b c0 64             	imul   $0x64,%eax,%eax
 30c:	03 45 08             	add    0x8(%ebp),%eax
}
 30f:	5d                   	pop    %ebp
 310:	c3                   	ret    
 311:	eb 0d                	jmp    320 <foo2>
 313:	90                   	nop
 314:	90                   	nop
 315:	90                   	nop
 316:	90                   	nop
 317:	90                   	nop
 318:	90                   	nop
 319:	90                   	nop
 31a:	90                   	nop
 31b:	90                   	nop
 31c:	90                   	nop
 31d:	90                   	nop
 31e:	90                   	nop
 31f:	90                   	nop

00000320 <foo2>:
int foo2(int a, int b, int c) {
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	53                   	push   %ebx
 324:	8b 45 10             	mov    0x10(%ebp),%eax
 327:	8b 55 0c             	mov    0xc(%ebp),%edx
 32a:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
 32d:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
  return a;
 330:	6b d2 5f             	imul   $0x5f,%edx,%edx
 333:	8d 04 58             	lea    (%eax,%ebx,2),%eax
}
 336:	5b                   	pop    %ebx
 337:	01 c1                	add    %eax,%ecx
    a += b;
 339:	8d 04 8d 00 00 00 00 	lea    0x0(,%ecx,4),%eax
 340:	03 45 08             	add    0x8(%ebp),%eax
}
 343:	5d                   	pop    %ebp
    a += b;
 344:	01 c8                	add    %ecx,%eax
  return a;
 346:	01 d0                	add    %edx,%eax
}
 348:	c3                   	ret    
 349:	66 90                	xchg   %ax,%ax
 34b:	66 90                	xchg   %ax,%ax
 34d:	66 90                	xchg   %ax,%ax
 34f:	90                   	nop

00000350 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	53                   	push   %ebx
 354:	8b 45 08             	mov    0x8(%ebp),%eax
 357:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 35a:	89 c2                	mov    %eax,%edx
 35c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 360:	83 c1 01             	add    $0x1,%ecx
 363:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 367:	83 c2 01             	add    $0x1,%edx
 36a:	84 db                	test   %bl,%bl
 36c:	88 5a ff             	mov    %bl,-0x1(%edx)
 36f:	75 ef                	jne    360 <strcpy+0x10>
    ;
  return os;
}
 371:	5b                   	pop    %ebx
 372:	5d                   	pop    %ebp
 373:	c3                   	ret    
 374:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 37a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000380 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	53                   	push   %ebx
 384:	8b 55 08             	mov    0x8(%ebp),%edx
 387:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 38a:	0f b6 02             	movzbl (%edx),%eax
 38d:	0f b6 19             	movzbl (%ecx),%ebx
 390:	84 c0                	test   %al,%al
 392:	75 1c                	jne    3b0 <strcmp+0x30>
 394:	eb 2a                	jmp    3c0 <strcmp+0x40>
 396:	8d 76 00             	lea    0x0(%esi),%esi
 399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 3a0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
 3a3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 3a6:	83 c1 01             	add    $0x1,%ecx
 3a9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
 3ac:	84 c0                	test   %al,%al
 3ae:	74 10                	je     3c0 <strcmp+0x40>
 3b0:	38 d8                	cmp    %bl,%al
 3b2:	74 ec                	je     3a0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
 3b4:	29 d8                	sub    %ebx,%eax
}
 3b6:	5b                   	pop    %ebx
 3b7:	5d                   	pop    %ebp
 3b8:	c3                   	ret    
 3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 3c0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
 3c2:	29 d8                	sub    %ebx,%eax
}
 3c4:	5b                   	pop    %ebx
 3c5:	5d                   	pop    %ebp
 3c6:	c3                   	ret    
 3c7:	89 f6                	mov    %esi,%esi
 3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003d0 <strlen>:

uint
strlen(const char *s)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
 3d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 3d6:	80 39 00             	cmpb   $0x0,(%ecx)
 3d9:	74 15                	je     3f0 <strlen+0x20>
 3db:	31 d2                	xor    %edx,%edx
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
 3e0:	83 c2 01             	add    $0x1,%edx
 3e3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 3e7:	89 d0                	mov    %edx,%eax
 3e9:	75 f5                	jne    3e0 <strlen+0x10>
    ;
  return n;
}
 3eb:	5d                   	pop    %ebp
 3ec:	c3                   	ret    
 3ed:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
 3f0:	31 c0                	xor    %eax,%eax
}
 3f2:	5d                   	pop    %ebp
 3f3:	c3                   	ret    
 3f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 3fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000400 <memset>:

void*
memset(void *dst, int c, uint n)
{
 400:	55                   	push   %ebp
 401:	89 e5                	mov    %esp,%ebp
 403:	57                   	push   %edi
 404:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 407:	8b 4d 10             	mov    0x10(%ebp),%ecx
 40a:	8b 45 0c             	mov    0xc(%ebp),%eax
 40d:	89 d7                	mov    %edx,%edi
 40f:	fc                   	cld    
 410:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 412:	89 d0                	mov    %edx,%eax
 414:	5f                   	pop    %edi
 415:	5d                   	pop    %ebp
 416:	c3                   	ret    
 417:	89 f6                	mov    %esi,%esi
 419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000420 <strchr>:

char*
strchr(const char *s, char c)
{
 420:	55                   	push   %ebp
 421:	89 e5                	mov    %esp,%ebp
 423:	53                   	push   %ebx
 424:	8b 45 08             	mov    0x8(%ebp),%eax
 427:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 42a:	0f b6 10             	movzbl (%eax),%edx
 42d:	84 d2                	test   %dl,%dl
 42f:	74 1d                	je     44e <strchr+0x2e>
    if(*s == c)
 431:	38 d3                	cmp    %dl,%bl
 433:	89 d9                	mov    %ebx,%ecx
 435:	75 0d                	jne    444 <strchr+0x24>
 437:	eb 17                	jmp    450 <strchr+0x30>
 439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 440:	38 ca                	cmp    %cl,%dl
 442:	74 0c                	je     450 <strchr+0x30>
  for(; *s; s++)
 444:	83 c0 01             	add    $0x1,%eax
 447:	0f b6 10             	movzbl (%eax),%edx
 44a:	84 d2                	test   %dl,%dl
 44c:	75 f2                	jne    440 <strchr+0x20>
      return (char*)s;
  return 0;
 44e:	31 c0                	xor    %eax,%eax
}
 450:	5b                   	pop    %ebx
 451:	5d                   	pop    %ebp
 452:	c3                   	ret    
 453:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000460 <gets>:

char*
gets(char *buf, int max)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	57                   	push   %edi
 464:	56                   	push   %esi
 465:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 466:	31 f6                	xor    %esi,%esi
 468:	89 f3                	mov    %esi,%ebx
{
 46a:	83 ec 1c             	sub    $0x1c,%esp
 46d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 470:	eb 2f                	jmp    4a1 <gets+0x41>
 472:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 478:	8d 45 e7             	lea    -0x19(%ebp),%eax
 47b:	83 ec 04             	sub    $0x4,%esp
 47e:	6a 01                	push   $0x1
 480:	50                   	push   %eax
 481:	6a 00                	push   $0x0
 483:	e8 32 01 00 00       	call   5ba <read>
    if(cc < 1)
 488:	83 c4 10             	add    $0x10,%esp
 48b:	85 c0                	test   %eax,%eax
 48d:	7e 1c                	jle    4ab <gets+0x4b>
      break;
    buf[i++] = c;
 48f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 493:	83 c7 01             	add    $0x1,%edi
 496:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 499:	3c 0a                	cmp    $0xa,%al
 49b:	74 23                	je     4c0 <gets+0x60>
 49d:	3c 0d                	cmp    $0xd,%al
 49f:	74 1f                	je     4c0 <gets+0x60>
  for(i=0; i+1 < max; ){
 4a1:	83 c3 01             	add    $0x1,%ebx
 4a4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 4a7:	89 fe                	mov    %edi,%esi
 4a9:	7c cd                	jl     478 <gets+0x18>
 4ab:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 4ad:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 4b0:	c6 03 00             	movb   $0x0,(%ebx)
}
 4b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4b6:	5b                   	pop    %ebx
 4b7:	5e                   	pop    %esi
 4b8:	5f                   	pop    %edi
 4b9:	5d                   	pop    %ebp
 4ba:	c3                   	ret    
 4bb:	90                   	nop
 4bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4c0:	8b 75 08             	mov    0x8(%ebp),%esi
 4c3:	8b 45 08             	mov    0x8(%ebp),%eax
 4c6:	01 de                	add    %ebx,%esi
 4c8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 4ca:	c6 03 00             	movb   $0x0,(%ebx)
}
 4cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 4d0:	5b                   	pop    %ebx
 4d1:	5e                   	pop    %esi
 4d2:	5f                   	pop    %edi
 4d3:	5d                   	pop    %ebp
 4d4:	c3                   	ret    
 4d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004e0 <stat>:

int
stat(const char *n, struct stat *st)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	56                   	push   %esi
 4e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e5:	83 ec 08             	sub    $0x8,%esp
 4e8:	6a 00                	push   $0x0
 4ea:	ff 75 08             	pushl  0x8(%ebp)
 4ed:	e8 f0 00 00 00       	call   5e2 <open>
  if(fd < 0)
 4f2:	83 c4 10             	add    $0x10,%esp
 4f5:	85 c0                	test   %eax,%eax
 4f7:	78 27                	js     520 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 4f9:	83 ec 08             	sub    $0x8,%esp
 4fc:	ff 75 0c             	pushl  0xc(%ebp)
 4ff:	89 c3                	mov    %eax,%ebx
 501:	50                   	push   %eax
 502:	e8 f3 00 00 00       	call   5fa <fstat>
  close(fd);
 507:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 50a:	89 c6                	mov    %eax,%esi
  close(fd);
 50c:	e8 b9 00 00 00       	call   5ca <close>
  return r;
 511:	83 c4 10             	add    $0x10,%esp
}
 514:	8d 65 f8             	lea    -0x8(%ebp),%esp
 517:	89 f0                	mov    %esi,%eax
 519:	5b                   	pop    %ebx
 51a:	5e                   	pop    %esi
 51b:	5d                   	pop    %ebp
 51c:	c3                   	ret    
 51d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 520:	be ff ff ff ff       	mov    $0xffffffff,%esi
 525:	eb ed                	jmp    514 <stat+0x34>
 527:	89 f6                	mov    %esi,%esi
 529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000530 <atoi>:

int
atoi(const char *s)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	53                   	push   %ebx
 534:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 537:	0f be 11             	movsbl (%ecx),%edx
 53a:	8d 42 d0             	lea    -0x30(%edx),%eax
 53d:	3c 09                	cmp    $0x9,%al
  n = 0;
 53f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 544:	77 1f                	ja     565 <atoi+0x35>
 546:	8d 76 00             	lea    0x0(%esi),%esi
 549:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 550:	8d 04 80             	lea    (%eax,%eax,4),%eax
 553:	83 c1 01             	add    $0x1,%ecx
 556:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 55a:	0f be 11             	movsbl (%ecx),%edx
 55d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 560:	80 fb 09             	cmp    $0x9,%bl
 563:	76 eb                	jbe    550 <atoi+0x20>
  return n;
}
 565:	5b                   	pop    %ebx
 566:	5d                   	pop    %ebp
 567:	c3                   	ret    
 568:	90                   	nop
 569:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000570 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 570:	55                   	push   %ebp
 571:	89 e5                	mov    %esp,%ebp
 573:	56                   	push   %esi
 574:	53                   	push   %ebx
 575:	8b 5d 10             	mov    0x10(%ebp),%ebx
 578:	8b 45 08             	mov    0x8(%ebp),%eax
 57b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 57e:	85 db                	test   %ebx,%ebx
 580:	7e 14                	jle    596 <memmove+0x26>
 582:	31 d2                	xor    %edx,%edx
 584:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 588:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 58c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 58f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 592:	39 d3                	cmp    %edx,%ebx
 594:	75 f2                	jne    588 <memmove+0x18>
  return vdst;
}
 596:	5b                   	pop    %ebx
 597:	5e                   	pop    %esi
 598:	5d                   	pop    %ebp
 599:	c3                   	ret    

0000059a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 59a:	b8 01 00 00 00       	mov    $0x1,%eax
 59f:	cd 40                	int    $0x40
 5a1:	c3                   	ret    

000005a2 <exit>:
SYSCALL(exit)
 5a2:	b8 02 00 00 00       	mov    $0x2,%eax
 5a7:	cd 40                	int    $0x40
 5a9:	c3                   	ret    

000005aa <wait>:
SYSCALL(wait)
 5aa:	b8 03 00 00 00       	mov    $0x3,%eax
 5af:	cd 40                	int    $0x40
 5b1:	c3                   	ret    

000005b2 <pipe>:
SYSCALL(pipe)
 5b2:	b8 04 00 00 00       	mov    $0x4,%eax
 5b7:	cd 40                	int    $0x40
 5b9:	c3                   	ret    

000005ba <read>:
SYSCALL(read)
 5ba:	b8 05 00 00 00       	mov    $0x5,%eax
 5bf:	cd 40                	int    $0x40
 5c1:	c3                   	ret    

000005c2 <write>:
SYSCALL(write)
 5c2:	b8 10 00 00 00       	mov    $0x10,%eax
 5c7:	cd 40                	int    $0x40
 5c9:	c3                   	ret    

000005ca <close>:
SYSCALL(close)
 5ca:	b8 15 00 00 00       	mov    $0x15,%eax
 5cf:	cd 40                	int    $0x40
 5d1:	c3                   	ret    

000005d2 <kill>:
SYSCALL(kill)
 5d2:	b8 06 00 00 00       	mov    $0x6,%eax
 5d7:	cd 40                	int    $0x40
 5d9:	c3                   	ret    

000005da <exec>:
SYSCALL(exec)
 5da:	b8 07 00 00 00       	mov    $0x7,%eax
 5df:	cd 40                	int    $0x40
 5e1:	c3                   	ret    

000005e2 <open>:
SYSCALL(open)
 5e2:	b8 0f 00 00 00       	mov    $0xf,%eax
 5e7:	cd 40                	int    $0x40
 5e9:	c3                   	ret    

000005ea <mknod>:
SYSCALL(mknod)
 5ea:	b8 11 00 00 00       	mov    $0x11,%eax
 5ef:	cd 40                	int    $0x40
 5f1:	c3                   	ret    

000005f2 <unlink>:
SYSCALL(unlink)
 5f2:	b8 12 00 00 00       	mov    $0x12,%eax
 5f7:	cd 40                	int    $0x40
 5f9:	c3                   	ret    

000005fa <fstat>:
SYSCALL(fstat)
 5fa:	b8 08 00 00 00       	mov    $0x8,%eax
 5ff:	cd 40                	int    $0x40
 601:	c3                   	ret    

00000602 <link>:
SYSCALL(link)
 602:	b8 13 00 00 00       	mov    $0x13,%eax
 607:	cd 40                	int    $0x40
 609:	c3                   	ret    

0000060a <mkdir>:
SYSCALL(mkdir)
 60a:	b8 14 00 00 00       	mov    $0x14,%eax
 60f:	cd 40                	int    $0x40
 611:	c3                   	ret    

00000612 <chdir>:
SYSCALL(chdir)
 612:	b8 09 00 00 00       	mov    $0x9,%eax
 617:	cd 40                	int    $0x40
 619:	c3                   	ret    

0000061a <dup>:
SYSCALL(dup)
 61a:	b8 0a 00 00 00       	mov    $0xa,%eax
 61f:	cd 40                	int    $0x40
 621:	c3                   	ret    

00000622 <getpid>:
SYSCALL(getpid)
 622:	b8 0b 00 00 00       	mov    $0xb,%eax
 627:	cd 40                	int    $0x40
 629:	c3                   	ret    

0000062a <sbrk>:
SYSCALL(sbrk)
 62a:	b8 0c 00 00 00       	mov    $0xc,%eax
 62f:	cd 40                	int    $0x40
 631:	c3                   	ret    

00000632 <sleep>:
SYSCALL(sleep)
 632:	b8 0d 00 00 00       	mov    $0xd,%eax
 637:	cd 40                	int    $0x40
 639:	c3                   	ret    

0000063a <uptime>:
SYSCALL(uptime)
 63a:	b8 0e 00 00 00       	mov    $0xe,%eax
 63f:	cd 40                	int    $0x40
 641:	c3                   	ret    

00000642 <date>:
SYSCALL(date)
 642:	b8 16 00 00 00       	mov    $0x16,%eax
 647:	cd 40                	int    $0x40
 649:	c3                   	ret    

0000064a <alarm>:
SYSCALL(alarm)
 64a:	b8 17 00 00 00       	mov    $0x17,%eax
 64f:	cd 40                	int    $0x40
 651:	c3                   	ret    
 652:	66 90                	xchg   %ax,%ax
 654:	66 90                	xchg   %ax,%ax
 656:	66 90                	xchg   %ax,%ax
 658:	66 90                	xchg   %ax,%ax
 65a:	66 90                	xchg   %ax,%ax
 65c:	66 90                	xchg   %ax,%ax
 65e:	66 90                	xchg   %ax,%ax

00000660 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 660:	55                   	push   %ebp
 661:	89 e5                	mov    %esp,%ebp
 663:	57                   	push   %edi
 664:	56                   	push   %esi
 665:	53                   	push   %ebx
 666:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 669:	85 d2                	test   %edx,%edx
{
 66b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 66e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 670:	79 76                	jns    6e8 <printint+0x88>
 672:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 676:	74 70                	je     6e8 <printint+0x88>
    x = -xx;
 678:	f7 d8                	neg    %eax
    neg = 1;
 67a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 681:	31 f6                	xor    %esi,%esi
 683:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 686:	eb 0a                	jmp    692 <printint+0x32>
 688:	90                   	nop
 689:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 690:	89 fe                	mov    %edi,%esi
 692:	31 d2                	xor    %edx,%edx
 694:	8d 7e 01             	lea    0x1(%esi),%edi
 697:	f7 f1                	div    %ecx
 699:	0f b6 92 f4 0a 00 00 	movzbl 0xaf4(%edx),%edx
  }while((x /= base) != 0);
 6a0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 6a2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 6a5:	75 e9                	jne    690 <printint+0x30>
  if(neg)
 6a7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 6aa:	85 c0                	test   %eax,%eax
 6ac:	74 08                	je     6b6 <printint+0x56>
    buf[i++] = '-';
 6ae:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 6b3:	8d 7e 02             	lea    0x2(%esi),%edi
 6b6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 6ba:	8b 7d c0             	mov    -0x40(%ebp),%edi
 6bd:	8d 76 00             	lea    0x0(%esi),%esi
 6c0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 6c3:	83 ec 04             	sub    $0x4,%esp
 6c6:	83 ee 01             	sub    $0x1,%esi
 6c9:	6a 01                	push   $0x1
 6cb:	53                   	push   %ebx
 6cc:	57                   	push   %edi
 6cd:	88 45 d7             	mov    %al,-0x29(%ebp)
 6d0:	e8 ed fe ff ff       	call   5c2 <write>

  while(--i >= 0)
 6d5:	83 c4 10             	add    $0x10,%esp
 6d8:	39 de                	cmp    %ebx,%esi
 6da:	75 e4                	jne    6c0 <printint+0x60>
    putc(fd, buf[i]);
}
 6dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6df:	5b                   	pop    %ebx
 6e0:	5e                   	pop    %esi
 6e1:	5f                   	pop    %edi
 6e2:	5d                   	pop    %ebp
 6e3:	c3                   	ret    
 6e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 6e8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 6ef:	eb 90                	jmp    681 <printint+0x21>
 6f1:	eb 0d                	jmp    700 <printf>
 6f3:	90                   	nop
 6f4:	90                   	nop
 6f5:	90                   	nop
 6f6:	90                   	nop
 6f7:	90                   	nop
 6f8:	90                   	nop
 6f9:	90                   	nop
 6fa:	90                   	nop
 6fb:	90                   	nop
 6fc:	90                   	nop
 6fd:	90                   	nop
 6fe:	90                   	nop
 6ff:	90                   	nop

00000700 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 700:	55                   	push   %ebp
 701:	89 e5                	mov    %esp,%ebp
 703:	57                   	push   %edi
 704:	56                   	push   %esi
 705:	53                   	push   %ebx
 706:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 709:	8b 75 0c             	mov    0xc(%ebp),%esi
 70c:	0f b6 1e             	movzbl (%esi),%ebx
 70f:	84 db                	test   %bl,%bl
 711:	0f 84 b3 00 00 00    	je     7ca <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 717:	8d 45 10             	lea    0x10(%ebp),%eax
 71a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 71d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 71f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 722:	eb 2f                	jmp    753 <printf+0x53>
 724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 728:	83 f8 25             	cmp    $0x25,%eax
 72b:	0f 84 a7 00 00 00    	je     7d8 <printf+0xd8>
  write(fd, &c, 1);
 731:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 734:	83 ec 04             	sub    $0x4,%esp
 737:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 73a:	6a 01                	push   $0x1
 73c:	50                   	push   %eax
 73d:	ff 75 08             	pushl  0x8(%ebp)
 740:	e8 7d fe ff ff       	call   5c2 <write>
 745:	83 c4 10             	add    $0x10,%esp
 748:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 74b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 74f:	84 db                	test   %bl,%bl
 751:	74 77                	je     7ca <printf+0xca>
    if(state == 0){
 753:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 755:	0f be cb             	movsbl %bl,%ecx
 758:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 75b:	74 cb                	je     728 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 75d:	83 ff 25             	cmp    $0x25,%edi
 760:	75 e6                	jne    748 <printf+0x48>
      if(c == 'd'){
 762:	83 f8 64             	cmp    $0x64,%eax
 765:	0f 84 05 01 00 00    	je     870 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 76b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 771:	83 f9 70             	cmp    $0x70,%ecx
 774:	74 72                	je     7e8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 776:	83 f8 73             	cmp    $0x73,%eax
 779:	0f 84 99 00 00 00    	je     818 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 77f:	83 f8 63             	cmp    $0x63,%eax
 782:	0f 84 08 01 00 00    	je     890 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 788:	83 f8 25             	cmp    $0x25,%eax
 78b:	0f 84 ef 00 00 00    	je     880 <printf+0x180>
  write(fd, &c, 1);
 791:	8d 45 e7             	lea    -0x19(%ebp),%eax
 794:	83 ec 04             	sub    $0x4,%esp
 797:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 79b:	6a 01                	push   $0x1
 79d:	50                   	push   %eax
 79e:	ff 75 08             	pushl  0x8(%ebp)
 7a1:	e8 1c fe ff ff       	call   5c2 <write>
 7a6:	83 c4 0c             	add    $0xc,%esp
 7a9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 7ac:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 7af:	6a 01                	push   $0x1
 7b1:	50                   	push   %eax
 7b2:	ff 75 08             	pushl  0x8(%ebp)
 7b5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 7b8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 7ba:	e8 03 fe ff ff       	call   5c2 <write>
  for(i = 0; fmt[i]; i++){
 7bf:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 7c3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 7c6:	84 db                	test   %bl,%bl
 7c8:	75 89                	jne    753 <printf+0x53>
    }
  }
}
 7ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
 7cd:	5b                   	pop    %ebx
 7ce:	5e                   	pop    %esi
 7cf:	5f                   	pop    %edi
 7d0:	5d                   	pop    %ebp
 7d1:	c3                   	ret    
 7d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 7d8:	bf 25 00 00 00       	mov    $0x25,%edi
 7dd:	e9 66 ff ff ff       	jmp    748 <printf+0x48>
 7e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 7e8:	83 ec 0c             	sub    $0xc,%esp
 7eb:	b9 10 00 00 00       	mov    $0x10,%ecx
 7f0:	6a 00                	push   $0x0
 7f2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 7f5:	8b 45 08             	mov    0x8(%ebp),%eax
 7f8:	8b 17                	mov    (%edi),%edx
 7fa:	e8 61 fe ff ff       	call   660 <printint>
        ap++;
 7ff:	89 f8                	mov    %edi,%eax
 801:	83 c4 10             	add    $0x10,%esp
      state = 0;
 804:	31 ff                	xor    %edi,%edi
        ap++;
 806:	83 c0 04             	add    $0x4,%eax
 809:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 80c:	e9 37 ff ff ff       	jmp    748 <printf+0x48>
 811:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 818:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 81b:	8b 08                	mov    (%eax),%ecx
        ap++;
 81d:	83 c0 04             	add    $0x4,%eax
 820:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 823:	85 c9                	test   %ecx,%ecx
 825:	0f 84 8e 00 00 00    	je     8b9 <printf+0x1b9>
        while(*s != 0){
 82b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 82e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 830:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 832:	84 c0                	test   %al,%al
 834:	0f 84 0e ff ff ff    	je     748 <printf+0x48>
 83a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 83d:	89 de                	mov    %ebx,%esi
 83f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 842:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 845:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 848:	83 ec 04             	sub    $0x4,%esp
          s++;
 84b:	83 c6 01             	add    $0x1,%esi
 84e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 851:	6a 01                	push   $0x1
 853:	57                   	push   %edi
 854:	53                   	push   %ebx
 855:	e8 68 fd ff ff       	call   5c2 <write>
        while(*s != 0){
 85a:	0f b6 06             	movzbl (%esi),%eax
 85d:	83 c4 10             	add    $0x10,%esp
 860:	84 c0                	test   %al,%al
 862:	75 e4                	jne    848 <printf+0x148>
 864:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 867:	31 ff                	xor    %edi,%edi
 869:	e9 da fe ff ff       	jmp    748 <printf+0x48>
 86e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 870:	83 ec 0c             	sub    $0xc,%esp
 873:	b9 0a 00 00 00       	mov    $0xa,%ecx
 878:	6a 01                	push   $0x1
 87a:	e9 73 ff ff ff       	jmp    7f2 <printf+0xf2>
 87f:	90                   	nop
  write(fd, &c, 1);
 880:	83 ec 04             	sub    $0x4,%esp
 883:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 886:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 889:	6a 01                	push   $0x1
 88b:	e9 21 ff ff ff       	jmp    7b1 <printf+0xb1>
        putc(fd, *ap);
 890:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 893:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 896:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 898:	6a 01                	push   $0x1
        ap++;
 89a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 89d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 8a0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 8a3:	50                   	push   %eax
 8a4:	ff 75 08             	pushl  0x8(%ebp)
 8a7:	e8 16 fd ff ff       	call   5c2 <write>
        ap++;
 8ac:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 8af:	83 c4 10             	add    $0x10,%esp
      state = 0;
 8b2:	31 ff                	xor    %edi,%edi
 8b4:	e9 8f fe ff ff       	jmp    748 <printf+0x48>
          s = "(null)";
 8b9:	bb ed 0a 00 00       	mov    $0xaed,%ebx
        while(*s != 0){
 8be:	b8 28 00 00 00       	mov    $0x28,%eax
 8c3:	e9 72 ff ff ff       	jmp    83a <printf+0x13a>
 8c8:	66 90                	xchg   %ax,%ax
 8ca:	66 90                	xchg   %ax,%ax
 8cc:	66 90                	xchg   %ax,%ax
 8ce:	66 90                	xchg   %ax,%ax

000008d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d1:	a1 50 0e 00 00       	mov    0xe50,%eax
{
 8d6:	89 e5                	mov    %esp,%ebp
 8d8:	57                   	push   %edi
 8d9:	56                   	push   %esi
 8da:	53                   	push   %ebx
 8db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 8de:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 8e1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e8:	39 c8                	cmp    %ecx,%eax
 8ea:	8b 10                	mov    (%eax),%edx
 8ec:	73 32                	jae    920 <free+0x50>
 8ee:	39 d1                	cmp    %edx,%ecx
 8f0:	72 04                	jb     8f6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8f2:	39 d0                	cmp    %edx,%eax
 8f4:	72 32                	jb     928 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 8f6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 8f9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 8fc:	39 fa                	cmp    %edi,%edx
 8fe:	74 30                	je     930 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 900:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 903:	8b 50 04             	mov    0x4(%eax),%edx
 906:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 909:	39 f1                	cmp    %esi,%ecx
 90b:	74 3a                	je     947 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 90d:	89 08                	mov    %ecx,(%eax)
  freep = p;
 90f:	a3 50 0e 00 00       	mov    %eax,0xe50
}
 914:	5b                   	pop    %ebx
 915:	5e                   	pop    %esi
 916:	5f                   	pop    %edi
 917:	5d                   	pop    %ebp
 918:	c3                   	ret    
 919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 920:	39 d0                	cmp    %edx,%eax
 922:	72 04                	jb     928 <free+0x58>
 924:	39 d1                	cmp    %edx,%ecx
 926:	72 ce                	jb     8f6 <free+0x26>
{
 928:	89 d0                	mov    %edx,%eax
 92a:	eb bc                	jmp    8e8 <free+0x18>
 92c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 930:	03 72 04             	add    0x4(%edx),%esi
 933:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 936:	8b 10                	mov    (%eax),%edx
 938:	8b 12                	mov    (%edx),%edx
 93a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 93d:	8b 50 04             	mov    0x4(%eax),%edx
 940:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 943:	39 f1                	cmp    %esi,%ecx
 945:	75 c6                	jne    90d <free+0x3d>
    p->s.size += bp->s.size;
 947:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 94a:	a3 50 0e 00 00       	mov    %eax,0xe50
    p->s.size += bp->s.size;
 94f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 952:	8b 53 f8             	mov    -0x8(%ebx),%edx
 955:	89 10                	mov    %edx,(%eax)
}
 957:	5b                   	pop    %ebx
 958:	5e                   	pop    %esi
 959:	5f                   	pop    %edi
 95a:	5d                   	pop    %ebp
 95b:	c3                   	ret    
 95c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000960 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 960:	55                   	push   %ebp
 961:	89 e5                	mov    %esp,%ebp
 963:	57                   	push   %edi
 964:	56                   	push   %esi
 965:	53                   	push   %ebx
 966:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 969:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 96c:	8b 15 50 0e 00 00    	mov    0xe50,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 972:	8d 78 07             	lea    0x7(%eax),%edi
 975:	c1 ef 03             	shr    $0x3,%edi
 978:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 97b:	85 d2                	test   %edx,%edx
 97d:	0f 84 9d 00 00 00    	je     a20 <malloc+0xc0>
 983:	8b 02                	mov    (%edx),%eax
 985:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 988:	39 cf                	cmp    %ecx,%edi
 98a:	76 6c                	jbe    9f8 <malloc+0x98>
 98c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 992:	bb 00 10 00 00       	mov    $0x1000,%ebx
 997:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 99a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 9a1:	eb 0e                	jmp    9b1 <malloc+0x51>
 9a3:	90                   	nop
 9a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 9aa:	8b 48 04             	mov    0x4(%eax),%ecx
 9ad:	39 f9                	cmp    %edi,%ecx
 9af:	73 47                	jae    9f8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9b1:	39 05 50 0e 00 00    	cmp    %eax,0xe50
 9b7:	89 c2                	mov    %eax,%edx
 9b9:	75 ed                	jne    9a8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 9bb:	83 ec 0c             	sub    $0xc,%esp
 9be:	56                   	push   %esi
 9bf:	e8 66 fc ff ff       	call   62a <sbrk>
  if(p == (char*)-1)
 9c4:	83 c4 10             	add    $0x10,%esp
 9c7:	83 f8 ff             	cmp    $0xffffffff,%eax
 9ca:	74 1c                	je     9e8 <malloc+0x88>
  hp->s.size = nu;
 9cc:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 9cf:	83 ec 0c             	sub    $0xc,%esp
 9d2:	83 c0 08             	add    $0x8,%eax
 9d5:	50                   	push   %eax
 9d6:	e8 f5 fe ff ff       	call   8d0 <free>
  return freep;
 9db:	8b 15 50 0e 00 00    	mov    0xe50,%edx
      if((p = morecore(nunits)) == 0)
 9e1:	83 c4 10             	add    $0x10,%esp
 9e4:	85 d2                	test   %edx,%edx
 9e6:	75 c0                	jne    9a8 <malloc+0x48>
        return 0;
  }
}
 9e8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 9eb:	31 c0                	xor    %eax,%eax
}
 9ed:	5b                   	pop    %ebx
 9ee:	5e                   	pop    %esi
 9ef:	5f                   	pop    %edi
 9f0:	5d                   	pop    %ebp
 9f1:	c3                   	ret    
 9f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 9f8:	39 cf                	cmp    %ecx,%edi
 9fa:	74 54                	je     a50 <malloc+0xf0>
        p->s.size -= nunits;
 9fc:	29 f9                	sub    %edi,%ecx
 9fe:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 a01:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 a04:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 a07:	89 15 50 0e 00 00    	mov    %edx,0xe50
}
 a0d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 a10:	83 c0 08             	add    $0x8,%eax
}
 a13:	5b                   	pop    %ebx
 a14:	5e                   	pop    %esi
 a15:	5f                   	pop    %edi
 a16:	5d                   	pop    %ebp
 a17:	c3                   	ret    
 a18:	90                   	nop
 a19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 a20:	c7 05 50 0e 00 00 54 	movl   $0xe54,0xe50
 a27:	0e 00 00 
 a2a:	c7 05 54 0e 00 00 54 	movl   $0xe54,0xe54
 a31:	0e 00 00 
    base.s.size = 0;
 a34:	b8 54 0e 00 00       	mov    $0xe54,%eax
 a39:	c7 05 58 0e 00 00 00 	movl   $0x0,0xe58
 a40:	00 00 00 
 a43:	e9 44 ff ff ff       	jmp    98c <malloc+0x2c>
 a48:	90                   	nop
 a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 a50:	8b 08                	mov    (%eax),%ecx
 a52:	89 0a                	mov    %ecx,(%edx)
 a54:	eb b1                	jmp    a07 <malloc+0xa7>
