
_threadtest:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  "sleeptest",
};

int
main(int argc, char *argv[])
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
      11:	83 ec 28             	sub    $0x28,%esp
      14:	8b 39                	mov    (%ecx),%edi
      16:	8b 51 04             	mov    0x4(%ecx),%edx
  int i;
  int ret;
  int pid;
  int start = 0;
  int end = NTEST-1;
  if (argc >= 2)
      19:	83 ff 01             	cmp    $0x1,%edi
      1c:	0f 8e 1b 01 00 00    	jle    13d <main+0x13d>
    start = atoi(argv[1]);
      22:	83 ec 0c             	sub    $0xc,%esp
      25:	ff 72 04             	pushl  0x4(%edx)
      28:	89 55 d4             	mov    %edx,-0x2c(%ebp)
{
  int i;
  int ret;
  int pid;
  int start = 0;
  int end = NTEST-1;
      2b:	be 0d 00 00 00       	mov    $0xd,%esi
  if (argc >= 2)
    start = atoi(argv[1]);
      30:	e8 ab 0d 00 00       	call   de0 <atoi>
  if (argc >= 3)
      35:	83 c4 10             	add    $0x10,%esp
      38:	83 ff 02             	cmp    $0x2,%edi
  int ret;
  int pid;
  int start = 0;
  int end = NTEST-1;
  if (argc >= 2)
    start = atoi(argv[1]);
      3b:	89 c3                	mov    %eax,%ebx
  if (argc >= 3)
      3d:	74 13                	je     52 <main+0x52>
    end = atoi(argv[2]);
      3f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      42:	83 ec 0c             	sub    $0xc,%esp
      45:	ff 72 08             	pushl  0x8(%edx)
      48:	e8 93 0d 00 00       	call   de0 <atoi>
      4d:	83 c4 10             	add    $0x10,%esp
      50:	89 c6                	mov    %eax,%esi

  for (i = start; i <= end; i++){
      52:	39 de                	cmp    %ebx,%esi
      54:	0f 8c 08 01 00 00    	jl     162 <main+0x162>
      write(gpipe[1], (char*)&ret, sizeof(ret));
      close(gpipe[1]);
      exit();
    } else{
      close(gpipe[1]);
      if (wait() == -1 || read(gpipe[0], (char*)&ret, sizeof(ret)) == -1 || ret != 0){
      5a:	8d 7d e4             	lea    -0x1c(%ebp),%edi
      5d:	e9 9d 00 00 00       	jmp    ff <main+0xff>
      62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1,"%d. %s start\n", i, testname[i]);
    if (pipe(gpipe) < 0){
      printf(1,"pipe panic\n");
      exit();
    }
    ret = 0;
      68:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)

    if ((pid = fork()) < 0){
      6f:	e8 d6 0d 00 00       	call   e4a <fork>
      74:	85 c0                	test   %eax,%eax
      76:	0f 88 eb 00 00 00    	js     167 <main+0x167>
      printf(1,"fork panic\n");
      exit();
    }
    if (pid == 0){
      7c:	0f 84 f8 00 00 00    	je     17a <main+0x17a>
      ret = testfunc[i]();
      write(gpipe[1], (char*)&ret, sizeof(ret));
      close(gpipe[1]);
      exit();
    } else{
      close(gpipe[1]);
      82:	83 ec 0c             	sub    $0xc,%esp
      85:	ff 35 ec 1b 00 00    	pushl  0x1bec
      8b:	e8 ea 0d 00 00       	call   e7a <close>
      if (wait() == -1 || read(gpipe[0], (char*)&ret, sizeof(ret)) == -1 || ret != 0){
      90:	e8 c5 0d 00 00       	call   e5a <wait>
      95:	83 c4 10             	add    $0x10,%esp
      98:	83 f8 ff             	cmp    $0xffffffff,%eax
      9b:	0f 84 a8 00 00 00    	je     149 <main+0x149>
      a1:	83 ec 04             	sub    $0x4,%esp
      a4:	6a 04                	push   $0x4
      a6:	57                   	push   %edi
      a7:	ff 35 e8 1b 00 00    	pushl  0x1be8
      ad:	e8 b8 0d 00 00       	call   e6a <read>
      b2:	83 c4 10             	add    $0x10,%esp
      b5:	83 f8 ff             	cmp    $0xffffffff,%eax
      b8:	0f 84 8b 00 00 00    	je     149 <main+0x149>
      be:	8b 45 e4             	mov    -0x1c(%ebp),%eax
      c1:	85 c0                	test   %eax,%eax
      c3:	0f 85 80 00 00 00    	jne    149 <main+0x149>
        printf(1,"%d. %s panic\n", i, testname[i]);
        exit();
      }
      close(gpipe[0]);
      c9:	83 ec 0c             	sub    $0xc,%esp
      cc:	ff 35 e8 1b 00 00    	pushl  0x1be8
      d2:	e8 a3 0d 00 00       	call   e7a <close>
    }
    printf(1,"%d. %s finish\n", i, testname[i]);
      d7:	ff 34 9d 60 1b 00 00 	pushl  0x1b60(,%ebx,4)
      de:	53                   	push   %ebx
  if (argc >= 2)
    start = atoi(argv[1]);
  if (argc >= 3)
    end = atoi(argv[2]);

  for (i = start; i <= end; i++){
      df:	83 c3 01             	add    $0x1,%ebx
        printf(1,"%d. %s panic\n", i, testname[i]);
        exit();
      }
      close(gpipe[0]);
    }
    printf(1,"%d. %s finish\n", i, testname[i]);
      e2:	68 d6 13 00 00       	push   $0x13d6
      e7:	6a 01                	push   $0x1
      e9:	e8 d2 0e 00 00       	call   fc0 <printf>
    sleep(100);
      ee:	83 c4 14             	add    $0x14,%esp
      f1:	6a 64                	push   $0x64
      f3:	e8 ea 0d 00 00       	call   ee2 <sleep>
  if (argc >= 2)
    start = atoi(argv[1]);
  if (argc >= 3)
    end = atoi(argv[2]);

  for (i = start; i <= end; i++){
      f8:	83 c4 10             	add    $0x10,%esp
      fb:	39 f3                	cmp    %esi,%ebx
      fd:	7f 63                	jg     162 <main+0x162>
    printf(1,"%d. %s start\n", i, testname[i]);
      ff:	ff 34 9d 60 1b 00 00 	pushl  0x1b60(,%ebx,4)
     106:	53                   	push   %ebx
     107:	68 a2 13 00 00       	push   $0x13a2
     10c:	6a 01                	push   $0x1
     10e:	e8 ad 0e 00 00       	call   fc0 <printf>
    if (pipe(gpipe) < 0){
     113:	c7 04 24 e8 1b 00 00 	movl   $0x1be8,(%esp)
     11a:	e8 43 0d 00 00       	call   e62 <pipe>
     11f:	83 c4 10             	add    $0x10,%esp
     122:	85 c0                	test   %eax,%eax
     124:	0f 89 3e ff ff ff    	jns    68 <main+0x68>
      printf(1,"pipe panic\n");
     12a:	53                   	push   %ebx
     12b:	53                   	push   %ebx
     12c:	68 b0 13 00 00       	push   $0x13b0
     131:	6a 01                	push   $0x1
     133:	e8 88 0e 00 00       	call   fc0 <printf>
      exit();
     138:	e8 15 0d 00 00       	call   e52 <exit>
main(int argc, char *argv[])
{
  int i;
  int ret;
  int pid;
  int start = 0;
     13d:	31 db                	xor    %ebx,%ebx
  int end = NTEST-1;
     13f:	be 0d 00 00 00       	mov    $0xd,%esi
     144:	e9 11 ff ff ff       	jmp    5a <main+0x5a>
      close(gpipe[1]);
      exit();
    } else{
      close(gpipe[1]);
      if (wait() == -1 || read(gpipe[0], (char*)&ret, sizeof(ret)) == -1 || ret != 0){
        printf(1,"%d. %s panic\n", i, testname[i]);
     149:	ff 34 9d 60 1b 00 00 	pushl  0x1b60(,%ebx,4)
     150:	53                   	push   %ebx
     151:	68 c8 13 00 00       	push   $0x13c8
     156:	6a 01                	push   $0x1
     158:	e8 63 0e 00 00       	call   fc0 <printf>
        exit();
     15d:	e8 f0 0c 00 00       	call   e52 <exit>
      close(gpipe[0]);
    }
    printf(1,"%d. %s finish\n", i, testname[i]);
    sleep(100);
  }
  exit();
     162:	e8 eb 0c 00 00       	call   e52 <exit>
      exit();
    }
    ret = 0;

    if ((pid = fork()) < 0){
      printf(1,"fork panic\n");
     167:	51                   	push   %ecx
     168:	51                   	push   %ecx
     169:	68 bc 13 00 00       	push   $0x13bc
     16e:	6a 01                	push   $0x1
     170:	e8 4b 0e 00 00       	call   fc0 <printf>
      exit();
     175:	e8 d8 0c 00 00       	call   e52 <exit>
    }
    if (pid == 0){
      close(gpipe[0]);
     17a:	83 ec 0c             	sub    $0xc,%esp
     17d:	ff 35 e8 1b 00 00    	pushl  0x1be8
     183:	e8 f2 0c 00 00       	call   e7a <close>
      ret = testfunc[i]();
     188:	ff 14 9d a0 1b 00 00 	call   *0x1ba0(,%ebx,4)
     18f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      write(gpipe[1], (char*)&ret, sizeof(ret));
     192:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     195:	83 c4 0c             	add    $0xc,%esp
     198:	6a 04                	push   $0x4
     19a:	50                   	push   %eax
     19b:	ff 35 ec 1b 00 00    	pushl  0x1bec
     1a1:	e8 cc 0c 00 00       	call   e72 <write>
      close(gpipe[1]);
     1a6:	5a                   	pop    %edx
     1a7:	ff 35 ec 1b 00 00    	pushl  0x1bec
     1ad:	e8 c8 0c 00 00       	call   e7a <close>
      exit();
     1b2:	e8 9b 0c 00 00       	call   e52 <exit>
     1b7:	66 90                	xchg   %ax,%ax
     1b9:	66 90                	xchg   %ax,%ax
     1bb:	66 90                	xchg   %ax,%ax
     1bd:	66 90                	xchg   %ax,%ax
     1bf:	90                   	nop

000001c0 <killtest>:
	return 0;
}

int
killtest(void)
{
     1c0:	55                   	push   %ebp
  return 0;
}
     1c1:	31 c0                	xor    %eax,%eax
	return 0;
}

int
killtest(void)
{
     1c3:	89 e5                	mov    %esp,%ebp
  return 0;
}
     1c5:	5d                   	pop    %ebp
     1c6:	c3                   	ret    
     1c7:	89 f6                	mov    %esi,%esi
     1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001d0 <basicthreadmain>:
}

// ============================================================================
void*
basicthreadmain(void *arg)
{
     1d0:	55                   	push   %ebp
     1d1:	89 e5                	mov    %esp,%ebp
     1d3:	57                   	push   %edi
     1d4:	56                   	push   %esi
     1d5:	53                   	push   %ebx
  int tid = (int) arg;
  int i;
  for (i = 0; i < 100000000; i++){
    if (i % 20000000 == 0){
     1d6:	bf 6b ca 5f 6b       	mov    $0x6b5fca6b,%edi
void*
basicthreadmain(void *arg)
{
  int tid = (int) arg;
  int i;
  for (i = 0; i < 100000000; i++){
     1db:	31 db                	xor    %ebx,%ebx
}

// ============================================================================
void*
basicthreadmain(void *arg)
{
     1dd:	83 ec 0c             	sub    $0xc,%esp
     1e0:	8b 75 08             	mov    0x8(%ebp),%esi
     1e3:	eb 0e                	jmp    1f3 <basicthreadmain+0x23>
     1e5:	8d 76 00             	lea    0x0(%esi),%esi
  int tid = (int) arg;
  int i;
  for (i = 0; i < 100000000; i++){
     1e8:	83 c3 01             	add    $0x1,%ebx
     1eb:	81 fb 00 e1 f5 05    	cmp    $0x5f5e100,%ebx
     1f1:	74 36                	je     229 <basicthreadmain+0x59>
    if (i % 20000000 == 0){
     1f3:	89 d8                	mov    %ebx,%eax
     1f5:	f7 ef                	imul   %edi
     1f7:	89 d8                	mov    %ebx,%eax
     1f9:	c1 f8 1f             	sar    $0x1f,%eax
     1fc:	c1 fa 17             	sar    $0x17,%edx
     1ff:	29 c2                	sub    %eax,%edx
     201:	69 d2 00 2d 31 01    	imul   $0x1312d00,%edx,%edx
     207:	39 d3                	cmp    %edx,%ebx
     209:	75 dd                	jne    1e8 <basicthreadmain+0x18>
      printf(1, "%d", tid);
     20b:	83 ec 04             	sub    $0x4,%esp
void*
basicthreadmain(void *arg)
{
  int tid = (int) arg;
  int i;
  for (i = 0; i < 100000000; i++){
     20e:	83 c3 01             	add    $0x1,%ebx
    if (i % 20000000 == 0){
      printf(1, "%d", tid);
     211:	56                   	push   %esi
     212:	68 e0 12 00 00       	push   $0x12e0
     217:	6a 01                	push   $0x1
     219:	e8 a2 0d 00 00       	call   fc0 <printf>
     21e:	83 c4 10             	add    $0x10,%esp
void*
basicthreadmain(void *arg)
{
  int tid = (int) arg;
  int i;
  for (i = 0; i < 100000000; i++){
     221:	81 fb 00 e1 f5 05    	cmp    $0x5f5e100,%ebx
     227:	75 ca                	jne    1f3 <basicthreadmain+0x23>
    if (i % 20000000 == 0){
      printf(1, "%d", tid);
    }
  }
  thread_exit((void *)(tid+1));
     229:	83 ec 0c             	sub    $0xc,%esp
     22c:	83 c6 01             	add    $0x1,%esi
     22f:	56                   	push   %esi
     230:	e8 c5 0c 00 00       	call   efa <thread_exit>

	return 0;
}
     235:	8d 65 f4             	lea    -0xc(%ebp),%esp
     238:	31 c0                	xor    %eax,%eax
     23a:	5b                   	pop    %ebx
     23b:	5e                   	pop    %esi
     23c:	5f                   	pop    %edi
     23d:	5d                   	pop    %ebp
     23e:	c3                   	ret    
     23f:	90                   	nop

00000240 <jointhreadmain>:

// ============================================================================

void*
jointhreadmain(void *arg)
{
     240:	55                   	push   %ebp
     241:	89 e5                	mov    %esp,%ebp
     243:	83 ec 14             	sub    $0x14,%esp
  int val = (int)arg;
  sleep(200);
     246:	68 c8 00 00 00       	push   $0xc8
     24b:	e8 92 0c 00 00       	call   ee2 <sleep>
  printf(1, "thread_exit...\n");
     250:	58                   	pop    %eax
     251:	5a                   	pop    %edx
     252:	68 e3 12 00 00       	push   $0x12e3
     257:	6a 01                	push   $0x1
     259:	e8 62 0d 00 00       	call   fc0 <printf>
  thread_exit((void *)(val*2));
     25e:	8b 45 08             	mov    0x8(%ebp),%eax
     261:	01 c0                	add    %eax,%eax
     263:	89 04 24             	mov    %eax,(%esp)
     266:	e8 8f 0c 00 00       	call   efa <thread_exit>

	return 0;
}
     26b:	31 c0                	xor    %eax,%eax
     26d:	c9                   	leave  
     26e:	c3                   	ret    
     26f:	90                   	nop

00000270 <stressthreadmain>:

// ============================================================================

void*
stressthreadmain(void *arg)
{
     270:	55                   	push   %ebp
     271:	89 e5                	mov    %esp,%ebp
     273:	83 ec 14             	sub    $0x14,%esp
  thread_exit(0);
     276:	6a 00                	push   $0x0
     278:	e8 7d 0c 00 00       	call   efa <thread_exit>

	return 0;
}
     27d:	31 c0                	xor    %eax,%eax
     27f:	c9                   	leave  
     280:	c3                   	ret    
     281:	eb 0d                	jmp    290 <exitthreadmain>
     283:	90                   	nop
     284:	90                   	nop
     285:	90                   	nop
     286:	90                   	nop
     287:	90                   	nop
     288:	90                   	nop
     289:	90                   	nop
     28a:	90                   	nop
     28b:	90                   	nop
     28c:	90                   	nop
     28d:	90                   	nop
     28e:	90                   	nop
     28f:	90                   	nop

00000290 <exitthreadmain>:

// ============================================================================

void*
exitthreadmain(void *arg)
{
     290:	55                   	push   %ebp
     291:	89 e5                	mov    %esp,%ebp
     293:	83 ec 08             	sub    $0x8,%esp
     296:	8b 45 08             	mov    0x8(%ebp),%eax
  int i;
  if ((int)arg == 1){
     299:	83 f8 01             	cmp    $0x1,%eax
     29c:	74 1a                	je     2b8 <exitthreadmain+0x28>
    while(1){
      printf(1, "thread_exit ...\n");
      for (i = 0; i < 5000000; i++);
    }
  } else if ((int)arg == 2){
     29e:	83 f8 02             	cmp    $0x2,%eax
     2a1:	74 34                	je     2d7 <exitthreadmain+0x47>
    printf(1, "exit\n");
		exit();
  }
  thread_exit(0);
     2a3:	83 ec 0c             	sub    $0xc,%esp
     2a6:	6a 00                	push   $0x0
     2a8:	e8 4d 0c 00 00       	call   efa <thread_exit>

	return 0;
}
     2ad:	31 c0                	xor    %eax,%eax
     2af:	c9                   	leave  
     2b0:	c3                   	ret    
     2b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
exitthreadmain(void *arg)
{
  int i;
  if ((int)arg == 1){
    while(1){
      printf(1, "thread_exit ...\n");
     2b8:	83 ec 08             	sub    $0x8,%esp
     2bb:	68 f3 12 00 00       	push   $0x12f3
     2c0:	6a 01                	push   $0x1
     2c2:	e8 f9 0c 00 00       	call   fc0 <printf>
     2c7:	83 c4 10             	add    $0x10,%esp
     2ca:	b8 40 4b 4c 00       	mov    $0x4c4b40,%eax
     2cf:	90                   	nop
      for (i = 0; i < 5000000; i++);
     2d0:	83 e8 01             	sub    $0x1,%eax
     2d3:	75 fb                	jne    2d0 <exitthreadmain+0x40>
     2d5:	eb e1                	jmp    2b8 <exitthreadmain+0x28>
    }
  } else if ((int)arg == 2){
    printf(1, "exit\n");
     2d7:	83 ec 08             	sub    $0x8,%esp
     2da:	68 04 13 00 00       	push   $0x1304
     2df:	6a 01                	push   $0x1
     2e1:	e8 da 0c 00 00       	call   fc0 <printf>
		exit();
     2e6:	e8 67 0b 00 00       	call   e52 <exit>
     2eb:	90                   	nop
     2ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000002f0 <sleepthreadmain>:

// ============================================================================

void*
sleepthreadmain(void *arg)
{
     2f0:	55                   	push   %ebp
     2f1:	89 e5                	mov    %esp,%ebp
     2f3:	83 ec 14             	sub    $0x14,%esp
  sleep(1000000);
     2f6:	68 40 42 0f 00       	push   $0xf4240
     2fb:	e8 e2 0b 00 00       	call   ee2 <sleep>
  thread_exit(0);
     300:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     307:	e8 ee 0b 00 00       	call   efa <thread_exit>

	return 0;
}
     30c:	31 c0                	xor    %eax,%eax
     30e:	c9                   	leave  
     30f:	c3                   	ret    

00000310 <racingthreadmain>:
// ============================================================================
void nop(){ }

void*
racingthreadmain(void *arg)
{
     310:	55                   	push   %ebp
     311:	89 e5                	mov    %esp,%ebp
     313:	83 ec 14             	sub    $0x14,%esp
     316:	81 05 e4 1b 00 00 80 	addl   $0x989680,0x1be4
     31d:	96 98 00 
    tmp = gcnt;
    tmp++;
    nop();
    gcnt = tmp;
  }
  thread_exit((void *)(tid+1));
     320:	8b 45 08             	mov    0x8(%ebp),%eax
     323:	83 c0 01             	add    $0x1,%eax
     326:	50                   	push   %eax
     327:	e8 ce 0b 00 00       	call   efa <thread_exit>

	return 0;
}
     32c:	31 c0                	xor    %eax,%eax
     32e:	c9                   	leave  
     32f:	c3                   	ret    

00000330 <jointest2>:
  return 0;
}

int
jointest2(void)
{
     330:	55                   	push   %ebp
     331:	89 e5                	mov    %esp,%ebp
     333:	56                   	push   %esi
     334:	53                   	push   %ebx
     335:	8d 75 d0             	lea    -0x30(%ebp),%esi
  thread_t threads[NUM_THREAD];
  int i;
  void *retval;
  
  for (i = 1; i <= NUM_THREAD; i++){
     338:	bb 01 00 00 00       	mov    $0x1,%ebx
  return 0;
}

int
jointest2(void)
{
     33d:	83 ec 40             	sub    $0x40,%esp
  thread_t threads[NUM_THREAD];
  int i;
  void *retval;
  
  for (i = 1; i <= NUM_THREAD; i++){
    if (thread_create(&threads[i-1], jointhreadmain, (void*)(i)) != 0){
     340:	83 ec 04             	sub    $0x4,%esp
     343:	53                   	push   %ebx
     344:	68 40 02 00 00       	push   $0x240
     349:	56                   	push   %esi
     34a:	e8 a3 0b 00 00       	call   ef2 <thread_create>
     34f:	83 c4 10             	add    $0x10,%esp
     352:	85 c0                	test   %eax,%eax
     354:	75 7a                	jne    3d0 <jointest2+0xa0>
{
  thread_t threads[NUM_THREAD];
  int i;
  void *retval;
  
  for (i = 1; i <= NUM_THREAD; i++){
     356:	83 c3 01             	add    $0x1,%ebx
     359:	83 c6 04             	add    $0x4,%esi
     35c:	83 fb 0b             	cmp    $0xb,%ebx
     35f:	75 df                	jne    340 <jointest2+0x10>
    if (thread_create(&threads[i-1], jointhreadmain, (void*)(i)) != 0){
      printf(1, "panic at thread_create\n");
      return -1;
    }
  }
  sleep(500);
     361:	83 ec 0c             	sub    $0xc,%esp
     364:	8d 75 cc             	lea    -0x34(%ebp),%esi
  printf(1, "thread_join!!!\n");
     367:	bb 02 00 00 00       	mov    $0x2,%ebx
    if (thread_create(&threads[i-1], jointhreadmain, (void*)(i)) != 0){
      printf(1, "panic at thread_create\n");
      return -1;
    }
  }
  sleep(500);
     36c:	68 f4 01 00 00       	push   $0x1f4
     371:	e8 6c 0b 00 00       	call   ee2 <sleep>
  printf(1, "thread_join!!!\n");
     376:	58                   	pop    %eax
     377:	5a                   	pop    %edx
     378:	68 22 13 00 00       	push   $0x1322
     37d:	6a 01                	push   $0x1
     37f:	e8 3c 0c 00 00       	call   fc0 <printf>
     384:	83 c4 10             	add    $0x10,%esp
     387:	89 f6                	mov    %esi,%esi
     389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  for (i = 1; i <= NUM_THREAD; i++){
    if (thread_join(threads[i-1], &retval) != 0 || (int)retval != i * 2 ){
     390:	83 ec 08             	sub    $0x8,%esp
     393:	56                   	push   %esi
     394:	ff 74 5d cc          	pushl  -0x34(%ebp,%ebx,2)
     398:	e8 65 0b 00 00       	call   f02 <thread_join>
     39d:	83 c4 10             	add    $0x10,%esp
     3a0:	85 c0                	test   %eax,%eax
     3a2:	75 4c                	jne    3f0 <jointest2+0xc0>
     3a4:	39 5d cc             	cmp    %ebx,-0x34(%ebp)
     3a7:	75 47                	jne    3f0 <jointest2+0xc0>
     3a9:	83 c3 02             	add    $0x2,%ebx
      return -1;
    }
  }
  sleep(500);
  printf(1, "thread_join!!!\n");
  for (i = 1; i <= NUM_THREAD; i++){
     3ac:	83 fb 16             	cmp    $0x16,%ebx
     3af:	75 df                	jne    390 <jointest2+0x60>
    if (thread_join(threads[i-1], &retval) != 0 || (int)retval != i * 2 ){
      printf(1, "panic at thread_join\n");
      return -1;
    }
  }
  printf(1,"\n");
     3b1:	83 ec 08             	sub    $0x8,%esp
     3b4:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     3b7:	68 30 13 00 00       	push   $0x1330
     3bc:	6a 01                	push   $0x1
     3be:	e8 fd 0b 00 00       	call   fc0 <printf>
  return 0;
     3c3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     3c6:	83 c4 10             	add    $0x10,%esp
}
     3c9:	8d 65 f8             	lea    -0x8(%ebp),%esp
     3cc:	5b                   	pop    %ebx
     3cd:	5e                   	pop    %esi
     3ce:	5d                   	pop    %ebp
     3cf:	c3                   	ret    
  int i;
  void *retval;
  
  for (i = 1; i <= NUM_THREAD; i++){
    if (thread_create(&threads[i-1], jointhreadmain, (void*)(i)) != 0){
      printf(1, "panic at thread_create\n");
     3d0:	83 ec 08             	sub    $0x8,%esp
     3d3:	68 0a 13 00 00       	push   $0x130a
     3d8:	6a 01                	push   $0x1
     3da:	e8 e1 0b 00 00       	call   fc0 <printf>
      return -1;
     3df:	83 c4 10             	add    $0x10,%esp
      return -1;
    }
  }
  printf(1,"\n");
  return 0;
}
     3e2:	8d 65 f8             	lea    -0x8(%ebp),%esp
  void *retval;
  
  for (i = 1; i <= NUM_THREAD; i++){
    if (thread_create(&threads[i-1], jointhreadmain, (void*)(i)) != 0){
      printf(1, "panic at thread_create\n");
      return -1;
     3e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
    }
  }
  printf(1,"\n");
  return 0;
}
     3ea:	5b                   	pop    %ebx
     3eb:	5e                   	pop    %esi
     3ec:	5d                   	pop    %ebp
     3ed:	c3                   	ret    
     3ee:	66 90                	xchg   %ax,%ax
  }
  sleep(500);
  printf(1, "thread_join!!!\n");
  for (i = 1; i <= NUM_THREAD; i++){
    if (thread_join(threads[i-1], &retval) != 0 || (int)retval != i * 2 ){
      printf(1, "panic at thread_join\n");
     3f0:	83 ec 08             	sub    $0x8,%esp
     3f3:	68 32 13 00 00       	push   $0x1332
     3f8:	6a 01                	push   $0x1
     3fa:	e8 c1 0b 00 00       	call   fc0 <printf>
      return -1;
     3ff:	83 c4 10             	add    $0x10,%esp
    }
  }
  printf(1,"\n");
  return 0;
}
     402:	8d 65 f8             	lea    -0x8(%ebp),%esp
  sleep(500);
  printf(1, "thread_join!!!\n");
  for (i = 1; i <= NUM_THREAD; i++){
    if (thread_join(threads[i-1], &retval) != 0 || (int)retval != i * 2 ){
      printf(1, "panic at thread_join\n");
      return -1;
     405:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    }
  }
  printf(1,"\n");
  return 0;
}
     40a:	5b                   	pop    %ebx
     40b:	5e                   	pop    %esi
     40c:	5d                   	pop    %ebp
     40d:	c3                   	ret    
     40e:	66 90                	xchg   %ax,%ax

00000410 <pipetest>:
	return 0;
}

int
pipetest(void)
{
     410:	55                   	push   %ebp
     411:	89 e5                	mov    %esp,%ebp
     413:	57                   	push   %edi
     414:	56                   	push   %esi
     415:	53                   	push   %ebx
  int fd[2];
  int i;
  void *retval;
  int pid;

  if (pipe(fd) < 0){
     416:	8d 45 ac             	lea    -0x54(%ebp),%eax
	return 0;
}

int
pipetest(void)
{
     419:	83 ec 68             	sub    $0x68,%esp
  int fd[2];
  int i;
  void *retval;
  int pid;

  if (pipe(fd) < 0){
     41c:	50                   	push   %eax
     41d:	e8 40 0a 00 00       	call   e62 <pipe>
     422:	83 c4 10             	add    $0x10,%esp
     425:	85 c0                	test   %eax,%eax
     427:	0f 88 9a 01 00 00    	js     5c7 <pipetest+0x1b7>
    printf(1, "panic at pipe in pipetest\n");
    return -1;
  }
  arg[1] = fd[0];
     42d:	8b 45 ac             	mov    -0x54(%ebp),%eax
     430:	89 45 b8             	mov    %eax,-0x48(%ebp)
  arg[2] = fd[1];
     433:	8b 45 b0             	mov    -0x50(%ebp),%eax
     436:	89 45 bc             	mov    %eax,-0x44(%ebp)
  if ((pid = fork()) < 0){
     439:	e8 0c 0a 00 00       	call   e4a <fork>
     43e:	85 c0                	test   %eax,%eax
     440:	0f 88 9d 01 00 00    	js     5e3 <pipetest+0x1d3>
      printf(1, "panic at fork in pipetest\n");
      return -1;
  } else if (pid == 0){
     446:	75 78                	jne    4c0 <pipetest+0xb0>
    close(fd[0]);
     448:	83 ec 0c             	sub    $0xc,%esp
     44b:	8d 5d c0             	lea    -0x40(%ebp),%ebx
     44e:	ff 75 ac             	pushl  -0x54(%ebp)
     451:	8d 75 b4             	lea    -0x4c(%ebp),%esi
     454:	e8 21 0a 00 00       	call   e7a <close>
    arg[0] = 0;
     459:	89 df                	mov    %ebx,%edi
     45b:	c7 45 b4 00 00 00 00 	movl   $0x0,-0x4c(%ebp)
     462:	83 c4 10             	add    $0x10,%esp
     465:	8d 76 00             	lea    0x0(%esi),%esi
    for (i = 0; i < NUM_THREAD; i++){
      if (thread_create(&threads[i], pipethreadmain, (void*)arg) != 0){
     468:	83 ec 04             	sub    $0x4,%esp
     46b:	56                   	push   %esi
     46c:	68 20 06 00 00       	push   $0x620
     471:	57                   	push   %edi
     472:	e8 7b 0a 00 00       	call   ef2 <thread_create>
     477:	83 c4 10             	add    $0x10,%esp
     47a:	85 c0                	test   %eax,%eax
     47c:	0f 85 e6 00 00 00    	jne    568 <pipetest+0x158>
      printf(1, "panic at fork in pipetest\n");
      return -1;
  } else if (pid == 0){
    close(fd[0]);
    arg[0] = 0;
    for (i = 0; i < NUM_THREAD; i++){
     482:	8d 45 e8             	lea    -0x18(%ebp),%eax
     485:	83 c7 04             	add    $0x4,%edi
     488:	39 f8                	cmp    %edi,%eax
     48a:	75 dc                	jne    468 <pipetest+0x58>
     48c:	8d 75 a8             	lea    -0x58(%ebp),%esi
     48f:	90                   	nop
        printf(1, "panic at thread_create\n");
        return -1;
      }
    }
    for (i = 0; i < NUM_THREAD; i++){
      if (thread_join(threads[i], &retval) != 0){
     490:	83 ec 08             	sub    $0x8,%esp
     493:	56                   	push   %esi
     494:	ff 33                	pushl  (%ebx)
     496:	e8 67 0a 00 00       	call   f02 <thread_join>
     49b:	83 c4 10             	add    $0x10,%esp
     49e:	85 c0                	test   %eax,%eax
     4a0:	0f 85 ea 00 00 00    	jne    590 <pipetest+0x180>
      if (thread_create(&threads[i], pipethreadmain, (void*)arg) != 0){
        printf(1, "panic at thread_create\n");
        return -1;
      }
    }
    for (i = 0; i < NUM_THREAD; i++){
     4a6:	8d 45 e8             	lea    -0x18(%ebp),%eax
     4a9:	83 c3 04             	add    $0x4,%ebx
     4ac:	39 d8                	cmp    %ebx,%eax
     4ae:	75 e0                	jne    490 <pipetest+0x80>
      if (thread_join(threads[i], &retval) != 0){
        printf(1, "panic at thread_join\n");
        return -1;
      }
    }
    close(fd[1]);
     4b0:	83 ec 0c             	sub    $0xc,%esp
     4b3:	ff 75 b0             	pushl  -0x50(%ebp)
     4b6:	e8 bf 09 00 00       	call   e7a <close>
    exit();
     4bb:	e8 92 09 00 00       	call   e52 <exit>
  } else{
    close(fd[1]);
     4c0:	83 ec 0c             	sub    $0xc,%esp
     4c3:	8d 5d c0             	lea    -0x40(%ebp),%ebx
     4c6:	ff 75 b0             	pushl  -0x50(%ebp)
     4c9:	8d 75 b4             	lea    -0x4c(%ebp),%esi
     4cc:	e8 a9 09 00 00       	call   e7a <close>
    arg[0] = 1;
    gcnt = 0;
     4d1:	89 df                	mov    %ebx,%edi
    }
    close(fd[1]);
    exit();
  } else{
    close(fd[1]);
    arg[0] = 1;
     4d3:	c7 45 b4 01 00 00 00 	movl   $0x1,-0x4c(%ebp)
    gcnt = 0;
     4da:	c7 05 e4 1b 00 00 00 	movl   $0x0,0x1be4
     4e1:	00 00 00 
     4e4:	83 c4 10             	add    $0x10,%esp
     4e7:	89 f6                	mov    %esi,%esi
     4e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    for (i = 0; i < NUM_THREAD; i++){
      if (thread_create(&threads[i], pipethreadmain, (void*)arg) != 0){
     4f0:	83 ec 04             	sub    $0x4,%esp
     4f3:	56                   	push   %esi
     4f4:	68 20 06 00 00       	push   $0x620
     4f9:	57                   	push   %edi
     4fa:	e8 f3 09 00 00       	call   ef2 <thread_create>
     4ff:	83 c4 10             	add    $0x10,%esp
     502:	85 c0                	test   %eax,%eax
     504:	75 62                	jne    568 <pipetest+0x158>
    exit();
  } else{
    close(fd[1]);
    arg[0] = 1;
    gcnt = 0;
    for (i = 0; i < NUM_THREAD; i++){
     506:	8d 45 e8             	lea    -0x18(%ebp),%eax
     509:	83 c7 04             	add    $0x4,%edi
     50c:	39 f8                	cmp    %edi,%eax
     50e:	75 e0                	jne    4f0 <pipetest+0xe0>
     510:	8d 75 a8             	lea    -0x58(%ebp),%esi
     513:	90                   	nop
     514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "panic at thread_create\n");
        return -1;
      }
    }
    for (i = 0; i < NUM_THREAD; i++){
      if (thread_join(threads[i], &retval) != 0){
     518:	83 ec 08             	sub    $0x8,%esp
     51b:	56                   	push   %esi
     51c:	ff 33                	pushl  (%ebx)
     51e:	e8 df 09 00 00       	call   f02 <thread_join>
     523:	83 c4 10             	add    $0x10,%esp
     526:	85 c0                	test   %eax,%eax
     528:	75 66                	jne    590 <pipetest+0x180>
      if (thread_create(&threads[i], pipethreadmain, (void*)arg) != 0){
        printf(1, "panic at thread_create\n");
        return -1;
      }
    }
    for (i = 0; i < NUM_THREAD; i++){
     52a:	8d 45 e8             	lea    -0x18(%ebp),%eax
     52d:	83 c3 04             	add    $0x4,%ebx
     530:	39 d8                	cmp    %ebx,%eax
     532:	75 e4                	jne    518 <pipetest+0x108>
      if (thread_join(threads[i], &retval) != 0){
        printf(1, "panic at thread_join\n");
        return -1;
      }
    }
    close(fd[0]);
     534:	83 ec 0c             	sub    $0xc,%esp
     537:	ff 75 ac             	pushl  -0x54(%ebp)
     53a:	e8 3b 09 00 00       	call   e7a <close>
  }
  if (wait() == -1){
     53f:	e8 16 09 00 00       	call   e5a <wait>
     544:	83 c4 10             	add    $0x10,%esp
     547:	83 f8 ff             	cmp    $0xffffffff,%eax
     54a:	0f 84 af 00 00 00    	je     5ff <pipetest+0x1ef>
    printf(1, "panic at wait in pipetest\n");
    return -1;
  }
  if (gcnt != 0)
     550:	a1 e4 1b 00 00       	mov    0x1be4,%eax
     555:	85 c0                	test   %eax,%eax
     557:	75 57                	jne    5b0 <pipetest+0x1a0>
    printf(1,"panic at validation in pipetest : %d\n", gcnt);

  return 0;
}
     559:	8d 65 f4             	lea    -0xc(%ebp),%esp
     55c:	5b                   	pop    %ebx
     55d:	5e                   	pop    %esi
     55e:	5f                   	pop    %edi
     55f:	5d                   	pop    %ebp
     560:	c3                   	ret    
     561:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  } else if (pid == 0){
    close(fd[0]);
    arg[0] = 0;
    for (i = 0; i < NUM_THREAD; i++){
      if (thread_create(&threads[i], pipethreadmain, (void*)arg) != 0){
        printf(1, "panic at thread_create\n");
     568:	83 ec 08             	sub    $0x8,%esp
     56b:	68 0a 13 00 00       	push   $0x130a
     570:	6a 01                	push   $0x1
     572:	e8 49 0a 00 00       	call   fc0 <printf>
        return -1;
     577:	83 c4 10             	add    $0x10,%esp
  }
  if (gcnt != 0)
    printf(1,"panic at validation in pipetest : %d\n", gcnt);

  return 0;
}
     57a:	8d 65 f4             	lea    -0xc(%ebp),%esp
    close(fd[0]);
    arg[0] = 0;
    for (i = 0; i < NUM_THREAD; i++){
      if (thread_create(&threads[i], pipethreadmain, (void*)arg) != 0){
        printf(1, "panic at thread_create\n");
        return -1;
     57d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  if (gcnt != 0)
    printf(1,"panic at validation in pipetest : %d\n", gcnt);

  return 0;
}
     582:	5b                   	pop    %ebx
     583:	5e                   	pop    %esi
     584:	5f                   	pop    %edi
     585:	5d                   	pop    %ebp
     586:	c3                   	ret    
     587:	89 f6                	mov    %esi,%esi
     589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
        return -1;
      }
    }
    for (i = 0; i < NUM_THREAD; i++){
      if (thread_join(threads[i], &retval) != 0){
        printf(1, "panic at thread_join\n");
     590:	83 ec 08             	sub    $0x8,%esp
     593:	68 32 13 00 00       	push   $0x1332
     598:	6a 01                	push   $0x1
     59a:	e8 21 0a 00 00       	call   fc0 <printf>
        return -1;
     59f:	83 c4 10             	add    $0x10,%esp
  }
  if (gcnt != 0)
    printf(1,"panic at validation in pipetest : %d\n", gcnt);

  return 0;
}
     5a2:	8d 65 f4             	lea    -0xc(%ebp),%esp
      }
    }
    for (i = 0; i < NUM_THREAD; i++){
      if (thread_join(threads[i], &retval) != 0){
        printf(1, "panic at thread_join\n");
        return -1;
     5a5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
  if (gcnt != 0)
    printf(1,"panic at validation in pipetest : %d\n", gcnt);

  return 0;
}
     5aa:	5b                   	pop    %ebx
     5ab:	5e                   	pop    %esi
     5ac:	5f                   	pop    %edi
     5ad:	5d                   	pop    %ebp
     5ae:	c3                   	ret    
     5af:	90                   	nop
  if (wait() == -1){
    printf(1, "panic at wait in pipetest\n");
    return -1;
  }
  if (gcnt != 0)
    printf(1,"panic at validation in pipetest : %d\n", gcnt);
     5b0:	83 ec 04             	sub    $0x4,%esp
     5b3:	50                   	push   %eax
     5b4:	68 5c 14 00 00       	push   $0x145c
     5b9:	6a 01                	push   $0x1
     5bb:	e8 00 0a 00 00       	call   fc0 <printf>
     5c0:	83 c4 10             	add    $0x10,%esp

  return 0;
     5c3:	31 c0                	xor    %eax,%eax
     5c5:	eb 92                	jmp    559 <pipetest+0x149>
  int i;
  void *retval;
  int pid;

  if (pipe(fd) < 0){
    printf(1, "panic at pipe in pipetest\n");
     5c7:	83 ec 08             	sub    $0x8,%esp
     5ca:	68 48 13 00 00       	push   $0x1348
     5cf:	6a 01                	push   $0x1
     5d1:	e8 ea 09 00 00       	call   fc0 <printf>
    return -1;
     5d6:	83 c4 10             	add    $0x10,%esp
     5d9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     5de:	e9 76 ff ff ff       	jmp    559 <pipetest+0x149>
  }
  arg[1] = fd[0];
  arg[2] = fd[1];
  if ((pid = fork()) < 0){
      printf(1, "panic at fork in pipetest\n");
     5e3:	83 ec 08             	sub    $0x8,%esp
     5e6:	68 63 13 00 00       	push   $0x1363
     5eb:	6a 01                	push   $0x1
     5ed:	e8 ce 09 00 00       	call   fc0 <printf>
      return -1;
     5f2:	83 c4 10             	add    $0x10,%esp
     5f5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     5fa:	e9 5a ff ff ff       	jmp    559 <pipetest+0x149>
      }
    }
    close(fd[0]);
  }
  if (wait() == -1){
    printf(1, "panic at wait in pipetest\n");
     5ff:	83 ec 08             	sub    $0x8,%esp
     602:	89 45 a4             	mov    %eax,-0x5c(%ebp)
     605:	68 7e 13 00 00       	push   $0x137e
     60a:	6a 01                	push   $0x1
     60c:	e8 af 09 00 00       	call   fc0 <printf>
    return -1;
     611:	83 c4 10             	add    $0x10,%esp
     614:	8b 45 a4             	mov    -0x5c(%ebp),%eax
     617:	e9 3d ff ff ff       	jmp    559 <pipetest+0x149>
     61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000620 <pipethreadmain>:

// ============================================================================

void*
pipethreadmain(void *arg)
{
     620:	55                   	push   %ebp
     621:	89 e5                	mov    %esp,%ebp
     623:	57                   	push   %edi
     624:	56                   	push   %esi
     625:	53                   	push   %ebx
    if (type){
      read(fd[0], &input, sizeof(int));
      __sync_fetch_and_add(&gcnt, input);
      //gcnt += input;
    } else{
      write(fd[1], &i, sizeof(int));
     626:	8d 7d e0             	lea    -0x20(%ebp),%edi

// ============================================================================

void*
pipethreadmain(void *arg)
{
     629:	83 ec 1c             	sub    $0x1c,%esp
     62c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  int type = ((int*)arg)[0];
  int *fd = (int*)arg+1;
  int i;
  int input;
  for (i = -5; i <= 5; i++){
     62f:	c7 45 e0 fb ff ff ff 	movl   $0xfffffffb,-0x20(%ebp)
// ============================================================================

void*
pipethreadmain(void *arg)
{
  int type = ((int*)arg)[0];
     636:	8b 33                	mov    (%ebx),%esi
     638:	eb 32                	jmp    66c <pipethreadmain+0x4c>
     63a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  int *fd = (int*)arg+1;
  int i;
  int input;
  for (i = -5; i <= 5; i++){
    if (type){
      read(fd[0], &input, sizeof(int));
     640:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     643:	83 ec 04             	sub    $0x4,%esp
     646:	6a 04                	push   $0x4
     648:	50                   	push   %eax
     649:	ff 73 04             	pushl  0x4(%ebx)
     64c:	e8 19 08 00 00       	call   e6a <read>
      __sync_fetch_and_add(&gcnt, input);
     651:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     654:	f0 01 05 e4 1b 00 00 	lock add %eax,0x1be4
{
  int type = ((int*)arg)[0];
  int *fd = (int*)arg+1;
  int i;
  int input;
  for (i = -5; i <= 5; i++){
     65b:	8b 45 e0             	mov    -0x20(%ebp),%eax
     65e:	83 c4 10             	add    $0x10,%esp
     661:	83 c0 01             	add    $0x1,%eax
     664:	83 f8 05             	cmp    $0x5,%eax
     667:	89 45 e0             	mov    %eax,-0x20(%ebp)
     66a:	7f 23                	jg     68f <pipethreadmain+0x6f>
    if (type){
     66c:	85 f6                	test   %esi,%esi
     66e:	75 d0                	jne    640 <pipethreadmain+0x20>
      read(fd[0], &input, sizeof(int));
      __sync_fetch_and_add(&gcnt, input);
      //gcnt += input;
    } else{
      write(fd[1], &i, sizeof(int));
     670:	83 ec 04             	sub    $0x4,%esp
     673:	6a 04                	push   $0x4
     675:	57                   	push   %edi
     676:	ff 73 08             	pushl  0x8(%ebx)
     679:	e8 f4 07 00 00       	call   e72 <write>
{
  int type = ((int*)arg)[0];
  int *fd = (int*)arg+1;
  int i;
  int input;
  for (i = -5; i <= 5; i++){
     67e:	8b 45 e0             	mov    -0x20(%ebp),%eax
    if (type){
      read(fd[0], &input, sizeof(int));
      __sync_fetch_and_add(&gcnt, input);
      //gcnt += input;
    } else{
      write(fd[1], &i, sizeof(int));
     681:	83 c4 10             	add    $0x10,%esp
{
  int type = ((int*)arg)[0];
  int *fd = (int*)arg+1;
  int i;
  int input;
  for (i = -5; i <= 5; i++){
     684:	83 c0 01             	add    $0x1,%eax
     687:	83 f8 05             	cmp    $0x5,%eax
     68a:	89 45 e0             	mov    %eax,-0x20(%ebp)
     68d:	7e dd                	jle    66c <pipethreadmain+0x4c>
      //gcnt += input;
    } else{
      write(fd[1], &i, sizeof(int));
    }
  }
  thread_exit(0);
     68f:	83 ec 0c             	sub    $0xc,%esp
     692:	6a 00                	push   $0x0
     694:	e8 61 08 00 00       	call   efa <thread_exit>

	return 0;
}
     699:	8d 65 f4             	lea    -0xc(%ebp),%esp
     69c:	31 c0                	xor    %eax,%eax
     69e:	5b                   	pop    %ebx
     69f:	5e                   	pop    %esi
     6a0:	5f                   	pop    %edi
     6a1:	5d                   	pop    %ebp
     6a2:	c3                   	ret    
     6a3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     6a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006b0 <exittest2>:
  return 0;
}

int
exittest2(void)
{
     6b0:	55                   	push   %ebp
     6b1:	89 e5                	mov    %esp,%ebp
     6b3:	56                   	push   %esi
     6b4:	53                   	push   %ebx
     6b5:	8d 75 f8             	lea    -0x8(%ebp),%esi
     6b8:	8d 5d d0             	lea    -0x30(%ebp),%ebx
     6bb:	83 ec 40             	sub    $0x40,%esp
     6be:	66 90                	xchg   %ax,%ax
  thread_t threads[NUM_THREAD];
  int i;

  for (i = 0; i < NUM_THREAD; i++){
    if (thread_create(&threads[i], exitthreadmain, (void*)2) != 0){
     6c0:	83 ec 04             	sub    $0x4,%esp
     6c3:	6a 02                	push   $0x2
     6c5:	68 90 02 00 00       	push   $0x290
     6ca:	53                   	push   %ebx
     6cb:	e8 22 08 00 00       	call   ef2 <thread_create>
     6d0:	83 c4 10             	add    $0x10,%esp
     6d3:	85 c0                	test   %eax,%eax
     6d5:	75 29                	jne    700 <exittest2+0x50>
     6d7:	83 c3 04             	add    $0x4,%ebx
exittest2(void)
{
  thread_t threads[NUM_THREAD];
  int i;

  for (i = 0; i < NUM_THREAD; i++){
     6da:	39 f3                	cmp    %esi,%ebx
     6dc:	75 e2                	jne    6c0 <exittest2+0x10>
    if (thread_create(&threads[i], exitthreadmain, (void*)2) != 0){
      printf(1, "panic at thread_create\n");
      return -1;
    }
  }
	printf(1, "end\n");
     6de:	83 ec 08             	sub    $0x8,%esp
     6e1:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     6e4:	68 99 13 00 00       	push   $0x1399
     6e9:	6a 01                	push   $0x1
     6eb:	e8 d0 08 00 00       	call   fc0 <printf>
  return 0;
     6f0:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     6f3:	83 c4 10             	add    $0x10,%esp
}
     6f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     6f9:	5b                   	pop    %ebx
     6fa:	5e                   	pop    %esi
     6fb:	5d                   	pop    %ebp
     6fc:	c3                   	ret    
     6fd:	8d 76 00             	lea    0x0(%esi),%esi
  thread_t threads[NUM_THREAD];
  int i;

  for (i = 0; i < NUM_THREAD; i++){
    if (thread_create(&threads[i], sleepthreadmain, (void*)i) != 0){
        printf(1, "panic at thread_create\n");
     700:	83 ec 08             	sub    $0x8,%esp
     703:	68 0a 13 00 00       	push   $0x130a
     708:	6a 01                	push   $0x1
     70a:	e8 b1 08 00 00       	call   fc0 <printf>
     70f:	83 c4 10             	add    $0x10,%esp
      return -1;
    }
  }
	printf(1, "end\n");
  return 0;
}
     712:	8d 65 f8             	lea    -0x8(%ebp),%esp
  thread_t threads[NUM_THREAD];
  int i;

  for (i = 0; i < NUM_THREAD; i++){
    if (thread_create(&threads[i], sleepthreadmain, (void*)i) != 0){
        printf(1, "panic at thread_create\n");
     715:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
    }
  }
	printf(1, "end\n");
  return 0;
}
     71a:	5b                   	pop    %ebx
     71b:	5e                   	pop    %esi
     71c:	5d                   	pop    %ebp
     71d:	c3                   	ret    
     71e:	66 90                	xchg   %ax,%ax

00000720 <jointest1>:
	return 0;
}

int
jointest1(void)
{
     720:	55                   	push   %ebp
     721:	89 e5                	mov    %esp,%ebp
     723:	56                   	push   %esi
     724:	53                   	push   %ebx
     725:	8d 75 d0             	lea    -0x30(%ebp),%esi
  thread_t threads[NUM_THREAD];
  int i;
  void *retval;
  
  for (i = 1; i <= NUM_THREAD; i++){
     728:	bb 01 00 00 00       	mov    $0x1,%ebx
	return 0;
}

int
jointest1(void)
{
     72d:	83 ec 40             	sub    $0x40,%esp
  thread_t threads[NUM_THREAD];
  int i;
  void *retval;
  
  for (i = 1; i <= NUM_THREAD; i++){
    if (thread_create(&threads[i-1], jointhreadmain, (void*)i) != 0){
     730:	83 ec 04             	sub    $0x4,%esp
     733:	53                   	push   %ebx
     734:	68 40 02 00 00       	push   $0x240
     739:	56                   	push   %esi
     73a:	e8 b3 07 00 00       	call   ef2 <thread_create>
     73f:	83 c4 10             	add    $0x10,%esp
     742:	85 c0                	test   %eax,%eax
     744:	75 6a                	jne    7b0 <jointest1+0x90>
{
  thread_t threads[NUM_THREAD];
  int i;
  void *retval;
  
  for (i = 1; i <= NUM_THREAD; i++){
     746:	83 c3 01             	add    $0x1,%ebx
     749:	83 c6 04             	add    $0x4,%esi
     74c:	83 fb 0b             	cmp    $0xb,%ebx
     74f:	75 df                	jne    730 <jointest1+0x10>
    if (thread_create(&threads[i-1], jointhreadmain, (void*)i) != 0){
      printf(1, "panic at thread_create\n");
      return -1;
    }
  }
  printf(1, "thread_join!!!\n");
     751:	83 ec 08             	sub    $0x8,%esp
     754:	8d 75 cc             	lea    -0x34(%ebp),%esi
     757:	bb 02 00 00 00       	mov    $0x2,%ebx
     75c:	68 22 13 00 00       	push   $0x1322
     761:	6a 01                	push   $0x1
     763:	e8 58 08 00 00       	call   fc0 <printf>
     768:	83 c4 10             	add    $0x10,%esp
     76b:	90                   	nop
     76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for (i = 1; i <= NUM_THREAD; i++){
    if (thread_join(threads[i-1], &retval) != 0 || (int)retval != i * 2 ){
     770:	83 ec 08             	sub    $0x8,%esp
     773:	56                   	push   %esi
     774:	ff 74 5d cc          	pushl  -0x34(%ebp,%ebx,2)
     778:	e8 85 07 00 00       	call   f02 <thread_join>
     77d:	83 c4 10             	add    $0x10,%esp
     780:	85 c0                	test   %eax,%eax
     782:	75 4c                	jne    7d0 <jointest1+0xb0>
     784:	39 5d cc             	cmp    %ebx,-0x34(%ebp)
     787:	75 47                	jne    7d0 <jointest1+0xb0>
     789:	83 c3 02             	add    $0x2,%ebx
      printf(1, "panic at thread_create\n");
      return -1;
    }
  }
  printf(1, "thread_join!!!\n");
  for (i = 1; i <= NUM_THREAD; i++){
     78c:	83 fb 16             	cmp    $0x16,%ebx
     78f:	75 df                	jne    770 <jointest1+0x50>
    if (thread_join(threads[i-1], &retval) != 0 || (int)retval != i * 2 ){
      printf(1, "panic at thread_join\n");
      return -1;
    }
  }
  printf(1,"\n");
     791:	83 ec 08             	sub    $0x8,%esp
     794:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     797:	68 30 13 00 00       	push   $0x1330
     79c:	6a 01                	push   $0x1
     79e:	e8 1d 08 00 00       	call   fc0 <printf>
  return 0;
     7a3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     7a6:	83 c4 10             	add    $0x10,%esp
}
     7a9:	8d 65 f8             	lea    -0x8(%ebp),%esp
     7ac:	5b                   	pop    %ebx
     7ad:	5e                   	pop    %esi
     7ae:	5d                   	pop    %ebp
     7af:	c3                   	ret    
  int i;
  void *retval;
  
  for (i = 1; i <= NUM_THREAD; i++){
    if (thread_create(&threads[i-1], jointhreadmain, (void*)i) != 0){
      printf(1, "panic at thread_create\n");
     7b0:	83 ec 08             	sub    $0x8,%esp
     7b3:	68 0a 13 00 00       	push   $0x130a
     7b8:	6a 01                	push   $0x1
     7ba:	e8 01 08 00 00       	call   fc0 <printf>
      return -1;
     7bf:	83 c4 10             	add    $0x10,%esp
      return -1;
    }
  }
  printf(1,"\n");
  return 0;
}
     7c2:	8d 65 f8             	lea    -0x8(%ebp),%esp
  void *retval;
  
  for (i = 1; i <= NUM_THREAD; i++){
    if (thread_create(&threads[i-1], jointhreadmain, (void*)i) != 0){
      printf(1, "panic at thread_create\n");
      return -1;
     7c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
    }
  }
  printf(1,"\n");
  return 0;
}
     7ca:	5b                   	pop    %ebx
     7cb:	5e                   	pop    %esi
     7cc:	5d                   	pop    %ebp
     7cd:	c3                   	ret    
     7ce:	66 90                	xchg   %ax,%ax
    }
  }
  printf(1, "thread_join!!!\n");
  for (i = 1; i <= NUM_THREAD; i++){
    if (thread_join(threads[i-1], &retval) != 0 || (int)retval != i * 2 ){
      printf(1, "panic at thread_join\n");
     7d0:	83 ec 08             	sub    $0x8,%esp
     7d3:	68 32 13 00 00       	push   $0x1332
     7d8:	6a 01                	push   $0x1
     7da:	e8 e1 07 00 00       	call   fc0 <printf>
     7df:	83 c4 10             	add    $0x10,%esp
      return -1;
    }
  }
  printf(1,"\n");
  return 0;
}
     7e2:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }
  }
  printf(1, "thread_join!!!\n");
  for (i = 1; i <= NUM_THREAD; i++){
    if (thread_join(threads[i-1], &retval) != 0 || (int)retval != i * 2 ){
      printf(1, "panic at thread_join\n");
     7e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
    }
  }
  printf(1,"\n");
  return 0;
}
     7ea:	5b                   	pop    %ebx
     7eb:	5e                   	pop    %esi
     7ec:	5d                   	pop    %ebp
     7ed:	c3                   	ret    
     7ee:	66 90                	xchg   %ax,%ax

000007f0 <stresstest>:
	return 0;
}

int
stresstest(void)
{
     7f0:	55                   	push   %ebp
     7f1:	89 e5                	mov    %esp,%ebp
     7f3:	57                   	push   %edi
     7f4:	56                   	push   %esi
     7f5:	53                   	push   %ebx
     7f6:	83 ec 4c             	sub    $0x4c,%esp
  const int nstress = 1000;
  thread_t threads[NUM_THREAD];
  int i, n;
  void *retval;

  for (n = 1; n <= nstress; n++){
     7f9:	c7 45 b4 01 00 00 00 	movl   $0x1,-0x4c(%ebp)
     800:	8d 75 c0             	lea    -0x40(%ebp),%esi
     803:	31 db                	xor    %ebx,%ebx
     805:	89 f7                	mov    %esi,%edi
     807:	89 f6                	mov    %esi,%esi
     809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if (n % 1000 == 0)
      printf(1, "%d\n", n);
    for (i = 0; i < NUM_THREAD; i++){
      if (thread_create(&threads[i], stressthreadmain, (void*)i) != 0){
     810:	83 ec 04             	sub    $0x4,%esp
     813:	53                   	push   %ebx
     814:	68 70 02 00 00       	push   $0x270
     819:	57                   	push   %edi
     81a:	e8 d3 06 00 00       	call   ef2 <thread_create>
     81f:	83 c4 10             	add    $0x10,%esp
     822:	85 c0                	test   %eax,%eax
     824:	0f 85 86 00 00 00    	jne    8b0 <stresstest+0xc0>
  void *retval;

  for (n = 1; n <= nstress; n++){
    if (n % 1000 == 0)
      printf(1, "%d\n", n);
    for (i = 0; i < NUM_THREAD; i++){
     82a:	83 c3 01             	add    $0x1,%ebx
     82d:	83 c7 04             	add    $0x4,%edi
     830:	83 fb 0a             	cmp    $0xa,%ebx
     833:	75 db                	jne    810 <stresstest+0x20>
     835:	8d 76 00             	lea    0x0(%esi),%esi
        printf(1, "panic at thread_create\n");
        return -1;
      }
    }
    for (i = 0; i < NUM_THREAD; i++){
      if (thread_join(threads[i], &retval) != 0){
     838:	8d 45 bc             	lea    -0x44(%ebp),%eax
     83b:	83 ec 08             	sub    $0x8,%esp
     83e:	50                   	push   %eax
     83f:	ff 36                	pushl  (%esi)
     841:	e8 bc 06 00 00       	call   f02 <thread_join>
     846:	83 c4 10             	add    $0x10,%esp
     849:	85 c0                	test   %eax,%eax
     84b:	0f 85 7f 00 00 00    	jne    8d0 <stresstest+0xe0>
      if (thread_create(&threads[i], stressthreadmain, (void*)i) != 0){
        printf(1, "panic at thread_create\n");
        return -1;
      }
    }
    for (i = 0; i < NUM_THREAD; i++){
     851:	8d 4d e8             	lea    -0x18(%ebp),%ecx
     854:	83 c6 04             	add    $0x4,%esi
     857:	39 f1                	cmp    %esi,%ecx
     859:	75 dd                	jne    838 <stresstest+0x48>
  const int nstress = 1000;
  thread_t threads[NUM_THREAD];
  int i, n;
  void *retval;

  for (n = 1; n <= nstress; n++){
     85b:	83 45 b4 01          	addl   $0x1,-0x4c(%ebp)
     85f:	8b 55 b4             	mov    -0x4c(%ebp),%edx
     862:	81 fa e9 03 00 00    	cmp    $0x3e9,%edx
     868:	0f 84 81 00 00 00    	je     8ef <stresstest+0xff>
    if (n % 1000 == 0)
     86e:	8b 45 b4             	mov    -0x4c(%ebp),%eax
     871:	8b 4d b4             	mov    -0x4c(%ebp),%ecx
     874:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
     879:	f7 ea                	imul   %edx
     87b:	89 c8                	mov    %ecx,%eax
     87d:	c1 f8 1f             	sar    $0x1f,%eax
     880:	c1 fa 06             	sar    $0x6,%edx
     883:	29 c2                	sub    %eax,%edx
     885:	69 c2 e8 03 00 00    	imul   $0x3e8,%edx,%eax
     88b:	39 c1                	cmp    %eax,%ecx
     88d:	0f 85 6d ff ff ff    	jne    800 <stresstest+0x10>
      printf(1, "%d\n", n);
     893:	83 ec 04             	sub    $0x4,%esp
     896:	51                   	push   %ecx
     897:	68 9e 13 00 00       	push   $0x139e
     89c:	6a 01                	push   $0x1
     89e:	e8 1d 07 00 00       	call   fc0 <printf>
     8a3:	83 c4 10             	add    $0x10,%esp
     8a6:	e9 55 ff ff ff       	jmp    800 <stresstest+0x10>
     8ab:	90                   	nop
     8ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (i = 0; i < NUM_THREAD; i++){
      if (thread_create(&threads[i], stressthreadmain, (void*)i) != 0){
        printf(1, "panic at thread_create\n");
     8b0:	83 ec 08             	sub    $0x8,%esp
     8b3:	68 0a 13 00 00       	push   $0x130a
     8b8:	6a 01                	push   $0x1
     8ba:	e8 01 07 00 00       	call   fc0 <printf>
        return -1;
     8bf:	83 c4 10             	add    $0x10,%esp
     8c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      }
    }
  }
  printf(1, "\n");
  return 0;
}
     8c7:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8ca:	5b                   	pop    %ebx
     8cb:	5e                   	pop    %esi
     8cc:	5f                   	pop    %edi
     8cd:	5d                   	pop    %ebp
     8ce:	c3                   	ret    
     8cf:	90                   	nop
        return -1;
      }
    }
    for (i = 0; i < NUM_THREAD; i++){
      if (thread_join(threads[i], &retval) != 0){
        printf(1, "panic at thread_join\n");
     8d0:	83 ec 08             	sub    $0x8,%esp
     8d3:	68 32 13 00 00       	push   $0x1332
     8d8:	6a 01                	push   $0x1
     8da:	e8 e1 06 00 00       	call   fc0 <printf>
        return -1;
     8df:	83 c4 10             	add    $0x10,%esp
      }
    }
  }
  printf(1, "\n");
  return 0;
}
     8e2:	8d 65 f4             	lea    -0xc(%ebp),%esp
      }
    }
    for (i = 0; i < NUM_THREAD; i++){
      if (thread_join(threads[i], &retval) != 0){
        printf(1, "panic at thread_join\n");
        return -1;
     8e5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      }
    }
  }
  printf(1, "\n");
  return 0;
}
     8ea:	5b                   	pop    %ebx
     8eb:	5e                   	pop    %esi
     8ec:	5f                   	pop    %edi
     8ed:	5d                   	pop    %ebp
     8ee:	c3                   	ret    
        printf(1, "panic at thread_join\n");
        return -1;
      }
    }
  }
  printf(1, "\n");
     8ef:	83 ec 08             	sub    $0x8,%esp
     8f2:	89 45 b4             	mov    %eax,-0x4c(%ebp)
     8f5:	68 30 13 00 00       	push   $0x1330
     8fa:	6a 01                	push   $0x1
     8fc:	e8 bf 06 00 00       	call   fc0 <printf>
     901:	83 c4 10             	add    $0x10,%esp
     904:	8b 45 b4             	mov    -0x4c(%ebp),%eax
     907:	eb be                	jmp    8c7 <stresstest+0xd7>
     909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000910 <exectest>:
     910:	55                   	push   %ebp
     911:	31 c0                	xor    %eax,%eax
     913:	89 e5                	mov    %esp,%ebp
     915:	5d                   	pop    %ebp
     916:	c3                   	ret    
     917:	89 f6                	mov    %esi,%esi
     919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000920 <sbrktest>:
     920:	55                   	push   %ebp
     921:	31 c0                	xor    %eax,%eax
     923:	89 e5                	mov    %esp,%ebp
     925:	5d                   	pop    %ebp
     926:	c3                   	ret    
     927:	89 f6                	mov    %esi,%esi
     929:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000930 <sleeptest>:
	return 0;
}

int
sleeptest(void)
{
     930:	55                   	push   %ebp
     931:	89 e5                	mov    %esp,%ebp
     933:	57                   	push   %edi
     934:	56                   	push   %esi
     935:	53                   	push   %ebx
     936:	8d 75 c0             	lea    -0x40(%ebp),%esi
  thread_t threads[NUM_THREAD];
  int i;

  for (i = 0; i < NUM_THREAD; i++){
     939:	31 db                	xor    %ebx,%ebx
	return 0;
}

int
sleeptest(void)
{
     93b:	83 ec 3c             	sub    $0x3c,%esp
     93e:	66 90                	xchg   %ax,%ax
  thread_t threads[NUM_THREAD];
  int i;

  for (i = 0; i < NUM_THREAD; i++){
    if (thread_create(&threads[i], sleepthreadmain, (void*)i) != 0){
     940:	83 ec 04             	sub    $0x4,%esp
     943:	53                   	push   %ebx
     944:	68 f0 02 00 00       	push   $0x2f0
     949:	56                   	push   %esi
     94a:	e8 a3 05 00 00       	call   ef2 <thread_create>
     94f:	83 c4 10             	add    $0x10,%esp
     952:	85 c0                	test   %eax,%eax
     954:	89 c7                	mov    %eax,%edi
     956:	75 28                	jne    980 <sleeptest+0x50>
sleeptest(void)
{
  thread_t threads[NUM_THREAD];
  int i;

  for (i = 0; i < NUM_THREAD; i++){
     958:	83 c3 01             	add    $0x1,%ebx
     95b:	83 c6 04             	add    $0x4,%esi
     95e:	83 fb 0a             	cmp    $0xa,%ebx
     961:	75 dd                	jne    940 <sleeptest+0x10>
    if (thread_create(&threads[i], sleepthreadmain, (void*)i) != 0){
        printf(1, "panic at thread_create\n");
        return -1;
    }
  }
  sleep(10);
     963:	83 ec 0c             	sub    $0xc,%esp
     966:	6a 0a                	push   $0xa
     968:	e8 75 05 00 00       	call   ee2 <sleep>
  return 0;
     96d:	83 c4 10             	add    $0x10,%esp
}
     970:	8d 65 f4             	lea    -0xc(%ebp),%esp
     973:	89 f8                	mov    %edi,%eax
     975:	5b                   	pop    %ebx
     976:	5e                   	pop    %esi
     977:	5f                   	pop    %edi
     978:	5d                   	pop    %ebp
     979:	c3                   	ret    
     97a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  thread_t threads[NUM_THREAD];
  int i;

  for (i = 0; i < NUM_THREAD; i++){
    if (thread_create(&threads[i], sleepthreadmain, (void*)i) != 0){
        printf(1, "panic at thread_create\n");
     980:	83 ec 08             	sub    $0x8,%esp
     983:	bf ff ff ff ff       	mov    $0xffffffff,%edi
     988:	68 0a 13 00 00       	push   $0x130a
     98d:	6a 01                	push   $0x1
     98f:	e8 2c 06 00 00       	call   fc0 <printf>
     994:	83 c4 10             	add    $0x10,%esp
        return -1;
    }
  }
  sleep(10);
  return 0;
}
     997:	8d 65 f4             	lea    -0xc(%ebp),%esp
     99a:	89 f8                	mov    %edi,%eax
     99c:	5b                   	pop    %ebx
     99d:	5e                   	pop    %esi
     99e:	5f                   	pop    %edi
     99f:	5d                   	pop    %ebp
     9a0:	c3                   	ret    
     9a1:	eb 0d                	jmp    9b0 <exittest1>
     9a3:	90                   	nop
     9a4:	90                   	nop
     9a5:	90                   	nop
     9a6:	90                   	nop
     9a7:	90                   	nop
     9a8:	90                   	nop
     9a9:	90                   	nop
     9aa:	90                   	nop
     9ab:	90                   	nop
     9ac:	90                   	nop
     9ad:	90                   	nop
     9ae:	90                   	nop
     9af:	90                   	nop

000009b0 <exittest1>:
	return 0;
}

int
exittest1(void)
{
     9b0:	55                   	push   %ebp
     9b1:	89 e5                	mov    %esp,%ebp
     9b3:	57                   	push   %edi
     9b4:	56                   	push   %esi
     9b5:	53                   	push   %ebx
     9b6:	8d 7d e8             	lea    -0x18(%ebp),%edi
     9b9:	8d 5d c0             	lea    -0x40(%ebp),%ebx
     9bc:	83 ec 3c             	sub    $0x3c,%esp
     9bf:	90                   	nop
  thread_t threads[NUM_THREAD];
  int i;
  
  for (i = 0; i < NUM_THREAD; i++){
    if (thread_create(&threads[i], exitthreadmain, (void*)1) != 0){
     9c0:	83 ec 04             	sub    $0x4,%esp
     9c3:	6a 01                	push   $0x1
     9c5:	68 90 02 00 00       	push   $0x290
     9ca:	53                   	push   %ebx
     9cb:	e8 22 05 00 00       	call   ef2 <thread_create>
     9d0:	83 c4 10             	add    $0x10,%esp
     9d3:	85 c0                	test   %eax,%eax
     9d5:	89 c6                	mov    %eax,%esi
     9d7:	75 27                	jne    a00 <exittest1+0x50>
     9d9:	83 c3 04             	add    $0x4,%ebx
exittest1(void)
{
  thread_t threads[NUM_THREAD];
  int i;
  
  for (i = 0; i < NUM_THREAD; i++){
     9dc:	39 fb                	cmp    %edi,%ebx
     9de:	75 e0                	jne    9c0 <exittest1+0x10>
    if (thread_create(&threads[i], exitthreadmain, (void*)1) != 0){
      printf(1, "panic at thread_create\n");
      return -1;
    }
  }
  sleep(1);
     9e0:	83 ec 0c             	sub    $0xc,%esp
     9e3:	6a 01                	push   $0x1
     9e5:	e8 f8 04 00 00       	call   ee2 <sleep>
  return 0;
     9ea:	83 c4 10             	add    $0x10,%esp
}
     9ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9f0:	89 f0                	mov    %esi,%eax
     9f2:	5b                   	pop    %ebx
     9f3:	5e                   	pop    %esi
     9f4:	5f                   	pop    %edi
     9f5:	5d                   	pop    %ebp
     9f6:	c3                   	ret    
     9f7:	89 f6                	mov    %esi,%esi
     9f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  thread_t threads[NUM_THREAD];
  int i;

  for (i = 0; i < NUM_THREAD; i++){
    if (thread_create(&threads[i], sleepthreadmain, (void*)i) != 0){
        printf(1, "panic at thread_create\n");
     a00:	83 ec 08             	sub    $0x8,%esp
     a03:	be ff ff ff ff       	mov    $0xffffffff,%esi
     a08:	68 0a 13 00 00       	push   $0x130a
     a0d:	6a 01                	push   $0x1
     a0f:	e8 ac 05 00 00       	call   fc0 <printf>
     a14:	83 c4 10             	add    $0x10,%esp
      return -1;
    }
  }
  sleep(1);
  return 0;
}
     a17:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a1a:	89 f0                	mov    %esi,%eax
     a1c:	5b                   	pop    %ebx
     a1d:	5e                   	pop    %esi
     a1e:	5f                   	pop    %edi
     a1f:	5d                   	pop    %ebp
     a20:	c3                   	ret    
     a21:	eb 0d                	jmp    a30 <basictest>
     a23:	90                   	nop
     a24:	90                   	nop
     a25:	90                   	nop
     a26:	90                   	nop
     a27:	90                   	nop
     a28:	90                   	nop
     a29:	90                   	nop
     a2a:	90                   	nop
     a2b:	90                   	nop
     a2c:	90                   	nop
     a2d:	90                   	nop
     a2e:	90                   	nop
     a2f:	90                   	nop

00000a30 <basictest>:
	return 0;
}

int
basictest(void)
{
     a30:	55                   	push   %ebp
     a31:	89 e5                	mov    %esp,%ebp
     a33:	56                   	push   %esi
     a34:	53                   	push   %ebx
     a35:	8d 75 d0             	lea    -0x30(%ebp),%esi
  thread_t threads[NUM_THREAD];
  int i;
  void *retval;
  
  for (i = 0; i < NUM_THREAD; i++){
     a38:	31 db                	xor    %ebx,%ebx
	return 0;
}

int
basictest(void)
{
     a3a:	83 ec 40             	sub    $0x40,%esp
     a3d:	8d 76 00             	lea    0x0(%esi),%esi
  thread_t threads[NUM_THREAD];
  int i;
  void *retval;
  
  for (i = 0; i < NUM_THREAD; i++){
    if (thread_create(&threads[i], basicthreadmain, (void*)i) != 0){
     a40:	83 ec 04             	sub    $0x4,%esp
     a43:	53                   	push   %ebx
     a44:	68 d0 01 00 00       	push   $0x1d0
     a49:	56                   	push   %esi
     a4a:	e8 a3 04 00 00       	call   ef2 <thread_create>
     a4f:	83 c4 10             	add    $0x10,%esp
     a52:	85 c0                	test   %eax,%eax
     a54:	75 5a                	jne    ab0 <basictest+0x80>
{
  thread_t threads[NUM_THREAD];
  int i;
  void *retval;
  
  for (i = 0; i < NUM_THREAD; i++){
     a56:	83 c3 01             	add    $0x1,%ebx
     a59:	83 c6 04             	add    $0x4,%esi
     a5c:	83 fb 0a             	cmp    $0xa,%ebx
     a5f:	75 df                	jne    a40 <basictest+0x10>
     a61:	8d 75 cc             	lea    -0x34(%ebp),%esi
     a64:	31 db                	xor    %ebx,%ebx
     a66:	8d 76 00             	lea    0x0(%esi),%esi
     a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      printf(1, "panic at thread_create\n");
      return -1;
    }
  }
  for (i = 0; i < NUM_THREAD; i++){
    if (thread_join(threads[i], &retval) != 0 || (int)retval != i+1){
     a70:	83 ec 08             	sub    $0x8,%esp
     a73:	56                   	push   %esi
     a74:	ff 74 9d d0          	pushl  -0x30(%ebp,%ebx,4)
     a78:	e8 85 04 00 00       	call   f02 <thread_join>
     a7d:	83 c4 10             	add    $0x10,%esp
     a80:	85 c0                	test   %eax,%eax
     a82:	75 4c                	jne    ad0 <basictest+0xa0>
     a84:	83 c3 01             	add    $0x1,%ebx
     a87:	39 5d cc             	cmp    %ebx,-0x34(%ebp)
     a8a:	75 44                	jne    ad0 <basictest+0xa0>
    if (thread_create(&threads[i], basicthreadmain, (void*)i) != 0){
      printf(1, "panic at thread_create\n");
      return -1;
    }
  }
  for (i = 0; i < NUM_THREAD; i++){
     a8c:	83 fb 0a             	cmp    $0xa,%ebx
     a8f:	75 df                	jne    a70 <basictest+0x40>
    if (thread_join(threads[i], &retval) != 0 || (int)retval != i+1){
      printf(1, "panic at thread_join\n");
      return -1;
    }
  }
  printf(1,"\n");
     a91:	83 ec 08             	sub    $0x8,%esp
     a94:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     a97:	68 30 13 00 00       	push   $0x1330
     a9c:	6a 01                	push   $0x1
     a9e:	e8 1d 05 00 00       	call   fc0 <printf>
  return 0;
     aa3:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     aa6:	83 c4 10             	add    $0x10,%esp
}
     aa9:	8d 65 f8             	lea    -0x8(%ebp),%esp
     aac:	5b                   	pop    %ebx
     aad:	5e                   	pop    %esi
     aae:	5d                   	pop    %ebp
     aaf:	c3                   	ret    
  int i;
  void *retval;
  
  for (i = 0; i < NUM_THREAD; i++){
    if (thread_create(&threads[i], basicthreadmain, (void*)i) != 0){
      printf(1, "panic at thread_create\n");
     ab0:	83 ec 08             	sub    $0x8,%esp
     ab3:	68 0a 13 00 00       	push   $0x130a
     ab8:	6a 01                	push   $0x1
     aba:	e8 01 05 00 00       	call   fc0 <printf>
      return -1;
     abf:	83 c4 10             	add    $0x10,%esp
      return -1;
    }
  }
  printf(1,"\n");
  return 0;
}
     ac2:	8d 65 f8             	lea    -0x8(%ebp),%esp
  void *retval;
  
  for (i = 0; i < NUM_THREAD; i++){
    if (thread_create(&threads[i], basicthreadmain, (void*)i) != 0){
      printf(1, "panic at thread_create\n");
      return -1;
     ac5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
    }
  }
  printf(1,"\n");
  return 0;
}
     aca:	5b                   	pop    %ebx
     acb:	5e                   	pop    %esi
     acc:	5d                   	pop    %ebp
     acd:	c3                   	ret    
     ace:	66 90                	xchg   %ax,%ax
    }
  }
  printf(1, "thread_join!!!\n");
  for (i = 1; i <= NUM_THREAD; i++){
    if (thread_join(threads[i-1], &retval) != 0 || (int)retval != i * 2 ){
      printf(1, "panic at thread_join\n");
     ad0:	83 ec 08             	sub    $0x8,%esp
     ad3:	68 32 13 00 00       	push   $0x1332
     ad8:	6a 01                	push   $0x1
     ada:	e8 e1 04 00 00       	call   fc0 <printf>
     adf:	83 c4 10             	add    $0x10,%esp
      return -1;
    }
  }
  printf(1,"\n");
  return 0;
}
     ae2:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }
  }
  printf(1, "thread_join!!!\n");
  for (i = 1; i <= NUM_THREAD; i++){
    if (thread_join(threads[i-1], &retval) != 0 || (int)retval != i * 2 ){
      printf(1, "panic at thread_join\n");
     ae5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
    }
  }
  printf(1,"\n");
  return 0;
}
     aea:	5b                   	pop    %ebx
     aeb:	5e                   	pop    %esi
     aec:	5d                   	pop    %ebp
     aed:	c3                   	ret    
     aee:	66 90                	xchg   %ax,%ax

00000af0 <racingtest>:
	return 0;
}

int
racingtest(void)
{
     af0:	55                   	push   %ebp
     af1:	89 e5                	mov    %esp,%ebp
     af3:	56                   	push   %esi
     af4:	53                   	push   %ebx
     af5:	8d 75 d0             	lea    -0x30(%ebp),%esi
  thread_t threads[NUM_THREAD];
  int i;
  void *retval;
  gcnt = 0;
  
  for (i = 0; i < NUM_THREAD; i++){
     af8:	31 db                	xor    %ebx,%ebx
	return 0;
}

int
racingtest(void)
{
     afa:	83 ec 40             	sub    $0x40,%esp
  thread_t threads[NUM_THREAD];
  int i;
  void *retval;
  gcnt = 0;
     afd:	c7 05 e4 1b 00 00 00 	movl   $0x0,0x1be4
     b04:	00 00 00 
     b07:	89 f6                	mov    %esi,%esi
     b09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  
  for (i = 0; i < NUM_THREAD; i++){
    if (thread_create(&threads[i], racingthreadmain, (void*)i) != 0){
     b10:	83 ec 04             	sub    $0x4,%esp
     b13:	53                   	push   %ebx
     b14:	68 10 03 00 00       	push   $0x310
     b19:	56                   	push   %esi
     b1a:	e8 d3 03 00 00       	call   ef2 <thread_create>
     b1f:	83 c4 10             	add    $0x10,%esp
     b22:	85 c0                	test   %eax,%eax
     b24:	75 6a                	jne    b90 <racingtest+0xa0>
  thread_t threads[NUM_THREAD];
  int i;
  void *retval;
  gcnt = 0;
  
  for (i = 0; i < NUM_THREAD; i++){
     b26:	83 c3 01             	add    $0x1,%ebx
     b29:	83 c6 04             	add    $0x4,%esi
     b2c:	83 fb 0a             	cmp    $0xa,%ebx
     b2f:	75 df                	jne    b10 <racingtest+0x20>
     b31:	8d 75 cc             	lea    -0x34(%ebp),%esi
     b34:	31 db                	xor    %ebx,%ebx
     b36:	8d 76 00             	lea    0x0(%esi),%esi
     b39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      printf(1, "panic at thread_create\n");
      return -1;
    }
  }
  for (i = 0; i < NUM_THREAD; i++){
    if (thread_join(threads[i], &retval) != 0 || (int)retval != i+1){
     b40:	83 ec 08             	sub    $0x8,%esp
     b43:	56                   	push   %esi
     b44:	ff 74 9d d0          	pushl  -0x30(%ebp,%ebx,4)
     b48:	e8 b5 03 00 00       	call   f02 <thread_join>
     b4d:	83 c4 10             	add    $0x10,%esp
     b50:	85 c0                	test   %eax,%eax
     b52:	75 5c                	jne    bb0 <racingtest+0xc0>
     b54:	83 c3 01             	add    $0x1,%ebx
     b57:	39 5d cc             	cmp    %ebx,-0x34(%ebp)
     b5a:	75 54                	jne    bb0 <racingtest+0xc0>
    if (thread_create(&threads[i], racingthreadmain, (void*)i) != 0){
      printf(1, "panic at thread_create\n");
      return -1;
    }
  }
  for (i = 0; i < NUM_THREAD; i++){
     b5c:	83 fb 0a             	cmp    $0xa,%ebx
     b5f:	75 df                	jne    b40 <racingtest+0x50>
    if (thread_join(threads[i], &retval) != 0 || (int)retval != i+1){
      printf(1, "panic at thread_join\n");
      return -1;
    }
  }
  printf(1,"%d\n", gcnt);
     b61:	83 ec 04             	sub    $0x4,%esp
     b64:	ff 35 e4 1b 00 00    	pushl  0x1be4
     b6a:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     b6d:	68 9e 13 00 00       	push   $0x139e
     b72:	6a 01                	push   $0x1
     b74:	e8 47 04 00 00       	call   fc0 <printf>
  return 0;
     b79:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     b7c:	83 c4 10             	add    $0x10,%esp
}
     b7f:	8d 65 f8             	lea    -0x8(%ebp),%esp
     b82:	5b                   	pop    %ebx
     b83:	5e                   	pop    %esi
     b84:	5d                   	pop    %ebp
     b85:	c3                   	ret    
     b86:	8d 76 00             	lea    0x0(%esi),%esi
     b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  void *retval;
  gcnt = 0;
  
  for (i = 0; i < NUM_THREAD; i++){
    if (thread_create(&threads[i], racingthreadmain, (void*)i) != 0){
      printf(1, "panic at thread_create\n");
     b90:	83 ec 08             	sub    $0x8,%esp
     b93:	68 0a 13 00 00       	push   $0x130a
     b98:	6a 01                	push   $0x1
     b9a:	e8 21 04 00 00       	call   fc0 <printf>
      return -1;
     b9f:	83 c4 10             	add    $0x10,%esp
      return -1;
    }
  }
  printf(1,"%d\n", gcnt);
  return 0;
}
     ba2:	8d 65 f8             	lea    -0x8(%ebp),%esp
  gcnt = 0;
  
  for (i = 0; i < NUM_THREAD; i++){
    if (thread_create(&threads[i], racingthreadmain, (void*)i) != 0){
      printf(1, "panic at thread_create\n");
      return -1;
     ba5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
    }
  }
  printf(1,"%d\n", gcnt);
  return 0;
}
     baa:	5b                   	pop    %ebx
     bab:	5e                   	pop    %esi
     bac:	5d                   	pop    %ebp
     bad:	c3                   	ret    
     bae:	66 90                	xchg   %ax,%ax
    }
  }
  printf(1, "thread_join!!!\n");
  for (i = 1; i <= NUM_THREAD; i++){
    if (thread_join(threads[i-1], &retval) != 0 || (int)retval != i * 2 ){
      printf(1, "panic at thread_join\n");
     bb0:	83 ec 08             	sub    $0x8,%esp
     bb3:	68 32 13 00 00       	push   $0x1332
     bb8:	6a 01                	push   $0x1
     bba:	e8 01 04 00 00       	call   fc0 <printf>
     bbf:	83 c4 10             	add    $0x10,%esp
      return -1;
    }
  }
  printf(1,"%d\n", gcnt);
  return 0;
}
     bc2:	8d 65 f8             	lea    -0x8(%ebp),%esp
    }
  }
  printf(1, "thread_join!!!\n");
  for (i = 1; i <= NUM_THREAD; i++){
    if (thread_join(threads[i-1], &retval) != 0 || (int)retval != i * 2 ){
      printf(1, "panic at thread_join\n");
     bc5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
      return -1;
    }
  }
  printf(1,"%d\n", gcnt);
  return 0;
}
     bca:	5b                   	pop    %ebx
     bcb:	5e                   	pop    %esi
     bcc:	5d                   	pop    %ebp
     bcd:	c3                   	ret    
     bce:	66 90                	xchg   %ax,%ax

00000bd0 <nop>:
  }
  exit();
}

// ============================================================================
void nop(){ }
     bd0:	55                   	push   %ebp
     bd1:	89 e5                	mov    %esp,%ebp
     bd3:	5d                   	pop    %ebp
     bd4:	c3                   	ret    
     bd5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000be0 <execthreadmain>:
     be0:	55                   	push   %ebp
     be1:	31 c0                	xor    %eax,%eax
     be3:	89 e5                	mov    %esp,%ebp
     be5:	5d                   	pop    %ebp
     be6:	c3                   	ret    
     be7:	89 f6                	mov    %esi,%esi
     be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bf0 <sbrkthreadmain>:
     bf0:	55                   	push   %ebp
     bf1:	31 c0                	xor    %eax,%eax
     bf3:	89 e5                	mov    %esp,%ebp
     bf5:	5d                   	pop    %ebp
     bf6:	c3                   	ret    
     bf7:	89 f6                	mov    %esi,%esi
     bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c00 <killthreadmain>:

// ============================================================================

void*
killthreadmain(void *arg)
{
     c00:	55                   	push   %ebp
	return 0;
}
     c01:	31 c0                	xor    %eax,%eax

// ============================================================================

void*
killthreadmain(void *arg)
{
     c03:	89 e5                	mov    %esp,%ebp
	return 0;
}
     c05:	5d                   	pop    %ebp
     c06:	c3                   	ret    
     c07:	66 90                	xchg   %ax,%ax
     c09:	66 90                	xchg   %ax,%ax
     c0b:	66 90                	xchg   %ax,%ax
     c0d:	66 90                	xchg   %ax,%ax
     c0f:	90                   	nop

00000c10 <strcpy>:
     c10:	55                   	push   %ebp
     c11:	89 e5                	mov    %esp,%ebp
     c13:	53                   	push   %ebx
     c14:	8b 45 08             	mov    0x8(%ebp),%eax
     c17:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     c1a:	89 c2                	mov    %eax,%edx
     c1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c20:	83 c1 01             	add    $0x1,%ecx
     c23:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     c27:	83 c2 01             	add    $0x1,%edx
     c2a:	84 db                	test   %bl,%bl
     c2c:	88 5a ff             	mov    %bl,-0x1(%edx)
     c2f:	75 ef                	jne    c20 <strcpy+0x10>
     c31:	5b                   	pop    %ebx
     c32:	5d                   	pop    %ebp
     c33:	c3                   	ret    
     c34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     c3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000c40 <strcmp>:
     c40:	55                   	push   %ebp
     c41:	89 e5                	mov    %esp,%ebp
     c43:	56                   	push   %esi
     c44:	53                   	push   %ebx
     c45:	8b 55 08             	mov    0x8(%ebp),%edx
     c48:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     c4b:	0f b6 02             	movzbl (%edx),%eax
     c4e:	0f b6 19             	movzbl (%ecx),%ebx
     c51:	84 c0                	test   %al,%al
     c53:	75 1e                	jne    c73 <strcmp+0x33>
     c55:	eb 29                	jmp    c80 <strcmp+0x40>
     c57:	89 f6                	mov    %esi,%esi
     c59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     c60:	83 c2 01             	add    $0x1,%edx
     c63:	0f b6 02             	movzbl (%edx),%eax
     c66:	8d 71 01             	lea    0x1(%ecx),%esi
     c69:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     c6d:	84 c0                	test   %al,%al
     c6f:	74 0f                	je     c80 <strcmp+0x40>
     c71:	89 f1                	mov    %esi,%ecx
     c73:	38 d8                	cmp    %bl,%al
     c75:	74 e9                	je     c60 <strcmp+0x20>
     c77:	29 d8                	sub    %ebx,%eax
     c79:	5b                   	pop    %ebx
     c7a:	5e                   	pop    %esi
     c7b:	5d                   	pop    %ebp
     c7c:	c3                   	ret    
     c7d:	8d 76 00             	lea    0x0(%esi),%esi
     c80:	31 c0                	xor    %eax,%eax
     c82:	29 d8                	sub    %ebx,%eax
     c84:	5b                   	pop    %ebx
     c85:	5e                   	pop    %esi
     c86:	5d                   	pop    %ebp
     c87:	c3                   	ret    
     c88:	90                   	nop
     c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c90 <strlen>:
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	8b 4d 08             	mov    0x8(%ebp),%ecx
     c96:	80 39 00             	cmpb   $0x0,(%ecx)
     c99:	74 12                	je     cad <strlen+0x1d>
     c9b:	31 d2                	xor    %edx,%edx
     c9d:	8d 76 00             	lea    0x0(%esi),%esi
     ca0:	83 c2 01             	add    $0x1,%edx
     ca3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     ca7:	89 d0                	mov    %edx,%eax
     ca9:	75 f5                	jne    ca0 <strlen+0x10>
     cab:	5d                   	pop    %ebp
     cac:	c3                   	ret    
     cad:	31 c0                	xor    %eax,%eax
     caf:	5d                   	pop    %ebp
     cb0:	c3                   	ret    
     cb1:	eb 0d                	jmp    cc0 <memset>
     cb3:	90                   	nop
     cb4:	90                   	nop
     cb5:	90                   	nop
     cb6:	90                   	nop
     cb7:	90                   	nop
     cb8:	90                   	nop
     cb9:	90                   	nop
     cba:	90                   	nop
     cbb:	90                   	nop
     cbc:	90                   	nop
     cbd:	90                   	nop
     cbe:	90                   	nop
     cbf:	90                   	nop

00000cc0 <memset>:
     cc0:	55                   	push   %ebp
     cc1:	89 e5                	mov    %esp,%ebp
     cc3:	57                   	push   %edi
     cc4:	8b 55 08             	mov    0x8(%ebp),%edx
     cc7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     cca:	8b 45 0c             	mov    0xc(%ebp),%eax
     ccd:	89 d7                	mov    %edx,%edi
     ccf:	fc                   	cld    
     cd0:	f3 aa                	rep stos %al,%es:(%edi)
     cd2:	89 d0                	mov    %edx,%eax
     cd4:	5f                   	pop    %edi
     cd5:	5d                   	pop    %ebp
     cd6:	c3                   	ret    
     cd7:	89 f6                	mov    %esi,%esi
     cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ce0 <strchr>:
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	53                   	push   %ebx
     ce4:	8b 45 08             	mov    0x8(%ebp),%eax
     ce7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     cea:	0f b6 10             	movzbl (%eax),%edx
     ced:	84 d2                	test   %dl,%dl
     cef:	74 1d                	je     d0e <strchr+0x2e>
     cf1:	38 d3                	cmp    %dl,%bl
     cf3:	89 d9                	mov    %ebx,%ecx
     cf5:	75 0d                	jne    d04 <strchr+0x24>
     cf7:	eb 17                	jmp    d10 <strchr+0x30>
     cf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d00:	38 ca                	cmp    %cl,%dl
     d02:	74 0c                	je     d10 <strchr+0x30>
     d04:	83 c0 01             	add    $0x1,%eax
     d07:	0f b6 10             	movzbl (%eax),%edx
     d0a:	84 d2                	test   %dl,%dl
     d0c:	75 f2                	jne    d00 <strchr+0x20>
     d0e:	31 c0                	xor    %eax,%eax
     d10:	5b                   	pop    %ebx
     d11:	5d                   	pop    %ebp
     d12:	c3                   	ret    
     d13:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     d19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d20 <gets>:
     d20:	55                   	push   %ebp
     d21:	89 e5                	mov    %esp,%ebp
     d23:	57                   	push   %edi
     d24:	56                   	push   %esi
     d25:	53                   	push   %ebx
     d26:	31 f6                	xor    %esi,%esi
     d28:	8d 7d e7             	lea    -0x19(%ebp),%edi
     d2b:	83 ec 1c             	sub    $0x1c,%esp
     d2e:	eb 29                	jmp    d59 <gets+0x39>
     d30:	83 ec 04             	sub    $0x4,%esp
     d33:	6a 01                	push   $0x1
     d35:	57                   	push   %edi
     d36:	6a 00                	push   $0x0
     d38:	e8 2d 01 00 00       	call   e6a <read>
     d3d:	83 c4 10             	add    $0x10,%esp
     d40:	85 c0                	test   %eax,%eax
     d42:	7e 1d                	jle    d61 <gets+0x41>
     d44:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     d48:	8b 55 08             	mov    0x8(%ebp),%edx
     d4b:	89 de                	mov    %ebx,%esi
     d4d:	3c 0a                	cmp    $0xa,%al
     d4f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
     d53:	74 1b                	je     d70 <gets+0x50>
     d55:	3c 0d                	cmp    $0xd,%al
     d57:	74 17                	je     d70 <gets+0x50>
     d59:	8d 5e 01             	lea    0x1(%esi),%ebx
     d5c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     d5f:	7c cf                	jl     d30 <gets+0x10>
     d61:	8b 45 08             	mov    0x8(%ebp),%eax
     d64:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
     d68:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d6b:	5b                   	pop    %ebx
     d6c:	5e                   	pop    %esi
     d6d:	5f                   	pop    %edi
     d6e:	5d                   	pop    %ebp
     d6f:	c3                   	ret    
     d70:	8b 45 08             	mov    0x8(%ebp),%eax
     d73:	89 de                	mov    %ebx,%esi
     d75:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
     d79:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d7c:	5b                   	pop    %ebx
     d7d:	5e                   	pop    %esi
     d7e:	5f                   	pop    %edi
     d7f:	5d                   	pop    %ebp
     d80:	c3                   	ret    
     d81:	eb 0d                	jmp    d90 <stat>
     d83:	90                   	nop
     d84:	90                   	nop
     d85:	90                   	nop
     d86:	90                   	nop
     d87:	90                   	nop
     d88:	90                   	nop
     d89:	90                   	nop
     d8a:	90                   	nop
     d8b:	90                   	nop
     d8c:	90                   	nop
     d8d:	90                   	nop
     d8e:	90                   	nop
     d8f:	90                   	nop

00000d90 <stat>:
     d90:	55                   	push   %ebp
     d91:	89 e5                	mov    %esp,%ebp
     d93:	56                   	push   %esi
     d94:	53                   	push   %ebx
     d95:	83 ec 08             	sub    $0x8,%esp
     d98:	6a 00                	push   $0x0
     d9a:	ff 75 08             	pushl  0x8(%ebp)
     d9d:	e8 f0 00 00 00       	call   e92 <open>
     da2:	83 c4 10             	add    $0x10,%esp
     da5:	85 c0                	test   %eax,%eax
     da7:	78 27                	js     dd0 <stat+0x40>
     da9:	83 ec 08             	sub    $0x8,%esp
     dac:	ff 75 0c             	pushl  0xc(%ebp)
     daf:	89 c3                	mov    %eax,%ebx
     db1:	50                   	push   %eax
     db2:	e8 f3 00 00 00       	call   eaa <fstat>
     db7:	89 c6                	mov    %eax,%esi
     db9:	89 1c 24             	mov    %ebx,(%esp)
     dbc:	e8 b9 00 00 00       	call   e7a <close>
     dc1:	83 c4 10             	add    $0x10,%esp
     dc4:	89 f0                	mov    %esi,%eax
     dc6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     dc9:	5b                   	pop    %ebx
     dca:	5e                   	pop    %esi
     dcb:	5d                   	pop    %ebp
     dcc:	c3                   	ret    
     dcd:	8d 76 00             	lea    0x0(%esi),%esi
     dd0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     dd5:	eb ef                	jmp    dc6 <stat+0x36>
     dd7:	89 f6                	mov    %esi,%esi
     dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000de0 <atoi>:
     de0:	55                   	push   %ebp
     de1:	89 e5                	mov    %esp,%ebp
     de3:	53                   	push   %ebx
     de4:	8b 4d 08             	mov    0x8(%ebp),%ecx
     de7:	0f be 11             	movsbl (%ecx),%edx
     dea:	8d 42 d0             	lea    -0x30(%edx),%eax
     ded:	3c 09                	cmp    $0x9,%al
     def:	b8 00 00 00 00       	mov    $0x0,%eax
     df4:	77 1f                	ja     e15 <atoi+0x35>
     df6:	8d 76 00             	lea    0x0(%esi),%esi
     df9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     e00:	8d 04 80             	lea    (%eax,%eax,4),%eax
     e03:	83 c1 01             	add    $0x1,%ecx
     e06:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
     e0a:	0f be 11             	movsbl (%ecx),%edx
     e0d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     e10:	80 fb 09             	cmp    $0x9,%bl
     e13:	76 eb                	jbe    e00 <atoi+0x20>
     e15:	5b                   	pop    %ebx
     e16:	5d                   	pop    %ebp
     e17:	c3                   	ret    
     e18:	90                   	nop
     e19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000e20 <memmove>:
     e20:	55                   	push   %ebp
     e21:	89 e5                	mov    %esp,%ebp
     e23:	56                   	push   %esi
     e24:	53                   	push   %ebx
     e25:	8b 5d 10             	mov    0x10(%ebp),%ebx
     e28:	8b 45 08             	mov    0x8(%ebp),%eax
     e2b:	8b 75 0c             	mov    0xc(%ebp),%esi
     e2e:	85 db                	test   %ebx,%ebx
     e30:	7e 14                	jle    e46 <memmove+0x26>
     e32:	31 d2                	xor    %edx,%edx
     e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e38:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     e3c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     e3f:	83 c2 01             	add    $0x1,%edx
     e42:	39 da                	cmp    %ebx,%edx
     e44:	75 f2                	jne    e38 <memmove+0x18>
     e46:	5b                   	pop    %ebx
     e47:	5e                   	pop    %esi
     e48:	5d                   	pop    %ebp
     e49:	c3                   	ret    

00000e4a <fork>:
     e4a:	b8 01 00 00 00       	mov    $0x1,%eax
     e4f:	cd 40                	int    $0x40
     e51:	c3                   	ret    

00000e52 <exit>:
     e52:	b8 02 00 00 00       	mov    $0x2,%eax
     e57:	cd 40                	int    $0x40
     e59:	c3                   	ret    

00000e5a <wait>:
     e5a:	b8 03 00 00 00       	mov    $0x3,%eax
     e5f:	cd 40                	int    $0x40
     e61:	c3                   	ret    

00000e62 <pipe>:
     e62:	b8 04 00 00 00       	mov    $0x4,%eax
     e67:	cd 40                	int    $0x40
     e69:	c3                   	ret    

00000e6a <read>:
     e6a:	b8 05 00 00 00       	mov    $0x5,%eax
     e6f:	cd 40                	int    $0x40
     e71:	c3                   	ret    

00000e72 <write>:
     e72:	b8 10 00 00 00       	mov    $0x10,%eax
     e77:	cd 40                	int    $0x40
     e79:	c3                   	ret    

00000e7a <close>:
     e7a:	b8 15 00 00 00       	mov    $0x15,%eax
     e7f:	cd 40                	int    $0x40
     e81:	c3                   	ret    

00000e82 <kill>:
     e82:	b8 06 00 00 00       	mov    $0x6,%eax
     e87:	cd 40                	int    $0x40
     e89:	c3                   	ret    

00000e8a <exec>:
     e8a:	b8 07 00 00 00       	mov    $0x7,%eax
     e8f:	cd 40                	int    $0x40
     e91:	c3                   	ret    

00000e92 <open>:
     e92:	b8 0f 00 00 00       	mov    $0xf,%eax
     e97:	cd 40                	int    $0x40
     e99:	c3                   	ret    

00000e9a <mknod>:
     e9a:	b8 11 00 00 00       	mov    $0x11,%eax
     e9f:	cd 40                	int    $0x40
     ea1:	c3                   	ret    

00000ea2 <unlink>:
     ea2:	b8 12 00 00 00       	mov    $0x12,%eax
     ea7:	cd 40                	int    $0x40
     ea9:	c3                   	ret    

00000eaa <fstat>:
     eaa:	b8 08 00 00 00       	mov    $0x8,%eax
     eaf:	cd 40                	int    $0x40
     eb1:	c3                   	ret    

00000eb2 <link>:
     eb2:	b8 13 00 00 00       	mov    $0x13,%eax
     eb7:	cd 40                	int    $0x40
     eb9:	c3                   	ret    

00000eba <mkdir>:
     eba:	b8 14 00 00 00       	mov    $0x14,%eax
     ebf:	cd 40                	int    $0x40
     ec1:	c3                   	ret    

00000ec2 <chdir>:
     ec2:	b8 09 00 00 00       	mov    $0x9,%eax
     ec7:	cd 40                	int    $0x40
     ec9:	c3                   	ret    

00000eca <dup>:
     eca:	b8 0a 00 00 00       	mov    $0xa,%eax
     ecf:	cd 40                	int    $0x40
     ed1:	c3                   	ret    

00000ed2 <getpid>:
     ed2:	b8 0b 00 00 00       	mov    $0xb,%eax
     ed7:	cd 40                	int    $0x40
     ed9:	c3                   	ret    

00000eda <sbrk>:
     eda:	b8 0c 00 00 00       	mov    $0xc,%eax
     edf:	cd 40                	int    $0x40
     ee1:	c3                   	ret    

00000ee2 <sleep>:
     ee2:	b8 0d 00 00 00       	mov    $0xd,%eax
     ee7:	cd 40                	int    $0x40
     ee9:	c3                   	ret    

00000eea <uptime>:
     eea:	b8 0e 00 00 00       	mov    $0xe,%eax
     eef:	cd 40                	int    $0x40
     ef1:	c3                   	ret    

00000ef2 <thread_create>:
     ef2:	b8 16 00 00 00       	mov    $0x16,%eax
     ef7:	cd 40                	int    $0x40
     ef9:	c3                   	ret    

00000efa <thread_exit>:
     efa:	b8 17 00 00 00       	mov    $0x17,%eax
     eff:	cd 40                	int    $0x40
     f01:	c3                   	ret    

00000f02 <thread_join>:
     f02:	b8 18 00 00 00       	mov    $0x18,%eax
     f07:	cd 40                	int    $0x40
     f09:	c3                   	ret    

00000f0a <ex>:
     f0a:	b8 19 00 00 00       	mov    $0x19,%eax
     f0f:	cd 40                	int    $0x40
     f11:	c3                   	ret    
     f12:	66 90                	xchg   %ax,%ax
     f14:	66 90                	xchg   %ax,%ax
     f16:	66 90                	xchg   %ax,%ax
     f18:	66 90                	xchg   %ax,%ax
     f1a:	66 90                	xchg   %ax,%ax
     f1c:	66 90                	xchg   %ax,%ax
     f1e:	66 90                	xchg   %ax,%ax

00000f20 <printint>:
     f20:	55                   	push   %ebp
     f21:	89 e5                	mov    %esp,%ebp
     f23:	57                   	push   %edi
     f24:	56                   	push   %esi
     f25:	53                   	push   %ebx
     f26:	89 c6                	mov    %eax,%esi
     f28:	83 ec 3c             	sub    $0x3c,%esp
     f2b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     f2e:	85 db                	test   %ebx,%ebx
     f30:	74 7e                	je     fb0 <printint+0x90>
     f32:	89 d0                	mov    %edx,%eax
     f34:	c1 e8 1f             	shr    $0x1f,%eax
     f37:	84 c0                	test   %al,%al
     f39:	74 75                	je     fb0 <printint+0x90>
     f3b:	89 d0                	mov    %edx,%eax
     f3d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
     f44:	f7 d8                	neg    %eax
     f46:	89 75 c0             	mov    %esi,-0x40(%ebp)
     f49:	31 ff                	xor    %edi,%edi
     f4b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     f4e:	89 ce                	mov    %ecx,%esi
     f50:	eb 08                	jmp    f5a <printint+0x3a>
     f52:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     f58:	89 cf                	mov    %ecx,%edi
     f5a:	31 d2                	xor    %edx,%edx
     f5c:	8d 4f 01             	lea    0x1(%edi),%ecx
     f5f:	f7 f6                	div    %esi
     f61:	0f b6 92 8c 14 00 00 	movzbl 0x148c(%edx),%edx
     f68:	85 c0                	test   %eax,%eax
     f6a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
     f6d:	75 e9                	jne    f58 <printint+0x38>
     f6f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     f72:	8b 75 c0             	mov    -0x40(%ebp),%esi
     f75:	85 c0                	test   %eax,%eax
     f77:	74 08                	je     f81 <printint+0x61>
     f79:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     f7e:	8d 4f 02             	lea    0x2(%edi),%ecx
     f81:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
     f85:	8d 76 00             	lea    0x0(%esi),%esi
     f88:	0f b6 07             	movzbl (%edi),%eax
     f8b:	83 ec 04             	sub    $0x4,%esp
     f8e:	83 ef 01             	sub    $0x1,%edi
     f91:	6a 01                	push   $0x1
     f93:	53                   	push   %ebx
     f94:	56                   	push   %esi
     f95:	88 45 d7             	mov    %al,-0x29(%ebp)
     f98:	e8 d5 fe ff ff       	call   e72 <write>
     f9d:	83 c4 10             	add    $0x10,%esp
     fa0:	39 df                	cmp    %ebx,%edi
     fa2:	75 e4                	jne    f88 <printint+0x68>
     fa4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fa7:	5b                   	pop    %ebx
     fa8:	5e                   	pop    %esi
     fa9:	5f                   	pop    %edi
     faa:	5d                   	pop    %ebp
     fab:	c3                   	ret    
     fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fb0:	89 d0                	mov    %edx,%eax
     fb2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     fb9:	eb 8b                	jmp    f46 <printint+0x26>
     fbb:	90                   	nop
     fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000fc0 <printf>:
     fc0:	55                   	push   %ebp
     fc1:	89 e5                	mov    %esp,%ebp
     fc3:	57                   	push   %edi
     fc4:	56                   	push   %esi
     fc5:	53                   	push   %ebx
     fc6:	8d 45 10             	lea    0x10(%ebp),%eax
     fc9:	83 ec 2c             	sub    $0x2c,%esp
     fcc:	8b 75 0c             	mov    0xc(%ebp),%esi
     fcf:	8b 7d 08             	mov    0x8(%ebp),%edi
     fd2:	89 45 d0             	mov    %eax,-0x30(%ebp)
     fd5:	0f b6 1e             	movzbl (%esi),%ebx
     fd8:	83 c6 01             	add    $0x1,%esi
     fdb:	84 db                	test   %bl,%bl
     fdd:	0f 84 b0 00 00 00    	je     1093 <printf+0xd3>
     fe3:	31 d2                	xor    %edx,%edx
     fe5:	eb 39                	jmp    1020 <printf+0x60>
     fe7:	89 f6                	mov    %esi,%esi
     fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     ff0:	83 f8 25             	cmp    $0x25,%eax
     ff3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     ff6:	ba 25 00 00 00       	mov    $0x25,%edx
     ffb:	74 18                	je     1015 <printf+0x55>
     ffd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1000:	83 ec 04             	sub    $0x4,%esp
    1003:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    1006:	6a 01                	push   $0x1
    1008:	50                   	push   %eax
    1009:	57                   	push   %edi
    100a:	e8 63 fe ff ff       	call   e72 <write>
    100f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    1012:	83 c4 10             	add    $0x10,%esp
    1015:	83 c6 01             	add    $0x1,%esi
    1018:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    101c:	84 db                	test   %bl,%bl
    101e:	74 73                	je     1093 <printf+0xd3>
    1020:	85 d2                	test   %edx,%edx
    1022:	0f be cb             	movsbl %bl,%ecx
    1025:	0f b6 c3             	movzbl %bl,%eax
    1028:	74 c6                	je     ff0 <printf+0x30>
    102a:	83 fa 25             	cmp    $0x25,%edx
    102d:	75 e6                	jne    1015 <printf+0x55>
    102f:	83 f8 64             	cmp    $0x64,%eax
    1032:	0f 84 f8 00 00 00    	je     1130 <printf+0x170>
    1038:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    103e:	83 f9 70             	cmp    $0x70,%ecx
    1041:	74 5d                	je     10a0 <printf+0xe0>
    1043:	83 f8 73             	cmp    $0x73,%eax
    1046:	0f 84 84 00 00 00    	je     10d0 <printf+0x110>
    104c:	83 f8 63             	cmp    $0x63,%eax
    104f:	0f 84 ea 00 00 00    	je     113f <printf+0x17f>
    1055:	83 f8 25             	cmp    $0x25,%eax
    1058:	0f 84 c2 00 00 00    	je     1120 <printf+0x160>
    105e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1061:	83 ec 04             	sub    $0x4,%esp
    1064:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    1068:	6a 01                	push   $0x1
    106a:	50                   	push   %eax
    106b:	57                   	push   %edi
    106c:	e8 01 fe ff ff       	call   e72 <write>
    1071:	83 c4 0c             	add    $0xc,%esp
    1074:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1077:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    107a:	6a 01                	push   $0x1
    107c:	50                   	push   %eax
    107d:	57                   	push   %edi
    107e:	83 c6 01             	add    $0x1,%esi
    1081:	e8 ec fd ff ff       	call   e72 <write>
    1086:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    108a:	83 c4 10             	add    $0x10,%esp
    108d:	31 d2                	xor    %edx,%edx
    108f:	84 db                	test   %bl,%bl
    1091:	75 8d                	jne    1020 <printf+0x60>
    1093:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1096:	5b                   	pop    %ebx
    1097:	5e                   	pop    %esi
    1098:	5f                   	pop    %edi
    1099:	5d                   	pop    %ebp
    109a:	c3                   	ret    
    109b:	90                   	nop
    109c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10a0:	83 ec 0c             	sub    $0xc,%esp
    10a3:	b9 10 00 00 00       	mov    $0x10,%ecx
    10a8:	6a 00                	push   $0x0
    10aa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    10ad:	89 f8                	mov    %edi,%eax
    10af:	8b 13                	mov    (%ebx),%edx
    10b1:	e8 6a fe ff ff       	call   f20 <printint>
    10b6:	89 d8                	mov    %ebx,%eax
    10b8:	83 c4 10             	add    $0x10,%esp
    10bb:	31 d2                	xor    %edx,%edx
    10bd:	83 c0 04             	add    $0x4,%eax
    10c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
    10c3:	e9 4d ff ff ff       	jmp    1015 <printf+0x55>
    10c8:	90                   	nop
    10c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
    10d3:	8b 18                	mov    (%eax),%ebx
    10d5:	83 c0 04             	add    $0x4,%eax
    10d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
    10db:	b8 84 14 00 00       	mov    $0x1484,%eax
    10e0:	85 db                	test   %ebx,%ebx
    10e2:	0f 44 d8             	cmove  %eax,%ebx
    10e5:	0f b6 03             	movzbl (%ebx),%eax
    10e8:	84 c0                	test   %al,%al
    10ea:	74 23                	je     110f <printf+0x14f>
    10ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10f0:	88 45 e3             	mov    %al,-0x1d(%ebp)
    10f3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    10f6:	83 ec 04             	sub    $0x4,%esp
    10f9:	6a 01                	push   $0x1
    10fb:	83 c3 01             	add    $0x1,%ebx
    10fe:	50                   	push   %eax
    10ff:	57                   	push   %edi
    1100:	e8 6d fd ff ff       	call   e72 <write>
    1105:	0f b6 03             	movzbl (%ebx),%eax
    1108:	83 c4 10             	add    $0x10,%esp
    110b:	84 c0                	test   %al,%al
    110d:	75 e1                	jne    10f0 <printf+0x130>
    110f:	31 d2                	xor    %edx,%edx
    1111:	e9 ff fe ff ff       	jmp    1015 <printf+0x55>
    1116:	8d 76 00             	lea    0x0(%esi),%esi
    1119:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1120:	83 ec 04             	sub    $0x4,%esp
    1123:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    1126:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1129:	6a 01                	push   $0x1
    112b:	e9 4c ff ff ff       	jmp    107c <printf+0xbc>
    1130:	83 ec 0c             	sub    $0xc,%esp
    1133:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1138:	6a 01                	push   $0x1
    113a:	e9 6b ff ff ff       	jmp    10aa <printf+0xea>
    113f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1142:	83 ec 04             	sub    $0x4,%esp
    1145:	8b 03                	mov    (%ebx),%eax
    1147:	6a 01                	push   $0x1
    1149:	88 45 e4             	mov    %al,-0x1c(%ebp)
    114c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    114f:	50                   	push   %eax
    1150:	57                   	push   %edi
    1151:	e8 1c fd ff ff       	call   e72 <write>
    1156:	e9 5b ff ff ff       	jmp    10b6 <printf+0xf6>
    115b:	66 90                	xchg   %ax,%ax
    115d:	66 90                	xchg   %ax,%ax
    115f:	90                   	nop

00001160 <free>:
    1160:	55                   	push   %ebp
    1161:	a1 d8 1b 00 00       	mov    0x1bd8,%eax
    1166:	89 e5                	mov    %esp,%ebp
    1168:	57                   	push   %edi
    1169:	56                   	push   %esi
    116a:	53                   	push   %ebx
    116b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    116e:	8b 10                	mov    (%eax),%edx
    1170:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    1173:	39 c8                	cmp    %ecx,%eax
    1175:	73 19                	jae    1190 <free+0x30>
    1177:	89 f6                	mov    %esi,%esi
    1179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1180:	39 d1                	cmp    %edx,%ecx
    1182:	72 1c                	jb     11a0 <free+0x40>
    1184:	39 d0                	cmp    %edx,%eax
    1186:	73 18                	jae    11a0 <free+0x40>
    1188:	89 d0                	mov    %edx,%eax
    118a:	39 c8                	cmp    %ecx,%eax
    118c:	8b 10                	mov    (%eax),%edx
    118e:	72 f0                	jb     1180 <free+0x20>
    1190:	39 d0                	cmp    %edx,%eax
    1192:	72 f4                	jb     1188 <free+0x28>
    1194:	39 d1                	cmp    %edx,%ecx
    1196:	73 f0                	jae    1188 <free+0x28>
    1198:	90                   	nop
    1199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    11a0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    11a3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    11a6:	39 d7                	cmp    %edx,%edi
    11a8:	74 19                	je     11c3 <free+0x63>
    11aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
    11ad:	8b 50 04             	mov    0x4(%eax),%edx
    11b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    11b3:	39 f1                	cmp    %esi,%ecx
    11b5:	74 23                	je     11da <free+0x7a>
    11b7:	89 08                	mov    %ecx,(%eax)
    11b9:	a3 d8 1b 00 00       	mov    %eax,0x1bd8
    11be:	5b                   	pop    %ebx
    11bf:	5e                   	pop    %esi
    11c0:	5f                   	pop    %edi
    11c1:	5d                   	pop    %ebp
    11c2:	c3                   	ret    
    11c3:	03 72 04             	add    0x4(%edx),%esi
    11c6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    11c9:	8b 10                	mov    (%eax),%edx
    11cb:	8b 12                	mov    (%edx),%edx
    11cd:	89 53 f8             	mov    %edx,-0x8(%ebx)
    11d0:	8b 50 04             	mov    0x4(%eax),%edx
    11d3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    11d6:	39 f1                	cmp    %esi,%ecx
    11d8:	75 dd                	jne    11b7 <free+0x57>
    11da:	03 53 fc             	add    -0x4(%ebx),%edx
    11dd:	a3 d8 1b 00 00       	mov    %eax,0x1bd8
    11e2:	89 50 04             	mov    %edx,0x4(%eax)
    11e5:	8b 53 f8             	mov    -0x8(%ebx),%edx
    11e8:	89 10                	mov    %edx,(%eax)
    11ea:	5b                   	pop    %ebx
    11eb:	5e                   	pop    %esi
    11ec:	5f                   	pop    %edi
    11ed:	5d                   	pop    %ebp
    11ee:	c3                   	ret    
    11ef:	90                   	nop

000011f0 <malloc>:
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	57                   	push   %edi
    11f4:	56                   	push   %esi
    11f5:	53                   	push   %ebx
    11f6:	83 ec 0c             	sub    $0xc,%esp
    11f9:	8b 45 08             	mov    0x8(%ebp),%eax
    11fc:	8b 15 d8 1b 00 00    	mov    0x1bd8,%edx
    1202:	8d 78 07             	lea    0x7(%eax),%edi
    1205:	c1 ef 03             	shr    $0x3,%edi
    1208:	83 c7 01             	add    $0x1,%edi
    120b:	85 d2                	test   %edx,%edx
    120d:	0f 84 a3 00 00 00    	je     12b6 <malloc+0xc6>
    1213:	8b 02                	mov    (%edx),%eax
    1215:	8b 48 04             	mov    0x4(%eax),%ecx
    1218:	39 cf                	cmp    %ecx,%edi
    121a:	76 74                	jbe    1290 <malloc+0xa0>
    121c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    1222:	be 00 10 00 00       	mov    $0x1000,%esi
    1227:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    122e:	0f 43 f7             	cmovae %edi,%esi
    1231:	ba 00 80 00 00       	mov    $0x8000,%edx
    1236:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    123c:	0f 46 da             	cmovbe %edx,%ebx
    123f:	eb 10                	jmp    1251 <malloc+0x61>
    1241:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1248:	8b 02                	mov    (%edx),%eax
    124a:	8b 48 04             	mov    0x4(%eax),%ecx
    124d:	39 cf                	cmp    %ecx,%edi
    124f:	76 3f                	jbe    1290 <malloc+0xa0>
    1251:	39 05 d8 1b 00 00    	cmp    %eax,0x1bd8
    1257:	89 c2                	mov    %eax,%edx
    1259:	75 ed                	jne    1248 <malloc+0x58>
    125b:	83 ec 0c             	sub    $0xc,%esp
    125e:	53                   	push   %ebx
    125f:	e8 76 fc ff ff       	call   eda <sbrk>
    1264:	83 c4 10             	add    $0x10,%esp
    1267:	83 f8 ff             	cmp    $0xffffffff,%eax
    126a:	74 1c                	je     1288 <malloc+0x98>
    126c:	89 70 04             	mov    %esi,0x4(%eax)
    126f:	83 ec 0c             	sub    $0xc,%esp
    1272:	83 c0 08             	add    $0x8,%eax
    1275:	50                   	push   %eax
    1276:	e8 e5 fe ff ff       	call   1160 <free>
    127b:	8b 15 d8 1b 00 00    	mov    0x1bd8,%edx
    1281:	83 c4 10             	add    $0x10,%esp
    1284:	85 d2                	test   %edx,%edx
    1286:	75 c0                	jne    1248 <malloc+0x58>
    1288:	31 c0                	xor    %eax,%eax
    128a:	eb 1c                	jmp    12a8 <malloc+0xb8>
    128c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1290:	39 cf                	cmp    %ecx,%edi
    1292:	74 1c                	je     12b0 <malloc+0xc0>
    1294:	29 f9                	sub    %edi,%ecx
    1296:	89 48 04             	mov    %ecx,0x4(%eax)
    1299:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
    129c:	89 78 04             	mov    %edi,0x4(%eax)
    129f:	89 15 d8 1b 00 00    	mov    %edx,0x1bd8
    12a5:	83 c0 08             	add    $0x8,%eax
    12a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12ab:	5b                   	pop    %ebx
    12ac:	5e                   	pop    %esi
    12ad:	5f                   	pop    %edi
    12ae:	5d                   	pop    %ebp
    12af:	c3                   	ret    
    12b0:	8b 08                	mov    (%eax),%ecx
    12b2:	89 0a                	mov    %ecx,(%edx)
    12b4:	eb e9                	jmp    129f <malloc+0xaf>
    12b6:	c7 05 d8 1b 00 00 dc 	movl   $0x1bdc,0x1bd8
    12bd:	1b 00 00 
    12c0:	c7 05 dc 1b 00 00 dc 	movl   $0x1bdc,0x1bdc
    12c7:	1b 00 00 
    12ca:	b8 dc 1b 00 00       	mov    $0x1bdc,%eax
    12cf:	c7 05 e0 1b 00 00 00 	movl   $0x0,0x1be0
    12d6:	00 00 00 
    12d9:	e9 3e ff ff ff       	jmp    121c <malloc+0x2c>
