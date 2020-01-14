
_thread_test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    }
  }
}

int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	51                   	push   %ecx
   e:	83 ec 0c             	sub    $0xc,%esp
  int i;
  for (i = 0; i < NUM_THREAD; i++)
    expected[i] = i;
  11:	c7 05 84 11 00 00 00 	movl   $0x0,0x1184
  18:	00 00 00 
  1b:	c7 05 88 11 00 00 01 	movl   $0x1,0x1188
  22:	00 00 00 

  printf(1, "Test 1: Basic test\n");
  25:	68 7c 0c 00 00       	push   $0xc7c
  2a:	6a 01                	push   $0x1

int main(int argc, char *argv[])
{
  int i;
  for (i = 0; i < NUM_THREAD; i++)
    expected[i] = i;
  2c:	c7 05 8c 11 00 00 02 	movl   $0x2,0x118c
  33:	00 00 00 
  36:	c7 05 90 11 00 00 03 	movl   $0x3,0x1190
  3d:	00 00 00 
  40:	c7 05 94 11 00 00 04 	movl   $0x4,0x1194
  47:	00 00 00 

  printf(1, "Test 1: Basic test\n");
  4a:	e8 31 08 00 00       	call   880 <printf>
  create_all(2, thread_basic);
  4f:	58                   	pop    %eax
  50:	5a                   	pop    %edx
  51:	68 70 01 00 00       	push   $0x170
  56:	6a 02                	push   $0x2
  58:	e8 93 03 00 00       	call   3f0 <create_all>
  sleep(100);
  5d:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
  64:	e8 39 07 00 00       	call   7a2 <sleep>
  printf(1, "Parent waiting for children...\n");
  69:	59                   	pop    %ecx
  6a:	58                   	pop    %eax
  6b:	68 40 0d 00 00       	push   $0xd40
  70:	6a 01                	push   $0x1
  72:	e8 09 08 00 00       	call   880 <printf>
  join_all(2);
  77:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  7e:	e8 cd 03 00 00       	call   450 <join_all>
  if (status != 1) {
  83:	83 c4 10             	add    $0x10,%esp
  86:	83 3d b0 11 00 00 01 	cmpl   $0x1,0x11b0
  8d:	74 14                	je     a3 <main+0xa3>
    printf(1, "Join returned before thread exit, or the address space is not properly shared\n");
  8f:	83 ec 08             	sub    $0x8,%esp
  92:	68 60 0d 00 00       	push   $0xd60
  97:	6a 01                	push   $0x1
  99:	e8 e2 07 00 00       	call   880 <printf>
    failed();
  9e:	e8 2d 01 00 00       	call   1d0 <failed>
  }
  printf(1, "Test 1 passed\n\n");
  a3:	50                   	push   %eax
  a4:	50                   	push   %eax
  a5:	68 90 0c 00 00       	push   $0xc90
  aa:	6a 01                	push   $0x1
  ac:	e8 cf 07 00 00       	call   880 <printf>

  printf(1, "Test 2: Fork test\n");
  b1:	58                   	pop    %eax
  b2:	5a                   	pop    %edx
  b3:	68 a0 0c 00 00       	push   $0xca0
  b8:	6a 01                	push   $0x1
  ba:	e8 c1 07 00 00       	call   880 <printf>
  create_all(NUM_THREAD, thread_fork);
  bf:	59                   	pop    %ecx
  c0:	58                   	pop    %eax
  c1:	68 f0 01 00 00       	push   $0x1f0
  c6:	6a 05                	push   $0x5
  c8:	e8 23 03 00 00       	call   3f0 <create_all>
  join_all(NUM_THREAD);
  cd:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  d4:	e8 77 03 00 00       	call   450 <join_all>
  if (status != 2) {
  d9:	a1 b0 11 00 00       	mov    0x11b0,%eax
  de:	83 c4 10             	add    $0x10,%esp
  e1:	83 f8 02             	cmp    $0x2,%eax
  e4:	74 2e                	je     114 <main+0x114>
    if (status == 3) {
  e6:	83 f8 03             	cmp    $0x3,%eax
  e9:	74 16                	je     101 <main+0x101>
      printf(1, "Child process referenced parent's memory\n");
    }
    else {
      printf(1, "Status expected 2, found %d\n", status);
  eb:	51                   	push   %ecx
  ec:	50                   	push   %eax
  ed:	68 b3 0c 00 00       	push   $0xcb3
  f2:	6a 01                	push   $0x1
  f4:	e8 87 07 00 00       	call   880 <printf>
  f9:	83 c4 10             	add    $0x10,%esp
    }
    failed();
  fc:	e8 cf 00 00 00       	call   1d0 <failed>
  printf(1, "Test 2: Fork test\n");
  create_all(NUM_THREAD, thread_fork);
  join_all(NUM_THREAD);
  if (status != 2) {
    if (status == 3) {
      printf(1, "Child process referenced parent's memory\n");
 101:	50                   	push   %eax
 102:	50                   	push   %eax
 103:	68 b0 0d 00 00       	push   $0xdb0
 108:	6a 01                	push   $0x1
 10a:	e8 71 07 00 00       	call   880 <printf>
 10f:	83 c4 10             	add    $0x10,%esp
 112:	eb e8                	jmp    fc <main+0xfc>
    else {
      printf(1, "Status expected 2, found %d\n", status);
    }
    failed();
  }
  printf(1, "Test 2 passed\n\n");
 114:	50                   	push   %eax
 115:	50                   	push   %eax
 116:	68 d0 0c 00 00       	push   $0xcd0
 11b:	6a 01                	push   $0x1
 11d:	e8 5e 07 00 00       	call   880 <printf>

  printf(1, "Test 3: Sbrk test\n");
 122:	5a                   	pop    %edx
 123:	59                   	pop    %ecx
 124:	68 e0 0c 00 00       	push   $0xce0
 129:	6a 01                	push   $0x1
 12b:	e8 50 07 00 00       	call   880 <printf>
  create_all(NUM_THREAD, thread_sbrk);
 130:	58                   	pop    %eax
 131:	5a                   	pop    %edx
 132:	68 b0 02 00 00       	push   $0x2b0
 137:	6a 05                	push   $0x5
 139:	e8 b2 02 00 00       	call   3f0 <create_all>
  join_all(NUM_THREAD);
 13e:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 145:	e8 06 03 00 00       	call   450 <join_all>
  printf(1, "Test 3 passed\n\n");
 14a:	59                   	pop    %ecx
 14b:	58                   	pop    %eax
 14c:	68 f3 0c 00 00       	push   $0xcf3
 151:	6a 01                	push   $0x1
 153:	e8 28 07 00 00       	call   880 <printf>

  printf(1, "All tests passed!\n");
 158:	58                   	pop    %eax
 159:	5a                   	pop    %edx
 15a:	68 03 0d 00 00       	push   $0xd03
 15f:	6a 01                	push   $0x1
 161:	e8 1a 07 00 00       	call   880 <printf>
  exit();
 166:	e8 a7 05 00 00       	call   712 <exit>
 16b:	66 90                	xchg   %ax,%ax
 16d:	66 90                	xchg   %ax,%ax
 16f:	90                   	nop

00000170 <thread_basic>:
  printf(1, "Test failed!\n");
  exit();
}

void *thread_basic(void *arg)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	53                   	push   %ebx
 174:	83 ec 08             	sub    $0x8,%esp
 177:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int val = (int)arg;
  printf(1, "Thread %d start\n", val);
 17a:	53                   	push   %ebx
 17b:	68 a0 0b 00 00       	push   $0xba0
 180:	6a 01                	push   $0x1
 182:	e8 f9 06 00 00       	call   880 <printf>
  if (val == 1) {
 187:	83 c4 10             	add    $0x10,%esp
 18a:	83 fb 01             	cmp    $0x1,%ebx
 18d:	74 21                	je     1b0 <thread_basic+0x40>
    sleep(200);
    status = 1;
  }
  printf(1, "Thread %d end\n", val);
 18f:	83 ec 04             	sub    $0x4,%esp
 192:	53                   	push   %ebx
 193:	68 b1 0b 00 00       	push   $0xbb1
 198:	6a 01                	push   $0x1
 19a:	e8 e1 06 00 00       	call   880 <printf>
  thread_exit(arg);
 19f:	89 1c 24             	mov    %ebx,(%esp)
 1a2:	e8 13 06 00 00       	call   7ba <thread_exit>
  return 0;
}
 1a7:	31 c0                	xor    %eax,%eax
 1a9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1ac:	c9                   	leave  
 1ad:	c3                   	ret    
 1ae:	66 90                	xchg   %ax,%ax
void *thread_basic(void *arg)
{
  int val = (int)arg;
  printf(1, "Thread %d start\n", val);
  if (val == 1) {
    sleep(200);
 1b0:	83 ec 0c             	sub    $0xc,%esp
 1b3:	68 c8 00 00 00       	push   $0xc8
 1b8:	e8 e5 05 00 00       	call   7a2 <sleep>
    status = 1;
 1bd:	c7 05 b0 11 00 00 01 	movl   $0x1,0x11b0
 1c4:	00 00 00 
 1c7:	83 c4 10             	add    $0x10,%esp
 1ca:	eb c3                	jmp    18f <thread_basic+0x1f>
 1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000001d0 <failed>:
int status;
thread_t thread[NUM_THREAD];
int expected[NUM_THREAD];

void failed()
{
 1d0:	55                   	push   %ebp
 1d1:	89 e5                	mov    %esp,%ebp
 1d3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "Test failed!\n");
 1d6:	68 c0 0b 00 00       	push   $0xbc0
 1db:	6a 01                	push   $0x1
 1dd:	e8 9e 06 00 00       	call   880 <printf>
  exit();
 1e2:	e8 2b 05 00 00       	call   712 <exit>
 1e7:	89 f6                	mov    %esi,%esi
 1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <thread_fork>:
  thread_exit(arg);
  return 0;
}

void *thread_fork(void *arg)
{
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	53                   	push   %ebx
 1f4:	83 ec 08             	sub    $0x8,%esp
 1f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int val = (int)arg;
  int pid;

  printf(1, "Thread %d start\n", val);
 1fa:	53                   	push   %ebx
 1fb:	68 a0 0b 00 00       	push   $0xba0
 200:	6a 01                	push   $0x1
 202:	e8 79 06 00 00       	call   880 <printf>
  pid = fork();
 207:	e8 fe 04 00 00       	call   70a <fork>
  if (pid < 0) {
 20c:	83 c4 10             	add    $0x10,%esp
 20f:	85 c0                	test   %eax,%eax
 211:	78 35                	js     248 <thread_fork+0x58>
    printf(1, "Fork error on thread %d\n", val);
    failed();
  }

  if (pid == 0) {
 213:	74 59                	je     26e <thread_fork+0x7e>
    status = 3;
    printf(1, "Child of thread %d end\n", val);
    exit();
  }
  else {
    status = 2;
 215:	c7 05 b0 11 00 00 02 	movl   $0x2,0x11b0
 21c:	00 00 00 
    if (wait() == -1) {
 21f:	e8 f6 04 00 00       	call   71a <wait>
 224:	83 f8 ff             	cmp    $0xffffffff,%eax
 227:	74 32                	je     25b <thread_fork+0x6b>
      printf(1, "Thread %d lost their child\n", val);
      failed();
    }
  }
  printf(1, "Thread %d end\n", val);
 229:	83 ec 04             	sub    $0x4,%esp
 22c:	53                   	push   %ebx
 22d:	68 b1 0b 00 00       	push   $0xbb1
 232:	6a 01                	push   $0x1
 234:	e8 47 06 00 00       	call   880 <printf>
  thread_exit(arg);
 239:	89 1c 24             	mov    %ebx,(%esp)
 23c:	e8 79 05 00 00       	call   7ba <thread_exit>
  return 0;
}
 241:	31 c0                	xor    %eax,%eax
 243:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 246:	c9                   	leave  
 247:	c3                   	ret    
  int pid;

  printf(1, "Thread %d start\n", val);
  pid = fork();
  if (pid < 0) {
    printf(1, "Fork error on thread %d\n", val);
 248:	51                   	push   %ecx
 249:	53                   	push   %ebx
 24a:	68 ce 0b 00 00       	push   $0xbce
 24f:	6a 01                	push   $0x1
 251:	e8 2a 06 00 00       	call   880 <printf>
    failed();
 256:	e8 75 ff ff ff       	call   1d0 <failed>
    exit();
  }
  else {
    status = 2;
    if (wait() == -1) {
      printf(1, "Thread %d lost their child\n", val);
 25b:	50                   	push   %eax
 25c:	53                   	push   %ebx
 25d:	68 19 0c 00 00       	push   $0xc19
 262:	6a 01                	push   $0x1
 264:	e8 17 06 00 00       	call   880 <printf>
      failed();
 269:	e8 62 ff ff ff       	call   1d0 <failed>
    printf(1, "Fork error on thread %d\n", val);
    failed();
  }

  if (pid == 0) {
    printf(1, "Child of thread %d start\n", val);
 26e:	52                   	push   %edx
 26f:	53                   	push   %ebx
 270:	68 e7 0b 00 00       	push   $0xbe7
 275:	6a 01                	push   $0x1
 277:	e8 04 06 00 00       	call   880 <printf>
    sleep(100);
 27c:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 283:	e8 1a 05 00 00       	call   7a2 <sleep>
    status = 3;
    printf(1, "Child of thread %d end\n", val);
 288:	83 c4 0c             	add    $0xc,%esp
  }

  if (pid == 0) {
    printf(1, "Child of thread %d start\n", val);
    sleep(100);
    status = 3;
 28b:	c7 05 b0 11 00 00 03 	movl   $0x3,0x11b0
 292:	00 00 00 
    printf(1, "Child of thread %d end\n", val);
 295:	53                   	push   %ebx
 296:	68 01 0c 00 00       	push   $0xc01
 29b:	6a 01                	push   $0x1
 29d:	e8 de 05 00 00       	call   880 <printf>
    exit();
 2a2:	e8 6b 04 00 00       	call   712 <exit>
 2a7:	89 f6                	mov    %esi,%esi
 2a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002b0 <thread_sbrk>:
}

int *ptr;

void *thread_sbrk(void *arg)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	57                   	push   %edi
 2b4:	56                   	push   %esi
 2b5:	53                   	push   %ebx
 2b6:	83 ec 10             	sub    $0x10,%esp
 2b9:	8b 75 08             	mov    0x8(%ebp),%esi
  int val = (int)arg;
  printf(1, "Thread %d start\n", val);
 2bc:	56                   	push   %esi
 2bd:	68 a0 0b 00 00       	push   $0xba0
 2c2:	6a 01                	push   $0x1
 2c4:	e8 b7 05 00 00       	call   880 <printf>

  int i, j;

  if (val == 0) {
 2c9:	83 c4 10             	add    $0x10,%esp
 2cc:	85 f6                	test   %esi,%esi
 2ce:	0f 84 e0 00 00 00    	je     3b4 <thread_sbrk+0x104>
    sleep(100);
    free(ptr);
    ptr = 0;
  }
  else {
    while (ptr == 0)
 2d4:	8b 15 ac 11 00 00    	mov    0x11ac,%edx
 2da:	85 d2                	test   %edx,%edx
 2dc:	75 17                	jne    2f5 <thread_sbrk+0x45>
      sleep(1);
 2de:	83 ec 0c             	sub    $0xc,%esp
 2e1:	6a 01                	push   $0x1
 2e3:	e8 ba 04 00 00       	call   7a2 <sleep>
    sleep(100);
    free(ptr);
    ptr = 0;
  }
  else {
    while (ptr == 0)
 2e8:	8b 15 ac 11 00 00    	mov    0x11ac,%edx
 2ee:	83 c4 10             	add    $0x10,%esp
 2f1:	85 d2                	test   %edx,%edx
 2f3:	74 e9                	je     2de <thread_sbrk+0x2e>
}

int *ptr;

void *thread_sbrk(void *arg)
{
 2f5:	31 c0                	xor    %eax,%eax
 2f7:	eb 0d                	jmp    306 <thread_sbrk+0x56>
 2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 300:	8b 15 ac 11 00 00    	mov    0x11ac,%edx
  }
  else {
    while (ptr == 0)
      sleep(1);
    for (i = 0; i < 16384; i++)
      ptr[i] = val;
 306:	89 34 02             	mov    %esi,(%edx,%eax,1)
 309:	83 c0 04             	add    $0x4,%eax
    ptr = 0;
  }
  else {
    while (ptr == 0)
      sleep(1);
    for (i = 0; i < 16384; i++)
 30c:	3d 00 00 01 00       	cmp    $0x10000,%eax
 311:	75 ed                	jne    300 <thread_sbrk+0x50>
      ptr[i] = val;
  }

  while (ptr != 0)
 313:	a1 ac 11 00 00       	mov    0x11ac,%eax
 318:	85 c0                	test   %eax,%eax
 31a:	74 16                	je     332 <thread_sbrk+0x82>
    sleep(1);
 31c:	83 ec 0c             	sub    $0xc,%esp
 31f:	6a 01                	push   $0x1
 321:	e8 7c 04 00 00       	call   7a2 <sleep>
      sleep(1);
    for (i = 0; i < 16384; i++)
      ptr[i] = val;
  }

  while (ptr != 0)
 326:	a1 ac 11 00 00       	mov    0x11ac,%eax
 32b:	83 c4 10             	add    $0x10,%esp
 32e:	85 c0                	test   %eax,%eax
 330:	75 ea                	jne    31c <thread_sbrk+0x6c>
}

int *ptr;

void *thread_sbrk(void *arg)
{
 332:	bb d0 07 00 00       	mov    $0x7d0,%ebx
 337:	89 f6                	mov    %esi,%esi
 339:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

  while (ptr != 0)
    sleep(1);

  for (i = 0; i < 2000; i++) {
    int *p = (int *)malloc(65536);
 340:	83 ec 0c             	sub    $0xc,%esp
 343:	68 00 00 01 00       	push   $0x10000
 348:	e8 63 07 00 00       	call   ab0 <malloc>
 34d:	8d b8 00 00 01 00    	lea    0x10000(%eax),%edi
 353:	89 c1                	mov    %eax,%ecx
 355:	83 c4 10             	add    $0x10,%esp
 358:	89 c2                	mov    %eax,%edx
 35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    for (j = 0; j < 16384; j++)
      p[j] = val;
 360:	89 32                	mov    %esi,(%edx)
 362:	83 c2 04             	add    $0x4,%edx
  while (ptr != 0)
    sleep(1);

  for (i = 0; i < 2000; i++) {
    int *p = (int *)malloc(65536);
    for (j = 0; j < 16384; j++)
 365:	39 fa                	cmp    %edi,%edx
 367:	75 f7                	jne    360 <thread_sbrk+0xb0>
 369:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      p[j] = val;
    for (j = 0; j < 16384; j++) {
      if (p[j] != val) {
 370:	8b 11                	mov    (%ecx),%edx
 372:	39 d6                	cmp    %edx,%esi
 374:	75 2b                	jne    3a1 <thread_sbrk+0xf1>
 376:	83 c1 04             	add    $0x4,%ecx

  for (i = 0; i < 2000; i++) {
    int *p = (int *)malloc(65536);
    for (j = 0; j < 16384; j++)
      p[j] = val;
    for (j = 0; j < 16384; j++) {
 379:	39 f9                	cmp    %edi,%ecx
 37b:	75 f3                	jne    370 <thread_sbrk+0xc0>
      if (p[j] != val) {
        printf(1, "Thread %d found %d\n", val, p[j]);
        failed();
      }
    }
    free(p);
 37d:	83 ec 0c             	sub    $0xc,%esp
 380:	50                   	push   %eax
 381:	e8 9a 06 00 00       	call   a20 <free>
  }

  while (ptr != 0)
    sleep(1);

  for (i = 0; i < 2000; i++) {
 386:	83 c4 10             	add    $0x10,%esp
 389:	83 eb 01             	sub    $0x1,%ebx
 38c:	75 b2                	jne    340 <thread_sbrk+0x90>
      }
    }
    free(p);
  }

  thread_exit(arg);
 38e:	83 ec 0c             	sub    $0xc,%esp
 391:	56                   	push   %esi
 392:	e8 23 04 00 00       	call   7ba <thread_exit>
  return 0;
}
 397:	8d 65 f4             	lea    -0xc(%ebp),%esp
 39a:	31 c0                	xor    %eax,%eax
 39c:	5b                   	pop    %ebx
 39d:	5e                   	pop    %esi
 39e:	5f                   	pop    %edi
 39f:	5d                   	pop    %ebp
 3a0:	c3                   	ret    
    int *p = (int *)malloc(65536);
    for (j = 0; j < 16384; j++)
      p[j] = val;
    for (j = 0; j < 16384; j++) {
      if (p[j] != val) {
        printf(1, "Thread %d found %d\n", val, p[j]);
 3a1:	52                   	push   %edx
 3a2:	56                   	push   %esi
 3a3:	68 35 0c 00 00       	push   $0xc35
 3a8:	6a 01                	push   $0x1
 3aa:	e8 d1 04 00 00       	call   880 <printf>
        failed();
 3af:	e8 1c fe ff ff       	call   1d0 <failed>
  printf(1, "Thread %d start\n", val);

  int i, j;

  if (val == 0) {
    ptr = (int *)malloc(65536);
 3b4:	83 ec 0c             	sub    $0xc,%esp
 3b7:	68 00 00 01 00       	push   $0x10000
 3bc:	e8 ef 06 00 00       	call   ab0 <malloc>
    sleep(100);
 3c1:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
  printf(1, "Thread %d start\n", val);

  int i, j;

  if (val == 0) {
    ptr = (int *)malloc(65536);
 3c8:	a3 ac 11 00 00       	mov    %eax,0x11ac
    sleep(100);
 3cd:	e8 d0 03 00 00       	call   7a2 <sleep>
    free(ptr);
 3d2:	5a                   	pop    %edx
 3d3:	ff 35 ac 11 00 00    	pushl  0x11ac
 3d9:	e8 42 06 00 00       	call   a20 <free>
    ptr = 0;
 3de:	c7 05 ac 11 00 00 00 	movl   $0x0,0x11ac
 3e5:	00 00 00 
 3e8:	83 c4 10             	add    $0x10,%esp
 3eb:	e9 42 ff ff ff       	jmp    332 <thread_sbrk+0x82>

000003f0 <create_all>:

  thread_exit(arg);
  return 0;
}
void create_all(int n, void *(*entry)(void *))
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	57                   	push   %edi
 3f4:	56                   	push   %esi
 3f5:	53                   	push   %ebx
 3f6:	83 ec 0c             	sub    $0xc,%esp
  int i;
  for (i = 0; i < n; i++) {
 3f9:	8b 45 08             	mov    0x8(%ebp),%eax

  thread_exit(arg);
  return 0;
}
void create_all(int n, void *(*entry)(void *))
{
 3fc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  int i;
  for (i = 0; i < n; i++) {
 3ff:	85 c0                	test   %eax,%eax
 401:	7e 2a                	jle    42d <create_all+0x3d>
 403:	be 98 11 00 00       	mov    $0x1198,%esi
 408:	31 db                	xor    %ebx,%ebx
 40a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (thread_create(&thread[i], entry, (void *)i) != 0) {
 410:	83 ec 04             	sub    $0x4,%esp
 413:	53                   	push   %ebx
 414:	57                   	push   %edi
 415:	56                   	push   %esi
 416:	e8 97 03 00 00       	call   7b2 <thread_create>
 41b:	83 c4 10             	add    $0x10,%esp
 41e:	85 c0                	test   %eax,%eax
 420:	75 13                	jne    435 <create_all+0x45>
  return 0;
}
void create_all(int n, void *(*entry)(void *))
{
  int i;
  for (i = 0; i < n; i++) {
 422:	83 c3 01             	add    $0x1,%ebx
 425:	83 c6 04             	add    $0x4,%esi
 428:	39 5d 08             	cmp    %ebx,0x8(%ebp)
 42b:	75 e3                	jne    410 <create_all+0x20>
    if (thread_create(&thread[i], entry, (void *)i) != 0) {
      printf(1, "Error creating thread %d\n", i);
      failed();
    }
  }
}
 42d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 430:	5b                   	pop    %ebx
 431:	5e                   	pop    %esi
 432:	5f                   	pop    %edi
 433:	5d                   	pop    %ebp
 434:	c3                   	ret    
void create_all(int n, void *(*entry)(void *))
{
  int i;
  for (i = 0; i < n; i++) {
    if (thread_create(&thread[i], entry, (void *)i) != 0) {
      printf(1, "Error creating thread %d\n", i);
 435:	83 ec 04             	sub    $0x4,%esp
 438:	53                   	push   %ebx
 439:	68 49 0c 00 00       	push   $0xc49
 43e:	6a 01                	push   $0x1
 440:	e8 3b 04 00 00       	call   880 <printf>
      failed();
 445:	e8 86 fd ff ff       	call   1d0 <failed>
 44a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000450 <join_all>:
    }
  }
}

void join_all(int n)
{
 450:	55                   	push   %ebp
 451:	89 e5                	mov    %esp,%ebp
 453:	57                   	push   %edi
 454:	56                   	push   %esi
 455:	53                   	push   %ebx
 456:	83 ec 1c             	sub    $0x1c,%esp
 459:	8b 75 08             	mov    0x8(%ebp),%esi
  int i, retval;
  for (i = 0; i < n; i++) {
 45c:	85 f6                	test   %esi,%esi
 45e:	7e 34                	jle    494 <join_all+0x44>
 460:	8d 7d e4             	lea    -0x1c(%ebp),%edi
 463:	31 db                	xor    %ebx,%ebx
 465:	8d 76 00             	lea    0x0(%esi),%esi
    if (thread_join(thread[i], (void **)&retval) != 0) {
 468:	83 ec 08             	sub    $0x8,%esp
 46b:	57                   	push   %edi
 46c:	ff 34 9d 98 11 00 00 	pushl  0x1198(,%ebx,4)
 473:	e8 4a 03 00 00       	call   7c2 <thread_join>
 478:	83 c4 10             	add    $0x10,%esp
 47b:	85 c0                	test   %eax,%eax
 47d:	75 1d                	jne    49c <join_all+0x4c>
      printf(1, "Error joining thread %d\n", i);
      failed();
    }
    if (retval != expected[i]) {
 47f:	8b 14 9d 84 11 00 00 	mov    0x1184(,%ebx,4),%edx
 486:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 489:	39 c2                	cmp    %eax,%edx
 48b:	75 24                	jne    4b1 <join_all+0x61>
}

void join_all(int n)
{
  int i, retval;
  for (i = 0; i < n; i++) {
 48d:	83 c3 01             	add    $0x1,%ebx
 490:	39 de                	cmp    %ebx,%esi
 492:	75 d4                	jne    468 <join_all+0x18>
    if (retval != expected[i]) {
      printf(1, "Thread %d returned %d, but expected %d\n", i, retval, expected[i]);
      failed();
    }
  }
}
 494:	8d 65 f4             	lea    -0xc(%ebp),%esp
 497:	5b                   	pop    %ebx
 498:	5e                   	pop    %esi
 499:	5f                   	pop    %edi
 49a:	5d                   	pop    %ebp
 49b:	c3                   	ret    
void join_all(int n)
{
  int i, retval;
  for (i = 0; i < n; i++) {
    if (thread_join(thread[i], (void **)&retval) != 0) {
      printf(1, "Error joining thread %d\n", i);
 49c:	83 ec 04             	sub    $0x4,%esp
 49f:	53                   	push   %ebx
 4a0:	68 63 0c 00 00       	push   $0xc63
 4a5:	6a 01                	push   $0x1
 4a7:	e8 d4 03 00 00       	call   880 <printf>
      failed();
 4ac:	e8 1f fd ff ff       	call   1d0 <failed>
    }
    if (retval != expected[i]) {
      printf(1, "Thread %d returned %d, but expected %d\n", i, retval, expected[i]);
 4b1:	83 ec 0c             	sub    $0xc,%esp
 4b4:	52                   	push   %edx
 4b5:	50                   	push   %eax
 4b6:	53                   	push   %ebx
 4b7:	68 18 0d 00 00       	push   $0xd18
 4bc:	6a 01                	push   $0x1
 4be:	e8 bd 03 00 00       	call   880 <printf>
      failed();
 4c3:	83 c4 20             	add    $0x20,%esp
 4c6:	e8 05 fd ff ff       	call   1d0 <failed>
 4cb:	66 90                	xchg   %ax,%ax
 4cd:	66 90                	xchg   %ax,%ax
 4cf:	90                   	nop

000004d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 4d0:	55                   	push   %ebp
 4d1:	89 e5                	mov    %esp,%ebp
 4d3:	53                   	push   %ebx
 4d4:	8b 45 08             	mov    0x8(%ebp),%eax
 4d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 4da:	89 c2                	mov    %eax,%edx
 4dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 4e0:	83 c1 01             	add    $0x1,%ecx
 4e3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 4e7:	83 c2 01             	add    $0x1,%edx
 4ea:	84 db                	test   %bl,%bl
 4ec:	88 5a ff             	mov    %bl,-0x1(%edx)
 4ef:	75 ef                	jne    4e0 <strcpy+0x10>
    ;
  return os;
}
 4f1:	5b                   	pop    %ebx
 4f2:	5d                   	pop    %ebp
 4f3:	c3                   	ret    
 4f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 4fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000500 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	56                   	push   %esi
 504:	53                   	push   %ebx
 505:	8b 55 08             	mov    0x8(%ebp),%edx
 508:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 50b:	0f b6 02             	movzbl (%edx),%eax
 50e:	0f b6 19             	movzbl (%ecx),%ebx
 511:	84 c0                	test   %al,%al
 513:	75 1e                	jne    533 <strcmp+0x33>
 515:	eb 29                	jmp    540 <strcmp+0x40>
 517:	89 f6                	mov    %esi,%esi
 519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
 520:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 523:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 526:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 529:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
 52d:	84 c0                	test   %al,%al
 52f:	74 0f                	je     540 <strcmp+0x40>
 531:	89 f1                	mov    %esi,%ecx
 533:	38 d8                	cmp    %bl,%al
 535:	74 e9                	je     520 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 537:	29 d8                	sub    %ebx,%eax
}
 539:	5b                   	pop    %ebx
 53a:	5e                   	pop    %esi
 53b:	5d                   	pop    %ebp
 53c:	c3                   	ret    
 53d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 540:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 542:	29 d8                	sub    %ebx,%eax
}
 544:	5b                   	pop    %ebx
 545:	5e                   	pop    %esi
 546:	5d                   	pop    %ebp
 547:	c3                   	ret    
 548:	90                   	nop
 549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000550 <strlen>:

uint
strlen(const char *s)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 556:	80 39 00             	cmpb   $0x0,(%ecx)
 559:	74 12                	je     56d <strlen+0x1d>
 55b:	31 d2                	xor    %edx,%edx
 55d:	8d 76 00             	lea    0x0(%esi),%esi
 560:	83 c2 01             	add    $0x1,%edx
 563:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 567:	89 d0                	mov    %edx,%eax
 569:	75 f5                	jne    560 <strlen+0x10>
    ;
  return n;
}
 56b:	5d                   	pop    %ebp
 56c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 56d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 56f:	5d                   	pop    %ebp
 570:	c3                   	ret    
 571:	eb 0d                	jmp    580 <memset>
 573:	90                   	nop
 574:	90                   	nop
 575:	90                   	nop
 576:	90                   	nop
 577:	90                   	nop
 578:	90                   	nop
 579:	90                   	nop
 57a:	90                   	nop
 57b:	90                   	nop
 57c:	90                   	nop
 57d:	90                   	nop
 57e:	90                   	nop
 57f:	90                   	nop

00000580 <memset>:

void*
memset(void *dst, int c, uint n)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	57                   	push   %edi
 584:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 587:	8b 4d 10             	mov    0x10(%ebp),%ecx
 58a:	8b 45 0c             	mov    0xc(%ebp),%eax
 58d:	89 d7                	mov    %edx,%edi
 58f:	fc                   	cld    
 590:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 592:	89 d0                	mov    %edx,%eax
 594:	5f                   	pop    %edi
 595:	5d                   	pop    %ebp
 596:	c3                   	ret    
 597:	89 f6                	mov    %esi,%esi
 599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005a0 <strchr>:

char*
strchr(const char *s, char c)
{
 5a0:	55                   	push   %ebp
 5a1:	89 e5                	mov    %esp,%ebp
 5a3:	53                   	push   %ebx
 5a4:	8b 45 08             	mov    0x8(%ebp),%eax
 5a7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
 5aa:	0f b6 10             	movzbl (%eax),%edx
 5ad:	84 d2                	test   %dl,%dl
 5af:	74 1d                	je     5ce <strchr+0x2e>
    if(*s == c)
 5b1:	38 d3                	cmp    %dl,%bl
 5b3:	89 d9                	mov    %ebx,%ecx
 5b5:	75 0d                	jne    5c4 <strchr+0x24>
 5b7:	eb 17                	jmp    5d0 <strchr+0x30>
 5b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 5c0:	38 ca                	cmp    %cl,%dl
 5c2:	74 0c                	je     5d0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 5c4:	83 c0 01             	add    $0x1,%eax
 5c7:	0f b6 10             	movzbl (%eax),%edx
 5ca:	84 d2                	test   %dl,%dl
 5cc:	75 f2                	jne    5c0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 5ce:	31 c0                	xor    %eax,%eax
}
 5d0:	5b                   	pop    %ebx
 5d1:	5d                   	pop    %ebp
 5d2:	c3                   	ret    
 5d3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 5d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000005e0 <gets>:

char*
gets(char *buf, int max)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	57                   	push   %edi
 5e4:	56                   	push   %esi
 5e5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5e6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
 5e8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
 5eb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5ee:	eb 29                	jmp    619 <gets+0x39>
    cc = read(0, &c, 1);
 5f0:	83 ec 04             	sub    $0x4,%esp
 5f3:	6a 01                	push   $0x1
 5f5:	57                   	push   %edi
 5f6:	6a 00                	push   $0x0
 5f8:	e8 2d 01 00 00       	call   72a <read>
    if(cc < 1)
 5fd:	83 c4 10             	add    $0x10,%esp
 600:	85 c0                	test   %eax,%eax
 602:	7e 1d                	jle    621 <gets+0x41>
      break;
    buf[i++] = c;
 604:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 608:	8b 55 08             	mov    0x8(%ebp),%edx
 60b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
 60d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 60f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 613:	74 1b                	je     630 <gets+0x50>
 615:	3c 0d                	cmp    $0xd,%al
 617:	74 17                	je     630 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 619:	8d 5e 01             	lea    0x1(%esi),%ebx
 61c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 61f:	7c cf                	jl     5f0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 621:	8b 45 08             	mov    0x8(%ebp),%eax
 624:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 628:	8d 65 f4             	lea    -0xc(%ebp),%esp
 62b:	5b                   	pop    %ebx
 62c:	5e                   	pop    %esi
 62d:	5f                   	pop    %edi
 62e:	5d                   	pop    %ebp
 62f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 630:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 633:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 635:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 639:	8d 65 f4             	lea    -0xc(%ebp),%esp
 63c:	5b                   	pop    %ebx
 63d:	5e                   	pop    %esi
 63e:	5f                   	pop    %edi
 63f:	5d                   	pop    %ebp
 640:	c3                   	ret    
 641:	eb 0d                	jmp    650 <stat>
 643:	90                   	nop
 644:	90                   	nop
 645:	90                   	nop
 646:	90                   	nop
 647:	90                   	nop
 648:	90                   	nop
 649:	90                   	nop
 64a:	90                   	nop
 64b:	90                   	nop
 64c:	90                   	nop
 64d:	90                   	nop
 64e:	90                   	nop
 64f:	90                   	nop

00000650 <stat>:

int
stat(const char *n, struct stat *st)
{
 650:	55                   	push   %ebp
 651:	89 e5                	mov    %esp,%ebp
 653:	56                   	push   %esi
 654:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 655:	83 ec 08             	sub    $0x8,%esp
 658:	6a 00                	push   $0x0
 65a:	ff 75 08             	pushl  0x8(%ebp)
 65d:	e8 f0 00 00 00       	call   752 <open>
  if(fd < 0)
 662:	83 c4 10             	add    $0x10,%esp
 665:	85 c0                	test   %eax,%eax
 667:	78 27                	js     690 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 669:	83 ec 08             	sub    $0x8,%esp
 66c:	ff 75 0c             	pushl  0xc(%ebp)
 66f:	89 c3                	mov    %eax,%ebx
 671:	50                   	push   %eax
 672:	e8 f3 00 00 00       	call   76a <fstat>
 677:	89 c6                	mov    %eax,%esi
  close(fd);
 679:	89 1c 24             	mov    %ebx,(%esp)
 67c:	e8 b9 00 00 00       	call   73a <close>
  return r;
 681:	83 c4 10             	add    $0x10,%esp
 684:	89 f0                	mov    %esi,%eax
}
 686:	8d 65 f8             	lea    -0x8(%ebp),%esp
 689:	5b                   	pop    %ebx
 68a:	5e                   	pop    %esi
 68b:	5d                   	pop    %ebp
 68c:	c3                   	ret    
 68d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 690:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 695:	eb ef                	jmp    686 <stat+0x36>
 697:	89 f6                	mov    %esi,%esi
 699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006a0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	53                   	push   %ebx
 6a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 6a7:	0f be 11             	movsbl (%ecx),%edx
 6aa:	8d 42 d0             	lea    -0x30(%edx),%eax
 6ad:	3c 09                	cmp    $0x9,%al
 6af:	b8 00 00 00 00       	mov    $0x0,%eax
 6b4:	77 1f                	ja     6d5 <atoi+0x35>
 6b6:	8d 76 00             	lea    0x0(%esi),%esi
 6b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 6c0:	8d 04 80             	lea    (%eax,%eax,4),%eax
 6c3:	83 c1 01             	add    $0x1,%ecx
 6c6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 6ca:	0f be 11             	movsbl (%ecx),%edx
 6cd:	8d 5a d0             	lea    -0x30(%edx),%ebx
 6d0:	80 fb 09             	cmp    $0x9,%bl
 6d3:	76 eb                	jbe    6c0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
 6d5:	5b                   	pop    %ebx
 6d6:	5d                   	pop    %ebp
 6d7:	c3                   	ret    
 6d8:	90                   	nop
 6d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000006e0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	56                   	push   %esi
 6e4:	53                   	push   %ebx
 6e5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6e8:	8b 45 08             	mov    0x8(%ebp),%eax
 6eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 6ee:	85 db                	test   %ebx,%ebx
 6f0:	7e 14                	jle    706 <memmove+0x26>
 6f2:	31 d2                	xor    %edx,%edx
 6f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 6f8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 6fc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 6ff:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 702:	39 da                	cmp    %ebx,%edx
 704:	75 f2                	jne    6f8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 706:	5b                   	pop    %ebx
 707:	5e                   	pop    %esi
 708:	5d                   	pop    %ebp
 709:	c3                   	ret    

0000070a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 70a:	b8 01 00 00 00       	mov    $0x1,%eax
 70f:	cd 40                	int    $0x40
 711:	c3                   	ret    

00000712 <exit>:
SYSCALL(exit)
 712:	b8 02 00 00 00       	mov    $0x2,%eax
 717:	cd 40                	int    $0x40
 719:	c3                   	ret    

0000071a <wait>:
SYSCALL(wait)
 71a:	b8 03 00 00 00       	mov    $0x3,%eax
 71f:	cd 40                	int    $0x40
 721:	c3                   	ret    

00000722 <pipe>:
SYSCALL(pipe)
 722:	b8 04 00 00 00       	mov    $0x4,%eax
 727:	cd 40                	int    $0x40
 729:	c3                   	ret    

0000072a <read>:
SYSCALL(read)
 72a:	b8 05 00 00 00       	mov    $0x5,%eax
 72f:	cd 40                	int    $0x40
 731:	c3                   	ret    

00000732 <write>:
SYSCALL(write)
 732:	b8 10 00 00 00       	mov    $0x10,%eax
 737:	cd 40                	int    $0x40
 739:	c3                   	ret    

0000073a <close>:
SYSCALL(close)
 73a:	b8 15 00 00 00       	mov    $0x15,%eax
 73f:	cd 40                	int    $0x40
 741:	c3                   	ret    

00000742 <kill>:
SYSCALL(kill)
 742:	b8 06 00 00 00       	mov    $0x6,%eax
 747:	cd 40                	int    $0x40
 749:	c3                   	ret    

0000074a <exec>:
SYSCALL(exec)
 74a:	b8 07 00 00 00       	mov    $0x7,%eax
 74f:	cd 40                	int    $0x40
 751:	c3                   	ret    

00000752 <open>:
SYSCALL(open)
 752:	b8 0f 00 00 00       	mov    $0xf,%eax
 757:	cd 40                	int    $0x40
 759:	c3                   	ret    

0000075a <mknod>:
SYSCALL(mknod)
 75a:	b8 11 00 00 00       	mov    $0x11,%eax
 75f:	cd 40                	int    $0x40
 761:	c3                   	ret    

00000762 <unlink>:
SYSCALL(unlink)
 762:	b8 12 00 00 00       	mov    $0x12,%eax
 767:	cd 40                	int    $0x40
 769:	c3                   	ret    

0000076a <fstat>:
SYSCALL(fstat)
 76a:	b8 08 00 00 00       	mov    $0x8,%eax
 76f:	cd 40                	int    $0x40
 771:	c3                   	ret    

00000772 <link>:
SYSCALL(link)
 772:	b8 13 00 00 00       	mov    $0x13,%eax
 777:	cd 40                	int    $0x40
 779:	c3                   	ret    

0000077a <mkdir>:
SYSCALL(mkdir)
 77a:	b8 14 00 00 00       	mov    $0x14,%eax
 77f:	cd 40                	int    $0x40
 781:	c3                   	ret    

00000782 <chdir>:
SYSCALL(chdir)
 782:	b8 09 00 00 00       	mov    $0x9,%eax
 787:	cd 40                	int    $0x40
 789:	c3                   	ret    

0000078a <dup>:
SYSCALL(dup)
 78a:	b8 0a 00 00 00       	mov    $0xa,%eax
 78f:	cd 40                	int    $0x40
 791:	c3                   	ret    

00000792 <getpid>:
SYSCALL(getpid)
 792:	b8 0b 00 00 00       	mov    $0xb,%eax
 797:	cd 40                	int    $0x40
 799:	c3                   	ret    

0000079a <sbrk>:
SYSCALL(sbrk)
 79a:	b8 0c 00 00 00       	mov    $0xc,%eax
 79f:	cd 40                	int    $0x40
 7a1:	c3                   	ret    

000007a2 <sleep>:
SYSCALL(sleep)
 7a2:	b8 0d 00 00 00       	mov    $0xd,%eax
 7a7:	cd 40                	int    $0x40
 7a9:	c3                   	ret    

000007aa <uptime>:
SYSCALL(uptime)
 7aa:	b8 0e 00 00 00       	mov    $0xe,%eax
 7af:	cd 40                	int    $0x40
 7b1:	c3                   	ret    

000007b2 <thread_create>:
SYSCALL(thread_create)
 7b2:	b8 16 00 00 00       	mov    $0x16,%eax
 7b7:	cd 40                	int    $0x40
 7b9:	c3                   	ret    

000007ba <thread_exit>:
SYSCALL(thread_exit)
 7ba:	b8 17 00 00 00       	mov    $0x17,%eax
 7bf:	cd 40                	int    $0x40
 7c1:	c3                   	ret    

000007c2 <thread_join>:
SYSCALL(thread_join)
 7c2:	b8 18 00 00 00       	mov    $0x18,%eax
 7c7:	cd 40                	int    $0x40
 7c9:	c3                   	ret    

000007ca <ex>:
SYSCALL(ex)
 7ca:	b8 19 00 00 00       	mov    $0x19,%eax
 7cf:	cd 40                	int    $0x40
 7d1:	c3                   	ret    
 7d2:	66 90                	xchg   %ax,%ax
 7d4:	66 90                	xchg   %ax,%ax
 7d6:	66 90                	xchg   %ax,%ax
 7d8:	66 90                	xchg   %ax,%ax
 7da:	66 90                	xchg   %ax,%ax
 7dc:	66 90                	xchg   %ax,%ax
 7de:	66 90                	xchg   %ax,%ax

000007e0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 7e0:	55                   	push   %ebp
 7e1:	89 e5                	mov    %esp,%ebp
 7e3:	57                   	push   %edi
 7e4:	56                   	push   %esi
 7e5:	53                   	push   %ebx
 7e6:	89 c6                	mov    %eax,%esi
 7e8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 7eb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7ee:	85 db                	test   %ebx,%ebx
 7f0:	74 7e                	je     870 <printint+0x90>
 7f2:	89 d0                	mov    %edx,%eax
 7f4:	c1 e8 1f             	shr    $0x1f,%eax
 7f7:	84 c0                	test   %al,%al
 7f9:	74 75                	je     870 <printint+0x90>
    neg = 1;
    x = -xx;
 7fb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 7fd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
 804:	f7 d8                	neg    %eax
 806:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 809:	31 ff                	xor    %edi,%edi
 80b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 80e:	89 ce                	mov    %ecx,%esi
 810:	eb 08                	jmp    81a <printint+0x3a>
 812:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
 818:	89 cf                	mov    %ecx,%edi
 81a:	31 d2                	xor    %edx,%edx
 81c:	8d 4f 01             	lea    0x1(%edi),%ecx
 81f:	f7 f6                	div    %esi
 821:	0f b6 92 e4 0d 00 00 	movzbl 0xde4(%edx),%edx
  }while((x /= base) != 0);
 828:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 82a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 82d:	75 e9                	jne    818 <printint+0x38>
  if(neg)
 82f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 832:	8b 75 c0             	mov    -0x40(%ebp),%esi
 835:	85 c0                	test   %eax,%eax
 837:	74 08                	je     841 <printint+0x61>
    buf[i++] = '-';
 839:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
 83e:	8d 4f 02             	lea    0x2(%edi),%ecx
 841:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
 845:	8d 76 00             	lea    0x0(%esi),%esi
 848:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 84b:	83 ec 04             	sub    $0x4,%esp
 84e:	83 ef 01             	sub    $0x1,%edi
 851:	6a 01                	push   $0x1
 853:	53                   	push   %ebx
 854:	56                   	push   %esi
 855:	88 45 d7             	mov    %al,-0x29(%ebp)
 858:	e8 d5 fe ff ff       	call   732 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 85d:	83 c4 10             	add    $0x10,%esp
 860:	39 df                	cmp    %ebx,%edi
 862:	75 e4                	jne    848 <printint+0x68>
    putc(fd, buf[i]);
}
 864:	8d 65 f4             	lea    -0xc(%ebp),%esp
 867:	5b                   	pop    %ebx
 868:	5e                   	pop    %esi
 869:	5f                   	pop    %edi
 86a:	5d                   	pop    %ebp
 86b:	c3                   	ret    
 86c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 870:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 872:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 879:	eb 8b                	jmp    806 <printint+0x26>
 87b:	90                   	nop
 87c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000880 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	57                   	push   %edi
 884:	56                   	push   %esi
 885:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 886:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 889:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 88c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 88f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 892:	89 45 d0             	mov    %eax,-0x30(%ebp)
 895:	0f b6 1e             	movzbl (%esi),%ebx
 898:	83 c6 01             	add    $0x1,%esi
 89b:	84 db                	test   %bl,%bl
 89d:	0f 84 b0 00 00 00    	je     953 <printf+0xd3>
 8a3:	31 d2                	xor    %edx,%edx
 8a5:	eb 39                	jmp    8e0 <printf+0x60>
 8a7:	89 f6                	mov    %esi,%esi
 8a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8b0:	83 f8 25             	cmp    $0x25,%eax
 8b3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
 8b6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 8bb:	74 18                	je     8d5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 8bd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 8c0:	83 ec 04             	sub    $0x4,%esp
 8c3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 8c6:	6a 01                	push   $0x1
 8c8:	50                   	push   %eax
 8c9:	57                   	push   %edi
 8ca:	e8 63 fe ff ff       	call   732 <write>
 8cf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
 8d2:	83 c4 10             	add    $0x10,%esp
 8d5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8d8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 8dc:	84 db                	test   %bl,%bl
 8de:	74 73                	je     953 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
 8e0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 8e2:	0f be cb             	movsbl %bl,%ecx
 8e5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 8e8:	74 c6                	je     8b0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 8ea:	83 fa 25             	cmp    $0x25,%edx
 8ed:	75 e6                	jne    8d5 <printf+0x55>
      if(c == 'd'){
 8ef:	83 f8 64             	cmp    $0x64,%eax
 8f2:	0f 84 f8 00 00 00    	je     9f0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 8f8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 8fe:	83 f9 70             	cmp    $0x70,%ecx
 901:	74 5d                	je     960 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 903:	83 f8 73             	cmp    $0x73,%eax
 906:	0f 84 84 00 00 00    	je     990 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 90c:	83 f8 63             	cmp    $0x63,%eax
 90f:	0f 84 ea 00 00 00    	je     9ff <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 915:	83 f8 25             	cmp    $0x25,%eax
 918:	0f 84 c2 00 00 00    	je     9e0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 91e:	8d 45 e7             	lea    -0x19(%ebp),%eax
 921:	83 ec 04             	sub    $0x4,%esp
 924:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 928:	6a 01                	push   $0x1
 92a:	50                   	push   %eax
 92b:	57                   	push   %edi
 92c:	e8 01 fe ff ff       	call   732 <write>
 931:	83 c4 0c             	add    $0xc,%esp
 934:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 937:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 93a:	6a 01                	push   $0x1
 93c:	50                   	push   %eax
 93d:	57                   	push   %edi
 93e:	83 c6 01             	add    $0x1,%esi
 941:	e8 ec fd ff ff       	call   732 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 946:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 94a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 94d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 94f:	84 db                	test   %bl,%bl
 951:	75 8d                	jne    8e0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 953:	8d 65 f4             	lea    -0xc(%ebp),%esp
 956:	5b                   	pop    %ebx
 957:	5e                   	pop    %esi
 958:	5f                   	pop    %edi
 959:	5d                   	pop    %ebp
 95a:	c3                   	ret    
 95b:	90                   	nop
 95c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 960:	83 ec 0c             	sub    $0xc,%esp
 963:	b9 10 00 00 00       	mov    $0x10,%ecx
 968:	6a 00                	push   $0x0
 96a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
 96d:	89 f8                	mov    %edi,%eax
 96f:	8b 13                	mov    (%ebx),%edx
 971:	e8 6a fe ff ff       	call   7e0 <printint>
        ap++;
 976:	89 d8                	mov    %ebx,%eax
 978:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 97b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
 97d:	83 c0 04             	add    $0x4,%eax
 980:	89 45 d0             	mov    %eax,-0x30(%ebp)
 983:	e9 4d ff ff ff       	jmp    8d5 <printf+0x55>
 988:	90                   	nop
 989:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 990:	8b 45 d0             	mov    -0x30(%ebp),%eax
 993:	8b 18                	mov    (%eax),%ebx
        ap++;
 995:	83 c0 04             	add    $0x4,%eax
 998:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
 99b:	b8 dc 0d 00 00       	mov    $0xddc,%eax
 9a0:	85 db                	test   %ebx,%ebx
 9a2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
 9a5:	0f b6 03             	movzbl (%ebx),%eax
 9a8:	84 c0                	test   %al,%al
 9aa:	74 23                	je     9cf <printf+0x14f>
 9ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 9b0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9b3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
 9b6:	83 ec 04             	sub    $0x4,%esp
 9b9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 9bb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9be:	50                   	push   %eax
 9bf:	57                   	push   %edi
 9c0:	e8 6d fd ff ff       	call   732 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 9c5:	0f b6 03             	movzbl (%ebx),%eax
 9c8:	83 c4 10             	add    $0x10,%esp
 9cb:	84 c0                	test   %al,%al
 9cd:	75 e1                	jne    9b0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 9cf:	31 d2                	xor    %edx,%edx
 9d1:	e9 ff fe ff ff       	jmp    8d5 <printf+0x55>
 9d6:	8d 76 00             	lea    0x0(%esi),%esi
 9d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 9e0:	83 ec 04             	sub    $0x4,%esp
 9e3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 9e6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 9e9:	6a 01                	push   $0x1
 9eb:	e9 4c ff ff ff       	jmp    93c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 9f0:	83 ec 0c             	sub    $0xc,%esp
 9f3:	b9 0a 00 00 00       	mov    $0xa,%ecx
 9f8:	6a 01                	push   $0x1
 9fa:	e9 6b ff ff ff       	jmp    96a <printf+0xea>
 9ff:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 a02:	83 ec 04             	sub    $0x4,%esp
 a05:	8b 03                	mov    (%ebx),%eax
 a07:	6a 01                	push   $0x1
 a09:	88 45 e4             	mov    %al,-0x1c(%ebp)
 a0c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 a0f:	50                   	push   %eax
 a10:	57                   	push   %edi
 a11:	e8 1c fd ff ff       	call   732 <write>
 a16:	e9 5b ff ff ff       	jmp    976 <printf+0xf6>
 a1b:	66 90                	xchg   %ax,%ax
 a1d:	66 90                	xchg   %ax,%ax
 a1f:	90                   	nop

00000a20 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a20:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a21:	a1 78 11 00 00       	mov    0x1178,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 a26:	89 e5                	mov    %esp,%ebp
 a28:	57                   	push   %edi
 a29:	56                   	push   %esi
 a2a:	53                   	push   %ebx
 a2b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a2e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a30:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a33:	39 c8                	cmp    %ecx,%eax
 a35:	73 19                	jae    a50 <free+0x30>
 a37:	89 f6                	mov    %esi,%esi
 a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 a40:	39 d1                	cmp    %edx,%ecx
 a42:	72 1c                	jb     a60 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a44:	39 d0                	cmp    %edx,%eax
 a46:	73 18                	jae    a60 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
 a48:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a4a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a4c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a4e:	72 f0                	jb     a40 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a50:	39 d0                	cmp    %edx,%eax
 a52:	72 f4                	jb     a48 <free+0x28>
 a54:	39 d1                	cmp    %edx,%ecx
 a56:	73 f0                	jae    a48 <free+0x28>
 a58:	90                   	nop
 a59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
 a60:	8b 73 fc             	mov    -0x4(%ebx),%esi
 a63:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 a66:	39 d7                	cmp    %edx,%edi
 a68:	74 19                	je     a83 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 a6a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 a6d:	8b 50 04             	mov    0x4(%eax),%edx
 a70:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a73:	39 f1                	cmp    %esi,%ecx
 a75:	74 23                	je     a9a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 a77:	89 08                	mov    %ecx,(%eax)
  freep = p;
 a79:	a3 78 11 00 00       	mov    %eax,0x1178
}
 a7e:	5b                   	pop    %ebx
 a7f:	5e                   	pop    %esi
 a80:	5f                   	pop    %edi
 a81:	5d                   	pop    %ebp
 a82:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 a83:	03 72 04             	add    0x4(%edx),%esi
 a86:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 a89:	8b 10                	mov    (%eax),%edx
 a8b:	8b 12                	mov    (%edx),%edx
 a8d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 a90:	8b 50 04             	mov    0x4(%eax),%edx
 a93:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 a96:	39 f1                	cmp    %esi,%ecx
 a98:	75 dd                	jne    a77 <free+0x57>
    p->s.size += bp->s.size;
 a9a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 a9d:	a3 78 11 00 00       	mov    %eax,0x1178
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 aa2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 aa5:	8b 53 f8             	mov    -0x8(%ebx),%edx
 aa8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 aaa:	5b                   	pop    %ebx
 aab:	5e                   	pop    %esi
 aac:	5f                   	pop    %edi
 aad:	5d                   	pop    %ebp
 aae:	c3                   	ret    
 aaf:	90                   	nop

00000ab0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
 ab3:	57                   	push   %edi
 ab4:	56                   	push   %esi
 ab5:	53                   	push   %ebx
 ab6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ab9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 abc:	8b 15 78 11 00 00    	mov    0x1178,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 ac2:	8d 78 07             	lea    0x7(%eax),%edi
 ac5:	c1 ef 03             	shr    $0x3,%edi
 ac8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 acb:	85 d2                	test   %edx,%edx
 acd:	0f 84 a3 00 00 00    	je     b76 <malloc+0xc6>
 ad3:	8b 02                	mov    (%edx),%eax
 ad5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 ad8:	39 cf                	cmp    %ecx,%edi
 ada:	76 74                	jbe    b50 <malloc+0xa0>
 adc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 ae2:	be 00 10 00 00       	mov    $0x1000,%esi
 ae7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
 aee:	0f 43 f7             	cmovae %edi,%esi
 af1:	ba 00 80 00 00       	mov    $0x8000,%edx
 af6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
 afc:	0f 46 da             	cmovbe %edx,%ebx
 aff:	eb 10                	jmp    b11 <malloc+0x61>
 b01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b08:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 b0a:	8b 48 04             	mov    0x4(%eax),%ecx
 b0d:	39 cf                	cmp    %ecx,%edi
 b0f:	76 3f                	jbe    b50 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 b11:	39 05 78 11 00 00    	cmp    %eax,0x1178
 b17:	89 c2                	mov    %eax,%edx
 b19:	75 ed                	jne    b08 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 b1b:	83 ec 0c             	sub    $0xc,%esp
 b1e:	53                   	push   %ebx
 b1f:	e8 76 fc ff ff       	call   79a <sbrk>
  if(p == (char*)-1)
 b24:	83 c4 10             	add    $0x10,%esp
 b27:	83 f8 ff             	cmp    $0xffffffff,%eax
 b2a:	74 1c                	je     b48 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 b2c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
 b2f:	83 ec 0c             	sub    $0xc,%esp
 b32:	83 c0 08             	add    $0x8,%eax
 b35:	50                   	push   %eax
 b36:	e8 e5 fe ff ff       	call   a20 <free>
  return freep;
 b3b:	8b 15 78 11 00 00    	mov    0x1178,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 b41:	83 c4 10             	add    $0x10,%esp
 b44:	85 d2                	test   %edx,%edx
 b46:	75 c0                	jne    b08 <malloc+0x58>
        return 0;
 b48:	31 c0                	xor    %eax,%eax
 b4a:	eb 1c                	jmp    b68 <malloc+0xb8>
 b4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
 b50:	39 cf                	cmp    %ecx,%edi
 b52:	74 1c                	je     b70 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 b54:	29 f9                	sub    %edi,%ecx
 b56:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 b59:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 b5c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
 b5f:	89 15 78 11 00 00    	mov    %edx,0x1178
      return (void*)(p + 1);
 b65:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 b68:	8d 65 f4             	lea    -0xc(%ebp),%esp
 b6b:	5b                   	pop    %ebx
 b6c:	5e                   	pop    %esi
 b6d:	5f                   	pop    %edi
 b6e:	5d                   	pop    %ebp
 b6f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 b70:	8b 08                	mov    (%eax),%ecx
 b72:	89 0a                	mov    %ecx,(%edx)
 b74:	eb e9                	jmp    b5f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 b76:	c7 05 78 11 00 00 7c 	movl   $0x117c,0x1178
 b7d:	11 00 00 
 b80:	c7 05 7c 11 00 00 7c 	movl   $0x117c,0x117c
 b87:	11 00 00 
    base.s.size = 0;
 b8a:	b8 7c 11 00 00       	mov    $0x117c,%eax
 b8f:	c7 05 80 11 00 00 00 	movl   $0x0,0x1180
 b96:	00 00 00 
 b99:	e9 3e ff ff ff       	jmp    adc <malloc+0x2c>
