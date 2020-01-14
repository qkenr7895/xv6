
_thread_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
}

int t1[NUM_THREAD], t2[NUM_THREAD];

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 20             	sub    $0x20,%esp
  int i, retval;
  int pid;
  
  printf(1, "Thread kill test start\n");
  14:	68 d0 08 00 00       	push   $0x8d0
  19:	6a 01                	push   $0x1
  1b:	e8 30 05 00 00       	call   550 <printf>
  pid = fork();
  20:	e8 b5 03 00 00       	call   3da <fork>
  if (pid < 0) {
  25:	83 c4 10             	add    $0x10,%esp
  28:	85 c0                	test   %eax,%eax
  2a:	0f 88 cd 00 00 00    	js     fd <main+0xfd>
    printf(1, "Fork failed!!\n");
    exit();
  }
  else if (pid == 0) {
  30:	74 4a                	je     7c <main+0x7c>
  32:	bb 01 00 00 00       	mov    $0x1,%ebx
  37:	89 c7                	mov    %eax,%edi
  39:	be 04 0c 00 00       	mov    $0xc04,%esi
    printf(1, "This code shouldn't be executed!!\n");
    exit();
  }
  else {
    for (i = 0; i < NUM_THREAD; i++) {
      if (i == 0)
  3e:	83 fb 01             	cmp    $0x1,%ebx
  41:	74 23                	je     66 <main+0x66>
        thread_create(&t2[i], thread2, (void *)pid);
      else
        thread_create(&t2[i], thread2, (void *)0);
  43:	83 ec 04             	sub    $0x4,%esp
  46:	6a 00                	push   $0x0
  48:	68 40 01 00 00       	push   $0x140
  4d:	56                   	push   %esi
  4e:	e8 2f 04 00 00       	call   482 <thread_create>
    sleep(300);
    printf(1, "This code shouldn't be executed!!\n");
    exit();
  }
  else {
    for (i = 0; i < NUM_THREAD; i++) {
  53:	83 c4 10             	add    $0x10,%esp
  56:	83 fb 05             	cmp    $0x5,%ebx
  59:	74 65                	je     c0 <main+0xc0>
  5b:	83 c3 01             	add    $0x1,%ebx
  5e:	83 c6 04             	add    $0x4,%esi
      if (i == 0)
  61:	83 fb 01             	cmp    $0x1,%ebx
  64:	75 dd                	jne    43 <main+0x43>
        thread_create(&t2[i], thread2, (void *)pid);
  66:	52                   	push   %edx
  67:	57                   	push   %edi
  68:	68 40 01 00 00       	push   $0x140
  6d:	68 04 0c 00 00       	push   $0xc04
  72:	e8 0b 04 00 00       	call   482 <thread_create>
  77:	83 c4 10             	add    $0x10,%esp
  7a:	eb df                	jmp    5b <main+0x5b>
  7c:	be 18 0c 00 00       	mov    $0xc18,%esi
  pid = fork();
  if (pid < 0) {
    printf(1, "Fork failed!!\n");
    exit();
  }
  else if (pid == 0) {
  81:	31 db                	xor    %ebx,%ebx
    for (i = 0; i < NUM_THREAD; i++)
      thread_create(&t1[i], thread1, (void *)i);
  83:	83 ec 04             	sub    $0x4,%esp
  86:	53                   	push   %ebx
  87:	68 10 01 00 00       	push   $0x110
  if (pid < 0) {
    printf(1, "Fork failed!!\n");
    exit();
  }
  else if (pid == 0) {
    for (i = 0; i < NUM_THREAD; i++)
  8c:	83 c3 01             	add    $0x1,%ebx
      thread_create(&t1[i], thread1, (void *)i);
  8f:	56                   	push   %esi
  90:	83 c6 04             	add    $0x4,%esi
  93:	e8 ea 03 00 00       	call   482 <thread_create>
  if (pid < 0) {
    printf(1, "Fork failed!!\n");
    exit();
  }
  else if (pid == 0) {
    for (i = 0; i < NUM_THREAD; i++)
  98:	83 c4 10             	add    $0x10,%esp
  9b:	83 fb 05             	cmp    $0x5,%ebx
  9e:	75 e3                	jne    83 <main+0x83>
      thread_create(&t1[i], thread1, (void *)i);
    sleep(300);
  a0:	83 ec 0c             	sub    $0xc,%esp
  a3:	68 2c 01 00 00       	push   $0x12c
  a8:	e8 c5 03 00 00       	call   472 <sleep>
    printf(1, "This code shouldn't be executed!!\n");
  ad:	59                   	pop    %ecx
  ae:	5b                   	pop    %ebx
  af:	68 70 08 00 00       	push   $0x870
  b4:	6a 01                	push   $0x1
  b6:	e8 95 04 00 00       	call   550 <printf>
    exit();
  bb:	e8 22 03 00 00       	call   3e2 <exit>
  c0:	8d 75 e4             	lea    -0x1c(%ebp),%esi
  c3:	31 db                	xor    %ebx,%ebx
        thread_create(&t2[i], thread2, (void *)pid);
      else
        thread_create(&t2[i], thread2, (void *)0);
    }
    for (i = 0; i < NUM_THREAD; i++)
      thread_join(t2[i], (void **)&retval);
  c5:	83 ec 08             	sub    $0x8,%esp
  c8:	83 c3 04             	add    $0x4,%ebx
  cb:	56                   	push   %esi
  cc:	ff b3 00 0c 00 00    	pushl  0xc00(%ebx)
  d2:	e8 bb 03 00 00       	call   492 <thread_join>
      if (i == 0)
        thread_create(&t2[i], thread2, (void *)pid);
      else
        thread_create(&t2[i], thread2, (void *)0);
    }
    for (i = 0; i < NUM_THREAD; i++)
  d7:	83 c4 10             	add    $0x10,%esp
  da:	83 fb 14             	cmp    $0x14,%ebx
  dd:	75 e6                	jne    c5 <main+0xc5>
  df:	90                   	nop
      thread_join(t2[i], (void **)&retval);
    while (wait() != -1)
  e0:	e8 05 03 00 00       	call   3ea <wait>
  e5:	83 f8 ff             	cmp    $0xffffffff,%eax
  e8:	75 f6                	jne    e0 <main+0xe0>
      ;
    printf(1, "Kill test finished\n");
  ea:	50                   	push   %eax
  eb:	50                   	push   %eax
  ec:	68 f7 08 00 00       	push   $0x8f7
  f1:	6a 01                	push   $0x1
  f3:	e8 58 04 00 00       	call   550 <printf>
    exit();
  f8:	e8 e5 02 00 00       	call   3e2 <exit>
  int pid;
  
  printf(1, "Thread kill test start\n");
  pid = fork();
  if (pid < 0) {
    printf(1, "Fork failed!!\n");
  fd:	56                   	push   %esi
  fe:	56                   	push   %esi
  ff:	68 e8 08 00 00       	push   $0x8e8
 104:	6a 01                	push   $0x1
 106:	e8 45 04 00 00       	call   550 <printf>
    exit();
 10b:	e8 d2 02 00 00       	call   3e2 <exit>

00000110 <thread1>:
#include "user.h"

#define NUM_THREAD 5

void *thread1(void *arg)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	83 ec 14             	sub    $0x14,%esp
  sleep(200);
 116:	68 c8 00 00 00       	push   $0xc8
 11b:	e8 52 03 00 00       	call   472 <sleep>
  printf(1, "This code shouldn't be executed!!\n");
 120:	58                   	pop    %eax
 121:	5a                   	pop    %edx
 122:	68 70 08 00 00       	push   $0x870
 127:	6a 01                	push   $0x1
 129:	e8 22 04 00 00       	call   550 <printf>
  exit();
 12e:	e8 af 02 00 00       	call   3e2 <exit>
 133:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <thread2>:
  return 0;
}

void *thread2(void *arg)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	83 ec 10             	sub    $0x10,%esp
 147:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int val = (int)arg;
  sleep(100);
 14a:	6a 64                	push   $0x64
 14c:	e8 21 03 00 00       	call   472 <sleep>
  if (val != 0) {
 151:	83 c4 10             	add    $0x10,%esp
 154:	85 db                	test   %ebx,%ebx
 156:	74 1b                	je     173 <thread2+0x33>
    printf(1, "Killing process %d\n", val);
 158:	83 ec 04             	sub    $0x4,%esp
 15b:	53                   	push   %ebx
 15c:	68 bc 08 00 00       	push   $0x8bc
 161:	6a 01                	push   $0x1
 163:	e8 e8 03 00 00       	call   550 <printf>
    kill(val);
 168:	89 1c 24             	mov    %ebx,(%esp)
 16b:	e8 a2 02 00 00       	call   412 <kill>
 170:	83 c4 10             	add    $0x10,%esp
  }
  printf(1, "This code should be executed 5 times.\n");
 173:	83 ec 08             	sub    $0x8,%esp
 176:	68 94 08 00 00       	push   $0x894
 17b:	6a 01                	push   $0x1
 17d:	e8 ce 03 00 00       	call   550 <printf>
  thread_exit(0);
 182:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 189:	e8 fc 02 00 00       	call   48a <thread_exit>
  return 0;
}
 18e:	31 c0                	xor    %eax,%eax
 190:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 193:	c9                   	leave  
 194:	c3                   	ret    
 195:	66 90                	xchg   %ax,%ax
 197:	66 90                	xchg   %ax,%ax
 199:	66 90                	xchg   %ax,%ax
 19b:	66 90                	xchg   %ax,%ax
 19d:	66 90                	xchg   %ax,%ax
 19f:	90                   	nop

000001a0 <strcpy>:
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	53                   	push   %ebx
 1a4:	8b 45 08             	mov    0x8(%ebp),%eax
 1a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1aa:	89 c2                	mov    %eax,%edx
 1ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1b0:	83 c1 01             	add    $0x1,%ecx
 1b3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 1b7:	83 c2 01             	add    $0x1,%edx
 1ba:	84 db                	test   %bl,%bl
 1bc:	88 5a ff             	mov    %bl,-0x1(%edx)
 1bf:	75 ef                	jne    1b0 <strcpy+0x10>
 1c1:	5b                   	pop    %ebx
 1c2:	5d                   	pop    %ebp
 1c3:	c3                   	ret    
 1c4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1ca:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001d0 <strcmp>:
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	56                   	push   %esi
 1d4:	53                   	push   %ebx
 1d5:	8b 55 08             	mov    0x8(%ebp),%edx
 1d8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 1db:	0f b6 02             	movzbl (%edx),%eax
 1de:	0f b6 19             	movzbl (%ecx),%ebx
 1e1:	84 c0                	test   %al,%al
 1e3:	75 1e                	jne    203 <strcmp+0x33>
 1e5:	eb 29                	jmp    210 <strcmp+0x40>
 1e7:	89 f6                	mov    %esi,%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 1f0:	83 c2 01             	add    $0x1,%edx
 1f3:	0f b6 02             	movzbl (%edx),%eax
 1f6:	8d 71 01             	lea    0x1(%ecx),%esi
 1f9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 1fd:	84 c0                	test   %al,%al
 1ff:	74 0f                	je     210 <strcmp+0x40>
 201:	89 f1                	mov    %esi,%ecx
 203:	38 d8                	cmp    %bl,%al
 205:	74 e9                	je     1f0 <strcmp+0x20>
 207:	29 d8                	sub    %ebx,%eax
 209:	5b                   	pop    %ebx
 20a:	5e                   	pop    %esi
 20b:	5d                   	pop    %ebp
 20c:	c3                   	ret    
 20d:	8d 76 00             	lea    0x0(%esi),%esi
 210:	31 c0                	xor    %eax,%eax
 212:	29 d8                	sub    %ebx,%eax
 214:	5b                   	pop    %ebx
 215:	5e                   	pop    %esi
 216:	5d                   	pop    %ebp
 217:	c3                   	ret    
 218:	90                   	nop
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000220 <strlen>:
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	8b 4d 08             	mov    0x8(%ebp),%ecx
 226:	80 39 00             	cmpb   $0x0,(%ecx)
 229:	74 12                	je     23d <strlen+0x1d>
 22b:	31 d2                	xor    %edx,%edx
 22d:	8d 76 00             	lea    0x0(%esi),%esi
 230:	83 c2 01             	add    $0x1,%edx
 233:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 237:	89 d0                	mov    %edx,%eax
 239:	75 f5                	jne    230 <strlen+0x10>
 23b:	5d                   	pop    %ebp
 23c:	c3                   	ret    
 23d:	31 c0                	xor    %eax,%eax
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    
 241:	eb 0d                	jmp    250 <memset>
 243:	90                   	nop
 244:	90                   	nop
 245:	90                   	nop
 246:	90                   	nop
 247:	90                   	nop
 248:	90                   	nop
 249:	90                   	nop
 24a:	90                   	nop
 24b:	90                   	nop
 24c:	90                   	nop
 24d:	90                   	nop
 24e:	90                   	nop
 24f:	90                   	nop

00000250 <memset>:
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	57                   	push   %edi
 254:	8b 55 08             	mov    0x8(%ebp),%edx
 257:	8b 4d 10             	mov    0x10(%ebp),%ecx
 25a:	8b 45 0c             	mov    0xc(%ebp),%eax
 25d:	89 d7                	mov    %edx,%edi
 25f:	fc                   	cld    
 260:	f3 aa                	rep stos %al,%es:(%edi)
 262:	89 d0                	mov    %edx,%eax
 264:	5f                   	pop    %edi
 265:	5d                   	pop    %ebp
 266:	c3                   	ret    
 267:	89 f6                	mov    %esi,%esi
 269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000270 <strchr>:
 270:	55                   	push   %ebp
 271:	89 e5                	mov    %esp,%ebp
 273:	53                   	push   %ebx
 274:	8b 45 08             	mov    0x8(%ebp),%eax
 277:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 27a:	0f b6 10             	movzbl (%eax),%edx
 27d:	84 d2                	test   %dl,%dl
 27f:	74 1d                	je     29e <strchr+0x2e>
 281:	38 d3                	cmp    %dl,%bl
 283:	89 d9                	mov    %ebx,%ecx
 285:	75 0d                	jne    294 <strchr+0x24>
 287:	eb 17                	jmp    2a0 <strchr+0x30>
 289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 290:	38 ca                	cmp    %cl,%dl
 292:	74 0c                	je     2a0 <strchr+0x30>
 294:	83 c0 01             	add    $0x1,%eax
 297:	0f b6 10             	movzbl (%eax),%edx
 29a:	84 d2                	test   %dl,%dl
 29c:	75 f2                	jne    290 <strchr+0x20>
 29e:	31 c0                	xor    %eax,%eax
 2a0:	5b                   	pop    %ebx
 2a1:	5d                   	pop    %ebp
 2a2:	c3                   	ret    
 2a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002b0 <gets>:
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	56                   	push   %esi
 2b5:	53                   	push   %ebx
 2b6:	31 f6                	xor    %esi,%esi
 2b8:	8d 7d e7             	lea    -0x19(%ebp),%edi
 2bb:	83 ec 1c             	sub    $0x1c,%esp
 2be:	eb 29                	jmp    2e9 <gets+0x39>
 2c0:	83 ec 04             	sub    $0x4,%esp
 2c3:	6a 01                	push   $0x1
 2c5:	57                   	push   %edi
 2c6:	6a 00                	push   $0x0
 2c8:	e8 2d 01 00 00       	call   3fa <read>
 2cd:	83 c4 10             	add    $0x10,%esp
 2d0:	85 c0                	test   %eax,%eax
 2d2:	7e 1d                	jle    2f1 <gets+0x41>
 2d4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 2d8:	8b 55 08             	mov    0x8(%ebp),%edx
 2db:	89 de                	mov    %ebx,%esi
 2dd:	3c 0a                	cmp    $0xa,%al
 2df:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
 2e3:	74 1b                	je     300 <gets+0x50>
 2e5:	3c 0d                	cmp    $0xd,%al
 2e7:	74 17                	je     300 <gets+0x50>
 2e9:	8d 5e 01             	lea    0x1(%esi),%ebx
 2ec:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2ef:	7c cf                	jl     2c0 <gets+0x10>
 2f1:	8b 45 08             	mov    0x8(%ebp),%eax
 2f4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 2f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 2fb:	5b                   	pop    %ebx
 2fc:	5e                   	pop    %esi
 2fd:	5f                   	pop    %edi
 2fe:	5d                   	pop    %ebp
 2ff:	c3                   	ret    
 300:	8b 45 08             	mov    0x8(%ebp),%eax
 303:	89 de                	mov    %ebx,%esi
 305:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
 309:	8d 65 f4             	lea    -0xc(%ebp),%esp
 30c:	5b                   	pop    %ebx
 30d:	5e                   	pop    %esi
 30e:	5f                   	pop    %edi
 30f:	5d                   	pop    %ebp
 310:	c3                   	ret    
 311:	eb 0d                	jmp    320 <stat>
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

00000320 <stat>:
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	56                   	push   %esi
 324:	53                   	push   %ebx
 325:	83 ec 08             	sub    $0x8,%esp
 328:	6a 00                	push   $0x0
 32a:	ff 75 08             	pushl  0x8(%ebp)
 32d:	e8 f0 00 00 00       	call   422 <open>
 332:	83 c4 10             	add    $0x10,%esp
 335:	85 c0                	test   %eax,%eax
 337:	78 27                	js     360 <stat+0x40>
 339:	83 ec 08             	sub    $0x8,%esp
 33c:	ff 75 0c             	pushl  0xc(%ebp)
 33f:	89 c3                	mov    %eax,%ebx
 341:	50                   	push   %eax
 342:	e8 f3 00 00 00       	call   43a <fstat>
 347:	89 c6                	mov    %eax,%esi
 349:	89 1c 24             	mov    %ebx,(%esp)
 34c:	e8 b9 00 00 00       	call   40a <close>
 351:	83 c4 10             	add    $0x10,%esp
 354:	89 f0                	mov    %esi,%eax
 356:	8d 65 f8             	lea    -0x8(%ebp),%esp
 359:	5b                   	pop    %ebx
 35a:	5e                   	pop    %esi
 35b:	5d                   	pop    %ebp
 35c:	c3                   	ret    
 35d:	8d 76 00             	lea    0x0(%esi),%esi
 360:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 365:	eb ef                	jmp    356 <stat+0x36>
 367:	89 f6                	mov    %esi,%esi
 369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000370 <atoi>:
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	53                   	push   %ebx
 374:	8b 4d 08             	mov    0x8(%ebp),%ecx
 377:	0f be 11             	movsbl (%ecx),%edx
 37a:	8d 42 d0             	lea    -0x30(%edx),%eax
 37d:	3c 09                	cmp    $0x9,%al
 37f:	b8 00 00 00 00       	mov    $0x0,%eax
 384:	77 1f                	ja     3a5 <atoi+0x35>
 386:	8d 76 00             	lea    0x0(%esi),%esi
 389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 390:	8d 04 80             	lea    (%eax,%eax,4),%eax
 393:	83 c1 01             	add    $0x1,%ecx
 396:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 39a:	0f be 11             	movsbl (%ecx),%edx
 39d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 3a0:	80 fb 09             	cmp    $0x9,%bl
 3a3:	76 eb                	jbe    390 <atoi+0x20>
 3a5:	5b                   	pop    %ebx
 3a6:	5d                   	pop    %ebp
 3a7:	c3                   	ret    
 3a8:	90                   	nop
 3a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003b0 <memmove>:
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	56                   	push   %esi
 3b4:	53                   	push   %ebx
 3b5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3b8:	8b 45 08             	mov    0x8(%ebp),%eax
 3bb:	8b 75 0c             	mov    0xc(%ebp),%esi
 3be:	85 db                	test   %ebx,%ebx
 3c0:	7e 14                	jle    3d6 <memmove+0x26>
 3c2:	31 d2                	xor    %edx,%edx
 3c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 3c8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 3cc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 3cf:	83 c2 01             	add    $0x1,%edx
 3d2:	39 da                	cmp    %ebx,%edx
 3d4:	75 f2                	jne    3c8 <memmove+0x18>
 3d6:	5b                   	pop    %ebx
 3d7:	5e                   	pop    %esi
 3d8:	5d                   	pop    %ebp
 3d9:	c3                   	ret    

000003da <fork>:
 3da:	b8 01 00 00 00       	mov    $0x1,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <exit>:
 3e2:	b8 02 00 00 00       	mov    $0x2,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <wait>:
 3ea:	b8 03 00 00 00       	mov    $0x3,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <pipe>:
 3f2:	b8 04 00 00 00       	mov    $0x4,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <read>:
 3fa:	b8 05 00 00 00       	mov    $0x5,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <write>:
 402:	b8 10 00 00 00       	mov    $0x10,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <close>:
 40a:	b8 15 00 00 00       	mov    $0x15,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <kill>:
 412:	b8 06 00 00 00       	mov    $0x6,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <exec>:
 41a:	b8 07 00 00 00       	mov    $0x7,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <open>:
 422:	b8 0f 00 00 00       	mov    $0xf,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <mknod>:
 42a:	b8 11 00 00 00       	mov    $0x11,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <unlink>:
 432:	b8 12 00 00 00       	mov    $0x12,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <fstat>:
 43a:	b8 08 00 00 00       	mov    $0x8,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <link>:
 442:	b8 13 00 00 00       	mov    $0x13,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <mkdir>:
 44a:	b8 14 00 00 00       	mov    $0x14,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <chdir>:
 452:	b8 09 00 00 00       	mov    $0x9,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <dup>:
 45a:	b8 0a 00 00 00       	mov    $0xa,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <getpid>:
 462:	b8 0b 00 00 00       	mov    $0xb,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <sbrk>:
 46a:	b8 0c 00 00 00       	mov    $0xc,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <sleep>:
 472:	b8 0d 00 00 00       	mov    $0xd,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <uptime>:
 47a:	b8 0e 00 00 00       	mov    $0xe,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <thread_create>:
 482:	b8 16 00 00 00       	mov    $0x16,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <thread_exit>:
 48a:	b8 17 00 00 00       	mov    $0x17,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <thread_join>:
 492:	b8 18 00 00 00       	mov    $0x18,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <ex>:
 49a:	b8 19 00 00 00       	mov    $0x19,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    
 4a2:	66 90                	xchg   %ax,%ax
 4a4:	66 90                	xchg   %ax,%ax
 4a6:	66 90                	xchg   %ax,%ax
 4a8:	66 90                	xchg   %ax,%ax
 4aa:	66 90                	xchg   %ax,%ax
 4ac:	66 90                	xchg   %ax,%ax
 4ae:	66 90                	xchg   %ax,%ax

000004b0 <printint>:
 4b0:	55                   	push   %ebp
 4b1:	89 e5                	mov    %esp,%ebp
 4b3:	57                   	push   %edi
 4b4:	56                   	push   %esi
 4b5:	53                   	push   %ebx
 4b6:	89 c6                	mov    %eax,%esi
 4b8:	83 ec 3c             	sub    $0x3c,%esp
 4bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 4be:	85 db                	test   %ebx,%ebx
 4c0:	74 7e                	je     540 <printint+0x90>
 4c2:	89 d0                	mov    %edx,%eax
 4c4:	c1 e8 1f             	shr    $0x1f,%eax
 4c7:	84 c0                	test   %al,%al
 4c9:	74 75                	je     540 <printint+0x90>
 4cb:	89 d0                	mov    %edx,%eax
 4cd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 4d4:	f7 d8                	neg    %eax
 4d6:	89 75 c0             	mov    %esi,-0x40(%ebp)
 4d9:	31 ff                	xor    %edi,%edi
 4db:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4de:	89 ce                	mov    %ecx,%esi
 4e0:	eb 08                	jmp    4ea <printint+0x3a>
 4e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4e8:	89 cf                	mov    %ecx,%edi
 4ea:	31 d2                	xor    %edx,%edx
 4ec:	8d 4f 01             	lea    0x1(%edi),%ecx
 4ef:	f7 f6                	div    %esi
 4f1:	0f b6 92 14 09 00 00 	movzbl 0x914(%edx),%edx
 4f8:	85 c0                	test   %eax,%eax
 4fa:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
 4fd:	75 e9                	jne    4e8 <printint+0x38>
 4ff:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 502:	8b 75 c0             	mov    -0x40(%ebp),%esi
 505:	85 c0                	test   %eax,%eax
 507:	74 08                	je     511 <printint+0x61>
 509:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 50e:	8d 4f 02             	lea    0x2(%edi),%ecx
 511:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 515:	8d 76 00             	lea    0x0(%esi),%esi
 518:	0f b6 07             	movzbl (%edi),%eax
 51b:	83 ec 04             	sub    $0x4,%esp
 51e:	83 ef 01             	sub    $0x1,%edi
 521:	6a 01                	push   $0x1
 523:	53                   	push   %ebx
 524:	56                   	push   %esi
 525:	88 45 d7             	mov    %al,-0x29(%ebp)
 528:	e8 d5 fe ff ff       	call   402 <write>
 52d:	83 c4 10             	add    $0x10,%esp
 530:	39 df                	cmp    %ebx,%edi
 532:	75 e4                	jne    518 <printint+0x68>
 534:	8d 65 f4             	lea    -0xc(%ebp),%esp
 537:	5b                   	pop    %ebx
 538:	5e                   	pop    %esi
 539:	5f                   	pop    %edi
 53a:	5d                   	pop    %ebp
 53b:	c3                   	ret    
 53c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 540:	89 d0                	mov    %edx,%eax
 542:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 549:	eb 8b                	jmp    4d6 <printint+0x26>
 54b:	90                   	nop
 54c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000550 <printf>:
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	8d 45 10             	lea    0x10(%ebp),%eax
 559:	83 ec 2c             	sub    $0x2c,%esp
 55c:	8b 75 0c             	mov    0xc(%ebp),%esi
 55f:	8b 7d 08             	mov    0x8(%ebp),%edi
 562:	89 45 d0             	mov    %eax,-0x30(%ebp)
 565:	0f b6 1e             	movzbl (%esi),%ebx
 568:	83 c6 01             	add    $0x1,%esi
 56b:	84 db                	test   %bl,%bl
 56d:	0f 84 b0 00 00 00    	je     623 <printf+0xd3>
 573:	31 d2                	xor    %edx,%edx
 575:	eb 39                	jmp    5b0 <printf+0x60>
 577:	89 f6                	mov    %esi,%esi
 579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 580:	83 f8 25             	cmp    $0x25,%eax
 583:	89 55 d4             	mov    %edx,-0x2c(%ebp)
 586:	ba 25 00 00 00       	mov    $0x25,%edx
 58b:	74 18                	je     5a5 <printf+0x55>
 58d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 590:	83 ec 04             	sub    $0x4,%esp
 593:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 596:	6a 01                	push   $0x1
 598:	50                   	push   %eax
 599:	57                   	push   %edi
 59a:	e8 63 fe ff ff       	call   402 <write>
 59f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 5a2:	83 c4 10             	add    $0x10,%esp
 5a5:	83 c6 01             	add    $0x1,%esi
 5a8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 5ac:	84 db                	test   %bl,%bl
 5ae:	74 73                	je     623 <printf+0xd3>
 5b0:	85 d2                	test   %edx,%edx
 5b2:	0f be cb             	movsbl %bl,%ecx
 5b5:	0f b6 c3             	movzbl %bl,%eax
 5b8:	74 c6                	je     580 <printf+0x30>
 5ba:	83 fa 25             	cmp    $0x25,%edx
 5bd:	75 e6                	jne    5a5 <printf+0x55>
 5bf:	83 f8 64             	cmp    $0x64,%eax
 5c2:	0f 84 f8 00 00 00    	je     6c0 <printf+0x170>
 5c8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 5ce:	83 f9 70             	cmp    $0x70,%ecx
 5d1:	74 5d                	je     630 <printf+0xe0>
 5d3:	83 f8 73             	cmp    $0x73,%eax
 5d6:	0f 84 84 00 00 00    	je     660 <printf+0x110>
 5dc:	83 f8 63             	cmp    $0x63,%eax
 5df:	0f 84 ea 00 00 00    	je     6cf <printf+0x17f>
 5e5:	83 f8 25             	cmp    $0x25,%eax
 5e8:	0f 84 c2 00 00 00    	je     6b0 <printf+0x160>
 5ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5f1:	83 ec 04             	sub    $0x4,%esp
 5f4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 5f8:	6a 01                	push   $0x1
 5fa:	50                   	push   %eax
 5fb:	57                   	push   %edi
 5fc:	e8 01 fe ff ff       	call   402 <write>
 601:	83 c4 0c             	add    $0xc,%esp
 604:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 607:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 60a:	6a 01                	push   $0x1
 60c:	50                   	push   %eax
 60d:	57                   	push   %edi
 60e:	83 c6 01             	add    $0x1,%esi
 611:	e8 ec fd ff ff       	call   402 <write>
 616:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 61a:	83 c4 10             	add    $0x10,%esp
 61d:	31 d2                	xor    %edx,%edx
 61f:	84 db                	test   %bl,%bl
 621:	75 8d                	jne    5b0 <printf+0x60>
 623:	8d 65 f4             	lea    -0xc(%ebp),%esp
 626:	5b                   	pop    %ebx
 627:	5e                   	pop    %esi
 628:	5f                   	pop    %edi
 629:	5d                   	pop    %ebp
 62a:	c3                   	ret    
 62b:	90                   	nop
 62c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 630:	83 ec 0c             	sub    $0xc,%esp
 633:	b9 10 00 00 00       	mov    $0x10,%ecx
 638:	6a 00                	push   $0x0
 63a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 63d:	89 f8                	mov    %edi,%eax
 63f:	8b 13                	mov    (%ebx),%edx
 641:	e8 6a fe ff ff       	call   4b0 <printint>
 646:	89 d8                	mov    %ebx,%eax
 648:	83 c4 10             	add    $0x10,%esp
 64b:	31 d2                	xor    %edx,%edx
 64d:	83 c0 04             	add    $0x4,%eax
 650:	89 45 d0             	mov    %eax,-0x30(%ebp)
 653:	e9 4d ff ff ff       	jmp    5a5 <printf+0x55>
 658:	90                   	nop
 659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 660:	8b 45 d0             	mov    -0x30(%ebp),%eax
 663:	8b 18                	mov    (%eax),%ebx
 665:	83 c0 04             	add    $0x4,%eax
 668:	89 45 d0             	mov    %eax,-0x30(%ebp)
 66b:	b8 0b 09 00 00       	mov    $0x90b,%eax
 670:	85 db                	test   %ebx,%ebx
 672:	0f 44 d8             	cmove  %eax,%ebx
 675:	0f b6 03             	movzbl (%ebx),%eax
 678:	84 c0                	test   %al,%al
 67a:	74 23                	je     69f <printf+0x14f>
 67c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 680:	88 45 e3             	mov    %al,-0x1d(%ebp)
 683:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 686:	83 ec 04             	sub    $0x4,%esp
 689:	6a 01                	push   $0x1
 68b:	83 c3 01             	add    $0x1,%ebx
 68e:	50                   	push   %eax
 68f:	57                   	push   %edi
 690:	e8 6d fd ff ff       	call   402 <write>
 695:	0f b6 03             	movzbl (%ebx),%eax
 698:	83 c4 10             	add    $0x10,%esp
 69b:	84 c0                	test   %al,%al
 69d:	75 e1                	jne    680 <printf+0x130>
 69f:	31 d2                	xor    %edx,%edx
 6a1:	e9 ff fe ff ff       	jmp    5a5 <printf+0x55>
 6a6:	8d 76 00             	lea    0x0(%esi),%esi
 6a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 6b0:	83 ec 04             	sub    $0x4,%esp
 6b3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 6b6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 6b9:	6a 01                	push   $0x1
 6bb:	e9 4c ff ff ff       	jmp    60c <printf+0xbc>
 6c0:	83 ec 0c             	sub    $0xc,%esp
 6c3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 6c8:	6a 01                	push   $0x1
 6ca:	e9 6b ff ff ff       	jmp    63a <printf+0xea>
 6cf:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 6d2:	83 ec 04             	sub    $0x4,%esp
 6d5:	8b 03                	mov    (%ebx),%eax
 6d7:	6a 01                	push   $0x1
 6d9:	88 45 e4             	mov    %al,-0x1c(%ebp)
 6dc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 6df:	50                   	push   %eax
 6e0:	57                   	push   %edi
 6e1:	e8 1c fd ff ff       	call   402 <write>
 6e6:	e9 5b ff ff ff       	jmp    646 <printf+0xf6>
 6eb:	66 90                	xchg   %ax,%ax
 6ed:	66 90                	xchg   %ax,%ax
 6ef:	90                   	nop

000006f0 <free>:
 6f0:	55                   	push   %ebp
 6f1:	a1 f8 0b 00 00       	mov    0xbf8,%eax
 6f6:	89 e5                	mov    %esp,%ebp
 6f8:	57                   	push   %edi
 6f9:	56                   	push   %esi
 6fa:	53                   	push   %ebx
 6fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 6fe:	8b 10                	mov    (%eax),%edx
 700:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 703:	39 c8                	cmp    %ecx,%eax
 705:	73 19                	jae    720 <free+0x30>
 707:	89 f6                	mov    %esi,%esi
 709:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 710:	39 d1                	cmp    %edx,%ecx
 712:	72 1c                	jb     730 <free+0x40>
 714:	39 d0                	cmp    %edx,%eax
 716:	73 18                	jae    730 <free+0x40>
 718:	89 d0                	mov    %edx,%eax
 71a:	39 c8                	cmp    %ecx,%eax
 71c:	8b 10                	mov    (%eax),%edx
 71e:	72 f0                	jb     710 <free+0x20>
 720:	39 d0                	cmp    %edx,%eax
 722:	72 f4                	jb     718 <free+0x28>
 724:	39 d1                	cmp    %edx,%ecx
 726:	73 f0                	jae    718 <free+0x28>
 728:	90                   	nop
 729:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 730:	8b 73 fc             	mov    -0x4(%ebx),%esi
 733:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 736:	39 d7                	cmp    %edx,%edi
 738:	74 19                	je     753 <free+0x63>
 73a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 73d:	8b 50 04             	mov    0x4(%eax),%edx
 740:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 743:	39 f1                	cmp    %esi,%ecx
 745:	74 23                	je     76a <free+0x7a>
 747:	89 08                	mov    %ecx,(%eax)
 749:	a3 f8 0b 00 00       	mov    %eax,0xbf8
 74e:	5b                   	pop    %ebx
 74f:	5e                   	pop    %esi
 750:	5f                   	pop    %edi
 751:	5d                   	pop    %ebp
 752:	c3                   	ret    
 753:	03 72 04             	add    0x4(%edx),%esi
 756:	89 73 fc             	mov    %esi,-0x4(%ebx)
 759:	8b 10                	mov    (%eax),%edx
 75b:	8b 12                	mov    (%edx),%edx
 75d:	89 53 f8             	mov    %edx,-0x8(%ebx)
 760:	8b 50 04             	mov    0x4(%eax),%edx
 763:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 766:	39 f1                	cmp    %esi,%ecx
 768:	75 dd                	jne    747 <free+0x57>
 76a:	03 53 fc             	add    -0x4(%ebx),%edx
 76d:	a3 f8 0b 00 00       	mov    %eax,0xbf8
 772:	89 50 04             	mov    %edx,0x4(%eax)
 775:	8b 53 f8             	mov    -0x8(%ebx),%edx
 778:	89 10                	mov    %edx,(%eax)
 77a:	5b                   	pop    %ebx
 77b:	5e                   	pop    %esi
 77c:	5f                   	pop    %edi
 77d:	5d                   	pop    %ebp
 77e:	c3                   	ret    
 77f:	90                   	nop

00000780 <malloc>:
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	57                   	push   %edi
 784:	56                   	push   %esi
 785:	53                   	push   %ebx
 786:	83 ec 0c             	sub    $0xc,%esp
 789:	8b 45 08             	mov    0x8(%ebp),%eax
 78c:	8b 15 f8 0b 00 00    	mov    0xbf8,%edx
 792:	8d 78 07             	lea    0x7(%eax),%edi
 795:	c1 ef 03             	shr    $0x3,%edi
 798:	83 c7 01             	add    $0x1,%edi
 79b:	85 d2                	test   %edx,%edx
 79d:	0f 84 a3 00 00 00    	je     846 <malloc+0xc6>
 7a3:	8b 02                	mov    (%edx),%eax
 7a5:	8b 48 04             	mov    0x4(%eax),%ecx
 7a8:	39 cf                	cmp    %ecx,%edi
 7aa:	76 74                	jbe    820 <malloc+0xa0>
 7ac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 7b2:	be 00 10 00 00       	mov    $0x1000,%esi
 7b7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 7be:	0f 43 f7             	cmovae %edi,%esi
 7c1:	ba 00 80 00 00       	mov    $0x8000,%edx
 7c6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 7cc:	0f 46 da             	cmovbe %edx,%ebx
 7cf:	eb 10                	jmp    7e1 <malloc+0x61>
 7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7d8:	8b 02                	mov    (%edx),%eax
 7da:	8b 48 04             	mov    0x4(%eax),%ecx
 7dd:	39 cf                	cmp    %ecx,%edi
 7df:	76 3f                	jbe    820 <malloc+0xa0>
 7e1:	39 05 f8 0b 00 00    	cmp    %eax,0xbf8
 7e7:	89 c2                	mov    %eax,%edx
 7e9:	75 ed                	jne    7d8 <malloc+0x58>
 7eb:	83 ec 0c             	sub    $0xc,%esp
 7ee:	53                   	push   %ebx
 7ef:	e8 76 fc ff ff       	call   46a <sbrk>
 7f4:	83 c4 10             	add    $0x10,%esp
 7f7:	83 f8 ff             	cmp    $0xffffffff,%eax
 7fa:	74 1c                	je     818 <malloc+0x98>
 7fc:	89 70 04             	mov    %esi,0x4(%eax)
 7ff:	83 ec 0c             	sub    $0xc,%esp
 802:	83 c0 08             	add    $0x8,%eax
 805:	50                   	push   %eax
 806:	e8 e5 fe ff ff       	call   6f0 <free>
 80b:	8b 15 f8 0b 00 00    	mov    0xbf8,%edx
 811:	83 c4 10             	add    $0x10,%esp
 814:	85 d2                	test   %edx,%edx
 816:	75 c0                	jne    7d8 <malloc+0x58>
 818:	31 c0                	xor    %eax,%eax
 81a:	eb 1c                	jmp    838 <malloc+0xb8>
 81c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 820:	39 cf                	cmp    %ecx,%edi
 822:	74 1c                	je     840 <malloc+0xc0>
 824:	29 f9                	sub    %edi,%ecx
 826:	89 48 04             	mov    %ecx,0x4(%eax)
 829:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 82c:	89 78 04             	mov    %edi,0x4(%eax)
 82f:	89 15 f8 0b 00 00    	mov    %edx,0xbf8
 835:	83 c0 08             	add    $0x8,%eax
 838:	8d 65 f4             	lea    -0xc(%ebp),%esp
 83b:	5b                   	pop    %ebx
 83c:	5e                   	pop    %esi
 83d:	5f                   	pop    %edi
 83e:	5d                   	pop    %ebp
 83f:	c3                   	ret    
 840:	8b 08                	mov    (%eax),%ecx
 842:	89 0a                	mov    %ecx,(%edx)
 844:	eb e9                	jmp    82f <malloc+0xaf>
 846:	c7 05 f8 0b 00 00 fc 	movl   $0xbfc,0xbf8
 84d:	0b 00 00 
 850:	c7 05 fc 0b 00 00 fc 	movl   $0xbfc,0xbfc
 857:	0b 00 00 
 85a:	b8 fc 0b 00 00       	mov    $0xbfc,%eax
 85f:	c7 05 00 0c 00 00 00 	movl   $0x0,0xc00
 866:	00 00 00 
 869:	e9 3e ff ff ff       	jmp    7ac <malloc+0x2c>
