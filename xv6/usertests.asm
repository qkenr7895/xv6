
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return randstate;
}

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "usertests starting\n");
      11:	68 66 4d 00 00       	push   $0x4d66
      16:	6a 01                	push   $0x1
      18:	e8 03 3a 00 00       	call   3a20 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	59                   	pop    %ecx
      1e:	58                   	pop    %eax
      1f:	6a 00                	push   $0x0
      21:	68 7a 4d 00 00       	push   $0x4d7a
      26:	e8 d7 38 00 00       	call   3902 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 13                	js     45 <main+0x45>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	52                   	push   %edx
      33:	52                   	push   %edx
      34:	68 e4 54 00 00       	push   $0x54e4
      39:	6a 01                	push   $0x1
      3b:	e8 e0 39 00 00       	call   3a20 <printf>
    exit();
      40:	e8 7d 38 00 00       	call   38c2 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      45:	50                   	push   %eax
      46:	50                   	push   %eax
      47:	68 00 02 00 00       	push   $0x200
      4c:	68 7a 4d 00 00       	push   $0x4d7a
      51:	e8 ac 38 00 00       	call   3902 <open>
      56:	89 04 24             	mov    %eax,(%esp)
      59:	e8 8c 38 00 00       	call   38ea <close>

  argptest();
      5e:	e8 7d 35 00 00       	call   35e0 <argptest>
  createdelete();
      63:	e8 c8 11 00 00       	call   1230 <createdelete>
  linkunlink();
      68:	e8 83 1a 00 00       	call   1af0 <linkunlink>
  concreate();
      6d:	e8 7e 17 00 00       	call   17f0 <concreate>
  fourfiles();
      72:	e8 b9 0f 00 00       	call   1030 <fourfiles>
  sharedfd();
      77:	e8 f4 0d 00 00       	call   e70 <sharedfd>

  bigargtest();
      7c:	e8 1f 32 00 00       	call   32a0 <bigargtest>
  bigwrite();
      81:	e8 8a 23 00 00       	call   2410 <bigwrite>
  bigargtest();
      86:	e8 15 32 00 00       	call   32a0 <bigargtest>
  bsstest();
      8b:	e8 90 31 00 00       	call   3220 <bsstest>
  sbrktest();
      90:	e8 bb 2c 00 00       	call   2d50 <sbrktest>
  validatetest();
      95:	e8 d6 30 00 00       	call   3170 <validatetest>

  opentest();
      9a:	e8 51 03 00 00       	call   3f0 <opentest>
  writetest();
      9f:	e8 dc 03 00 00       	call   480 <writetest>
  writetest1();
      a4:	e8 b7 05 00 00       	call   660 <writetest1>
  createtest();
      a9:	e8 82 07 00 00       	call   830 <createtest>

  openiputtest();
      ae:	e8 3d 02 00 00       	call   2f0 <openiputtest>
  exitiputtest();
      b3:	e8 48 01 00 00       	call   200 <exitiputtest>
  iputtest();
      b8:	e8 63 00 00 00       	call   120 <iputtest>

  mem();
      bd:	e8 be 0c 00 00       	call   d80 <mem>
  pipe1();
      c2:	e8 49 09 00 00       	call   a10 <pipe1>
  preempt();
      c7:	e8 e4 0a 00 00       	call   bb0 <preempt>
  exitwait();
      cc:	e8 1f 0c 00 00       	call   cf0 <exitwait>

  rmdot();
      d1:	e8 2a 27 00 00       	call   2800 <rmdot>
  fourteen();
      d6:	e8 e5 25 00 00       	call   26c0 <fourteen>
  bigfile();
      db:	e8 10 24 00 00       	call   24f0 <bigfile>
  subdir();
      e0:	e8 4b 1c 00 00       	call   1d30 <subdir>
  linktest();
      e5:	e8 f6 14 00 00       	call   15e0 <linktest>
  unlinkread();
      ea:	e8 61 13 00 00       	call   1450 <unlinkread>
  dirfile();
      ef:	e8 8c 28 00 00       	call   2980 <dirfile>
  iref();
      f4:	e8 87 2a 00 00       	call   2b80 <iref>
  forktest();
      f9:	e8 a2 2b 00 00       	call   2ca0 <forktest>
  bigdir(); // slow
      fe:	e8 fd 1a 00 00       	call   1c00 <bigdir>

  uio();
     103:	e8 68 34 00 00       	call   3570 <uio>

  exectest();
     108:	e8 b3 08 00 00       	call   9c0 <exectest>

  exit();
     10d:	e8 b0 37 00 00       	call   38c2 <exit>
     112:	66 90                	xchg   %ax,%ax
     114:	66 90                	xchg   %ax,%ax
     116:	66 90                	xchg   %ax,%ax
     118:	66 90                	xchg   %ax,%ax
     11a:	66 90                	xchg   %ax,%ax
     11c:	66 90                	xchg   %ax,%ax
     11e:	66 90                	xchg   %ax,%ax

00000120 <iputtest>:
{
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     126:	68 0c 3e 00 00       	push   $0x3e0c
     12b:	ff 35 28 5e 00 00    	pushl  0x5e28
     131:	e8 ea 38 00 00       	call   3a20 <printf>
  if(mkdir("iputdir") < 0){
     136:	c7 04 24 9f 3d 00 00 	movl   $0x3d9f,(%esp)
     13d:	e8 e8 37 00 00       	call   392a <mkdir>
     142:	83 c4 10             	add    $0x10,%esp
     145:	85 c0                	test   %eax,%eax
     147:	78 58                	js     1a1 <iputtest+0x81>
  if(chdir("iputdir") < 0){
     149:	83 ec 0c             	sub    $0xc,%esp
     14c:	68 9f 3d 00 00       	push   $0x3d9f
     151:	e8 dc 37 00 00       	call   3932 <chdir>
     156:	83 c4 10             	add    $0x10,%esp
     159:	85 c0                	test   %eax,%eax
     15b:	0f 88 85 00 00 00    	js     1e6 <iputtest+0xc6>
  if(unlink("../iputdir") < 0){
     161:	83 ec 0c             	sub    $0xc,%esp
     164:	68 9c 3d 00 00       	push   $0x3d9c
     169:	e8 a4 37 00 00       	call   3912 <unlink>
     16e:	83 c4 10             	add    $0x10,%esp
     171:	85 c0                	test   %eax,%eax
     173:	78 5a                	js     1cf <iputtest+0xaf>
  if(chdir("/") < 0){
     175:	83 ec 0c             	sub    $0xc,%esp
     178:	68 c1 3d 00 00       	push   $0x3dc1
     17d:	e8 b0 37 00 00       	call   3932 <chdir>
     182:	83 c4 10             	add    $0x10,%esp
     185:	85 c0                	test   %eax,%eax
     187:	78 2f                	js     1b8 <iputtest+0x98>
  printf(stdout, "iput test ok\n");
     189:	83 ec 08             	sub    $0x8,%esp
     18c:	68 44 3e 00 00       	push   $0x3e44
     191:	ff 35 28 5e 00 00    	pushl  0x5e28
     197:	e8 84 38 00 00       	call   3a20 <printf>
}
     19c:	83 c4 10             	add    $0x10,%esp
     19f:	c9                   	leave  
     1a0:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     1a1:	50                   	push   %eax
     1a2:	50                   	push   %eax
     1a3:	68 78 3d 00 00       	push   $0x3d78
     1a8:	ff 35 28 5e 00 00    	pushl  0x5e28
     1ae:	e8 6d 38 00 00       	call   3a20 <printf>
    exit();
     1b3:	e8 0a 37 00 00       	call   38c2 <exit>
    printf(stdout, "chdir / failed\n");
     1b8:	50                   	push   %eax
     1b9:	50                   	push   %eax
     1ba:	68 c3 3d 00 00       	push   $0x3dc3
     1bf:	ff 35 28 5e 00 00    	pushl  0x5e28
     1c5:	e8 56 38 00 00       	call   3a20 <printf>
    exit();
     1ca:	e8 f3 36 00 00       	call   38c2 <exit>
    printf(stdout, "unlink ../iputdir failed\n");
     1cf:	52                   	push   %edx
     1d0:	52                   	push   %edx
     1d1:	68 a7 3d 00 00       	push   $0x3da7
     1d6:	ff 35 28 5e 00 00    	pushl  0x5e28
     1dc:	e8 3f 38 00 00       	call   3a20 <printf>
    exit();
     1e1:	e8 dc 36 00 00       	call   38c2 <exit>
    printf(stdout, "chdir iputdir failed\n");
     1e6:	51                   	push   %ecx
     1e7:	51                   	push   %ecx
     1e8:	68 86 3d 00 00       	push   $0x3d86
     1ed:	ff 35 28 5e 00 00    	pushl  0x5e28
     1f3:	e8 28 38 00 00       	call   3a20 <printf>
    exit();
     1f8:	e8 c5 36 00 00       	call   38c2 <exit>
     1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <exitiputtest>:
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exitiput test\n");
     206:	68 d3 3d 00 00       	push   $0x3dd3
     20b:	ff 35 28 5e 00 00    	pushl  0x5e28
     211:	e8 0a 38 00 00       	call   3a20 <printf>
  pid = fork();
     216:	e8 9f 36 00 00       	call   38ba <fork>
  if(pid < 0){
     21b:	83 c4 10             	add    $0x10,%esp
     21e:	85 c0                	test   %eax,%eax
     220:	0f 88 82 00 00 00    	js     2a8 <exitiputtest+0xa8>
  if(pid == 0){
     226:	75 48                	jne    270 <exitiputtest+0x70>
    if(mkdir("iputdir") < 0){
     228:	83 ec 0c             	sub    $0xc,%esp
     22b:	68 9f 3d 00 00       	push   $0x3d9f
     230:	e8 f5 36 00 00       	call   392a <mkdir>
     235:	83 c4 10             	add    $0x10,%esp
     238:	85 c0                	test   %eax,%eax
     23a:	0f 88 96 00 00 00    	js     2d6 <exitiputtest+0xd6>
    if(chdir("iputdir") < 0){
     240:	83 ec 0c             	sub    $0xc,%esp
     243:	68 9f 3d 00 00       	push   $0x3d9f
     248:	e8 e5 36 00 00       	call   3932 <chdir>
     24d:	83 c4 10             	add    $0x10,%esp
     250:	85 c0                	test   %eax,%eax
     252:	78 6b                	js     2bf <exitiputtest+0xbf>
    if(unlink("../iputdir") < 0){
     254:	83 ec 0c             	sub    $0xc,%esp
     257:	68 9c 3d 00 00       	push   $0x3d9c
     25c:	e8 b1 36 00 00       	call   3912 <unlink>
     261:	83 c4 10             	add    $0x10,%esp
     264:	85 c0                	test   %eax,%eax
     266:	78 28                	js     290 <exitiputtest+0x90>
    exit();
     268:	e8 55 36 00 00       	call   38c2 <exit>
     26d:	8d 76 00             	lea    0x0(%esi),%esi
  wait();
     270:	e8 55 36 00 00       	call   38ca <wait>
  printf(stdout, "exitiput test ok\n");
     275:	83 ec 08             	sub    $0x8,%esp
     278:	68 f6 3d 00 00       	push   $0x3df6
     27d:	ff 35 28 5e 00 00    	pushl  0x5e28
     283:	e8 98 37 00 00       	call   3a20 <printf>
}
     288:	83 c4 10             	add    $0x10,%esp
     28b:	c9                   	leave  
     28c:	c3                   	ret    
     28d:	8d 76 00             	lea    0x0(%esi),%esi
      printf(stdout, "unlink ../iputdir failed\n");
     290:	83 ec 08             	sub    $0x8,%esp
     293:	68 a7 3d 00 00       	push   $0x3da7
     298:	ff 35 28 5e 00 00    	pushl  0x5e28
     29e:	e8 7d 37 00 00       	call   3a20 <printf>
      exit();
     2a3:	e8 1a 36 00 00       	call   38c2 <exit>
    printf(stdout, "fork failed\n");
     2a8:	51                   	push   %ecx
     2a9:	51                   	push   %ecx
     2aa:	68 b9 4c 00 00       	push   $0x4cb9
     2af:	ff 35 28 5e 00 00    	pushl  0x5e28
     2b5:	e8 66 37 00 00       	call   3a20 <printf>
    exit();
     2ba:	e8 03 36 00 00       	call   38c2 <exit>
      printf(stdout, "child chdir failed\n");
     2bf:	50                   	push   %eax
     2c0:	50                   	push   %eax
     2c1:	68 e2 3d 00 00       	push   $0x3de2
     2c6:	ff 35 28 5e 00 00    	pushl  0x5e28
     2cc:	e8 4f 37 00 00       	call   3a20 <printf>
      exit();
     2d1:	e8 ec 35 00 00       	call   38c2 <exit>
      printf(stdout, "mkdir failed\n");
     2d6:	52                   	push   %edx
     2d7:	52                   	push   %edx
     2d8:	68 78 3d 00 00       	push   $0x3d78
     2dd:	ff 35 28 5e 00 00    	pushl  0x5e28
     2e3:	e8 38 37 00 00       	call   3a20 <printf>
      exit();
     2e8:	e8 d5 35 00 00       	call   38c2 <exit>
     2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <openiputtest>:
{
     2f0:	55                   	push   %ebp
     2f1:	89 e5                	mov    %esp,%ebp
     2f3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "openiput test\n");
     2f6:	68 08 3e 00 00       	push   $0x3e08
     2fb:	ff 35 28 5e 00 00    	pushl  0x5e28
     301:	e8 1a 37 00 00       	call   3a20 <printf>
  if(mkdir("oidir") < 0){
     306:	c7 04 24 17 3e 00 00 	movl   $0x3e17,(%esp)
     30d:	e8 18 36 00 00       	call   392a <mkdir>
     312:	83 c4 10             	add    $0x10,%esp
     315:	85 c0                	test   %eax,%eax
     317:	0f 88 88 00 00 00    	js     3a5 <openiputtest+0xb5>
  pid = fork();
     31d:	e8 98 35 00 00       	call   38ba <fork>
  if(pid < 0){
     322:	85 c0                	test   %eax,%eax
     324:	0f 88 92 00 00 00    	js     3bc <openiputtest+0xcc>
  if(pid == 0){
     32a:	75 34                	jne    360 <openiputtest+0x70>
    int fd = open("oidir", O_RDWR);
     32c:	83 ec 08             	sub    $0x8,%esp
     32f:	6a 02                	push   $0x2
     331:	68 17 3e 00 00       	push   $0x3e17
     336:	e8 c7 35 00 00       	call   3902 <open>
    if(fd >= 0){
     33b:	83 c4 10             	add    $0x10,%esp
     33e:	85 c0                	test   %eax,%eax
     340:	78 5e                	js     3a0 <openiputtest+0xb0>
      printf(stdout, "open directory for write succeeded\n");
     342:	83 ec 08             	sub    $0x8,%esp
     345:	68 9c 4d 00 00       	push   $0x4d9c
     34a:	ff 35 28 5e 00 00    	pushl  0x5e28
     350:	e8 cb 36 00 00       	call   3a20 <printf>
      exit();
     355:	e8 68 35 00 00       	call   38c2 <exit>
     35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  sleep(1);
     360:	83 ec 0c             	sub    $0xc,%esp
     363:	6a 01                	push   $0x1
     365:	e8 e8 35 00 00       	call   3952 <sleep>
  if(unlink("oidir") != 0){
     36a:	c7 04 24 17 3e 00 00 	movl   $0x3e17,(%esp)
     371:	e8 9c 35 00 00       	call   3912 <unlink>
     376:	83 c4 10             	add    $0x10,%esp
     379:	85 c0                	test   %eax,%eax
     37b:	75 56                	jne    3d3 <openiputtest+0xe3>
  wait();
     37d:	e8 48 35 00 00       	call   38ca <wait>
  printf(stdout, "openiput test ok\n");
     382:	83 ec 08             	sub    $0x8,%esp
     385:	68 40 3e 00 00       	push   $0x3e40
     38a:	ff 35 28 5e 00 00    	pushl  0x5e28
     390:	e8 8b 36 00 00       	call   3a20 <printf>
     395:	83 c4 10             	add    $0x10,%esp
}
     398:	c9                   	leave  
     399:	c3                   	ret    
     39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    exit();
     3a0:	e8 1d 35 00 00       	call   38c2 <exit>
    printf(stdout, "mkdir oidir failed\n");
     3a5:	51                   	push   %ecx
     3a6:	51                   	push   %ecx
     3a7:	68 1d 3e 00 00       	push   $0x3e1d
     3ac:	ff 35 28 5e 00 00    	pushl  0x5e28
     3b2:	e8 69 36 00 00       	call   3a20 <printf>
    exit();
     3b7:	e8 06 35 00 00       	call   38c2 <exit>
    printf(stdout, "fork failed\n");
     3bc:	52                   	push   %edx
     3bd:	52                   	push   %edx
     3be:	68 b9 4c 00 00       	push   $0x4cb9
     3c3:	ff 35 28 5e 00 00    	pushl  0x5e28
     3c9:	e8 52 36 00 00       	call   3a20 <printf>
    exit();
     3ce:	e8 ef 34 00 00       	call   38c2 <exit>
    printf(stdout, "unlink failed\n");
     3d3:	50                   	push   %eax
     3d4:	50                   	push   %eax
     3d5:	68 31 3e 00 00       	push   $0x3e31
     3da:	ff 35 28 5e 00 00    	pushl  0x5e28
     3e0:	e8 3b 36 00 00       	call   3a20 <printf>
    exit();
     3e5:	e8 d8 34 00 00       	call   38c2 <exit>
     3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003f0 <opentest>:
{
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "open test\n");
     3f6:	68 52 3e 00 00       	push   $0x3e52
     3fb:	ff 35 28 5e 00 00    	pushl  0x5e28
     401:	e8 1a 36 00 00       	call   3a20 <printf>
  fd = open("echo", 0);
     406:	58                   	pop    %eax
     407:	5a                   	pop    %edx
     408:	6a 00                	push   $0x0
     40a:	68 5d 3e 00 00       	push   $0x3e5d
     40f:	e8 ee 34 00 00       	call   3902 <open>
  if(fd < 0){
     414:	83 c4 10             	add    $0x10,%esp
     417:	85 c0                	test   %eax,%eax
     419:	78 36                	js     451 <opentest+0x61>
  close(fd);
     41b:	83 ec 0c             	sub    $0xc,%esp
     41e:	50                   	push   %eax
     41f:	e8 c6 34 00 00       	call   38ea <close>
  fd = open("doesnotexist", 0);
     424:	5a                   	pop    %edx
     425:	59                   	pop    %ecx
     426:	6a 00                	push   $0x0
     428:	68 75 3e 00 00       	push   $0x3e75
     42d:	e8 d0 34 00 00       	call   3902 <open>
  if(fd >= 0){
     432:	83 c4 10             	add    $0x10,%esp
     435:	85 c0                	test   %eax,%eax
     437:	79 2f                	jns    468 <opentest+0x78>
  printf(stdout, "open test ok\n");
     439:	83 ec 08             	sub    $0x8,%esp
     43c:	68 a0 3e 00 00       	push   $0x3ea0
     441:	ff 35 28 5e 00 00    	pushl  0x5e28
     447:	e8 d4 35 00 00       	call   3a20 <printf>
}
     44c:	83 c4 10             	add    $0x10,%esp
     44f:	c9                   	leave  
     450:	c3                   	ret    
    printf(stdout, "open echo failed!\n");
     451:	50                   	push   %eax
     452:	50                   	push   %eax
     453:	68 62 3e 00 00       	push   $0x3e62
     458:	ff 35 28 5e 00 00    	pushl  0x5e28
     45e:	e8 bd 35 00 00       	call   3a20 <printf>
    exit();
     463:	e8 5a 34 00 00       	call   38c2 <exit>
    printf(stdout, "open doesnotexist succeeded!\n");
     468:	50                   	push   %eax
     469:	50                   	push   %eax
     46a:	68 82 3e 00 00       	push   $0x3e82
     46f:	ff 35 28 5e 00 00    	pushl  0x5e28
     475:	e8 a6 35 00 00       	call   3a20 <printf>
    exit();
     47a:	e8 43 34 00 00       	call   38c2 <exit>
     47f:	90                   	nop

00000480 <writetest>:
{
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	56                   	push   %esi
     484:	53                   	push   %ebx
  printf(stdout, "small file test\n");
     485:	83 ec 08             	sub    $0x8,%esp
     488:	68 ae 3e 00 00       	push   $0x3eae
     48d:	ff 35 28 5e 00 00    	pushl  0x5e28
     493:	e8 88 35 00 00       	call   3a20 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     498:	58                   	pop    %eax
     499:	5a                   	pop    %edx
     49a:	68 02 02 00 00       	push   $0x202
     49f:	68 bf 3e 00 00       	push   $0x3ebf
     4a4:	e8 59 34 00 00       	call   3902 <open>
  if(fd >= 0){
     4a9:	83 c4 10             	add    $0x10,%esp
     4ac:	85 c0                	test   %eax,%eax
     4ae:	0f 88 88 01 00 00    	js     63c <writetest+0x1bc>
    printf(stdout, "creat small succeeded; ok\n");
     4b4:	83 ec 08             	sub    $0x8,%esp
     4b7:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 100; i++){
     4b9:	31 db                	xor    %ebx,%ebx
    printf(stdout, "creat small succeeded; ok\n");
     4bb:	68 c5 3e 00 00       	push   $0x3ec5
     4c0:	ff 35 28 5e 00 00    	pushl  0x5e28
     4c6:	e8 55 35 00 00       	call   3a20 <printf>
     4cb:	83 c4 10             	add    $0x10,%esp
     4ce:	66 90                	xchg   %ax,%ax
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     4d0:	83 ec 04             	sub    $0x4,%esp
     4d3:	6a 0a                	push   $0xa
     4d5:	68 fc 3e 00 00       	push   $0x3efc
     4da:	56                   	push   %esi
     4db:	e8 02 34 00 00       	call   38e2 <write>
     4e0:	83 c4 10             	add    $0x10,%esp
     4e3:	83 f8 0a             	cmp    $0xa,%eax
     4e6:	0f 85 d9 00 00 00    	jne    5c5 <writetest+0x145>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     4ec:	83 ec 04             	sub    $0x4,%esp
     4ef:	6a 0a                	push   $0xa
     4f1:	68 07 3f 00 00       	push   $0x3f07
     4f6:	56                   	push   %esi
     4f7:	e8 e6 33 00 00       	call   38e2 <write>
     4fc:	83 c4 10             	add    $0x10,%esp
     4ff:	83 f8 0a             	cmp    $0xa,%eax
     502:	0f 85 d6 00 00 00    	jne    5de <writetest+0x15e>
  for(i = 0; i < 100; i++){
     508:	83 c3 01             	add    $0x1,%ebx
     50b:	83 fb 64             	cmp    $0x64,%ebx
     50e:	75 c0                	jne    4d0 <writetest+0x50>
  printf(stdout, "writes ok\n");
     510:	83 ec 08             	sub    $0x8,%esp
     513:	68 12 3f 00 00       	push   $0x3f12
     518:	ff 35 28 5e 00 00    	pushl  0x5e28
     51e:	e8 fd 34 00 00       	call   3a20 <printf>
  close(fd);
     523:	89 34 24             	mov    %esi,(%esp)
     526:	e8 bf 33 00 00       	call   38ea <close>
  fd = open("small", O_RDONLY);
     52b:	5b                   	pop    %ebx
     52c:	5e                   	pop    %esi
     52d:	6a 00                	push   $0x0
     52f:	68 bf 3e 00 00       	push   $0x3ebf
     534:	e8 c9 33 00 00       	call   3902 <open>
  if(fd >= 0){
     539:	83 c4 10             	add    $0x10,%esp
     53c:	85 c0                	test   %eax,%eax
  fd = open("small", O_RDONLY);
     53e:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     540:	0f 88 b1 00 00 00    	js     5f7 <writetest+0x177>
    printf(stdout, "open small succeeded ok\n");
     546:	83 ec 08             	sub    $0x8,%esp
     549:	68 1d 3f 00 00       	push   $0x3f1d
     54e:	ff 35 28 5e 00 00    	pushl  0x5e28
     554:	e8 c7 34 00 00       	call   3a20 <printf>
  i = read(fd, buf, 2000);
     559:	83 c4 0c             	add    $0xc,%esp
     55c:	68 d0 07 00 00       	push   $0x7d0
     561:	68 00 86 00 00       	push   $0x8600
     566:	53                   	push   %ebx
     567:	e8 6e 33 00 00       	call   38da <read>
  if(i == 2000){
     56c:	83 c4 10             	add    $0x10,%esp
     56f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     574:	0f 85 94 00 00 00    	jne    60e <writetest+0x18e>
    printf(stdout, "read succeeded ok\n");
     57a:	83 ec 08             	sub    $0x8,%esp
     57d:	68 51 3f 00 00       	push   $0x3f51
     582:	ff 35 28 5e 00 00    	pushl  0x5e28
     588:	e8 93 34 00 00       	call   3a20 <printf>
  close(fd);
     58d:	89 1c 24             	mov    %ebx,(%esp)
     590:	e8 55 33 00 00       	call   38ea <close>
  if(unlink("small") < 0){
     595:	c7 04 24 bf 3e 00 00 	movl   $0x3ebf,(%esp)
     59c:	e8 71 33 00 00       	call   3912 <unlink>
     5a1:	83 c4 10             	add    $0x10,%esp
     5a4:	85 c0                	test   %eax,%eax
     5a6:	78 7d                	js     625 <writetest+0x1a5>
  printf(stdout, "small file test ok\n");
     5a8:	83 ec 08             	sub    $0x8,%esp
     5ab:	68 79 3f 00 00       	push   $0x3f79
     5b0:	ff 35 28 5e 00 00    	pushl  0x5e28
     5b6:	e8 65 34 00 00       	call   3a20 <printf>
}
     5bb:	83 c4 10             	add    $0x10,%esp
     5be:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5c1:	5b                   	pop    %ebx
     5c2:	5e                   	pop    %esi
     5c3:	5d                   	pop    %ebp
     5c4:	c3                   	ret    
      printf(stdout, "error: write aa %d new file failed\n", i);
     5c5:	83 ec 04             	sub    $0x4,%esp
     5c8:	53                   	push   %ebx
     5c9:	68 c0 4d 00 00       	push   $0x4dc0
     5ce:	ff 35 28 5e 00 00    	pushl  0x5e28
     5d4:	e8 47 34 00 00       	call   3a20 <printf>
      exit();
     5d9:	e8 e4 32 00 00       	call   38c2 <exit>
      printf(stdout, "error: write bb %d new file failed\n", i);
     5de:	83 ec 04             	sub    $0x4,%esp
     5e1:	53                   	push   %ebx
     5e2:	68 e4 4d 00 00       	push   $0x4de4
     5e7:	ff 35 28 5e 00 00    	pushl  0x5e28
     5ed:	e8 2e 34 00 00       	call   3a20 <printf>
      exit();
     5f2:	e8 cb 32 00 00       	call   38c2 <exit>
    printf(stdout, "error: open small failed!\n");
     5f7:	51                   	push   %ecx
     5f8:	51                   	push   %ecx
     5f9:	68 36 3f 00 00       	push   $0x3f36
     5fe:	ff 35 28 5e 00 00    	pushl  0x5e28
     604:	e8 17 34 00 00       	call   3a20 <printf>
    exit();
     609:	e8 b4 32 00 00       	call   38c2 <exit>
    printf(stdout, "read failed\n");
     60e:	52                   	push   %edx
     60f:	52                   	push   %edx
     610:	68 7d 42 00 00       	push   $0x427d
     615:	ff 35 28 5e 00 00    	pushl  0x5e28
     61b:	e8 00 34 00 00       	call   3a20 <printf>
    exit();
     620:	e8 9d 32 00 00       	call   38c2 <exit>
    printf(stdout, "unlink small failed\n");
     625:	50                   	push   %eax
     626:	50                   	push   %eax
     627:	68 64 3f 00 00       	push   $0x3f64
     62c:	ff 35 28 5e 00 00    	pushl  0x5e28
     632:	e8 e9 33 00 00       	call   3a20 <printf>
    exit();
     637:	e8 86 32 00 00       	call   38c2 <exit>
    printf(stdout, "error: creat small failed!\n");
     63c:	50                   	push   %eax
     63d:	50                   	push   %eax
     63e:	68 e0 3e 00 00       	push   $0x3ee0
     643:	ff 35 28 5e 00 00    	pushl  0x5e28
     649:	e8 d2 33 00 00       	call   3a20 <printf>
    exit();
     64e:	e8 6f 32 00 00       	call   38c2 <exit>
     653:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000660 <writetest1>:
{
     660:	55                   	push   %ebp
     661:	89 e5                	mov    %esp,%ebp
     663:	56                   	push   %esi
     664:	53                   	push   %ebx
  printf(stdout, "big files test\n");
     665:	83 ec 08             	sub    $0x8,%esp
     668:	68 8d 3f 00 00       	push   $0x3f8d
     66d:	ff 35 28 5e 00 00    	pushl  0x5e28
     673:	e8 a8 33 00 00       	call   3a20 <printf>
  fd = open("big", O_CREATE|O_RDWR);
     678:	58                   	pop    %eax
     679:	5a                   	pop    %edx
     67a:	68 02 02 00 00       	push   $0x202
     67f:	68 07 40 00 00       	push   $0x4007
     684:	e8 79 32 00 00       	call   3902 <open>
  if(fd < 0){
     689:	83 c4 10             	add    $0x10,%esp
     68c:	85 c0                	test   %eax,%eax
     68e:	0f 88 61 01 00 00    	js     7f5 <writetest1+0x195>
     694:	89 c6                	mov    %eax,%esi
  for(i = 0; i < MAXFILE; i++){
     696:	31 db                	xor    %ebx,%ebx
     698:	90                   	nop
     699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(write(fd, buf, 512) != 512){
     6a0:	83 ec 04             	sub    $0x4,%esp
    ((int*)buf)[0] = i;
     6a3:	89 1d 00 86 00 00    	mov    %ebx,0x8600
    if(write(fd, buf, 512) != 512){
     6a9:	68 00 02 00 00       	push   $0x200
     6ae:	68 00 86 00 00       	push   $0x8600
     6b3:	56                   	push   %esi
     6b4:	e8 29 32 00 00       	call   38e2 <write>
     6b9:	83 c4 10             	add    $0x10,%esp
     6bc:	3d 00 02 00 00       	cmp    $0x200,%eax
     6c1:	0f 85 b3 00 00 00    	jne    77a <writetest1+0x11a>
  for(i = 0; i < MAXFILE; i++){
     6c7:	83 c3 01             	add    $0x1,%ebx
     6ca:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     6d0:	75 ce                	jne    6a0 <writetest1+0x40>
  close(fd);
     6d2:	83 ec 0c             	sub    $0xc,%esp
     6d5:	56                   	push   %esi
     6d6:	e8 0f 32 00 00       	call   38ea <close>
  fd = open("big", O_RDONLY);
     6db:	5b                   	pop    %ebx
     6dc:	5e                   	pop    %esi
     6dd:	6a 00                	push   $0x0
     6df:	68 07 40 00 00       	push   $0x4007
     6e4:	e8 19 32 00 00       	call   3902 <open>
  if(fd < 0){
     6e9:	83 c4 10             	add    $0x10,%esp
     6ec:	85 c0                	test   %eax,%eax
  fd = open("big", O_RDONLY);
     6ee:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     6f0:	0f 88 e8 00 00 00    	js     7de <writetest1+0x17e>
  n = 0;
     6f6:	31 db                	xor    %ebx,%ebx
     6f8:	eb 1d                	jmp    717 <writetest1+0xb7>
     6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(i != 512){
     700:	3d 00 02 00 00       	cmp    $0x200,%eax
     705:	0f 85 9f 00 00 00    	jne    7aa <writetest1+0x14a>
    if(((int*)buf)[0] != n){
     70b:	a1 00 86 00 00       	mov    0x8600,%eax
     710:	39 d8                	cmp    %ebx,%eax
     712:	75 7f                	jne    793 <writetest1+0x133>
    n++;
     714:	83 c3 01             	add    $0x1,%ebx
    i = read(fd, buf, 512);
     717:	83 ec 04             	sub    $0x4,%esp
     71a:	68 00 02 00 00       	push   $0x200
     71f:	68 00 86 00 00       	push   $0x8600
     724:	56                   	push   %esi
     725:	e8 b0 31 00 00       	call   38da <read>
    if(i == 0){
     72a:	83 c4 10             	add    $0x10,%esp
     72d:	85 c0                	test   %eax,%eax
     72f:	75 cf                	jne    700 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     731:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     737:	0f 84 86 00 00 00    	je     7c3 <writetest1+0x163>
  close(fd);
     73d:	83 ec 0c             	sub    $0xc,%esp
     740:	56                   	push   %esi
     741:	e8 a4 31 00 00       	call   38ea <close>
  if(unlink("big") < 0){
     746:	c7 04 24 07 40 00 00 	movl   $0x4007,(%esp)
     74d:	e8 c0 31 00 00       	call   3912 <unlink>
     752:	83 c4 10             	add    $0x10,%esp
     755:	85 c0                	test   %eax,%eax
     757:	0f 88 af 00 00 00    	js     80c <writetest1+0x1ac>
  printf(stdout, "big files ok\n");
     75d:	83 ec 08             	sub    $0x8,%esp
     760:	68 2e 40 00 00       	push   $0x402e
     765:	ff 35 28 5e 00 00    	pushl  0x5e28
     76b:	e8 b0 32 00 00       	call   3a20 <printf>
}
     770:	83 c4 10             	add    $0x10,%esp
     773:	8d 65 f8             	lea    -0x8(%ebp),%esp
     776:	5b                   	pop    %ebx
     777:	5e                   	pop    %esi
     778:	5d                   	pop    %ebp
     779:	c3                   	ret    
      printf(stdout, "error: write big file failed\n", i);
     77a:	83 ec 04             	sub    $0x4,%esp
     77d:	53                   	push   %ebx
     77e:	68 b7 3f 00 00       	push   $0x3fb7
     783:	ff 35 28 5e 00 00    	pushl  0x5e28
     789:	e8 92 32 00 00       	call   3a20 <printf>
      exit();
     78e:	e8 2f 31 00 00       	call   38c2 <exit>
      printf(stdout, "read content of block %d is %d\n",
     793:	50                   	push   %eax
     794:	53                   	push   %ebx
     795:	68 08 4e 00 00       	push   $0x4e08
     79a:	ff 35 28 5e 00 00    	pushl  0x5e28
     7a0:	e8 7b 32 00 00       	call   3a20 <printf>
      exit();
     7a5:	e8 18 31 00 00       	call   38c2 <exit>
      printf(stdout, "read failed %d\n", i);
     7aa:	83 ec 04             	sub    $0x4,%esp
     7ad:	50                   	push   %eax
     7ae:	68 0b 40 00 00       	push   $0x400b
     7b3:	ff 35 28 5e 00 00    	pushl  0x5e28
     7b9:	e8 62 32 00 00       	call   3a20 <printf>
      exit();
     7be:	e8 ff 30 00 00       	call   38c2 <exit>
        printf(stdout, "read only %d blocks from big", n);
     7c3:	52                   	push   %edx
     7c4:	68 8b 00 00 00       	push   $0x8b
     7c9:	68 ee 3f 00 00       	push   $0x3fee
     7ce:	ff 35 28 5e 00 00    	pushl  0x5e28
     7d4:	e8 47 32 00 00       	call   3a20 <printf>
        exit();
     7d9:	e8 e4 30 00 00       	call   38c2 <exit>
    printf(stdout, "error: open big failed!\n");
     7de:	51                   	push   %ecx
     7df:	51                   	push   %ecx
     7e0:	68 d5 3f 00 00       	push   $0x3fd5
     7e5:	ff 35 28 5e 00 00    	pushl  0x5e28
     7eb:	e8 30 32 00 00       	call   3a20 <printf>
    exit();
     7f0:	e8 cd 30 00 00       	call   38c2 <exit>
    printf(stdout, "error: creat big failed!\n");
     7f5:	50                   	push   %eax
     7f6:	50                   	push   %eax
     7f7:	68 9d 3f 00 00       	push   $0x3f9d
     7fc:	ff 35 28 5e 00 00    	pushl  0x5e28
     802:	e8 19 32 00 00       	call   3a20 <printf>
    exit();
     807:	e8 b6 30 00 00       	call   38c2 <exit>
    printf(stdout, "unlink big failed\n");
     80c:	50                   	push   %eax
     80d:	50                   	push   %eax
     80e:	68 1b 40 00 00       	push   $0x401b
     813:	ff 35 28 5e 00 00    	pushl  0x5e28
     819:	e8 02 32 00 00       	call   3a20 <printf>
    exit();
     81e:	e8 9f 30 00 00       	call   38c2 <exit>
     823:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000830 <createtest>:
{
     830:	55                   	push   %ebp
     831:	89 e5                	mov    %esp,%ebp
     833:	53                   	push   %ebx
  name[2] = '\0';
     834:	bb 30 00 00 00       	mov    $0x30,%ebx
{
     839:	83 ec 0c             	sub    $0xc,%esp
  printf(stdout, "many creates, followed by unlink test\n");
     83c:	68 28 4e 00 00       	push   $0x4e28
     841:	ff 35 28 5e 00 00    	pushl  0x5e28
     847:	e8 d4 31 00 00       	call   3a20 <printf>
  name[0] = 'a';
     84c:	c6 05 00 a6 00 00 61 	movb   $0x61,0xa600
  name[2] = '\0';
     853:	c6 05 02 a6 00 00 00 	movb   $0x0,0xa602
     85a:	83 c4 10             	add    $0x10,%esp
     85d:	8d 76 00             	lea    0x0(%esi),%esi
    fd = open(name, O_CREATE|O_RDWR);
     860:	83 ec 08             	sub    $0x8,%esp
    name[1] = '0' + i;
     863:	88 1d 01 a6 00 00    	mov    %bl,0xa601
     869:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     86c:	68 02 02 00 00       	push   $0x202
     871:	68 00 a6 00 00       	push   $0xa600
     876:	e8 87 30 00 00       	call   3902 <open>
    close(fd);
     87b:	89 04 24             	mov    %eax,(%esp)
     87e:	e8 67 30 00 00       	call   38ea <close>
  for(i = 0; i < 52; i++){
     883:	83 c4 10             	add    $0x10,%esp
     886:	80 fb 64             	cmp    $0x64,%bl
     889:	75 d5                	jne    860 <createtest+0x30>
  name[0] = 'a';
     88b:	c6 05 00 a6 00 00 61 	movb   $0x61,0xa600
  name[2] = '\0';
     892:	c6 05 02 a6 00 00 00 	movb   $0x0,0xa602
     899:	bb 30 00 00 00       	mov    $0x30,%ebx
     89e:	66 90                	xchg   %ax,%ax
    unlink(name);
     8a0:	83 ec 0c             	sub    $0xc,%esp
    name[1] = '0' + i;
     8a3:	88 1d 01 a6 00 00    	mov    %bl,0xa601
     8a9:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     8ac:	68 00 a6 00 00       	push   $0xa600
     8b1:	e8 5c 30 00 00       	call   3912 <unlink>
  for(i = 0; i < 52; i++){
     8b6:	83 c4 10             	add    $0x10,%esp
     8b9:	80 fb 64             	cmp    $0x64,%bl
     8bc:	75 e2                	jne    8a0 <createtest+0x70>
  printf(stdout, "many creates, followed by unlink; ok\n");
     8be:	83 ec 08             	sub    $0x8,%esp
     8c1:	68 50 4e 00 00       	push   $0x4e50
     8c6:	ff 35 28 5e 00 00    	pushl  0x5e28
     8cc:	e8 4f 31 00 00       	call   3a20 <printf>
}
     8d1:	83 c4 10             	add    $0x10,%esp
     8d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8d7:	c9                   	leave  
     8d8:	c3                   	ret    
     8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008e0 <dirtest>:
{
     8e0:	55                   	push   %ebp
     8e1:	89 e5                	mov    %esp,%ebp
     8e3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     8e6:	68 3c 40 00 00       	push   $0x403c
     8eb:	ff 35 28 5e 00 00    	pushl  0x5e28
     8f1:	e8 2a 31 00 00       	call   3a20 <printf>
  if(mkdir("dir0") < 0){
     8f6:	c7 04 24 48 40 00 00 	movl   $0x4048,(%esp)
     8fd:	e8 28 30 00 00       	call   392a <mkdir>
     902:	83 c4 10             	add    $0x10,%esp
     905:	85 c0                	test   %eax,%eax
     907:	78 58                	js     961 <dirtest+0x81>
  if(chdir("dir0") < 0){
     909:	83 ec 0c             	sub    $0xc,%esp
     90c:	68 48 40 00 00       	push   $0x4048
     911:	e8 1c 30 00 00       	call   3932 <chdir>
     916:	83 c4 10             	add    $0x10,%esp
     919:	85 c0                	test   %eax,%eax
     91b:	0f 88 85 00 00 00    	js     9a6 <dirtest+0xc6>
  if(chdir("..") < 0){
     921:	83 ec 0c             	sub    $0xc,%esp
     924:	68 ed 45 00 00       	push   $0x45ed
     929:	e8 04 30 00 00       	call   3932 <chdir>
     92e:	83 c4 10             	add    $0x10,%esp
     931:	85 c0                	test   %eax,%eax
     933:	78 5a                	js     98f <dirtest+0xaf>
  if(unlink("dir0") < 0){
     935:	83 ec 0c             	sub    $0xc,%esp
     938:	68 48 40 00 00       	push   $0x4048
     93d:	e8 d0 2f 00 00       	call   3912 <unlink>
     942:	83 c4 10             	add    $0x10,%esp
     945:	85 c0                	test   %eax,%eax
     947:	78 2f                	js     978 <dirtest+0x98>
  printf(stdout, "mkdir test ok\n");
     949:	83 ec 08             	sub    $0x8,%esp
     94c:	68 85 40 00 00       	push   $0x4085
     951:	ff 35 28 5e 00 00    	pushl  0x5e28
     957:	e8 c4 30 00 00       	call   3a20 <printf>
}
     95c:	83 c4 10             	add    $0x10,%esp
     95f:	c9                   	leave  
     960:	c3                   	ret    
    printf(stdout, "mkdir failed\n");
     961:	50                   	push   %eax
     962:	50                   	push   %eax
     963:	68 78 3d 00 00       	push   $0x3d78
     968:	ff 35 28 5e 00 00    	pushl  0x5e28
     96e:	e8 ad 30 00 00       	call   3a20 <printf>
    exit();
     973:	e8 4a 2f 00 00       	call   38c2 <exit>
    printf(stdout, "unlink dir0 failed\n");
     978:	50                   	push   %eax
     979:	50                   	push   %eax
     97a:	68 71 40 00 00       	push   $0x4071
     97f:	ff 35 28 5e 00 00    	pushl  0x5e28
     985:	e8 96 30 00 00       	call   3a20 <printf>
    exit();
     98a:	e8 33 2f 00 00       	call   38c2 <exit>
    printf(stdout, "chdir .. failed\n");
     98f:	52                   	push   %edx
     990:	52                   	push   %edx
     991:	68 60 40 00 00       	push   $0x4060
     996:	ff 35 28 5e 00 00    	pushl  0x5e28
     99c:	e8 7f 30 00 00       	call   3a20 <printf>
    exit();
     9a1:	e8 1c 2f 00 00       	call   38c2 <exit>
    printf(stdout, "chdir dir0 failed\n");
     9a6:	51                   	push   %ecx
     9a7:	51                   	push   %ecx
     9a8:	68 4d 40 00 00       	push   $0x404d
     9ad:	ff 35 28 5e 00 00    	pushl  0x5e28
     9b3:	e8 68 30 00 00       	call   3a20 <printf>
    exit();
     9b8:	e8 05 2f 00 00       	call   38c2 <exit>
     9bd:	8d 76 00             	lea    0x0(%esi),%esi

000009c0 <exectest>:
{
     9c0:	55                   	push   %ebp
     9c1:	89 e5                	mov    %esp,%ebp
     9c3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     9c6:	68 94 40 00 00       	push   $0x4094
     9cb:	ff 35 28 5e 00 00    	pushl  0x5e28
     9d1:	e8 4a 30 00 00       	call   3a20 <printf>
  if(exec("echo", echoargv) < 0){
     9d6:	5a                   	pop    %edx
     9d7:	59                   	pop    %ecx
     9d8:	68 2c 5e 00 00       	push   $0x5e2c
     9dd:	68 5d 3e 00 00       	push   $0x3e5d
     9e2:	e8 13 2f 00 00       	call   38fa <exec>
     9e7:	83 c4 10             	add    $0x10,%esp
     9ea:	85 c0                	test   %eax,%eax
     9ec:	78 02                	js     9f0 <exectest+0x30>
}
     9ee:	c9                   	leave  
     9ef:	c3                   	ret    
    printf(stdout, "exec echo failed\n");
     9f0:	50                   	push   %eax
     9f1:	50                   	push   %eax
     9f2:	68 9f 40 00 00       	push   $0x409f
     9f7:	ff 35 28 5e 00 00    	pushl  0x5e28
     9fd:	e8 1e 30 00 00       	call   3a20 <printf>
    exit();
     a02:	e8 bb 2e 00 00       	call   38c2 <exit>
     a07:	89 f6                	mov    %esi,%esi
     a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a10 <pipe1>:
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	57                   	push   %edi
     a14:	56                   	push   %esi
     a15:	53                   	push   %ebx
  if(pipe(fds) != 0){
     a16:	8d 45 e0             	lea    -0x20(%ebp),%eax
{
     a19:	83 ec 38             	sub    $0x38,%esp
  if(pipe(fds) != 0){
     a1c:	50                   	push   %eax
     a1d:	e8 b0 2e 00 00       	call   38d2 <pipe>
     a22:	83 c4 10             	add    $0x10,%esp
     a25:	85 c0                	test   %eax,%eax
     a27:	0f 85 3e 01 00 00    	jne    b6b <pipe1+0x15b>
     a2d:	89 c3                	mov    %eax,%ebx
  pid = fork();
     a2f:	e8 86 2e 00 00       	call   38ba <fork>
  if(pid == 0){
     a34:	83 f8 00             	cmp    $0x0,%eax
     a37:	0f 84 84 00 00 00    	je     ac1 <pipe1+0xb1>
  } else if(pid > 0){
     a3d:	0f 8e 3b 01 00 00    	jle    b7e <pipe1+0x16e>
    close(fds[1]);
     a43:	83 ec 0c             	sub    $0xc,%esp
     a46:	ff 75 e4             	pushl  -0x1c(%ebp)
    cc = 1;
     a49:	bf 01 00 00 00       	mov    $0x1,%edi
    close(fds[1]);
     a4e:	e8 97 2e 00 00       	call   38ea <close>
    while((n = read(fds[0], buf, cc)) > 0){
     a53:	83 c4 10             	add    $0x10,%esp
    total = 0;
     a56:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     a5d:	83 ec 04             	sub    $0x4,%esp
     a60:	57                   	push   %edi
     a61:	68 00 86 00 00       	push   $0x8600
     a66:	ff 75 e0             	pushl  -0x20(%ebp)
     a69:	e8 6c 2e 00 00       	call   38da <read>
     a6e:	83 c4 10             	add    $0x10,%esp
     a71:	85 c0                	test   %eax,%eax
     a73:	0f 8e ab 00 00 00    	jle    b24 <pipe1+0x114>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     a79:	89 d9                	mov    %ebx,%ecx
     a7b:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     a7e:	f7 d9                	neg    %ecx
     a80:	38 9c 0b 00 86 00 00 	cmp    %bl,0x8600(%ebx,%ecx,1)
     a87:	8d 53 01             	lea    0x1(%ebx),%edx
     a8a:	75 1b                	jne    aa7 <pipe1+0x97>
      for(i = 0; i < n; i++){
     a8c:	39 f2                	cmp    %esi,%edx
     a8e:	89 d3                	mov    %edx,%ebx
     a90:	75 ee                	jne    a80 <pipe1+0x70>
      cc = cc * 2;
     a92:	01 ff                	add    %edi,%edi
      total += n;
     a94:	01 45 d4             	add    %eax,-0x2c(%ebp)
     a97:	b8 00 20 00 00       	mov    $0x2000,%eax
     a9c:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     aa2:	0f 4f f8             	cmovg  %eax,%edi
     aa5:	eb b6                	jmp    a5d <pipe1+0x4d>
          printf(1, "pipe1 oops 2\n");
     aa7:	83 ec 08             	sub    $0x8,%esp
     aaa:	68 ce 40 00 00       	push   $0x40ce
     aaf:	6a 01                	push   $0x1
     ab1:	e8 6a 2f 00 00       	call   3a20 <printf>
          return;
     ab6:	83 c4 10             	add    $0x10,%esp
}
     ab9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     abc:	5b                   	pop    %ebx
     abd:	5e                   	pop    %esi
     abe:	5f                   	pop    %edi
     abf:	5d                   	pop    %ebp
     ac0:	c3                   	ret    
    close(fds[0]);
     ac1:	83 ec 0c             	sub    $0xc,%esp
     ac4:	ff 75 e0             	pushl  -0x20(%ebp)
     ac7:	31 db                	xor    %ebx,%ebx
     ac9:	be 09 04 00 00       	mov    $0x409,%esi
     ace:	e8 17 2e 00 00       	call   38ea <close>
     ad3:	83 c4 10             	add    $0x10,%esp
     ad6:	89 d8                	mov    %ebx,%eax
     ad8:	89 f2                	mov    %esi,%edx
     ada:	f7 d8                	neg    %eax
     adc:	29 da                	sub    %ebx,%edx
     ade:	66 90                	xchg   %ax,%ax
        buf[i] = seq++;
     ae0:	88 84 03 00 86 00 00 	mov    %al,0x8600(%ebx,%eax,1)
     ae7:	83 c0 01             	add    $0x1,%eax
      for(i = 0; i < 1033; i++)
     aea:	39 d0                	cmp    %edx,%eax
     aec:	75 f2                	jne    ae0 <pipe1+0xd0>
      if(write(fds[1], buf, 1033) != 1033){
     aee:	83 ec 04             	sub    $0x4,%esp
     af1:	68 09 04 00 00       	push   $0x409
     af6:	68 00 86 00 00       	push   $0x8600
     afb:	ff 75 e4             	pushl  -0x1c(%ebp)
     afe:	e8 df 2d 00 00       	call   38e2 <write>
     b03:	83 c4 10             	add    $0x10,%esp
     b06:	3d 09 04 00 00       	cmp    $0x409,%eax
     b0b:	0f 85 80 00 00 00    	jne    b91 <pipe1+0x181>
     b11:	81 eb 09 04 00 00    	sub    $0x409,%ebx
    for(n = 0; n < 5; n++){
     b17:	81 fb d3 eb ff ff    	cmp    $0xffffebd3,%ebx
     b1d:	75 b7                	jne    ad6 <pipe1+0xc6>
    exit();
     b1f:	e8 9e 2d 00 00       	call   38c2 <exit>
    if(total != 5 * 1033){
     b24:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     b2b:	75 29                	jne    b56 <pipe1+0x146>
    close(fds[0]);
     b2d:	83 ec 0c             	sub    $0xc,%esp
     b30:	ff 75 e0             	pushl  -0x20(%ebp)
     b33:	e8 b2 2d 00 00       	call   38ea <close>
    wait();
     b38:	e8 8d 2d 00 00       	call   38ca <wait>
  printf(1, "pipe1 ok\n");
     b3d:	5a                   	pop    %edx
     b3e:	59                   	pop    %ecx
     b3f:	68 f3 40 00 00       	push   $0x40f3
     b44:	6a 01                	push   $0x1
     b46:	e8 d5 2e 00 00       	call   3a20 <printf>
     b4b:	83 c4 10             	add    $0x10,%esp
}
     b4e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b51:	5b                   	pop    %ebx
     b52:	5e                   	pop    %esi
     b53:	5f                   	pop    %edi
     b54:	5d                   	pop    %ebp
     b55:	c3                   	ret    
      printf(1, "pipe1 oops 3 total %d\n", total);
     b56:	53                   	push   %ebx
     b57:	ff 75 d4             	pushl  -0x2c(%ebp)
     b5a:	68 dc 40 00 00       	push   $0x40dc
     b5f:	6a 01                	push   $0x1
     b61:	e8 ba 2e 00 00       	call   3a20 <printf>
      exit();
     b66:	e8 57 2d 00 00       	call   38c2 <exit>
    printf(1, "pipe() failed\n");
     b6b:	57                   	push   %edi
     b6c:	57                   	push   %edi
     b6d:	68 b1 40 00 00       	push   $0x40b1
     b72:	6a 01                	push   $0x1
     b74:	e8 a7 2e 00 00       	call   3a20 <printf>
    exit();
     b79:	e8 44 2d 00 00       	call   38c2 <exit>
    printf(1, "fork() failed\n");
     b7e:	50                   	push   %eax
     b7f:	50                   	push   %eax
     b80:	68 fd 40 00 00       	push   $0x40fd
     b85:	6a 01                	push   $0x1
     b87:	e8 94 2e 00 00       	call   3a20 <printf>
    exit();
     b8c:	e8 31 2d 00 00       	call   38c2 <exit>
        printf(1, "pipe1 oops 1\n");
     b91:	56                   	push   %esi
     b92:	56                   	push   %esi
     b93:	68 c0 40 00 00       	push   $0x40c0
     b98:	6a 01                	push   $0x1
     b9a:	e8 81 2e 00 00       	call   3a20 <printf>
        exit();
     b9f:	e8 1e 2d 00 00       	call   38c2 <exit>
     ba4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     baa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000bb0 <preempt>:
{
     bb0:	55                   	push   %ebp
     bb1:	89 e5                	mov    %esp,%ebp
     bb3:	57                   	push   %edi
     bb4:	56                   	push   %esi
     bb5:	53                   	push   %ebx
     bb6:	83 ec 24             	sub    $0x24,%esp
  printf(1, "preempt: ");
     bb9:	68 0c 41 00 00       	push   $0x410c
     bbe:	6a 01                	push   $0x1
     bc0:	e8 5b 2e 00 00       	call   3a20 <printf>
  pid1 = fork();
     bc5:	e8 f0 2c 00 00       	call   38ba <fork>
  if(pid1 == 0)
     bca:	83 c4 10             	add    $0x10,%esp
     bcd:	85 c0                	test   %eax,%eax
     bcf:	75 02                	jne    bd3 <preempt+0x23>
     bd1:	eb fe                	jmp    bd1 <preempt+0x21>
     bd3:	89 c7                	mov    %eax,%edi
  pid2 = fork();
     bd5:	e8 e0 2c 00 00       	call   38ba <fork>
  if(pid2 == 0)
     bda:	85 c0                	test   %eax,%eax
  pid2 = fork();
     bdc:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     bde:	75 02                	jne    be2 <preempt+0x32>
     be0:	eb fe                	jmp    be0 <preempt+0x30>
  pipe(pfds);
     be2:	8d 45 e0             	lea    -0x20(%ebp),%eax
     be5:	83 ec 0c             	sub    $0xc,%esp
     be8:	50                   	push   %eax
     be9:	e8 e4 2c 00 00       	call   38d2 <pipe>
  pid3 = fork();
     bee:	e8 c7 2c 00 00       	call   38ba <fork>
  if(pid3 == 0){
     bf3:	83 c4 10             	add    $0x10,%esp
     bf6:	85 c0                	test   %eax,%eax
  pid3 = fork();
     bf8:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     bfa:	75 46                	jne    c42 <preempt+0x92>
    close(pfds[0]);
     bfc:	83 ec 0c             	sub    $0xc,%esp
     bff:	ff 75 e0             	pushl  -0x20(%ebp)
     c02:	e8 e3 2c 00 00       	call   38ea <close>
    if(write(pfds[1], "x", 1) != 1)
     c07:	83 c4 0c             	add    $0xc,%esp
     c0a:	6a 01                	push   $0x1
     c0c:	68 d1 46 00 00       	push   $0x46d1
     c11:	ff 75 e4             	pushl  -0x1c(%ebp)
     c14:	e8 c9 2c 00 00       	call   38e2 <write>
     c19:	83 c4 10             	add    $0x10,%esp
     c1c:	83 e8 01             	sub    $0x1,%eax
     c1f:	74 11                	je     c32 <preempt+0x82>
      printf(1, "preempt write error");
     c21:	50                   	push   %eax
     c22:	50                   	push   %eax
     c23:	68 16 41 00 00       	push   $0x4116
     c28:	6a 01                	push   $0x1
     c2a:	e8 f1 2d 00 00       	call   3a20 <printf>
     c2f:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     c32:	83 ec 0c             	sub    $0xc,%esp
     c35:	ff 75 e4             	pushl  -0x1c(%ebp)
     c38:	e8 ad 2c 00 00       	call   38ea <close>
     c3d:	83 c4 10             	add    $0x10,%esp
     c40:	eb fe                	jmp    c40 <preempt+0x90>
  close(pfds[1]);
     c42:	83 ec 0c             	sub    $0xc,%esp
     c45:	ff 75 e4             	pushl  -0x1c(%ebp)
     c48:	e8 9d 2c 00 00       	call   38ea <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     c4d:	83 c4 0c             	add    $0xc,%esp
     c50:	68 00 20 00 00       	push   $0x2000
     c55:	68 00 86 00 00       	push   $0x8600
     c5a:	ff 75 e0             	pushl  -0x20(%ebp)
     c5d:	e8 78 2c 00 00       	call   38da <read>
     c62:	83 c4 10             	add    $0x10,%esp
     c65:	83 e8 01             	sub    $0x1,%eax
     c68:	74 19                	je     c83 <preempt+0xd3>
    printf(1, "preempt read error");
     c6a:	50                   	push   %eax
     c6b:	50                   	push   %eax
     c6c:	68 2a 41 00 00       	push   $0x412a
     c71:	6a 01                	push   $0x1
     c73:	e8 a8 2d 00 00       	call   3a20 <printf>
    return;
     c78:	83 c4 10             	add    $0x10,%esp
}
     c7b:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c7e:	5b                   	pop    %ebx
     c7f:	5e                   	pop    %esi
     c80:	5f                   	pop    %edi
     c81:	5d                   	pop    %ebp
     c82:	c3                   	ret    
  close(pfds[0]);
     c83:	83 ec 0c             	sub    $0xc,%esp
     c86:	ff 75 e0             	pushl  -0x20(%ebp)
     c89:	e8 5c 2c 00 00       	call   38ea <close>
  printf(1, "kill... ");
     c8e:	58                   	pop    %eax
     c8f:	5a                   	pop    %edx
     c90:	68 3d 41 00 00       	push   $0x413d
     c95:	6a 01                	push   $0x1
     c97:	e8 84 2d 00 00       	call   3a20 <printf>
  kill(pid1);
     c9c:	89 3c 24             	mov    %edi,(%esp)
     c9f:	e8 4e 2c 00 00       	call   38f2 <kill>
  kill(pid2);
     ca4:	89 34 24             	mov    %esi,(%esp)
     ca7:	e8 46 2c 00 00       	call   38f2 <kill>
  kill(pid3);
     cac:	89 1c 24             	mov    %ebx,(%esp)
     caf:	e8 3e 2c 00 00       	call   38f2 <kill>
  printf(1, "wait... ");
     cb4:	59                   	pop    %ecx
     cb5:	5b                   	pop    %ebx
     cb6:	68 46 41 00 00       	push   $0x4146
     cbb:	6a 01                	push   $0x1
     cbd:	e8 5e 2d 00 00       	call   3a20 <printf>
  wait();
     cc2:	e8 03 2c 00 00       	call   38ca <wait>
  wait();
     cc7:	e8 fe 2b 00 00       	call   38ca <wait>
  wait();
     ccc:	e8 f9 2b 00 00       	call   38ca <wait>
  printf(1, "preempt ok\n");
     cd1:	5e                   	pop    %esi
     cd2:	5f                   	pop    %edi
     cd3:	68 4f 41 00 00       	push   $0x414f
     cd8:	6a 01                	push   $0x1
     cda:	e8 41 2d 00 00       	call   3a20 <printf>
     cdf:	83 c4 10             	add    $0x10,%esp
     ce2:	eb 97                	jmp    c7b <preempt+0xcb>
     ce4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     cea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000cf0 <exitwait>:
{
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	56                   	push   %esi
     cf4:	be 64 00 00 00       	mov    $0x64,%esi
     cf9:	53                   	push   %ebx
     cfa:	eb 14                	jmp    d10 <exitwait+0x20>
     cfc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid){
     d00:	74 6f                	je     d71 <exitwait+0x81>
      if(wait() != pid){
     d02:	e8 c3 2b 00 00       	call   38ca <wait>
     d07:	39 d8                	cmp    %ebx,%eax
     d09:	75 2d                	jne    d38 <exitwait+0x48>
  for(i = 0; i < 100; i++){
     d0b:	83 ee 01             	sub    $0x1,%esi
     d0e:	74 48                	je     d58 <exitwait+0x68>
    pid = fork();
     d10:	e8 a5 2b 00 00       	call   38ba <fork>
    if(pid < 0){
     d15:	85 c0                	test   %eax,%eax
    pid = fork();
     d17:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     d19:	79 e5                	jns    d00 <exitwait+0x10>
      printf(1, "fork failed\n");
     d1b:	83 ec 08             	sub    $0x8,%esp
     d1e:	68 b9 4c 00 00       	push   $0x4cb9
     d23:	6a 01                	push   $0x1
     d25:	e8 f6 2c 00 00       	call   3a20 <printf>
      return;
     d2a:	83 c4 10             	add    $0x10,%esp
}
     d2d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d30:	5b                   	pop    %ebx
     d31:	5e                   	pop    %esi
     d32:	5d                   	pop    %ebp
     d33:	c3                   	ret    
     d34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        printf(1, "wait wrong pid\n");
     d38:	83 ec 08             	sub    $0x8,%esp
     d3b:	68 5b 41 00 00       	push   $0x415b
     d40:	6a 01                	push   $0x1
     d42:	e8 d9 2c 00 00       	call   3a20 <printf>
        return;
     d47:	83 c4 10             	add    $0x10,%esp
}
     d4a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d4d:	5b                   	pop    %ebx
     d4e:	5e                   	pop    %esi
     d4f:	5d                   	pop    %ebp
     d50:	c3                   	ret    
     d51:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  printf(1, "exitwait ok\n");
     d58:	83 ec 08             	sub    $0x8,%esp
     d5b:	68 6b 41 00 00       	push   $0x416b
     d60:	6a 01                	push   $0x1
     d62:	e8 b9 2c 00 00       	call   3a20 <printf>
     d67:	83 c4 10             	add    $0x10,%esp
}
     d6a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d6d:	5b                   	pop    %ebx
     d6e:	5e                   	pop    %esi
     d6f:	5d                   	pop    %ebp
     d70:	c3                   	ret    
      exit();
     d71:	e8 4c 2b 00 00       	call   38c2 <exit>
     d76:	8d 76 00             	lea    0x0(%esi),%esi
     d79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d80 <mem>:
{
     d80:	55                   	push   %ebp
     d81:	89 e5                	mov    %esp,%ebp
     d83:	57                   	push   %edi
     d84:	56                   	push   %esi
     d85:	53                   	push   %ebx
     d86:	31 ff                	xor    %edi,%edi
     d88:	bb d3 4d 62 10       	mov    $0x10624dd3,%ebx
     d8d:	83 ec 14             	sub    $0x14,%esp
 	printf(1, "mem test\n");
     d90:	68 78 41 00 00       	push   $0x4178
     d95:	6a 01                	push   $0x1
     d97:	e8 84 2c 00 00       	call   3a20 <printf>
  ppid = getpid();
     d9c:	e8 a1 2b 00 00       	call   3942 <getpid>
     da1:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     da3:	e8 12 2b 00 00       	call   38ba <fork>
     da8:	83 c4 10             	add    $0x10,%esp
     dab:	85 c0                	test   %eax,%eax
     dad:	0f 85 a5 00 00 00    	jne    e58 <mem+0xd8>
     db3:	90                   	nop
     db4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
		while((m2 = malloc(10001)) != 0){
     db8:	83 ec 0c             	sub    $0xc,%esp
     dbb:	68 11 27 00 00       	push   $0x2711
     dc0:	e8 bb 2e 00 00       	call   3c80 <malloc>
     dc5:	83 c4 10             	add    $0x10,%esp
     dc8:	85 c0                	test   %eax,%eax
     dca:	89 c1                	mov    %eax,%ecx
     dcc:	74 32                	je     e00 <mem+0x80>
			if((int)m2 % 1000 == 0)
     dce:	89 c8                	mov    %ecx,%eax
     dd0:	f7 eb                	imul   %ebx
     dd2:	89 c8                	mov    %ecx,%eax
     dd4:	c1 f8 1f             	sar    $0x1f,%eax
     dd7:	c1 fa 06             	sar    $0x6,%edx
     dda:	29 c2                	sub    %eax,%edx
     ddc:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
     de2:	39 d1                	cmp    %edx,%ecx
     de4:	75 02                	jne    de8 <mem+0x68>
			*(char**)m2 = m1;
     de6:	89 39                	mov    %edi,(%ecx)
{
     de8:	89 cf                	mov    %ecx,%edi
     dea:	eb cc                	jmp    db8 <mem+0x38>
     dec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m2 = *(char**)m1;
     df0:	8b 1f                	mov    (%edi),%ebx
      free(m1);
     df2:	83 ec 0c             	sub    $0xc,%esp
     df5:	57                   	push   %edi
     df6:	89 df                	mov    %ebx,%edi
     df8:	e8 f3 2d 00 00       	call   3bf0 <free>
    while(m1){
     dfd:	83 c4 10             	add    $0x10,%esp
     e00:	85 ff                	test   %edi,%edi
     e02:	75 ec                	jne    df0 <mem+0x70>
    m1 = malloc(1024*20);
     e04:	83 ec 0c             	sub    $0xc,%esp
     e07:	68 00 50 00 00       	push   $0x5000
     e0c:	e8 6f 2e 00 00       	call   3c80 <malloc>
    if(m1 == 0){
     e11:	83 c4 10             	add    $0x10,%esp
     e14:	85 c0                	test   %eax,%eax
     e16:	74 20                	je     e38 <mem+0xb8>
    free(m1);
     e18:	83 ec 0c             	sub    $0xc,%esp
     e1b:	50                   	push   %eax
     e1c:	e8 cf 2d 00 00       	call   3bf0 <free>
    printf(1, "mem ok\n");
     e21:	58                   	pop    %eax
     e22:	5a                   	pop    %edx
     e23:	68 9c 41 00 00       	push   $0x419c
     e28:	6a 01                	push   $0x1
     e2a:	e8 f1 2b 00 00       	call   3a20 <printf>
    exit();
     e2f:	e8 8e 2a 00 00       	call   38c2 <exit>
     e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "couldn't allocate mem?!!\n");
     e38:	83 ec 08             	sub    $0x8,%esp
     e3b:	68 82 41 00 00       	push   $0x4182
     e40:	6a 01                	push   $0x1
     e42:	e8 d9 2b 00 00       	call   3a20 <printf>
      kill(ppid);
     e47:	89 34 24             	mov    %esi,(%esp)
     e4a:	e8 a3 2a 00 00       	call   38f2 <kill>
      exit();
     e4f:	e8 6e 2a 00 00       	call   38c2 <exit>
     e54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
}
     e58:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e5b:	5b                   	pop    %ebx
     e5c:	5e                   	pop    %esi
     e5d:	5f                   	pop    %edi
     e5e:	5d                   	pop    %ebp
    wait();
     e5f:	e9 66 2a 00 00       	jmp    38ca <wait>
     e64:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     e6a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000e70 <sharedfd>:
{
     e70:	55                   	push   %ebp
     e71:	89 e5                	mov    %esp,%ebp
     e73:	57                   	push   %edi
     e74:	56                   	push   %esi
     e75:	53                   	push   %ebx
     e76:	83 ec 34             	sub    $0x34,%esp
  printf(1, "sharedfd test\n");
     e79:	68 a4 41 00 00       	push   $0x41a4
     e7e:	6a 01                	push   $0x1
     e80:	e8 9b 2b 00 00       	call   3a20 <printf>
  unlink("sharedfd");
     e85:	c7 04 24 b3 41 00 00 	movl   $0x41b3,(%esp)
     e8c:	e8 81 2a 00 00       	call   3912 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     e91:	59                   	pop    %ecx
     e92:	5b                   	pop    %ebx
     e93:	68 02 02 00 00       	push   $0x202
     e98:	68 b3 41 00 00       	push   $0x41b3
     e9d:	e8 60 2a 00 00       	call   3902 <open>
  if(fd < 0){
     ea2:	83 c4 10             	add    $0x10,%esp
     ea5:	85 c0                	test   %eax,%eax
     ea7:	0f 88 33 01 00 00    	js     fe0 <sharedfd+0x170>
     ead:	89 c6                	mov    %eax,%esi
  memset(buf, pid==0?'c':'p', sizeof(buf));
     eaf:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  pid = fork();
     eb4:	e8 01 2a 00 00       	call   38ba <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     eb9:	83 f8 01             	cmp    $0x1,%eax
  pid = fork();
     ebc:	89 c7                	mov    %eax,%edi
  memset(buf, pid==0?'c':'p', sizeof(buf));
     ebe:	19 c0                	sbb    %eax,%eax
     ec0:	83 ec 04             	sub    $0x4,%esp
     ec3:	83 e0 f3             	and    $0xfffffff3,%eax
     ec6:	6a 0a                	push   $0xa
     ec8:	83 c0 70             	add    $0x70,%eax
     ecb:	50                   	push   %eax
     ecc:	8d 45 de             	lea    -0x22(%ebp),%eax
     ecf:	50                   	push   %eax
     ed0:	e8 4b 28 00 00       	call   3720 <memset>
     ed5:	83 c4 10             	add    $0x10,%esp
     ed8:	eb 0b                	jmp    ee5 <sharedfd+0x75>
     eda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(i = 0; i < 1000; i++){
     ee0:	83 eb 01             	sub    $0x1,%ebx
     ee3:	74 29                	je     f0e <sharedfd+0x9e>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     ee5:	8d 45 de             	lea    -0x22(%ebp),%eax
     ee8:	83 ec 04             	sub    $0x4,%esp
     eeb:	6a 0a                	push   $0xa
     eed:	50                   	push   %eax
     eee:	56                   	push   %esi
     eef:	e8 ee 29 00 00       	call   38e2 <write>
     ef4:	83 c4 10             	add    $0x10,%esp
     ef7:	83 f8 0a             	cmp    $0xa,%eax
     efa:	74 e4                	je     ee0 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
     efc:	83 ec 08             	sub    $0x8,%esp
     eff:	68 a4 4e 00 00       	push   $0x4ea4
     f04:	6a 01                	push   $0x1
     f06:	e8 15 2b 00 00       	call   3a20 <printf>
      break;
     f0b:	83 c4 10             	add    $0x10,%esp
  if(pid == 0)
     f0e:	85 ff                	test   %edi,%edi
     f10:	0f 84 fe 00 00 00    	je     1014 <sharedfd+0x1a4>
    wait();
     f16:	e8 af 29 00 00       	call   38ca <wait>
  close(fd);
     f1b:	83 ec 0c             	sub    $0xc,%esp
  nc = np = 0;
     f1e:	31 db                	xor    %ebx,%ebx
     f20:	31 ff                	xor    %edi,%edi
  close(fd);
     f22:	56                   	push   %esi
     f23:	8d 75 e8             	lea    -0x18(%ebp),%esi
     f26:	e8 bf 29 00 00       	call   38ea <close>
  fd = open("sharedfd", 0);
     f2b:	58                   	pop    %eax
     f2c:	5a                   	pop    %edx
     f2d:	6a 00                	push   $0x0
     f2f:	68 b3 41 00 00       	push   $0x41b3
     f34:	e8 c9 29 00 00       	call   3902 <open>
  if(fd < 0){
     f39:	83 c4 10             	add    $0x10,%esp
     f3c:	85 c0                	test   %eax,%eax
  fd = open("sharedfd", 0);
     f3e:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  if(fd < 0){
     f41:	0f 88 b3 00 00 00    	js     ffa <sharedfd+0x18a>
     f47:	89 f8                	mov    %edi,%eax
     f49:	89 df                	mov    %ebx,%edi
     f4b:	89 c3                	mov    %eax,%ebx
     f4d:	8d 76 00             	lea    0x0(%esi),%esi
  while((n = read(fd, buf, sizeof(buf))) > 0){
     f50:	8d 45 de             	lea    -0x22(%ebp),%eax
     f53:	83 ec 04             	sub    $0x4,%esp
     f56:	6a 0a                	push   $0xa
     f58:	50                   	push   %eax
     f59:	ff 75 d4             	pushl  -0x2c(%ebp)
     f5c:	e8 79 29 00 00       	call   38da <read>
     f61:	83 c4 10             	add    $0x10,%esp
     f64:	85 c0                	test   %eax,%eax
     f66:	7e 28                	jle    f90 <sharedfd+0x120>
     f68:	8d 45 de             	lea    -0x22(%ebp),%eax
     f6b:	eb 15                	jmp    f82 <sharedfd+0x112>
     f6d:	8d 76 00             	lea    0x0(%esi),%esi
        np++;
     f70:	80 fa 70             	cmp    $0x70,%dl
     f73:	0f 94 c2             	sete   %dl
     f76:	0f b6 d2             	movzbl %dl,%edx
     f79:	01 d7                	add    %edx,%edi
     f7b:	83 c0 01             	add    $0x1,%eax
    for(i = 0; i < sizeof(buf); i++){
     f7e:	39 f0                	cmp    %esi,%eax
     f80:	74 ce                	je     f50 <sharedfd+0xe0>
      if(buf[i] == 'c')
     f82:	0f b6 10             	movzbl (%eax),%edx
     f85:	80 fa 63             	cmp    $0x63,%dl
     f88:	75 e6                	jne    f70 <sharedfd+0x100>
        nc++;
     f8a:	83 c3 01             	add    $0x1,%ebx
     f8d:	eb ec                	jmp    f7b <sharedfd+0x10b>
     f8f:	90                   	nop
  close(fd);
     f90:	83 ec 0c             	sub    $0xc,%esp
     f93:	89 d8                	mov    %ebx,%eax
     f95:	ff 75 d4             	pushl  -0x2c(%ebp)
     f98:	89 fb                	mov    %edi,%ebx
     f9a:	89 c7                	mov    %eax,%edi
     f9c:	e8 49 29 00 00       	call   38ea <close>
  unlink("sharedfd");
     fa1:	c7 04 24 b3 41 00 00 	movl   $0x41b3,(%esp)
     fa8:	e8 65 29 00 00       	call   3912 <unlink>
  if(nc == 10000 && np == 10000){
     fad:	83 c4 10             	add    $0x10,%esp
     fb0:	81 ff 10 27 00 00    	cmp    $0x2710,%edi
     fb6:	75 61                	jne    1019 <sharedfd+0x1a9>
     fb8:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     fbe:	75 59                	jne    1019 <sharedfd+0x1a9>
    printf(1, "sharedfd ok\n");
     fc0:	83 ec 08             	sub    $0x8,%esp
     fc3:	68 bc 41 00 00       	push   $0x41bc
     fc8:	6a 01                	push   $0x1
     fca:	e8 51 2a 00 00       	call   3a20 <printf>
     fcf:	83 c4 10             	add    $0x10,%esp
}
     fd2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fd5:	5b                   	pop    %ebx
     fd6:	5e                   	pop    %esi
     fd7:	5f                   	pop    %edi
     fd8:	5d                   	pop    %ebp
     fd9:	c3                   	ret    
     fda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    printf(1, "fstests: cannot open sharedfd for writing");
     fe0:	83 ec 08             	sub    $0x8,%esp
     fe3:	68 78 4e 00 00       	push   $0x4e78
     fe8:	6a 01                	push   $0x1
     fea:	e8 31 2a 00 00       	call   3a20 <printf>
    return;
     fef:	83 c4 10             	add    $0x10,%esp
}
     ff2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ff5:	5b                   	pop    %ebx
     ff6:	5e                   	pop    %esi
     ff7:	5f                   	pop    %edi
     ff8:	5d                   	pop    %ebp
     ff9:	c3                   	ret    
    printf(1, "fstests: cannot open sharedfd for reading\n");
     ffa:	83 ec 08             	sub    $0x8,%esp
     ffd:	68 c4 4e 00 00       	push   $0x4ec4
    1002:	6a 01                	push   $0x1
    1004:	e8 17 2a 00 00       	call   3a20 <printf>
    return;
    1009:	83 c4 10             	add    $0x10,%esp
}
    100c:	8d 65 f4             	lea    -0xc(%ebp),%esp
    100f:	5b                   	pop    %ebx
    1010:	5e                   	pop    %esi
    1011:	5f                   	pop    %edi
    1012:	5d                   	pop    %ebp
    1013:	c3                   	ret    
    exit();
    1014:	e8 a9 28 00 00       	call   38c2 <exit>
    printf(1, "sharedfd oops %d %d\n", nc, np);
    1019:	53                   	push   %ebx
    101a:	57                   	push   %edi
    101b:	68 c9 41 00 00       	push   $0x41c9
    1020:	6a 01                	push   $0x1
    1022:	e8 f9 29 00 00       	call   3a20 <printf>
    exit();
    1027:	e8 96 28 00 00       	call   38c2 <exit>
    102c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001030 <fourfiles>:
{
    1030:	55                   	push   %ebp
    1031:	89 e5                	mov    %esp,%ebp
    1033:	57                   	push   %edi
    1034:	56                   	push   %esi
    1035:	53                   	push   %ebx
  printf(1, "fourfiles test\n");
    1036:	be de 41 00 00       	mov    $0x41de,%esi
  for(pi = 0; pi < 4; pi++){
    103b:	31 db                	xor    %ebx,%ebx
{
    103d:	83 ec 34             	sub    $0x34,%esp
  char *names[] = { "f0", "f1", "f2", "f3" };
    1040:	c7 45 d8 de 41 00 00 	movl   $0x41de,-0x28(%ebp)
    1047:	c7 45 dc 27 43 00 00 	movl   $0x4327,-0x24(%ebp)
  printf(1, "fourfiles test\n");
    104e:	68 e4 41 00 00       	push   $0x41e4
    1053:	6a 01                	push   $0x1
  char *names[] = { "f0", "f1", "f2", "f3" };
    1055:	c7 45 e0 2b 43 00 00 	movl   $0x432b,-0x20(%ebp)
    105c:	c7 45 e4 e1 41 00 00 	movl   $0x41e1,-0x1c(%ebp)
  printf(1, "fourfiles test\n");
    1063:	e8 b8 29 00 00       	call   3a20 <printf>
    1068:	83 c4 10             	add    $0x10,%esp
    unlink(fname);
    106b:	83 ec 0c             	sub    $0xc,%esp
    106e:	56                   	push   %esi
    106f:	e8 9e 28 00 00       	call   3912 <unlink>
    pid = fork();
    1074:	e8 41 28 00 00       	call   38ba <fork>
    if(pid < 0){
    1079:	83 c4 10             	add    $0x10,%esp
    107c:	85 c0                	test   %eax,%eax
    107e:	0f 88 68 01 00 00    	js     11ec <fourfiles+0x1bc>
    if(pid == 0){
    1084:	0f 84 df 00 00 00    	je     1169 <fourfiles+0x139>
  for(pi = 0; pi < 4; pi++){
    108a:	83 c3 01             	add    $0x1,%ebx
    108d:	83 fb 04             	cmp    $0x4,%ebx
    1090:	74 06                	je     1098 <fourfiles+0x68>
    1092:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    1096:	eb d3                	jmp    106b <fourfiles+0x3b>
    wait();
    1098:	e8 2d 28 00 00       	call   38ca <wait>
  for(i = 0; i < 2; i++){
    109d:	31 ff                	xor    %edi,%edi
    wait();
    109f:	e8 26 28 00 00       	call   38ca <wait>
    10a4:	e8 21 28 00 00       	call   38ca <wait>
    10a9:	e8 1c 28 00 00       	call   38ca <wait>
    10ae:	c7 45 d0 de 41 00 00 	movl   $0x41de,-0x30(%ebp)
    fd = open(fname, 0);
    10b5:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    10b8:	31 db                	xor    %ebx,%ebx
    fd = open(fname, 0);
    10ba:	6a 00                	push   $0x0
    10bc:	ff 75 d0             	pushl  -0x30(%ebp)
    10bf:	e8 3e 28 00 00       	call   3902 <open>
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10c4:	83 c4 10             	add    $0x10,%esp
    fd = open(fname, 0);
    10c7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    10ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10d0:	83 ec 04             	sub    $0x4,%esp
    10d3:	68 00 20 00 00       	push   $0x2000
    10d8:	68 00 86 00 00       	push   $0x8600
    10dd:	ff 75 d4             	pushl  -0x2c(%ebp)
    10e0:	e8 f5 27 00 00       	call   38da <read>
    10e5:	83 c4 10             	add    $0x10,%esp
    10e8:	85 c0                	test   %eax,%eax
    10ea:	7e 26                	jle    1112 <fourfiles+0xe2>
      for(j = 0; j < n; j++){
    10ec:	31 d2                	xor    %edx,%edx
    10ee:	66 90                	xchg   %ax,%ax
        if(buf[j] != '0'+i){
    10f0:	0f be b2 00 86 00 00 	movsbl 0x8600(%edx),%esi
    10f7:	83 ff 01             	cmp    $0x1,%edi
    10fa:	19 c9                	sbb    %ecx,%ecx
    10fc:	83 c1 31             	add    $0x31,%ecx
    10ff:	39 ce                	cmp    %ecx,%esi
    1101:	0f 85 be 00 00 00    	jne    11c5 <fourfiles+0x195>
      for(j = 0; j < n; j++){
    1107:	83 c2 01             	add    $0x1,%edx
    110a:	39 d0                	cmp    %edx,%eax
    110c:	75 e2                	jne    10f0 <fourfiles+0xc0>
      total += n;
    110e:	01 c3                	add    %eax,%ebx
    1110:	eb be                	jmp    10d0 <fourfiles+0xa0>
    close(fd);
    1112:	83 ec 0c             	sub    $0xc,%esp
    1115:	ff 75 d4             	pushl  -0x2c(%ebp)
    1118:	e8 cd 27 00 00       	call   38ea <close>
    if(total != 12*500){
    111d:	83 c4 10             	add    $0x10,%esp
    1120:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    1126:	0f 85 d3 00 00 00    	jne    11ff <fourfiles+0x1cf>
    unlink(fname);
    112c:	83 ec 0c             	sub    $0xc,%esp
    112f:	ff 75 d0             	pushl  -0x30(%ebp)
    1132:	e8 db 27 00 00       	call   3912 <unlink>
  for(i = 0; i < 2; i++){
    1137:	83 c4 10             	add    $0x10,%esp
    113a:	83 ff 01             	cmp    $0x1,%edi
    113d:	75 1a                	jne    1159 <fourfiles+0x129>
  printf(1, "fourfiles ok\n");
    113f:	83 ec 08             	sub    $0x8,%esp
    1142:	68 22 42 00 00       	push   $0x4222
    1147:	6a 01                	push   $0x1
    1149:	e8 d2 28 00 00       	call   3a20 <printf>
}
    114e:	83 c4 10             	add    $0x10,%esp
    1151:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1154:	5b                   	pop    %ebx
    1155:	5e                   	pop    %esi
    1156:	5f                   	pop    %edi
    1157:	5d                   	pop    %ebp
    1158:	c3                   	ret    
    1159:	8b 45 dc             	mov    -0x24(%ebp),%eax
    115c:	bf 01 00 00 00       	mov    $0x1,%edi
    1161:	89 45 d0             	mov    %eax,-0x30(%ebp)
    1164:	e9 4c ff ff ff       	jmp    10b5 <fourfiles+0x85>
      fd = open(fname, O_CREATE | O_RDWR);
    1169:	83 ec 08             	sub    $0x8,%esp
    116c:	68 02 02 00 00       	push   $0x202
    1171:	56                   	push   %esi
    1172:	e8 8b 27 00 00       	call   3902 <open>
      if(fd < 0){
    1177:	83 c4 10             	add    $0x10,%esp
    117a:	85 c0                	test   %eax,%eax
      fd = open(fname, O_CREATE | O_RDWR);
    117c:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    117e:	78 59                	js     11d9 <fourfiles+0x1a9>
      memset(buf, '0'+pi, 512);
    1180:	83 ec 04             	sub    $0x4,%esp
    1183:	83 c3 30             	add    $0x30,%ebx
    1186:	68 00 02 00 00       	push   $0x200
    118b:	53                   	push   %ebx
    118c:	bb 0c 00 00 00       	mov    $0xc,%ebx
    1191:	68 00 86 00 00       	push   $0x8600
    1196:	e8 85 25 00 00       	call   3720 <memset>
    119b:	83 c4 10             	add    $0x10,%esp
        if((n = write(fd, buf, 500)) != 500){
    119e:	83 ec 04             	sub    $0x4,%esp
    11a1:	68 f4 01 00 00       	push   $0x1f4
    11a6:	68 00 86 00 00       	push   $0x8600
    11ab:	56                   	push   %esi
    11ac:	e8 31 27 00 00       	call   38e2 <write>
    11b1:	83 c4 10             	add    $0x10,%esp
    11b4:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    11b9:	75 57                	jne    1212 <fourfiles+0x1e2>
      for(i = 0; i < 12; i++){
    11bb:	83 eb 01             	sub    $0x1,%ebx
    11be:	75 de                	jne    119e <fourfiles+0x16e>
      exit();
    11c0:	e8 fd 26 00 00       	call   38c2 <exit>
          printf(1, "wrong char\n");
    11c5:	83 ec 08             	sub    $0x8,%esp
    11c8:	68 05 42 00 00       	push   $0x4205
    11cd:	6a 01                	push   $0x1
    11cf:	e8 4c 28 00 00       	call   3a20 <printf>
          exit();
    11d4:	e8 e9 26 00 00       	call   38c2 <exit>
        printf(1, "create failed\n");
    11d9:	51                   	push   %ecx
    11da:	51                   	push   %ecx
    11db:	68 7f 44 00 00       	push   $0x447f
    11e0:	6a 01                	push   $0x1
    11e2:	e8 39 28 00 00       	call   3a20 <printf>
        exit();
    11e7:	e8 d6 26 00 00       	call   38c2 <exit>
      printf(1, "fork failed\n");
    11ec:	53                   	push   %ebx
    11ed:	53                   	push   %ebx
    11ee:	68 b9 4c 00 00       	push   $0x4cb9
    11f3:	6a 01                	push   $0x1
    11f5:	e8 26 28 00 00       	call   3a20 <printf>
      exit();
    11fa:	e8 c3 26 00 00       	call   38c2 <exit>
      printf(1, "wrong length %d\n", total);
    11ff:	50                   	push   %eax
    1200:	53                   	push   %ebx
    1201:	68 11 42 00 00       	push   $0x4211
    1206:	6a 01                	push   $0x1
    1208:	e8 13 28 00 00       	call   3a20 <printf>
      exit();
    120d:	e8 b0 26 00 00       	call   38c2 <exit>
          printf(1, "write failed %d\n", n);
    1212:	52                   	push   %edx
    1213:	50                   	push   %eax
    1214:	68 f4 41 00 00       	push   $0x41f4
    1219:	6a 01                	push   $0x1
    121b:	e8 00 28 00 00       	call   3a20 <printf>
          exit();
    1220:	e8 9d 26 00 00       	call   38c2 <exit>
    1225:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001230 <createdelete>:
{
    1230:	55                   	push   %ebp
    1231:	89 e5                	mov    %esp,%ebp
    1233:	57                   	push   %edi
    1234:	56                   	push   %esi
    1235:	53                   	push   %ebx
  for(pi = 0; pi < 4; pi++){
    1236:	31 db                	xor    %ebx,%ebx
{
    1238:	83 ec 44             	sub    $0x44,%esp
  printf(1, "createdelete test\n");
    123b:	68 30 42 00 00       	push   $0x4230
    1240:	6a 01                	push   $0x1
    1242:	e8 d9 27 00 00       	call   3a20 <printf>
    1247:	83 c4 10             	add    $0x10,%esp
    pid = fork();
    124a:	e8 6b 26 00 00       	call   38ba <fork>
    if(pid < 0){
    124f:	85 c0                	test   %eax,%eax
    1251:	0f 88 be 01 00 00    	js     1415 <createdelete+0x1e5>
    if(pid == 0){
    1257:	0f 84 0b 01 00 00    	je     1368 <createdelete+0x138>
  for(pi = 0; pi < 4; pi++){
    125d:	83 c3 01             	add    $0x1,%ebx
    1260:	83 fb 04             	cmp    $0x4,%ebx
    1263:	75 e5                	jne    124a <createdelete+0x1a>
    1265:	8d 7d c8             	lea    -0x38(%ebp),%edi
  name[0] = name[1] = name[2] = 0;
    1268:	be ff ff ff ff       	mov    $0xffffffff,%esi
    wait();
    126d:	e8 58 26 00 00       	call   38ca <wait>
    1272:	e8 53 26 00 00       	call   38ca <wait>
    1277:	e8 4e 26 00 00       	call   38ca <wait>
    127c:	e8 49 26 00 00       	call   38ca <wait>
  name[0] = name[1] = name[2] = 0;
    1281:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1285:	8d 76 00             	lea    0x0(%esi),%esi
    1288:	8d 46 31             	lea    0x31(%esi),%eax
    128b:	88 45 c7             	mov    %al,-0x39(%ebp)
    128e:	8d 46 01             	lea    0x1(%esi),%eax
    1291:	83 f8 09             	cmp    $0x9,%eax
    1294:	89 45 c0             	mov    %eax,-0x40(%ebp)
    1297:	0f 9f c3             	setg   %bl
    129a:	85 c0                	test   %eax,%eax
    129c:	0f 94 c0             	sete   %al
    129f:	09 c3                	or     %eax,%ebx
    12a1:	88 5d c6             	mov    %bl,-0x3a(%ebp)
      name[2] = '\0';
    12a4:	bb 70 00 00 00       	mov    $0x70,%ebx
      name[1] = '0' + i;
    12a9:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    12ad:	83 ec 08             	sub    $0x8,%esp
      name[0] = 'p' + pi;
    12b0:	88 5d c8             	mov    %bl,-0x38(%ebp)
      fd = open(name, 0);
    12b3:	6a 00                	push   $0x0
    12b5:	57                   	push   %edi
      name[1] = '0' + i;
    12b6:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    12b9:	e8 44 26 00 00       	call   3902 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    12be:	83 c4 10             	add    $0x10,%esp
    12c1:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    12c5:	0f 84 85 00 00 00    	je     1350 <createdelete+0x120>
    12cb:	85 c0                	test   %eax,%eax
    12cd:	0f 88 1a 01 00 00    	js     13ed <createdelete+0x1bd>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    12d3:	83 fe 08             	cmp    $0x8,%esi
    12d6:	0f 86 54 01 00 00    	jbe    1430 <createdelete+0x200>
        close(fd);
    12dc:	83 ec 0c             	sub    $0xc,%esp
    12df:	50                   	push   %eax
    12e0:	e8 05 26 00 00       	call   38ea <close>
    12e5:	83 c4 10             	add    $0x10,%esp
    12e8:	83 c3 01             	add    $0x1,%ebx
    for(pi = 0; pi < 4; pi++){
    12eb:	80 fb 74             	cmp    $0x74,%bl
    12ee:	75 b9                	jne    12a9 <createdelete+0x79>
    12f0:	8b 75 c0             	mov    -0x40(%ebp),%esi
  for(i = 0; i < N; i++){
    12f3:	83 fe 13             	cmp    $0x13,%esi
    12f6:	75 90                	jne    1288 <createdelete+0x58>
    12f8:	be 70 00 00 00       	mov    $0x70,%esi
    12fd:	8d 76 00             	lea    0x0(%esi),%esi
    1300:	8d 46 c0             	lea    -0x40(%esi),%eax
  name[0] = name[1] = name[2] = 0;
    1303:	bb 04 00 00 00       	mov    $0x4,%ebx
    1308:	88 45 c7             	mov    %al,-0x39(%ebp)
      name[0] = 'p' + i;
    130b:	89 f0                	mov    %esi,%eax
      unlink(name);
    130d:	83 ec 0c             	sub    $0xc,%esp
      name[0] = 'p' + i;
    1310:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    1313:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    1317:	57                   	push   %edi
      name[1] = '0' + i;
    1318:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    131b:	e8 f2 25 00 00       	call   3912 <unlink>
    for(pi = 0; pi < 4; pi++){
    1320:	83 c4 10             	add    $0x10,%esp
    1323:	83 eb 01             	sub    $0x1,%ebx
    1326:	75 e3                	jne    130b <createdelete+0xdb>
    1328:	83 c6 01             	add    $0x1,%esi
  for(i = 0; i < N; i++){
    132b:	89 f0                	mov    %esi,%eax
    132d:	3c 84                	cmp    $0x84,%al
    132f:	75 cf                	jne    1300 <createdelete+0xd0>
  printf(1, "createdelete ok\n");
    1331:	83 ec 08             	sub    $0x8,%esp
    1334:	68 43 42 00 00       	push   $0x4243
    1339:	6a 01                	push   $0x1
    133b:	e8 e0 26 00 00       	call   3a20 <printf>
}
    1340:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1343:	5b                   	pop    %ebx
    1344:	5e                   	pop    %esi
    1345:	5f                   	pop    %edi
    1346:	5d                   	pop    %ebp
    1347:	c3                   	ret    
    1348:	90                   	nop
    1349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1350:	83 fe 08             	cmp    $0x8,%esi
    1353:	0f 86 cf 00 00 00    	jbe    1428 <createdelete+0x1f8>
      if(fd >= 0)
    1359:	85 c0                	test   %eax,%eax
    135b:	78 8b                	js     12e8 <createdelete+0xb8>
    135d:	e9 7a ff ff ff       	jmp    12dc <createdelete+0xac>
    1362:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      name[0] = 'p' + pi;
    1368:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    136b:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    136f:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[0] = 'p' + pi;
    1372:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[2] = '\0';
    1375:	31 db                	xor    %ebx,%ebx
    1377:	eb 0f                	jmp    1388 <createdelete+0x158>
    1379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    1380:	83 fb 13             	cmp    $0x13,%ebx
    1383:	74 63                	je     13e8 <createdelete+0x1b8>
    1385:	83 c3 01             	add    $0x1,%ebx
        fd = open(name, O_CREATE | O_RDWR);
    1388:	83 ec 08             	sub    $0x8,%esp
        name[1] = '0' + i;
    138b:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    138e:	68 02 02 00 00       	push   $0x202
    1393:	57                   	push   %edi
        name[1] = '0' + i;
    1394:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    1397:	e8 66 25 00 00       	call   3902 <open>
        if(fd < 0){
    139c:	83 c4 10             	add    $0x10,%esp
    139f:	85 c0                	test   %eax,%eax
    13a1:	78 5f                	js     1402 <createdelete+0x1d2>
        close(fd);
    13a3:	83 ec 0c             	sub    $0xc,%esp
    13a6:	50                   	push   %eax
    13a7:	e8 3e 25 00 00       	call   38ea <close>
        if(i > 0 && (i % 2 ) == 0){
    13ac:	83 c4 10             	add    $0x10,%esp
    13af:	85 db                	test   %ebx,%ebx
    13b1:	74 d2                	je     1385 <createdelete+0x155>
    13b3:	f6 c3 01             	test   $0x1,%bl
    13b6:	75 c8                	jne    1380 <createdelete+0x150>
          if(unlink(name) < 0){
    13b8:	83 ec 0c             	sub    $0xc,%esp
          name[1] = '0' + (i / 2);
    13bb:	89 d8                	mov    %ebx,%eax
    13bd:	d1 f8                	sar    %eax
          if(unlink(name) < 0){
    13bf:	57                   	push   %edi
          name[1] = '0' + (i / 2);
    13c0:	83 c0 30             	add    $0x30,%eax
    13c3:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    13c6:	e8 47 25 00 00       	call   3912 <unlink>
    13cb:	83 c4 10             	add    $0x10,%esp
    13ce:	85 c0                	test   %eax,%eax
    13d0:	79 ae                	jns    1380 <createdelete+0x150>
            printf(1, "unlink failed\n");
    13d2:	52                   	push   %edx
    13d3:	52                   	push   %edx
    13d4:	68 31 3e 00 00       	push   $0x3e31
    13d9:	6a 01                	push   $0x1
    13db:	e8 40 26 00 00       	call   3a20 <printf>
            exit();
    13e0:	e8 dd 24 00 00       	call   38c2 <exit>
    13e5:	8d 76 00             	lea    0x0(%esi),%esi
      exit();
    13e8:	e8 d5 24 00 00       	call   38c2 <exit>
        printf(1, "oops createdelete %s didn't exist\n", name);
    13ed:	83 ec 04             	sub    $0x4,%esp
    13f0:	57                   	push   %edi
    13f1:	68 f0 4e 00 00       	push   $0x4ef0
    13f6:	6a 01                	push   $0x1
    13f8:	e8 23 26 00 00       	call   3a20 <printf>
        exit();
    13fd:	e8 c0 24 00 00       	call   38c2 <exit>
          printf(1, "create failed\n");
    1402:	51                   	push   %ecx
    1403:	51                   	push   %ecx
    1404:	68 7f 44 00 00       	push   $0x447f
    1409:	6a 01                	push   $0x1
    140b:	e8 10 26 00 00       	call   3a20 <printf>
          exit();
    1410:	e8 ad 24 00 00       	call   38c2 <exit>
      printf(1, "fork failed\n");
    1415:	53                   	push   %ebx
    1416:	53                   	push   %ebx
    1417:	68 b9 4c 00 00       	push   $0x4cb9
    141c:	6a 01                	push   $0x1
    141e:	e8 fd 25 00 00       	call   3a20 <printf>
      exit();
    1423:	e8 9a 24 00 00       	call   38c2 <exit>
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1428:	85 c0                	test   %eax,%eax
    142a:	0f 88 b8 fe ff ff    	js     12e8 <createdelete+0xb8>
        printf(1, "oops createdelete %s did exist\n", name);
    1430:	50                   	push   %eax
    1431:	57                   	push   %edi
    1432:	68 14 4f 00 00       	push   $0x4f14
    1437:	6a 01                	push   $0x1
    1439:	e8 e2 25 00 00       	call   3a20 <printf>
        exit();
    143e:	e8 7f 24 00 00       	call   38c2 <exit>
    1443:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001450 <unlinkread>:
{
    1450:	55                   	push   %ebp
    1451:	89 e5                	mov    %esp,%ebp
    1453:	56                   	push   %esi
    1454:	53                   	push   %ebx
  printf(1, "unlinkread test\n");
    1455:	83 ec 08             	sub    $0x8,%esp
    1458:	68 54 42 00 00       	push   $0x4254
    145d:	6a 01                	push   $0x1
    145f:	e8 bc 25 00 00       	call   3a20 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1464:	5b                   	pop    %ebx
    1465:	5e                   	pop    %esi
    1466:	68 02 02 00 00       	push   $0x202
    146b:	68 65 42 00 00       	push   $0x4265
    1470:	e8 8d 24 00 00       	call   3902 <open>
  if(fd < 0){
    1475:	83 c4 10             	add    $0x10,%esp
    1478:	85 c0                	test   %eax,%eax
    147a:	0f 88 e6 00 00 00    	js     1566 <unlinkread+0x116>
  write(fd, "hello", 5);
    1480:	83 ec 04             	sub    $0x4,%esp
    1483:	89 c3                	mov    %eax,%ebx
    1485:	6a 05                	push   $0x5
    1487:	68 8a 42 00 00       	push   $0x428a
    148c:	50                   	push   %eax
    148d:	e8 50 24 00 00       	call   38e2 <write>
  close(fd);
    1492:	89 1c 24             	mov    %ebx,(%esp)
    1495:	e8 50 24 00 00       	call   38ea <close>
  fd = open("unlinkread", O_RDWR);
    149a:	58                   	pop    %eax
    149b:	5a                   	pop    %edx
    149c:	6a 02                	push   $0x2
    149e:	68 65 42 00 00       	push   $0x4265
    14a3:	e8 5a 24 00 00       	call   3902 <open>
  if(fd < 0){
    14a8:	83 c4 10             	add    $0x10,%esp
    14ab:	85 c0                	test   %eax,%eax
  fd = open("unlinkread", O_RDWR);
    14ad:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    14af:	0f 88 10 01 00 00    	js     15c5 <unlinkread+0x175>
  if(unlink("unlinkread") != 0){
    14b5:	83 ec 0c             	sub    $0xc,%esp
    14b8:	68 65 42 00 00       	push   $0x4265
    14bd:	e8 50 24 00 00       	call   3912 <unlink>
    14c2:	83 c4 10             	add    $0x10,%esp
    14c5:	85 c0                	test   %eax,%eax
    14c7:	0f 85 e5 00 00 00    	jne    15b2 <unlinkread+0x162>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    14cd:	83 ec 08             	sub    $0x8,%esp
    14d0:	68 02 02 00 00       	push   $0x202
    14d5:	68 65 42 00 00       	push   $0x4265
    14da:	e8 23 24 00 00       	call   3902 <open>
  write(fd1, "yyy", 3);
    14df:	83 c4 0c             	add    $0xc,%esp
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    14e2:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    14e4:	6a 03                	push   $0x3
    14e6:	68 c2 42 00 00       	push   $0x42c2
    14eb:	50                   	push   %eax
    14ec:	e8 f1 23 00 00       	call   38e2 <write>
  close(fd1);
    14f1:	89 34 24             	mov    %esi,(%esp)
    14f4:	e8 f1 23 00 00       	call   38ea <close>
  if(read(fd, buf, sizeof(buf)) != 5){
    14f9:	83 c4 0c             	add    $0xc,%esp
    14fc:	68 00 20 00 00       	push   $0x2000
    1501:	68 00 86 00 00       	push   $0x8600
    1506:	53                   	push   %ebx
    1507:	e8 ce 23 00 00       	call   38da <read>
    150c:	83 c4 10             	add    $0x10,%esp
    150f:	83 f8 05             	cmp    $0x5,%eax
    1512:	0f 85 87 00 00 00    	jne    159f <unlinkread+0x14f>
  if(buf[0] != 'h'){
    1518:	80 3d 00 86 00 00 68 	cmpb   $0x68,0x8600
    151f:	75 6b                	jne    158c <unlinkread+0x13c>
  if(write(fd, buf, 10) != 10){
    1521:	83 ec 04             	sub    $0x4,%esp
    1524:	6a 0a                	push   $0xa
    1526:	68 00 86 00 00       	push   $0x8600
    152b:	53                   	push   %ebx
    152c:	e8 b1 23 00 00       	call   38e2 <write>
    1531:	83 c4 10             	add    $0x10,%esp
    1534:	83 f8 0a             	cmp    $0xa,%eax
    1537:	75 40                	jne    1579 <unlinkread+0x129>
  close(fd);
    1539:	83 ec 0c             	sub    $0xc,%esp
    153c:	53                   	push   %ebx
    153d:	e8 a8 23 00 00       	call   38ea <close>
  unlink("unlinkread");
    1542:	c7 04 24 65 42 00 00 	movl   $0x4265,(%esp)
    1549:	e8 c4 23 00 00       	call   3912 <unlink>
  printf(1, "unlinkread ok\n");
    154e:	58                   	pop    %eax
    154f:	5a                   	pop    %edx
    1550:	68 0d 43 00 00       	push   $0x430d
    1555:	6a 01                	push   $0x1
    1557:	e8 c4 24 00 00       	call   3a20 <printf>
}
    155c:	83 c4 10             	add    $0x10,%esp
    155f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1562:	5b                   	pop    %ebx
    1563:	5e                   	pop    %esi
    1564:	5d                   	pop    %ebp
    1565:	c3                   	ret    
    printf(1, "create unlinkread failed\n");
    1566:	51                   	push   %ecx
    1567:	51                   	push   %ecx
    1568:	68 70 42 00 00       	push   $0x4270
    156d:	6a 01                	push   $0x1
    156f:	e8 ac 24 00 00       	call   3a20 <printf>
    exit();
    1574:	e8 49 23 00 00       	call   38c2 <exit>
    printf(1, "unlinkread write failed\n");
    1579:	51                   	push   %ecx
    157a:	51                   	push   %ecx
    157b:	68 f4 42 00 00       	push   $0x42f4
    1580:	6a 01                	push   $0x1
    1582:	e8 99 24 00 00       	call   3a20 <printf>
    exit();
    1587:	e8 36 23 00 00       	call   38c2 <exit>
    printf(1, "unlinkread wrong data\n");
    158c:	53                   	push   %ebx
    158d:	53                   	push   %ebx
    158e:	68 dd 42 00 00       	push   $0x42dd
    1593:	6a 01                	push   $0x1
    1595:	e8 86 24 00 00       	call   3a20 <printf>
    exit();
    159a:	e8 23 23 00 00       	call   38c2 <exit>
    printf(1, "unlinkread read failed");
    159f:	56                   	push   %esi
    15a0:	56                   	push   %esi
    15a1:	68 c6 42 00 00       	push   $0x42c6
    15a6:	6a 01                	push   $0x1
    15a8:	e8 73 24 00 00       	call   3a20 <printf>
    exit();
    15ad:	e8 10 23 00 00       	call   38c2 <exit>
    printf(1, "unlink unlinkread failed\n");
    15b2:	50                   	push   %eax
    15b3:	50                   	push   %eax
    15b4:	68 a8 42 00 00       	push   $0x42a8
    15b9:	6a 01                	push   $0x1
    15bb:	e8 60 24 00 00       	call   3a20 <printf>
    exit();
    15c0:	e8 fd 22 00 00       	call   38c2 <exit>
    printf(1, "open unlinkread failed\n");
    15c5:	50                   	push   %eax
    15c6:	50                   	push   %eax
    15c7:	68 90 42 00 00       	push   $0x4290
    15cc:	6a 01                	push   $0x1
    15ce:	e8 4d 24 00 00       	call   3a20 <printf>
    exit();
    15d3:	e8 ea 22 00 00       	call   38c2 <exit>
    15d8:	90                   	nop
    15d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000015e0 <linktest>:
{
    15e0:	55                   	push   %ebp
    15e1:	89 e5                	mov    %esp,%ebp
    15e3:	53                   	push   %ebx
    15e4:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "linktest\n");
    15e7:	68 1c 43 00 00       	push   $0x431c
    15ec:	6a 01                	push   $0x1
    15ee:	e8 2d 24 00 00       	call   3a20 <printf>
  unlink("lf1");
    15f3:	c7 04 24 26 43 00 00 	movl   $0x4326,(%esp)
    15fa:	e8 13 23 00 00       	call   3912 <unlink>
  unlink("lf2");
    15ff:	c7 04 24 2a 43 00 00 	movl   $0x432a,(%esp)
    1606:	e8 07 23 00 00       	call   3912 <unlink>
  fd = open("lf1", O_CREATE|O_RDWR);
    160b:	58                   	pop    %eax
    160c:	5a                   	pop    %edx
    160d:	68 02 02 00 00       	push   $0x202
    1612:	68 26 43 00 00       	push   $0x4326
    1617:	e8 e6 22 00 00       	call   3902 <open>
  if(fd < 0){
    161c:	83 c4 10             	add    $0x10,%esp
    161f:	85 c0                	test   %eax,%eax
    1621:	0f 88 1e 01 00 00    	js     1745 <linktest+0x165>
  if(write(fd, "hello", 5) != 5){
    1627:	83 ec 04             	sub    $0x4,%esp
    162a:	89 c3                	mov    %eax,%ebx
    162c:	6a 05                	push   $0x5
    162e:	68 8a 42 00 00       	push   $0x428a
    1633:	50                   	push   %eax
    1634:	e8 a9 22 00 00       	call   38e2 <write>
    1639:	83 c4 10             	add    $0x10,%esp
    163c:	83 f8 05             	cmp    $0x5,%eax
    163f:	0f 85 98 01 00 00    	jne    17dd <linktest+0x1fd>
  close(fd);
    1645:	83 ec 0c             	sub    $0xc,%esp
    1648:	53                   	push   %ebx
    1649:	e8 9c 22 00 00       	call   38ea <close>
  if(link("lf1", "lf2") < 0){
    164e:	5b                   	pop    %ebx
    164f:	58                   	pop    %eax
    1650:	68 2a 43 00 00       	push   $0x432a
    1655:	68 26 43 00 00       	push   $0x4326
    165a:	e8 c3 22 00 00       	call   3922 <link>
    165f:	83 c4 10             	add    $0x10,%esp
    1662:	85 c0                	test   %eax,%eax
    1664:	0f 88 60 01 00 00    	js     17ca <linktest+0x1ea>
  unlink("lf1");
    166a:	83 ec 0c             	sub    $0xc,%esp
    166d:	68 26 43 00 00       	push   $0x4326
    1672:	e8 9b 22 00 00       	call   3912 <unlink>
  if(open("lf1", 0) >= 0){
    1677:	58                   	pop    %eax
    1678:	5a                   	pop    %edx
    1679:	6a 00                	push   $0x0
    167b:	68 26 43 00 00       	push   $0x4326
    1680:	e8 7d 22 00 00       	call   3902 <open>
    1685:	83 c4 10             	add    $0x10,%esp
    1688:	85 c0                	test   %eax,%eax
    168a:	0f 89 27 01 00 00    	jns    17b7 <linktest+0x1d7>
  fd = open("lf2", 0);
    1690:	83 ec 08             	sub    $0x8,%esp
    1693:	6a 00                	push   $0x0
    1695:	68 2a 43 00 00       	push   $0x432a
    169a:	e8 63 22 00 00       	call   3902 <open>
  if(fd < 0){
    169f:	83 c4 10             	add    $0x10,%esp
    16a2:	85 c0                	test   %eax,%eax
  fd = open("lf2", 0);
    16a4:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    16a6:	0f 88 f8 00 00 00    	js     17a4 <linktest+0x1c4>
  if(read(fd, buf, sizeof(buf)) != 5){
    16ac:	83 ec 04             	sub    $0x4,%esp
    16af:	68 00 20 00 00       	push   $0x2000
    16b4:	68 00 86 00 00       	push   $0x8600
    16b9:	50                   	push   %eax
    16ba:	e8 1b 22 00 00       	call   38da <read>
    16bf:	83 c4 10             	add    $0x10,%esp
    16c2:	83 f8 05             	cmp    $0x5,%eax
    16c5:	0f 85 c6 00 00 00    	jne    1791 <linktest+0x1b1>
  close(fd);
    16cb:	83 ec 0c             	sub    $0xc,%esp
    16ce:	53                   	push   %ebx
    16cf:	e8 16 22 00 00       	call   38ea <close>
  if(link("lf2", "lf2") >= 0){
    16d4:	58                   	pop    %eax
    16d5:	5a                   	pop    %edx
    16d6:	68 2a 43 00 00       	push   $0x432a
    16db:	68 2a 43 00 00       	push   $0x432a
    16e0:	e8 3d 22 00 00       	call   3922 <link>
    16e5:	83 c4 10             	add    $0x10,%esp
    16e8:	85 c0                	test   %eax,%eax
    16ea:	0f 89 8e 00 00 00    	jns    177e <linktest+0x19e>
  unlink("lf2");
    16f0:	83 ec 0c             	sub    $0xc,%esp
    16f3:	68 2a 43 00 00       	push   $0x432a
    16f8:	e8 15 22 00 00       	call   3912 <unlink>
  if(link("lf2", "lf1") >= 0){
    16fd:	59                   	pop    %ecx
    16fe:	5b                   	pop    %ebx
    16ff:	68 26 43 00 00       	push   $0x4326
    1704:	68 2a 43 00 00       	push   $0x432a
    1709:	e8 14 22 00 00       	call   3922 <link>
    170e:	83 c4 10             	add    $0x10,%esp
    1711:	85 c0                	test   %eax,%eax
    1713:	79 56                	jns    176b <linktest+0x18b>
  if(link(".", "lf1") >= 0){
    1715:	83 ec 08             	sub    $0x8,%esp
    1718:	68 26 43 00 00       	push   $0x4326
    171d:	68 ee 45 00 00       	push   $0x45ee
    1722:	e8 fb 21 00 00       	call   3922 <link>
    1727:	83 c4 10             	add    $0x10,%esp
    172a:	85 c0                	test   %eax,%eax
    172c:	79 2a                	jns    1758 <linktest+0x178>
  printf(1, "linktest ok\n");
    172e:	83 ec 08             	sub    $0x8,%esp
    1731:	68 c4 43 00 00       	push   $0x43c4
    1736:	6a 01                	push   $0x1
    1738:	e8 e3 22 00 00       	call   3a20 <printf>
}
    173d:	83 c4 10             	add    $0x10,%esp
    1740:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1743:	c9                   	leave  
    1744:	c3                   	ret    
    printf(1, "create lf1 failed\n");
    1745:	50                   	push   %eax
    1746:	50                   	push   %eax
    1747:	68 2e 43 00 00       	push   $0x432e
    174c:	6a 01                	push   $0x1
    174e:	e8 cd 22 00 00       	call   3a20 <printf>
    exit();
    1753:	e8 6a 21 00 00       	call   38c2 <exit>
    printf(1, "link . lf1 succeeded! oops\n");
    1758:	50                   	push   %eax
    1759:	50                   	push   %eax
    175a:	68 a8 43 00 00       	push   $0x43a8
    175f:	6a 01                	push   $0x1
    1761:	e8 ba 22 00 00       	call   3a20 <printf>
    exit();
    1766:	e8 57 21 00 00       	call   38c2 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    176b:	52                   	push   %edx
    176c:	52                   	push   %edx
    176d:	68 5c 4f 00 00       	push   $0x4f5c
    1772:	6a 01                	push   $0x1
    1774:	e8 a7 22 00 00       	call   3a20 <printf>
    exit();
    1779:	e8 44 21 00 00       	call   38c2 <exit>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    177e:	50                   	push   %eax
    177f:	50                   	push   %eax
    1780:	68 8a 43 00 00       	push   $0x438a
    1785:	6a 01                	push   $0x1
    1787:	e8 94 22 00 00       	call   3a20 <printf>
    exit();
    178c:	e8 31 21 00 00       	call   38c2 <exit>
    printf(1, "read lf2 failed\n");
    1791:	51                   	push   %ecx
    1792:	51                   	push   %ecx
    1793:	68 79 43 00 00       	push   $0x4379
    1798:	6a 01                	push   $0x1
    179a:	e8 81 22 00 00       	call   3a20 <printf>
    exit();
    179f:	e8 1e 21 00 00       	call   38c2 <exit>
    printf(1, "open lf2 failed\n");
    17a4:	53                   	push   %ebx
    17a5:	53                   	push   %ebx
    17a6:	68 68 43 00 00       	push   $0x4368
    17ab:	6a 01                	push   $0x1
    17ad:	e8 6e 22 00 00       	call   3a20 <printf>
    exit();
    17b2:	e8 0b 21 00 00       	call   38c2 <exit>
    printf(1, "unlinked lf1 but it is still there!\n");
    17b7:	50                   	push   %eax
    17b8:	50                   	push   %eax
    17b9:	68 34 4f 00 00       	push   $0x4f34
    17be:	6a 01                	push   $0x1
    17c0:	e8 5b 22 00 00       	call   3a20 <printf>
    exit();
    17c5:	e8 f8 20 00 00       	call   38c2 <exit>
    printf(1, "link lf1 lf2 failed\n");
    17ca:	51                   	push   %ecx
    17cb:	51                   	push   %ecx
    17cc:	68 53 43 00 00       	push   $0x4353
    17d1:	6a 01                	push   $0x1
    17d3:	e8 48 22 00 00       	call   3a20 <printf>
    exit();
    17d8:	e8 e5 20 00 00       	call   38c2 <exit>
    printf(1, "write lf1 failed\n");
    17dd:	50                   	push   %eax
    17de:	50                   	push   %eax
    17df:	68 41 43 00 00       	push   $0x4341
    17e4:	6a 01                	push   $0x1
    17e6:	e8 35 22 00 00       	call   3a20 <printf>
    exit();
    17eb:	e8 d2 20 00 00       	call   38c2 <exit>

000017f0 <concreate>:
{
    17f0:	55                   	push   %ebp
    17f1:	89 e5                	mov    %esp,%ebp
    17f3:	57                   	push   %edi
    17f4:	56                   	push   %esi
    17f5:	53                   	push   %ebx
  for(i = 0; i < 40; i++){
    17f6:	31 f6                	xor    %esi,%esi
    17f8:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    if(pid && (i % 3) == 1){
    17fb:	bf ab aa aa aa       	mov    $0xaaaaaaab,%edi
{
    1800:	83 ec 64             	sub    $0x64,%esp
  printf(1, "concreate test\n");
    1803:	68 d1 43 00 00       	push   $0x43d1
    1808:	6a 01                	push   $0x1
    180a:	e8 11 22 00 00       	call   3a20 <printf>
  file[0] = 'C';
    180f:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    1813:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    1817:	83 c4 10             	add    $0x10,%esp
    181a:	eb 4c                	jmp    1868 <concreate+0x78>
    181c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid && (i % 3) == 1){
    1820:	89 f0                	mov    %esi,%eax
    1822:	89 f1                	mov    %esi,%ecx
    1824:	f7 e7                	mul    %edi
    1826:	d1 ea                	shr    %edx
    1828:	8d 04 52             	lea    (%edx,%edx,2),%eax
    182b:	29 c1                	sub    %eax,%ecx
    182d:	83 f9 01             	cmp    $0x1,%ecx
    1830:	0f 84 ba 00 00 00    	je     18f0 <concreate+0x100>
      fd = open(file, O_CREATE | O_RDWR);
    1836:	83 ec 08             	sub    $0x8,%esp
    1839:	68 02 02 00 00       	push   $0x202
    183e:	53                   	push   %ebx
    183f:	e8 be 20 00 00       	call   3902 <open>
      if(fd < 0){
    1844:	83 c4 10             	add    $0x10,%esp
    1847:	85 c0                	test   %eax,%eax
    1849:	78 67                	js     18b2 <concreate+0xc2>
      close(fd);
    184b:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 40; i++){
    184e:	83 c6 01             	add    $0x1,%esi
      close(fd);
    1851:	50                   	push   %eax
    1852:	e8 93 20 00 00       	call   38ea <close>
    1857:	83 c4 10             	add    $0x10,%esp
      wait();
    185a:	e8 6b 20 00 00       	call   38ca <wait>
  for(i = 0; i < 40; i++){
    185f:	83 fe 28             	cmp    $0x28,%esi
    1862:	0f 84 aa 00 00 00    	je     1912 <concreate+0x122>
    unlink(file);
    1868:	83 ec 0c             	sub    $0xc,%esp
    file[1] = '0' + i;
    186b:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    186e:	53                   	push   %ebx
    file[1] = '0' + i;
    186f:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    1872:	e8 9b 20 00 00       	call   3912 <unlink>
    pid = fork();
    1877:	e8 3e 20 00 00       	call   38ba <fork>
    if(pid && (i % 3) == 1){
    187c:	83 c4 10             	add    $0x10,%esp
    187f:	85 c0                	test   %eax,%eax
    1881:	75 9d                	jne    1820 <concreate+0x30>
    } else if(pid == 0 && (i % 5) == 1){
    1883:	89 f0                	mov    %esi,%eax
    1885:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
    188a:	f7 e2                	mul    %edx
    188c:	c1 ea 02             	shr    $0x2,%edx
    188f:	8d 04 92             	lea    (%edx,%edx,4),%eax
    1892:	29 c6                	sub    %eax,%esi
    1894:	83 fe 01             	cmp    $0x1,%esi
    1897:	74 37                	je     18d0 <concreate+0xe0>
      fd = open(file, O_CREATE | O_RDWR);
    1899:	83 ec 08             	sub    $0x8,%esp
    189c:	68 02 02 00 00       	push   $0x202
    18a1:	53                   	push   %ebx
    18a2:	e8 5b 20 00 00       	call   3902 <open>
      if(fd < 0){
    18a7:	83 c4 10             	add    $0x10,%esp
    18aa:	85 c0                	test   %eax,%eax
    18ac:	0f 89 28 02 00 00    	jns    1ada <concreate+0x2ea>
        printf(1, "concreate create %s failed\n", file);
    18b2:	83 ec 04             	sub    $0x4,%esp
    18b5:	53                   	push   %ebx
    18b6:	68 e4 43 00 00       	push   $0x43e4
    18bb:	6a 01                	push   $0x1
    18bd:	e8 5e 21 00 00       	call   3a20 <printf>
        exit();
    18c2:	e8 fb 1f 00 00       	call   38c2 <exit>
    18c7:	89 f6                	mov    %esi,%esi
    18c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      link("C0", file);
    18d0:	83 ec 08             	sub    $0x8,%esp
    18d3:	53                   	push   %ebx
    18d4:	68 e1 43 00 00       	push   $0x43e1
    18d9:	e8 44 20 00 00       	call   3922 <link>
    18de:	83 c4 10             	add    $0x10,%esp
      exit();
    18e1:	e8 dc 1f 00 00       	call   38c2 <exit>
    18e6:	8d 76 00             	lea    0x0(%esi),%esi
    18e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      link("C0", file);
    18f0:	83 ec 08             	sub    $0x8,%esp
  for(i = 0; i < 40; i++){
    18f3:	83 c6 01             	add    $0x1,%esi
      link("C0", file);
    18f6:	53                   	push   %ebx
    18f7:	68 e1 43 00 00       	push   $0x43e1
    18fc:	e8 21 20 00 00       	call   3922 <link>
    1901:	83 c4 10             	add    $0x10,%esp
      wait();
    1904:	e8 c1 1f 00 00       	call   38ca <wait>
  for(i = 0; i < 40; i++){
    1909:	83 fe 28             	cmp    $0x28,%esi
    190c:	0f 85 56 ff ff ff    	jne    1868 <concreate+0x78>
  memset(fa, 0, sizeof(fa));
    1912:	8d 45 c0             	lea    -0x40(%ebp),%eax
    1915:	83 ec 04             	sub    $0x4,%esp
    1918:	6a 28                	push   $0x28
    191a:	6a 00                	push   $0x0
    191c:	50                   	push   %eax
    191d:	e8 fe 1d 00 00       	call   3720 <memset>
  fd = open(".", 0);
    1922:	5f                   	pop    %edi
    1923:	58                   	pop    %eax
    1924:	6a 00                	push   $0x0
    1926:	68 ee 45 00 00       	push   $0x45ee
    192b:	8d 7d b0             	lea    -0x50(%ebp),%edi
    192e:	e8 cf 1f 00 00       	call   3902 <open>
  while(read(fd, &de, sizeof(de)) > 0){
    1933:	83 c4 10             	add    $0x10,%esp
  fd = open(".", 0);
    1936:	89 c6                	mov    %eax,%esi
  n = 0;
    1938:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    193f:	90                   	nop
  while(read(fd, &de, sizeof(de)) > 0){
    1940:	83 ec 04             	sub    $0x4,%esp
    1943:	6a 10                	push   $0x10
    1945:	57                   	push   %edi
    1946:	56                   	push   %esi
    1947:	e8 8e 1f 00 00       	call   38da <read>
    194c:	83 c4 10             	add    $0x10,%esp
    194f:	85 c0                	test   %eax,%eax
    1951:	7e 3d                	jle    1990 <concreate+0x1a0>
    if(de.inum == 0)
    1953:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1958:	74 e6                	je     1940 <concreate+0x150>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    195a:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    195e:	75 e0                	jne    1940 <concreate+0x150>
    1960:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    1964:	75 da                	jne    1940 <concreate+0x150>
      i = de.name[1] - '0';
    1966:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    196a:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    196d:	83 f8 27             	cmp    $0x27,%eax
    1970:	0f 87 4e 01 00 00    	ja     1ac4 <concreate+0x2d4>
      if(fa[i]){
    1976:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    197b:	0f 85 2d 01 00 00    	jne    1aae <concreate+0x2be>
      fa[i] = 1;
    1981:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    1986:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    198a:	eb b4                	jmp    1940 <concreate+0x150>
    198c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  close(fd);
    1990:	83 ec 0c             	sub    $0xc,%esp
    1993:	56                   	push   %esi
    1994:	e8 51 1f 00 00       	call   38ea <close>
  if(n != 40){
    1999:	83 c4 10             	add    $0x10,%esp
    199c:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    19a0:	0f 85 f5 00 00 00    	jne    1a9b <concreate+0x2ab>
  for(i = 0; i < 40; i++){
    19a6:	31 f6                	xor    %esi,%esi
    19a8:	eb 48                	jmp    19f2 <concreate+0x202>
    19aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
       ((i % 3) == 1 && pid != 0)){
    19b0:	85 ff                	test   %edi,%edi
    19b2:	74 05                	je     19b9 <concreate+0x1c9>
    19b4:	83 fa 01             	cmp    $0x1,%edx
    19b7:	74 64                	je     1a1d <concreate+0x22d>
      unlink(file);
    19b9:	83 ec 0c             	sub    $0xc,%esp
    19bc:	53                   	push   %ebx
    19bd:	e8 50 1f 00 00       	call   3912 <unlink>
      unlink(file);
    19c2:	89 1c 24             	mov    %ebx,(%esp)
    19c5:	e8 48 1f 00 00       	call   3912 <unlink>
      unlink(file);
    19ca:	89 1c 24             	mov    %ebx,(%esp)
    19cd:	e8 40 1f 00 00       	call   3912 <unlink>
      unlink(file);
    19d2:	89 1c 24             	mov    %ebx,(%esp)
    19d5:	e8 38 1f 00 00       	call   3912 <unlink>
    19da:	83 c4 10             	add    $0x10,%esp
    if(pid == 0)
    19dd:	85 ff                	test   %edi,%edi
    19df:	0f 84 fc fe ff ff    	je     18e1 <concreate+0xf1>
  for(i = 0; i < 40; i++){
    19e5:	83 c6 01             	add    $0x1,%esi
      wait();
    19e8:	e8 dd 1e 00 00       	call   38ca <wait>
  for(i = 0; i < 40; i++){
    19ed:	83 fe 28             	cmp    $0x28,%esi
    19f0:	74 7e                	je     1a70 <concreate+0x280>
    file[1] = '0' + i;
    19f2:	8d 46 30             	lea    0x30(%esi),%eax
    19f5:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    19f8:	e8 bd 1e 00 00       	call   38ba <fork>
    if(pid < 0){
    19fd:	85 c0                	test   %eax,%eax
    pid = fork();
    19ff:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    1a01:	0f 88 80 00 00 00    	js     1a87 <concreate+0x297>
    if(((i % 3) == 0 && pid == 0) ||
    1a07:	b8 ab aa aa aa       	mov    $0xaaaaaaab,%eax
    1a0c:	f7 e6                	mul    %esi
    1a0e:	d1 ea                	shr    %edx
    1a10:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1a13:	89 f2                	mov    %esi,%edx
    1a15:	29 c2                	sub    %eax,%edx
    1a17:	89 d0                	mov    %edx,%eax
    1a19:	09 f8                	or     %edi,%eax
    1a1b:	75 93                	jne    19b0 <concreate+0x1c0>
      close(open(file, 0));
    1a1d:	83 ec 08             	sub    $0x8,%esp
    1a20:	6a 00                	push   $0x0
    1a22:	53                   	push   %ebx
    1a23:	e8 da 1e 00 00       	call   3902 <open>
    1a28:	89 04 24             	mov    %eax,(%esp)
    1a2b:	e8 ba 1e 00 00       	call   38ea <close>
      close(open(file, 0));
    1a30:	58                   	pop    %eax
    1a31:	5a                   	pop    %edx
    1a32:	6a 00                	push   $0x0
    1a34:	53                   	push   %ebx
    1a35:	e8 c8 1e 00 00       	call   3902 <open>
    1a3a:	89 04 24             	mov    %eax,(%esp)
    1a3d:	e8 a8 1e 00 00       	call   38ea <close>
      close(open(file, 0));
    1a42:	59                   	pop    %ecx
    1a43:	58                   	pop    %eax
    1a44:	6a 00                	push   $0x0
    1a46:	53                   	push   %ebx
    1a47:	e8 b6 1e 00 00       	call   3902 <open>
    1a4c:	89 04 24             	mov    %eax,(%esp)
    1a4f:	e8 96 1e 00 00       	call   38ea <close>
      close(open(file, 0));
    1a54:	58                   	pop    %eax
    1a55:	5a                   	pop    %edx
    1a56:	6a 00                	push   $0x0
    1a58:	53                   	push   %ebx
    1a59:	e8 a4 1e 00 00       	call   3902 <open>
    1a5e:	89 04 24             	mov    %eax,(%esp)
    1a61:	e8 84 1e 00 00       	call   38ea <close>
    1a66:	83 c4 10             	add    $0x10,%esp
    1a69:	e9 6f ff ff ff       	jmp    19dd <concreate+0x1ed>
    1a6e:	66 90                	xchg   %ax,%ax
  printf(1, "concreate ok\n");
    1a70:	83 ec 08             	sub    $0x8,%esp
    1a73:	68 36 44 00 00       	push   $0x4436
    1a78:	6a 01                	push   $0x1
    1a7a:	e8 a1 1f 00 00       	call   3a20 <printf>
}
    1a7f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1a82:	5b                   	pop    %ebx
    1a83:	5e                   	pop    %esi
    1a84:	5f                   	pop    %edi
    1a85:	5d                   	pop    %ebp
    1a86:	c3                   	ret    
      printf(1, "fork failed\n");
    1a87:	83 ec 08             	sub    $0x8,%esp
    1a8a:	68 b9 4c 00 00       	push   $0x4cb9
    1a8f:	6a 01                	push   $0x1
    1a91:	e8 8a 1f 00 00       	call   3a20 <printf>
      exit();
    1a96:	e8 27 1e 00 00       	call   38c2 <exit>
    printf(1, "concreate not enough files in directory listing\n");
    1a9b:	51                   	push   %ecx
    1a9c:	51                   	push   %ecx
    1a9d:	68 80 4f 00 00       	push   $0x4f80
    1aa2:	6a 01                	push   $0x1
    1aa4:	e8 77 1f 00 00       	call   3a20 <printf>
    exit();
    1aa9:	e8 14 1e 00 00       	call   38c2 <exit>
        printf(1, "concreate duplicate file %s\n", de.name);
    1aae:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1ab1:	53                   	push   %ebx
    1ab2:	50                   	push   %eax
    1ab3:	68 19 44 00 00       	push   $0x4419
    1ab8:	6a 01                	push   $0x1
    1aba:	e8 61 1f 00 00       	call   3a20 <printf>
        exit();
    1abf:	e8 fe 1d 00 00       	call   38c2 <exit>
        printf(1, "concreate weird file %s\n", de.name);
    1ac4:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1ac7:	56                   	push   %esi
    1ac8:	50                   	push   %eax
    1ac9:	68 00 44 00 00       	push   $0x4400
    1ace:	6a 01                	push   $0x1
    1ad0:	e8 4b 1f 00 00       	call   3a20 <printf>
        exit();
    1ad5:	e8 e8 1d 00 00       	call   38c2 <exit>
      close(fd);
    1ada:	83 ec 0c             	sub    $0xc,%esp
    1add:	50                   	push   %eax
    1ade:	e8 07 1e 00 00       	call   38ea <close>
    1ae3:	83 c4 10             	add    $0x10,%esp
    1ae6:	e9 f6 fd ff ff       	jmp    18e1 <concreate+0xf1>
    1aeb:	90                   	nop
    1aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001af0 <linkunlink>:
{
    1af0:	55                   	push   %ebp
    1af1:	89 e5                	mov    %esp,%ebp
    1af3:	57                   	push   %edi
    1af4:	56                   	push   %esi
    1af5:	53                   	push   %ebx
    1af6:	83 ec 24             	sub    $0x24,%esp
  printf(1, "linkunlink test\n");
    1af9:	68 44 44 00 00       	push   $0x4444
    1afe:	6a 01                	push   $0x1
    1b00:	e8 1b 1f 00 00       	call   3a20 <printf>
  unlink("x");
    1b05:	c7 04 24 d1 46 00 00 	movl   $0x46d1,(%esp)
    1b0c:	e8 01 1e 00 00       	call   3912 <unlink>
  pid = fork();
    1b11:	e8 a4 1d 00 00       	call   38ba <fork>
  if(pid < 0){
    1b16:	83 c4 10             	add    $0x10,%esp
    1b19:	85 c0                	test   %eax,%eax
  pid = fork();
    1b1b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1b1e:	0f 88 b6 00 00 00    	js     1bda <linkunlink+0xea>
  unsigned int x = (pid ? 1 : 97);
    1b24:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1b28:	bb 64 00 00 00       	mov    $0x64,%ebx
    if((x % 3) == 0){
    1b2d:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  unsigned int x = (pid ? 1 : 97);
    1b32:	19 ff                	sbb    %edi,%edi
    1b34:	83 e7 60             	and    $0x60,%edi
    1b37:	83 c7 01             	add    $0x1,%edi
    1b3a:	eb 1e                	jmp    1b5a <linkunlink+0x6a>
    1b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if((x % 3) == 1){
    1b40:	83 fa 01             	cmp    $0x1,%edx
    1b43:	74 7b                	je     1bc0 <linkunlink+0xd0>
      unlink("x");
    1b45:	83 ec 0c             	sub    $0xc,%esp
    1b48:	68 d1 46 00 00       	push   $0x46d1
    1b4d:	e8 c0 1d 00 00       	call   3912 <unlink>
    1b52:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1b55:	83 eb 01             	sub    $0x1,%ebx
    1b58:	74 3d                	je     1b97 <linkunlink+0xa7>
    x = x * 1103515245 + 12345;
    1b5a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1b60:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1b66:	89 f8                	mov    %edi,%eax
    1b68:	f7 e6                	mul    %esi
    1b6a:	d1 ea                	shr    %edx
    1b6c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1b6f:	89 fa                	mov    %edi,%edx
    1b71:	29 c2                	sub    %eax,%edx
    1b73:	75 cb                	jne    1b40 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1b75:	83 ec 08             	sub    $0x8,%esp
    1b78:	68 02 02 00 00       	push   $0x202
    1b7d:	68 d1 46 00 00       	push   $0x46d1
    1b82:	e8 7b 1d 00 00       	call   3902 <open>
    1b87:	89 04 24             	mov    %eax,(%esp)
    1b8a:	e8 5b 1d 00 00       	call   38ea <close>
    1b8f:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 100; i++){
    1b92:	83 eb 01             	sub    $0x1,%ebx
    1b95:	75 c3                	jne    1b5a <linkunlink+0x6a>
  if(pid)
    1b97:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b9a:	85 c0                	test   %eax,%eax
    1b9c:	74 4f                	je     1bed <linkunlink+0xfd>
    wait();
    1b9e:	e8 27 1d 00 00       	call   38ca <wait>
  printf(1, "linkunlink ok\n");
    1ba3:	83 ec 08             	sub    $0x8,%esp
    1ba6:	68 59 44 00 00       	push   $0x4459
    1bab:	6a 01                	push   $0x1
    1bad:	e8 6e 1e 00 00       	call   3a20 <printf>
}
    1bb2:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1bb5:	5b                   	pop    %ebx
    1bb6:	5e                   	pop    %esi
    1bb7:	5f                   	pop    %edi
    1bb8:	5d                   	pop    %ebp
    1bb9:	c3                   	ret    
    1bba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      link("cat", "x");
    1bc0:	83 ec 08             	sub    $0x8,%esp
    1bc3:	68 d1 46 00 00       	push   $0x46d1
    1bc8:	68 55 44 00 00       	push   $0x4455
    1bcd:	e8 50 1d 00 00       	call   3922 <link>
    1bd2:	83 c4 10             	add    $0x10,%esp
    1bd5:	e9 7b ff ff ff       	jmp    1b55 <linkunlink+0x65>
    printf(1, "fork failed\n");
    1bda:	52                   	push   %edx
    1bdb:	52                   	push   %edx
    1bdc:	68 b9 4c 00 00       	push   $0x4cb9
    1be1:	6a 01                	push   $0x1
    1be3:	e8 38 1e 00 00       	call   3a20 <printf>
    exit();
    1be8:	e8 d5 1c 00 00       	call   38c2 <exit>
    exit();
    1bed:	e8 d0 1c 00 00       	call   38c2 <exit>
    1bf2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1bf9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001c00 <bigdir>:
{
    1c00:	55                   	push   %ebp
    1c01:	89 e5                	mov    %esp,%ebp
    1c03:	57                   	push   %edi
    1c04:	56                   	push   %esi
    1c05:	53                   	push   %ebx
    1c06:	83 ec 24             	sub    $0x24,%esp
  printf(1, "bigdir test\n");
    1c09:	68 68 44 00 00       	push   $0x4468
    1c0e:	6a 01                	push   $0x1
    1c10:	e8 0b 1e 00 00       	call   3a20 <printf>
  unlink("bd");
    1c15:	c7 04 24 75 44 00 00 	movl   $0x4475,(%esp)
    1c1c:	e8 f1 1c 00 00       	call   3912 <unlink>
  fd = open("bd", O_CREATE);
    1c21:	5a                   	pop    %edx
    1c22:	59                   	pop    %ecx
    1c23:	68 00 02 00 00       	push   $0x200
    1c28:	68 75 44 00 00       	push   $0x4475
    1c2d:	e8 d0 1c 00 00       	call   3902 <open>
  if(fd < 0){
    1c32:	83 c4 10             	add    $0x10,%esp
    1c35:	85 c0                	test   %eax,%eax
    1c37:	0f 88 de 00 00 00    	js     1d1b <bigdir+0x11b>
  close(fd);
    1c3d:	83 ec 0c             	sub    $0xc,%esp
    1c40:	8d 7d de             	lea    -0x22(%ebp),%edi
  for(i = 0; i < 500; i++){
    1c43:	31 f6                	xor    %esi,%esi
  close(fd);
    1c45:	50                   	push   %eax
    1c46:	e8 9f 1c 00 00       	call   38ea <close>
    1c4b:	83 c4 10             	add    $0x10,%esp
    1c4e:	66 90                	xchg   %ax,%ax
    name[1] = '0' + (i / 64);
    1c50:	89 f0                	mov    %esi,%eax
    if(link("bd", name) != 0){
    1c52:	83 ec 08             	sub    $0x8,%esp
    name[0] = 'x';
    1c55:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1c59:	c1 f8 06             	sar    $0x6,%eax
    if(link("bd", name) != 0){
    1c5c:	57                   	push   %edi
    1c5d:	68 75 44 00 00       	push   $0x4475
    name[1] = '0' + (i / 64);
    1c62:	83 c0 30             	add    $0x30,%eax
    name[3] = '\0';
    1c65:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    1c69:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1c6c:	89 f0                	mov    %esi,%eax
    1c6e:	83 e0 3f             	and    $0x3f,%eax
    1c71:	83 c0 30             	add    $0x30,%eax
    1c74:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(link("bd", name) != 0){
    1c77:	e8 a6 1c 00 00       	call   3922 <link>
    1c7c:	83 c4 10             	add    $0x10,%esp
    1c7f:	85 c0                	test   %eax,%eax
    1c81:	89 c3                	mov    %eax,%ebx
    1c83:	75 6e                	jne    1cf3 <bigdir+0xf3>
  for(i = 0; i < 500; i++){
    1c85:	83 c6 01             	add    $0x1,%esi
    1c88:	81 fe f4 01 00 00    	cmp    $0x1f4,%esi
    1c8e:	75 c0                	jne    1c50 <bigdir+0x50>
  unlink("bd");
    1c90:	83 ec 0c             	sub    $0xc,%esp
    1c93:	68 75 44 00 00       	push   $0x4475
    1c98:	e8 75 1c 00 00       	call   3912 <unlink>
    1c9d:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + (i / 64);
    1ca0:	89 d8                	mov    %ebx,%eax
    if(unlink(name) != 0){
    1ca2:	83 ec 0c             	sub    $0xc,%esp
    name[0] = 'x';
    1ca5:	c6 45 de 78          	movb   $0x78,-0x22(%ebp)
    name[1] = '0' + (i / 64);
    1ca9:	c1 f8 06             	sar    $0x6,%eax
    if(unlink(name) != 0){
    1cac:	57                   	push   %edi
    name[3] = '\0';
    1cad:	c6 45 e1 00          	movb   $0x0,-0x1f(%ebp)
    name[1] = '0' + (i / 64);
    1cb1:	83 c0 30             	add    $0x30,%eax
    1cb4:	88 45 df             	mov    %al,-0x21(%ebp)
    name[2] = '0' + (i % 64);
    1cb7:	89 d8                	mov    %ebx,%eax
    1cb9:	83 e0 3f             	and    $0x3f,%eax
    1cbc:	83 c0 30             	add    $0x30,%eax
    1cbf:	88 45 e0             	mov    %al,-0x20(%ebp)
    if(unlink(name) != 0){
    1cc2:	e8 4b 1c 00 00       	call   3912 <unlink>
    1cc7:	83 c4 10             	add    $0x10,%esp
    1cca:	85 c0                	test   %eax,%eax
    1ccc:	75 39                	jne    1d07 <bigdir+0x107>
  for(i = 0; i < 500; i++){
    1cce:	83 c3 01             	add    $0x1,%ebx
    1cd1:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1cd7:	75 c7                	jne    1ca0 <bigdir+0xa0>
  printf(1, "bigdir ok\n");
    1cd9:	83 ec 08             	sub    $0x8,%esp
    1cdc:	68 b7 44 00 00       	push   $0x44b7
    1ce1:	6a 01                	push   $0x1
    1ce3:	e8 38 1d 00 00       	call   3a20 <printf>
}
    1ce8:	83 c4 10             	add    $0x10,%esp
    1ceb:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1cee:	5b                   	pop    %ebx
    1cef:	5e                   	pop    %esi
    1cf0:	5f                   	pop    %edi
    1cf1:	5d                   	pop    %ebp
    1cf2:	c3                   	ret    
      printf(1, "bigdir link failed\n");
    1cf3:	83 ec 08             	sub    $0x8,%esp
    1cf6:	68 8e 44 00 00       	push   $0x448e
    1cfb:	6a 01                	push   $0x1
    1cfd:	e8 1e 1d 00 00       	call   3a20 <printf>
      exit();
    1d02:	e8 bb 1b 00 00       	call   38c2 <exit>
      printf(1, "bigdir unlink failed");
    1d07:	83 ec 08             	sub    $0x8,%esp
    1d0a:	68 a2 44 00 00       	push   $0x44a2
    1d0f:	6a 01                	push   $0x1
    1d11:	e8 0a 1d 00 00       	call   3a20 <printf>
      exit();
    1d16:	e8 a7 1b 00 00       	call   38c2 <exit>
    printf(1, "bigdir create failed\n");
    1d1b:	50                   	push   %eax
    1d1c:	50                   	push   %eax
    1d1d:	68 78 44 00 00       	push   $0x4478
    1d22:	6a 01                	push   $0x1
    1d24:	e8 f7 1c 00 00       	call   3a20 <printf>
    exit();
    1d29:	e8 94 1b 00 00       	call   38c2 <exit>
    1d2e:	66 90                	xchg   %ax,%ax

00001d30 <subdir>:
{
    1d30:	55                   	push   %ebp
    1d31:	89 e5                	mov    %esp,%ebp
    1d33:	53                   	push   %ebx
    1d34:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "subdir test\n");
    1d37:	68 c2 44 00 00       	push   $0x44c2
    1d3c:	6a 01                	push   $0x1
    1d3e:	e8 dd 1c 00 00       	call   3a20 <printf>
  unlink("ff");
    1d43:	c7 04 24 4b 45 00 00 	movl   $0x454b,(%esp)
    1d4a:	e8 c3 1b 00 00       	call   3912 <unlink>
  if(mkdir("dd") != 0){
    1d4f:	c7 04 24 e8 45 00 00 	movl   $0x45e8,(%esp)
    1d56:	e8 cf 1b 00 00       	call   392a <mkdir>
    1d5b:	83 c4 10             	add    $0x10,%esp
    1d5e:	85 c0                	test   %eax,%eax
    1d60:	0f 85 b3 05 00 00    	jne    2319 <subdir+0x5e9>
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d66:	83 ec 08             	sub    $0x8,%esp
    1d69:	68 02 02 00 00       	push   $0x202
    1d6e:	68 21 45 00 00       	push   $0x4521
    1d73:	e8 8a 1b 00 00       	call   3902 <open>
  if(fd < 0){
    1d78:	83 c4 10             	add    $0x10,%esp
    1d7b:	85 c0                	test   %eax,%eax
  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d7d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1d7f:	0f 88 81 05 00 00    	js     2306 <subdir+0x5d6>
  write(fd, "ff", 2);
    1d85:	83 ec 04             	sub    $0x4,%esp
    1d88:	6a 02                	push   $0x2
    1d8a:	68 4b 45 00 00       	push   $0x454b
    1d8f:	50                   	push   %eax
    1d90:	e8 4d 1b 00 00       	call   38e2 <write>
  close(fd);
    1d95:	89 1c 24             	mov    %ebx,(%esp)
    1d98:	e8 4d 1b 00 00       	call   38ea <close>
  if(unlink("dd") >= 0){
    1d9d:	c7 04 24 e8 45 00 00 	movl   $0x45e8,(%esp)
    1da4:	e8 69 1b 00 00       	call   3912 <unlink>
    1da9:	83 c4 10             	add    $0x10,%esp
    1dac:	85 c0                	test   %eax,%eax
    1dae:	0f 89 3f 05 00 00    	jns    22f3 <subdir+0x5c3>
  if(mkdir("/dd/dd") != 0){
    1db4:	83 ec 0c             	sub    $0xc,%esp
    1db7:	68 fc 44 00 00       	push   $0x44fc
    1dbc:	e8 69 1b 00 00       	call   392a <mkdir>
    1dc1:	83 c4 10             	add    $0x10,%esp
    1dc4:	85 c0                	test   %eax,%eax
    1dc6:	0f 85 14 05 00 00    	jne    22e0 <subdir+0x5b0>
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1dcc:	83 ec 08             	sub    $0x8,%esp
    1dcf:	68 02 02 00 00       	push   $0x202
    1dd4:	68 1e 45 00 00       	push   $0x451e
    1dd9:	e8 24 1b 00 00       	call   3902 <open>
  if(fd < 0){
    1dde:	83 c4 10             	add    $0x10,%esp
    1de1:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1de3:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1de5:	0f 88 24 04 00 00    	js     220f <subdir+0x4df>
  write(fd, "FF", 2);
    1deb:	83 ec 04             	sub    $0x4,%esp
    1dee:	6a 02                	push   $0x2
    1df0:	68 3f 45 00 00       	push   $0x453f
    1df5:	50                   	push   %eax
    1df6:	e8 e7 1a 00 00       	call   38e2 <write>
  close(fd);
    1dfb:	89 1c 24             	mov    %ebx,(%esp)
    1dfe:	e8 e7 1a 00 00       	call   38ea <close>
  fd = open("dd/dd/../ff", 0);
    1e03:	58                   	pop    %eax
    1e04:	5a                   	pop    %edx
    1e05:	6a 00                	push   $0x0
    1e07:	68 42 45 00 00       	push   $0x4542
    1e0c:	e8 f1 1a 00 00       	call   3902 <open>
  if(fd < 0){
    1e11:	83 c4 10             	add    $0x10,%esp
    1e14:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/../ff", 0);
    1e16:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1e18:	0f 88 de 03 00 00    	js     21fc <subdir+0x4cc>
  cc = read(fd, buf, sizeof(buf));
    1e1e:	83 ec 04             	sub    $0x4,%esp
    1e21:	68 00 20 00 00       	push   $0x2000
    1e26:	68 00 86 00 00       	push   $0x8600
    1e2b:	50                   	push   %eax
    1e2c:	e8 a9 1a 00 00       	call   38da <read>
  if(cc != 2 || buf[0] != 'f'){
    1e31:	83 c4 10             	add    $0x10,%esp
    1e34:	83 f8 02             	cmp    $0x2,%eax
    1e37:	0f 85 3a 03 00 00    	jne    2177 <subdir+0x447>
    1e3d:	80 3d 00 86 00 00 66 	cmpb   $0x66,0x8600
    1e44:	0f 85 2d 03 00 00    	jne    2177 <subdir+0x447>
  close(fd);
    1e4a:	83 ec 0c             	sub    $0xc,%esp
    1e4d:	53                   	push   %ebx
    1e4e:	e8 97 1a 00 00       	call   38ea <close>
  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1e53:	5b                   	pop    %ebx
    1e54:	58                   	pop    %eax
    1e55:	68 82 45 00 00       	push   $0x4582
    1e5a:	68 1e 45 00 00       	push   $0x451e
    1e5f:	e8 be 1a 00 00       	call   3922 <link>
    1e64:	83 c4 10             	add    $0x10,%esp
    1e67:	85 c0                	test   %eax,%eax
    1e69:	0f 85 c6 03 00 00    	jne    2235 <subdir+0x505>
  if(unlink("dd/dd/ff") != 0){
    1e6f:	83 ec 0c             	sub    $0xc,%esp
    1e72:	68 1e 45 00 00       	push   $0x451e
    1e77:	e8 96 1a 00 00       	call   3912 <unlink>
    1e7c:	83 c4 10             	add    $0x10,%esp
    1e7f:	85 c0                	test   %eax,%eax
    1e81:	0f 85 16 03 00 00    	jne    219d <subdir+0x46d>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1e87:	83 ec 08             	sub    $0x8,%esp
    1e8a:	6a 00                	push   $0x0
    1e8c:	68 1e 45 00 00       	push   $0x451e
    1e91:	e8 6c 1a 00 00       	call   3902 <open>
    1e96:	83 c4 10             	add    $0x10,%esp
    1e99:	85 c0                	test   %eax,%eax
    1e9b:	0f 89 2c 04 00 00    	jns    22cd <subdir+0x59d>
  if(chdir("dd") != 0){
    1ea1:	83 ec 0c             	sub    $0xc,%esp
    1ea4:	68 e8 45 00 00       	push   $0x45e8
    1ea9:	e8 84 1a 00 00       	call   3932 <chdir>
    1eae:	83 c4 10             	add    $0x10,%esp
    1eb1:	85 c0                	test   %eax,%eax
    1eb3:	0f 85 01 04 00 00    	jne    22ba <subdir+0x58a>
  if(chdir("dd/../../dd") != 0){
    1eb9:	83 ec 0c             	sub    $0xc,%esp
    1ebc:	68 b6 45 00 00       	push   $0x45b6
    1ec1:	e8 6c 1a 00 00       	call   3932 <chdir>
    1ec6:	83 c4 10             	add    $0x10,%esp
    1ec9:	85 c0                	test   %eax,%eax
    1ecb:	0f 85 b9 02 00 00    	jne    218a <subdir+0x45a>
  if(chdir("dd/../../../dd") != 0){
    1ed1:	83 ec 0c             	sub    $0xc,%esp
    1ed4:	68 dc 45 00 00       	push   $0x45dc
    1ed9:	e8 54 1a 00 00       	call   3932 <chdir>
    1ede:	83 c4 10             	add    $0x10,%esp
    1ee1:	85 c0                	test   %eax,%eax
    1ee3:	0f 85 a1 02 00 00    	jne    218a <subdir+0x45a>
  if(chdir("./..") != 0){
    1ee9:	83 ec 0c             	sub    $0xc,%esp
    1eec:	68 eb 45 00 00       	push   $0x45eb
    1ef1:	e8 3c 1a 00 00       	call   3932 <chdir>
    1ef6:	83 c4 10             	add    $0x10,%esp
    1ef9:	85 c0                	test   %eax,%eax
    1efb:	0f 85 21 03 00 00    	jne    2222 <subdir+0x4f2>
  fd = open("dd/dd/ffff", 0);
    1f01:	83 ec 08             	sub    $0x8,%esp
    1f04:	6a 00                	push   $0x0
    1f06:	68 82 45 00 00       	push   $0x4582
    1f0b:	e8 f2 19 00 00       	call   3902 <open>
  if(fd < 0){
    1f10:	83 c4 10             	add    $0x10,%esp
    1f13:	85 c0                	test   %eax,%eax
  fd = open("dd/dd/ffff", 0);
    1f15:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1f17:	0f 88 e0 04 00 00    	js     23fd <subdir+0x6cd>
  if(read(fd, buf, sizeof(buf)) != 2){
    1f1d:	83 ec 04             	sub    $0x4,%esp
    1f20:	68 00 20 00 00       	push   $0x2000
    1f25:	68 00 86 00 00       	push   $0x8600
    1f2a:	50                   	push   %eax
    1f2b:	e8 aa 19 00 00       	call   38da <read>
    1f30:	83 c4 10             	add    $0x10,%esp
    1f33:	83 f8 02             	cmp    $0x2,%eax
    1f36:	0f 85 ae 04 00 00    	jne    23ea <subdir+0x6ba>
  close(fd);
    1f3c:	83 ec 0c             	sub    $0xc,%esp
    1f3f:	53                   	push   %ebx
    1f40:	e8 a5 19 00 00       	call   38ea <close>
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1f45:	59                   	pop    %ecx
    1f46:	5b                   	pop    %ebx
    1f47:	6a 00                	push   $0x0
    1f49:	68 1e 45 00 00       	push   $0x451e
    1f4e:	e8 af 19 00 00       	call   3902 <open>
    1f53:	83 c4 10             	add    $0x10,%esp
    1f56:	85 c0                	test   %eax,%eax
    1f58:	0f 89 65 02 00 00    	jns    21c3 <subdir+0x493>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1f5e:	83 ec 08             	sub    $0x8,%esp
    1f61:	68 02 02 00 00       	push   $0x202
    1f66:	68 36 46 00 00       	push   $0x4636
    1f6b:	e8 92 19 00 00       	call   3902 <open>
    1f70:	83 c4 10             	add    $0x10,%esp
    1f73:	85 c0                	test   %eax,%eax
    1f75:	0f 89 35 02 00 00    	jns    21b0 <subdir+0x480>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1f7b:	83 ec 08             	sub    $0x8,%esp
    1f7e:	68 02 02 00 00       	push   $0x202
    1f83:	68 5b 46 00 00       	push   $0x465b
    1f88:	e8 75 19 00 00       	call   3902 <open>
    1f8d:	83 c4 10             	add    $0x10,%esp
    1f90:	85 c0                	test   %eax,%eax
    1f92:	0f 89 0f 03 00 00    	jns    22a7 <subdir+0x577>
  if(open("dd", O_CREATE) >= 0){
    1f98:	83 ec 08             	sub    $0x8,%esp
    1f9b:	68 00 02 00 00       	push   $0x200
    1fa0:	68 e8 45 00 00       	push   $0x45e8
    1fa5:	e8 58 19 00 00       	call   3902 <open>
    1faa:	83 c4 10             	add    $0x10,%esp
    1fad:	85 c0                	test   %eax,%eax
    1faf:	0f 89 df 02 00 00    	jns    2294 <subdir+0x564>
  if(open("dd", O_RDWR) >= 0){
    1fb5:	83 ec 08             	sub    $0x8,%esp
    1fb8:	6a 02                	push   $0x2
    1fba:	68 e8 45 00 00       	push   $0x45e8
    1fbf:	e8 3e 19 00 00       	call   3902 <open>
    1fc4:	83 c4 10             	add    $0x10,%esp
    1fc7:	85 c0                	test   %eax,%eax
    1fc9:	0f 89 b2 02 00 00    	jns    2281 <subdir+0x551>
  if(open("dd", O_WRONLY) >= 0){
    1fcf:	83 ec 08             	sub    $0x8,%esp
    1fd2:	6a 01                	push   $0x1
    1fd4:	68 e8 45 00 00       	push   $0x45e8
    1fd9:	e8 24 19 00 00       	call   3902 <open>
    1fde:	83 c4 10             	add    $0x10,%esp
    1fe1:	85 c0                	test   %eax,%eax
    1fe3:	0f 89 85 02 00 00    	jns    226e <subdir+0x53e>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1fe9:	83 ec 08             	sub    $0x8,%esp
    1fec:	68 ca 46 00 00       	push   $0x46ca
    1ff1:	68 36 46 00 00       	push   $0x4636
    1ff6:	e8 27 19 00 00       	call   3922 <link>
    1ffb:	83 c4 10             	add    $0x10,%esp
    1ffe:	85 c0                	test   %eax,%eax
    2000:	0f 84 55 02 00 00    	je     225b <subdir+0x52b>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    2006:	83 ec 08             	sub    $0x8,%esp
    2009:	68 ca 46 00 00       	push   $0x46ca
    200e:	68 5b 46 00 00       	push   $0x465b
    2013:	e8 0a 19 00 00       	call   3922 <link>
    2018:	83 c4 10             	add    $0x10,%esp
    201b:	85 c0                	test   %eax,%eax
    201d:	0f 84 25 02 00 00    	je     2248 <subdir+0x518>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    2023:	83 ec 08             	sub    $0x8,%esp
    2026:	68 82 45 00 00       	push   $0x4582
    202b:	68 21 45 00 00       	push   $0x4521
    2030:	e8 ed 18 00 00       	call   3922 <link>
    2035:	83 c4 10             	add    $0x10,%esp
    2038:	85 c0                	test   %eax,%eax
    203a:	0f 84 a9 01 00 00    	je     21e9 <subdir+0x4b9>
  if(mkdir("dd/ff/ff") == 0){
    2040:	83 ec 0c             	sub    $0xc,%esp
    2043:	68 36 46 00 00       	push   $0x4636
    2048:	e8 dd 18 00 00       	call   392a <mkdir>
    204d:	83 c4 10             	add    $0x10,%esp
    2050:	85 c0                	test   %eax,%eax
    2052:	0f 84 7e 01 00 00    	je     21d6 <subdir+0x4a6>
  if(mkdir("dd/xx/ff") == 0){
    2058:	83 ec 0c             	sub    $0xc,%esp
    205b:	68 5b 46 00 00       	push   $0x465b
    2060:	e8 c5 18 00 00       	call   392a <mkdir>
    2065:	83 c4 10             	add    $0x10,%esp
    2068:	85 c0                	test   %eax,%eax
    206a:	0f 84 67 03 00 00    	je     23d7 <subdir+0x6a7>
  if(mkdir("dd/dd/ffff") == 0){
    2070:	83 ec 0c             	sub    $0xc,%esp
    2073:	68 82 45 00 00       	push   $0x4582
    2078:	e8 ad 18 00 00       	call   392a <mkdir>
    207d:	83 c4 10             	add    $0x10,%esp
    2080:	85 c0                	test   %eax,%eax
    2082:	0f 84 3c 03 00 00    	je     23c4 <subdir+0x694>
  if(unlink("dd/xx/ff") == 0){
    2088:	83 ec 0c             	sub    $0xc,%esp
    208b:	68 5b 46 00 00       	push   $0x465b
    2090:	e8 7d 18 00 00       	call   3912 <unlink>
    2095:	83 c4 10             	add    $0x10,%esp
    2098:	85 c0                	test   %eax,%eax
    209a:	0f 84 11 03 00 00    	je     23b1 <subdir+0x681>
  if(unlink("dd/ff/ff") == 0){
    20a0:	83 ec 0c             	sub    $0xc,%esp
    20a3:	68 36 46 00 00       	push   $0x4636
    20a8:	e8 65 18 00 00       	call   3912 <unlink>
    20ad:	83 c4 10             	add    $0x10,%esp
    20b0:	85 c0                	test   %eax,%eax
    20b2:	0f 84 e6 02 00 00    	je     239e <subdir+0x66e>
  if(chdir("dd/ff") == 0){
    20b8:	83 ec 0c             	sub    $0xc,%esp
    20bb:	68 21 45 00 00       	push   $0x4521
    20c0:	e8 6d 18 00 00       	call   3932 <chdir>
    20c5:	83 c4 10             	add    $0x10,%esp
    20c8:	85 c0                	test   %eax,%eax
    20ca:	0f 84 bb 02 00 00    	je     238b <subdir+0x65b>
  if(chdir("dd/xx") == 0){
    20d0:	83 ec 0c             	sub    $0xc,%esp
    20d3:	68 cd 46 00 00       	push   $0x46cd
    20d8:	e8 55 18 00 00       	call   3932 <chdir>
    20dd:	83 c4 10             	add    $0x10,%esp
    20e0:	85 c0                	test   %eax,%eax
    20e2:	0f 84 90 02 00 00    	je     2378 <subdir+0x648>
  if(unlink("dd/dd/ffff") != 0){
    20e8:	83 ec 0c             	sub    $0xc,%esp
    20eb:	68 82 45 00 00       	push   $0x4582
    20f0:	e8 1d 18 00 00       	call   3912 <unlink>
    20f5:	83 c4 10             	add    $0x10,%esp
    20f8:	85 c0                	test   %eax,%eax
    20fa:	0f 85 9d 00 00 00    	jne    219d <subdir+0x46d>
  if(unlink("dd/ff") != 0){
    2100:	83 ec 0c             	sub    $0xc,%esp
    2103:	68 21 45 00 00       	push   $0x4521
    2108:	e8 05 18 00 00       	call   3912 <unlink>
    210d:	83 c4 10             	add    $0x10,%esp
    2110:	85 c0                	test   %eax,%eax
    2112:	0f 85 4d 02 00 00    	jne    2365 <subdir+0x635>
  if(unlink("dd") == 0){
    2118:	83 ec 0c             	sub    $0xc,%esp
    211b:	68 e8 45 00 00       	push   $0x45e8
    2120:	e8 ed 17 00 00       	call   3912 <unlink>
    2125:	83 c4 10             	add    $0x10,%esp
    2128:	85 c0                	test   %eax,%eax
    212a:	0f 84 22 02 00 00    	je     2352 <subdir+0x622>
  if(unlink("dd/dd") < 0){
    2130:	83 ec 0c             	sub    $0xc,%esp
    2133:	68 fd 44 00 00       	push   $0x44fd
    2138:	e8 d5 17 00 00       	call   3912 <unlink>
    213d:	83 c4 10             	add    $0x10,%esp
    2140:	85 c0                	test   %eax,%eax
    2142:	0f 88 f7 01 00 00    	js     233f <subdir+0x60f>
  if(unlink("dd") < 0){
    2148:	83 ec 0c             	sub    $0xc,%esp
    214b:	68 e8 45 00 00       	push   $0x45e8
    2150:	e8 bd 17 00 00       	call   3912 <unlink>
    2155:	83 c4 10             	add    $0x10,%esp
    2158:	85 c0                	test   %eax,%eax
    215a:	0f 88 cc 01 00 00    	js     232c <subdir+0x5fc>
  printf(1, "subdir ok\n");
    2160:	83 ec 08             	sub    $0x8,%esp
    2163:	68 ca 47 00 00       	push   $0x47ca
    2168:	6a 01                	push   $0x1
    216a:	e8 b1 18 00 00       	call   3a20 <printf>
}
    216f:	83 c4 10             	add    $0x10,%esp
    2172:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2175:	c9                   	leave  
    2176:	c3                   	ret    
    printf(1, "dd/dd/../ff wrong content\n");
    2177:	50                   	push   %eax
    2178:	50                   	push   %eax
    2179:	68 67 45 00 00       	push   $0x4567
    217e:	6a 01                	push   $0x1
    2180:	e8 9b 18 00 00       	call   3a20 <printf>
    exit();
    2185:	e8 38 17 00 00       	call   38c2 <exit>
    printf(1, "chdir dd/../../dd failed\n");
    218a:	50                   	push   %eax
    218b:	50                   	push   %eax
    218c:	68 c2 45 00 00       	push   $0x45c2
    2191:	6a 01                	push   $0x1
    2193:	e8 88 18 00 00       	call   3a20 <printf>
    exit();
    2198:	e8 25 17 00 00       	call   38c2 <exit>
    printf(1, "unlink dd/dd/ff failed\n");
    219d:	52                   	push   %edx
    219e:	52                   	push   %edx
    219f:	68 8d 45 00 00       	push   $0x458d
    21a4:	6a 01                	push   $0x1
    21a6:	e8 75 18 00 00       	call   3a20 <printf>
    exit();
    21ab:	e8 12 17 00 00       	call   38c2 <exit>
    printf(1, "create dd/ff/ff succeeded!\n");
    21b0:	50                   	push   %eax
    21b1:	50                   	push   %eax
    21b2:	68 3f 46 00 00       	push   $0x463f
    21b7:	6a 01                	push   $0x1
    21b9:	e8 62 18 00 00       	call   3a20 <printf>
    exit();
    21be:	e8 ff 16 00 00       	call   38c2 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    21c3:	52                   	push   %edx
    21c4:	52                   	push   %edx
    21c5:	68 24 50 00 00       	push   $0x5024
    21ca:	6a 01                	push   $0x1
    21cc:	e8 4f 18 00 00       	call   3a20 <printf>
    exit();
    21d1:	e8 ec 16 00 00       	call   38c2 <exit>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    21d6:	52                   	push   %edx
    21d7:	52                   	push   %edx
    21d8:	68 d3 46 00 00       	push   $0x46d3
    21dd:	6a 01                	push   $0x1
    21df:	e8 3c 18 00 00       	call   3a20 <printf>
    exit();
    21e4:	e8 d9 16 00 00       	call   38c2 <exit>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    21e9:	51                   	push   %ecx
    21ea:	51                   	push   %ecx
    21eb:	68 94 50 00 00       	push   $0x5094
    21f0:	6a 01                	push   $0x1
    21f2:	e8 29 18 00 00       	call   3a20 <printf>
    exit();
    21f7:	e8 c6 16 00 00       	call   38c2 <exit>
    printf(1, "open dd/dd/../ff failed\n");
    21fc:	50                   	push   %eax
    21fd:	50                   	push   %eax
    21fe:	68 4e 45 00 00       	push   $0x454e
    2203:	6a 01                	push   $0x1
    2205:	e8 16 18 00 00       	call   3a20 <printf>
    exit();
    220a:	e8 b3 16 00 00       	call   38c2 <exit>
    printf(1, "create dd/dd/ff failed\n");
    220f:	51                   	push   %ecx
    2210:	51                   	push   %ecx
    2211:	68 27 45 00 00       	push   $0x4527
    2216:	6a 01                	push   $0x1
    2218:	e8 03 18 00 00       	call   3a20 <printf>
    exit();
    221d:	e8 a0 16 00 00       	call   38c2 <exit>
    printf(1, "chdir ./.. failed\n");
    2222:	50                   	push   %eax
    2223:	50                   	push   %eax
    2224:	68 f0 45 00 00       	push   $0x45f0
    2229:	6a 01                	push   $0x1
    222b:	e8 f0 17 00 00       	call   3a20 <printf>
    exit();
    2230:	e8 8d 16 00 00       	call   38c2 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2235:	51                   	push   %ecx
    2236:	51                   	push   %ecx
    2237:	68 dc 4f 00 00       	push   $0x4fdc
    223c:	6a 01                	push   $0x1
    223e:	e8 dd 17 00 00       	call   3a20 <printf>
    exit();
    2243:	e8 7a 16 00 00       	call   38c2 <exit>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2248:	53                   	push   %ebx
    2249:	53                   	push   %ebx
    224a:	68 70 50 00 00       	push   $0x5070
    224f:	6a 01                	push   $0x1
    2251:	e8 ca 17 00 00       	call   3a20 <printf>
    exit();
    2256:	e8 67 16 00 00       	call   38c2 <exit>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    225b:	50                   	push   %eax
    225c:	50                   	push   %eax
    225d:	68 4c 50 00 00       	push   $0x504c
    2262:	6a 01                	push   $0x1
    2264:	e8 b7 17 00 00       	call   3a20 <printf>
    exit();
    2269:	e8 54 16 00 00       	call   38c2 <exit>
    printf(1, "open dd wronly succeeded!\n");
    226e:	50                   	push   %eax
    226f:	50                   	push   %eax
    2270:	68 af 46 00 00       	push   $0x46af
    2275:	6a 01                	push   $0x1
    2277:	e8 a4 17 00 00       	call   3a20 <printf>
    exit();
    227c:	e8 41 16 00 00       	call   38c2 <exit>
    printf(1, "open dd rdwr succeeded!\n");
    2281:	50                   	push   %eax
    2282:	50                   	push   %eax
    2283:	68 96 46 00 00       	push   $0x4696
    2288:	6a 01                	push   $0x1
    228a:	e8 91 17 00 00       	call   3a20 <printf>
    exit();
    228f:	e8 2e 16 00 00       	call   38c2 <exit>
    printf(1, "create dd succeeded!\n");
    2294:	50                   	push   %eax
    2295:	50                   	push   %eax
    2296:	68 80 46 00 00       	push   $0x4680
    229b:	6a 01                	push   $0x1
    229d:	e8 7e 17 00 00       	call   3a20 <printf>
    exit();
    22a2:	e8 1b 16 00 00       	call   38c2 <exit>
    printf(1, "create dd/xx/ff succeeded!\n");
    22a7:	50                   	push   %eax
    22a8:	50                   	push   %eax
    22a9:	68 64 46 00 00       	push   $0x4664
    22ae:	6a 01                	push   $0x1
    22b0:	e8 6b 17 00 00       	call   3a20 <printf>
    exit();
    22b5:	e8 08 16 00 00       	call   38c2 <exit>
    printf(1, "chdir dd failed\n");
    22ba:	50                   	push   %eax
    22bb:	50                   	push   %eax
    22bc:	68 a5 45 00 00       	push   $0x45a5
    22c1:	6a 01                	push   $0x1
    22c3:	e8 58 17 00 00       	call   3a20 <printf>
    exit();
    22c8:	e8 f5 15 00 00       	call   38c2 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    22cd:	50                   	push   %eax
    22ce:	50                   	push   %eax
    22cf:	68 00 50 00 00       	push   $0x5000
    22d4:	6a 01                	push   $0x1
    22d6:	e8 45 17 00 00       	call   3a20 <printf>
    exit();
    22db:	e8 e2 15 00 00       	call   38c2 <exit>
    printf(1, "subdir mkdir dd/dd failed\n");
    22e0:	53                   	push   %ebx
    22e1:	53                   	push   %ebx
    22e2:	68 03 45 00 00       	push   $0x4503
    22e7:	6a 01                	push   $0x1
    22e9:	e8 32 17 00 00       	call   3a20 <printf>
    exit();
    22ee:	e8 cf 15 00 00       	call   38c2 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    22f3:	50                   	push   %eax
    22f4:	50                   	push   %eax
    22f5:	68 b4 4f 00 00       	push   $0x4fb4
    22fa:	6a 01                	push   $0x1
    22fc:	e8 1f 17 00 00       	call   3a20 <printf>
    exit();
    2301:	e8 bc 15 00 00       	call   38c2 <exit>
    printf(1, "create dd/ff failed\n");
    2306:	50                   	push   %eax
    2307:	50                   	push   %eax
    2308:	68 e7 44 00 00       	push   $0x44e7
    230d:	6a 01                	push   $0x1
    230f:	e8 0c 17 00 00       	call   3a20 <printf>
    exit();
    2314:	e8 a9 15 00 00       	call   38c2 <exit>
    printf(1, "subdir mkdir dd failed\n");
    2319:	50                   	push   %eax
    231a:	50                   	push   %eax
    231b:	68 cf 44 00 00       	push   $0x44cf
    2320:	6a 01                	push   $0x1
    2322:	e8 f9 16 00 00       	call   3a20 <printf>
    exit();
    2327:	e8 96 15 00 00       	call   38c2 <exit>
    printf(1, "unlink dd failed\n");
    232c:	50                   	push   %eax
    232d:	50                   	push   %eax
    232e:	68 b8 47 00 00       	push   $0x47b8
    2333:	6a 01                	push   $0x1
    2335:	e8 e6 16 00 00       	call   3a20 <printf>
    exit();
    233a:	e8 83 15 00 00       	call   38c2 <exit>
    printf(1, "unlink dd/dd failed\n");
    233f:	52                   	push   %edx
    2340:	52                   	push   %edx
    2341:	68 a3 47 00 00       	push   $0x47a3
    2346:	6a 01                	push   $0x1
    2348:	e8 d3 16 00 00       	call   3a20 <printf>
    exit();
    234d:	e8 70 15 00 00       	call   38c2 <exit>
    printf(1, "unlink non-empty dd succeeded!\n");
    2352:	51                   	push   %ecx
    2353:	51                   	push   %ecx
    2354:	68 b8 50 00 00       	push   $0x50b8
    2359:	6a 01                	push   $0x1
    235b:	e8 c0 16 00 00       	call   3a20 <printf>
    exit();
    2360:	e8 5d 15 00 00       	call   38c2 <exit>
    printf(1, "unlink dd/ff failed\n");
    2365:	53                   	push   %ebx
    2366:	53                   	push   %ebx
    2367:	68 8e 47 00 00       	push   $0x478e
    236c:	6a 01                	push   $0x1
    236e:	e8 ad 16 00 00       	call   3a20 <printf>
    exit();
    2373:	e8 4a 15 00 00       	call   38c2 <exit>
    printf(1, "chdir dd/xx succeeded!\n");
    2378:	50                   	push   %eax
    2379:	50                   	push   %eax
    237a:	68 76 47 00 00       	push   $0x4776
    237f:	6a 01                	push   $0x1
    2381:	e8 9a 16 00 00       	call   3a20 <printf>
    exit();
    2386:	e8 37 15 00 00       	call   38c2 <exit>
    printf(1, "chdir dd/ff succeeded!\n");
    238b:	50                   	push   %eax
    238c:	50                   	push   %eax
    238d:	68 5e 47 00 00       	push   $0x475e
    2392:	6a 01                	push   $0x1
    2394:	e8 87 16 00 00       	call   3a20 <printf>
    exit();
    2399:	e8 24 15 00 00       	call   38c2 <exit>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    239e:	50                   	push   %eax
    239f:	50                   	push   %eax
    23a0:	68 42 47 00 00       	push   $0x4742
    23a5:	6a 01                	push   $0x1
    23a7:	e8 74 16 00 00       	call   3a20 <printf>
    exit();
    23ac:	e8 11 15 00 00       	call   38c2 <exit>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    23b1:	50                   	push   %eax
    23b2:	50                   	push   %eax
    23b3:	68 26 47 00 00       	push   $0x4726
    23b8:	6a 01                	push   $0x1
    23ba:	e8 61 16 00 00       	call   3a20 <printf>
    exit();
    23bf:	e8 fe 14 00 00       	call   38c2 <exit>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    23c4:	50                   	push   %eax
    23c5:	50                   	push   %eax
    23c6:	68 09 47 00 00       	push   $0x4709
    23cb:	6a 01                	push   $0x1
    23cd:	e8 4e 16 00 00       	call   3a20 <printf>
    exit();
    23d2:	e8 eb 14 00 00       	call   38c2 <exit>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    23d7:	50                   	push   %eax
    23d8:	50                   	push   %eax
    23d9:	68 ee 46 00 00       	push   $0x46ee
    23de:	6a 01                	push   $0x1
    23e0:	e8 3b 16 00 00       	call   3a20 <printf>
    exit();
    23e5:	e8 d8 14 00 00       	call   38c2 <exit>
    printf(1, "read dd/dd/ffff wrong len\n");
    23ea:	50                   	push   %eax
    23eb:	50                   	push   %eax
    23ec:	68 1b 46 00 00       	push   $0x461b
    23f1:	6a 01                	push   $0x1
    23f3:	e8 28 16 00 00       	call   3a20 <printf>
    exit();
    23f8:	e8 c5 14 00 00       	call   38c2 <exit>
    printf(1, "open dd/dd/ffff failed\n");
    23fd:	50                   	push   %eax
    23fe:	50                   	push   %eax
    23ff:	68 03 46 00 00       	push   $0x4603
    2404:	6a 01                	push   $0x1
    2406:	e8 15 16 00 00       	call   3a20 <printf>
    exit();
    240b:	e8 b2 14 00 00       	call   38c2 <exit>

00002410 <bigwrite>:
{
    2410:	55                   	push   %ebp
    2411:	89 e5                	mov    %esp,%ebp
    2413:	56                   	push   %esi
    2414:	53                   	push   %ebx
  for(sz = 499; sz < 12*512; sz += 471){
    2415:	bb f3 01 00 00       	mov    $0x1f3,%ebx
  printf(1, "bigwrite test\n");
    241a:	83 ec 08             	sub    $0x8,%esp
    241d:	68 d5 47 00 00       	push   $0x47d5
    2422:	6a 01                	push   $0x1
    2424:	e8 f7 15 00 00       	call   3a20 <printf>
  unlink("bigwrite");
    2429:	c7 04 24 e4 47 00 00 	movl   $0x47e4,(%esp)
    2430:	e8 dd 14 00 00       	call   3912 <unlink>
    2435:	83 c4 10             	add    $0x10,%esp
    2438:	90                   	nop
    2439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2440:	83 ec 08             	sub    $0x8,%esp
    2443:	68 02 02 00 00       	push   $0x202
    2448:	68 e4 47 00 00       	push   $0x47e4
    244d:	e8 b0 14 00 00       	call   3902 <open>
    if(fd < 0){
    2452:	83 c4 10             	add    $0x10,%esp
    2455:	85 c0                	test   %eax,%eax
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2457:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2459:	78 7e                	js     24d9 <bigwrite+0xc9>
      int cc = write(fd, buf, sz);
    245b:	83 ec 04             	sub    $0x4,%esp
    245e:	53                   	push   %ebx
    245f:	68 00 86 00 00       	push   $0x8600
    2464:	50                   	push   %eax
    2465:	e8 78 14 00 00       	call   38e2 <write>
      if(cc != sz){
    246a:	83 c4 10             	add    $0x10,%esp
    246d:	39 d8                	cmp    %ebx,%eax
    246f:	75 55                	jne    24c6 <bigwrite+0xb6>
      int cc = write(fd, buf, sz);
    2471:	83 ec 04             	sub    $0x4,%esp
    2474:	53                   	push   %ebx
    2475:	68 00 86 00 00       	push   $0x8600
    247a:	56                   	push   %esi
    247b:	e8 62 14 00 00       	call   38e2 <write>
      if(cc != sz){
    2480:	83 c4 10             	add    $0x10,%esp
    2483:	39 d8                	cmp    %ebx,%eax
    2485:	75 3f                	jne    24c6 <bigwrite+0xb6>
    close(fd);
    2487:	83 ec 0c             	sub    $0xc,%esp
  for(sz = 499; sz < 12*512; sz += 471){
    248a:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
    close(fd);
    2490:	56                   	push   %esi
    2491:	e8 54 14 00 00       	call   38ea <close>
    unlink("bigwrite");
    2496:	c7 04 24 e4 47 00 00 	movl   $0x47e4,(%esp)
    249d:	e8 70 14 00 00       	call   3912 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    24a2:	83 c4 10             	add    $0x10,%esp
    24a5:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    24ab:	75 93                	jne    2440 <bigwrite+0x30>
  printf(1, "bigwrite ok\n");
    24ad:	83 ec 08             	sub    $0x8,%esp
    24b0:	68 17 48 00 00       	push   $0x4817
    24b5:	6a 01                	push   $0x1
    24b7:	e8 64 15 00 00       	call   3a20 <printf>
}
    24bc:	83 c4 10             	add    $0x10,%esp
    24bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
    24c2:	5b                   	pop    %ebx
    24c3:	5e                   	pop    %esi
    24c4:	5d                   	pop    %ebp
    24c5:	c3                   	ret    
        printf(1, "write(%d) ret %d\n", sz, cc);
    24c6:	50                   	push   %eax
    24c7:	53                   	push   %ebx
    24c8:	68 05 48 00 00       	push   $0x4805
    24cd:	6a 01                	push   $0x1
    24cf:	e8 4c 15 00 00       	call   3a20 <printf>
        exit();
    24d4:	e8 e9 13 00 00       	call   38c2 <exit>
      printf(1, "cannot create bigwrite\n");
    24d9:	83 ec 08             	sub    $0x8,%esp
    24dc:	68 ed 47 00 00       	push   $0x47ed
    24e1:	6a 01                	push   $0x1
    24e3:	e8 38 15 00 00       	call   3a20 <printf>
      exit();
    24e8:	e8 d5 13 00 00       	call   38c2 <exit>
    24ed:	8d 76 00             	lea    0x0(%esi),%esi

000024f0 <bigfile>:
{
    24f0:	55                   	push   %ebp
    24f1:	89 e5                	mov    %esp,%ebp
    24f3:	57                   	push   %edi
    24f4:	56                   	push   %esi
    24f5:	53                   	push   %ebx
    24f6:	83 ec 14             	sub    $0x14,%esp
  printf(1, "bigfile test\n");
    24f9:	68 24 48 00 00       	push   $0x4824
    24fe:	6a 01                	push   $0x1
    2500:	e8 1b 15 00 00       	call   3a20 <printf>
  unlink("bigfile");
    2505:	c7 04 24 40 48 00 00 	movl   $0x4840,(%esp)
    250c:	e8 01 14 00 00       	call   3912 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    2511:	58                   	pop    %eax
    2512:	5a                   	pop    %edx
    2513:	68 02 02 00 00       	push   $0x202
    2518:	68 40 48 00 00       	push   $0x4840
    251d:	e8 e0 13 00 00       	call   3902 <open>
  if(fd < 0){
    2522:	83 c4 10             	add    $0x10,%esp
    2525:	85 c0                	test   %eax,%eax
    2527:	0f 88 5e 01 00 00    	js     268b <bigfile+0x19b>
    252d:	89 c6                	mov    %eax,%esi
  for(i = 0; i < 20; i++){
    252f:	31 db                	xor    %ebx,%ebx
    2531:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    memset(buf, i, 600);
    2538:	83 ec 04             	sub    $0x4,%esp
    253b:	68 58 02 00 00       	push   $0x258
    2540:	53                   	push   %ebx
    2541:	68 00 86 00 00       	push   $0x8600
    2546:	e8 d5 11 00 00       	call   3720 <memset>
    if(write(fd, buf, 600) != 600){
    254b:	83 c4 0c             	add    $0xc,%esp
    254e:	68 58 02 00 00       	push   $0x258
    2553:	68 00 86 00 00       	push   $0x8600
    2558:	56                   	push   %esi
    2559:	e8 84 13 00 00       	call   38e2 <write>
    255e:	83 c4 10             	add    $0x10,%esp
    2561:	3d 58 02 00 00       	cmp    $0x258,%eax
    2566:	0f 85 f8 00 00 00    	jne    2664 <bigfile+0x174>
  for(i = 0; i < 20; i++){
    256c:	83 c3 01             	add    $0x1,%ebx
    256f:	83 fb 14             	cmp    $0x14,%ebx
    2572:	75 c4                	jne    2538 <bigfile+0x48>
  close(fd);
    2574:	83 ec 0c             	sub    $0xc,%esp
    2577:	56                   	push   %esi
    2578:	e8 6d 13 00 00       	call   38ea <close>
  fd = open("bigfile", 0);
    257d:	5e                   	pop    %esi
    257e:	5f                   	pop    %edi
    257f:	6a 00                	push   $0x0
    2581:	68 40 48 00 00       	push   $0x4840
    2586:	e8 77 13 00 00       	call   3902 <open>
  if(fd < 0){
    258b:	83 c4 10             	add    $0x10,%esp
    258e:	85 c0                	test   %eax,%eax
  fd = open("bigfile", 0);
    2590:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2592:	0f 88 e0 00 00 00    	js     2678 <bigfile+0x188>
  total = 0;
    2598:	31 db                	xor    %ebx,%ebx
  for(i = 0; ; i++){
    259a:	31 ff                	xor    %edi,%edi
    259c:	eb 30                	jmp    25ce <bigfile+0xde>
    259e:	66 90                	xchg   %ax,%ax
    if(cc != 300){
    25a0:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    25a5:	0f 85 91 00 00 00    	jne    263c <bigfile+0x14c>
    if(buf[0] != i/2 || buf[299] != i/2){
    25ab:	0f be 05 00 86 00 00 	movsbl 0x8600,%eax
    25b2:	89 fa                	mov    %edi,%edx
    25b4:	d1 fa                	sar    %edx
    25b6:	39 d0                	cmp    %edx,%eax
    25b8:	75 6e                	jne    2628 <bigfile+0x138>
    25ba:	0f be 15 2b 87 00 00 	movsbl 0x872b,%edx
    25c1:	39 d0                	cmp    %edx,%eax
    25c3:	75 63                	jne    2628 <bigfile+0x138>
    total += cc;
    25c5:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  for(i = 0; ; i++){
    25cb:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    25ce:	83 ec 04             	sub    $0x4,%esp
    25d1:	68 2c 01 00 00       	push   $0x12c
    25d6:	68 00 86 00 00       	push   $0x8600
    25db:	56                   	push   %esi
    25dc:	e8 f9 12 00 00       	call   38da <read>
    if(cc < 0){
    25e1:	83 c4 10             	add    $0x10,%esp
    25e4:	85 c0                	test   %eax,%eax
    25e6:	78 68                	js     2650 <bigfile+0x160>
    if(cc == 0)
    25e8:	75 b6                	jne    25a0 <bigfile+0xb0>
  close(fd);
    25ea:	83 ec 0c             	sub    $0xc,%esp
    25ed:	56                   	push   %esi
    25ee:	e8 f7 12 00 00       	call   38ea <close>
  if(total != 20*600){
    25f3:	83 c4 10             	add    $0x10,%esp
    25f6:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    25fc:	0f 85 9c 00 00 00    	jne    269e <bigfile+0x1ae>
  unlink("bigfile");
    2602:	83 ec 0c             	sub    $0xc,%esp
    2605:	68 40 48 00 00       	push   $0x4840
    260a:	e8 03 13 00 00       	call   3912 <unlink>
  printf(1, "bigfile test ok\n");
    260f:	58                   	pop    %eax
    2610:	5a                   	pop    %edx
    2611:	68 cf 48 00 00       	push   $0x48cf
    2616:	6a 01                	push   $0x1
    2618:	e8 03 14 00 00       	call   3a20 <printf>
}
    261d:	83 c4 10             	add    $0x10,%esp
    2620:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2623:	5b                   	pop    %ebx
    2624:	5e                   	pop    %esi
    2625:	5f                   	pop    %edi
    2626:	5d                   	pop    %ebp
    2627:	c3                   	ret    
      printf(1, "read bigfile wrong data\n");
    2628:	83 ec 08             	sub    $0x8,%esp
    262b:	68 9c 48 00 00       	push   $0x489c
    2630:	6a 01                	push   $0x1
    2632:	e8 e9 13 00 00       	call   3a20 <printf>
      exit();
    2637:	e8 86 12 00 00       	call   38c2 <exit>
      printf(1, "short read bigfile\n");
    263c:	83 ec 08             	sub    $0x8,%esp
    263f:	68 88 48 00 00       	push   $0x4888
    2644:	6a 01                	push   $0x1
    2646:	e8 d5 13 00 00       	call   3a20 <printf>
      exit();
    264b:	e8 72 12 00 00       	call   38c2 <exit>
      printf(1, "read bigfile failed\n");
    2650:	83 ec 08             	sub    $0x8,%esp
    2653:	68 73 48 00 00       	push   $0x4873
    2658:	6a 01                	push   $0x1
    265a:	e8 c1 13 00 00       	call   3a20 <printf>
      exit();
    265f:	e8 5e 12 00 00       	call   38c2 <exit>
      printf(1, "write bigfile failed\n");
    2664:	83 ec 08             	sub    $0x8,%esp
    2667:	68 48 48 00 00       	push   $0x4848
    266c:	6a 01                	push   $0x1
    266e:	e8 ad 13 00 00       	call   3a20 <printf>
      exit();
    2673:	e8 4a 12 00 00       	call   38c2 <exit>
    printf(1, "cannot open bigfile\n");
    2678:	53                   	push   %ebx
    2679:	53                   	push   %ebx
    267a:	68 5e 48 00 00       	push   $0x485e
    267f:	6a 01                	push   $0x1
    2681:	e8 9a 13 00 00       	call   3a20 <printf>
    exit();
    2686:	e8 37 12 00 00       	call   38c2 <exit>
    printf(1, "cannot create bigfile");
    268b:	50                   	push   %eax
    268c:	50                   	push   %eax
    268d:	68 32 48 00 00       	push   $0x4832
    2692:	6a 01                	push   $0x1
    2694:	e8 87 13 00 00       	call   3a20 <printf>
    exit();
    2699:	e8 24 12 00 00       	call   38c2 <exit>
    printf(1, "read bigfile wrong total\n");
    269e:	51                   	push   %ecx
    269f:	51                   	push   %ecx
    26a0:	68 b5 48 00 00       	push   $0x48b5
    26a5:	6a 01                	push   $0x1
    26a7:	e8 74 13 00 00       	call   3a20 <printf>
    exit();
    26ac:	e8 11 12 00 00       	call   38c2 <exit>
    26b1:	eb 0d                	jmp    26c0 <fourteen>
    26b3:	90                   	nop
    26b4:	90                   	nop
    26b5:	90                   	nop
    26b6:	90                   	nop
    26b7:	90                   	nop
    26b8:	90                   	nop
    26b9:	90                   	nop
    26ba:	90                   	nop
    26bb:	90                   	nop
    26bc:	90                   	nop
    26bd:	90                   	nop
    26be:	90                   	nop
    26bf:	90                   	nop

000026c0 <fourteen>:
{
    26c0:	55                   	push   %ebp
    26c1:	89 e5                	mov    %esp,%ebp
    26c3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "fourteen test\n");
    26c6:	68 e0 48 00 00       	push   $0x48e0
    26cb:	6a 01                	push   $0x1
    26cd:	e8 4e 13 00 00       	call   3a20 <printf>
  if(mkdir("12345678901234") != 0){
    26d2:	c7 04 24 1b 49 00 00 	movl   $0x491b,(%esp)
    26d9:	e8 4c 12 00 00       	call   392a <mkdir>
    26de:	83 c4 10             	add    $0x10,%esp
    26e1:	85 c0                	test   %eax,%eax
    26e3:	0f 85 97 00 00 00    	jne    2780 <fourteen+0xc0>
  if(mkdir("12345678901234/123456789012345") != 0){
    26e9:	83 ec 0c             	sub    $0xc,%esp
    26ec:	68 d8 50 00 00       	push   $0x50d8
    26f1:	e8 34 12 00 00       	call   392a <mkdir>
    26f6:	83 c4 10             	add    $0x10,%esp
    26f9:	85 c0                	test   %eax,%eax
    26fb:	0f 85 de 00 00 00    	jne    27df <fourteen+0x11f>
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2701:	83 ec 08             	sub    $0x8,%esp
    2704:	68 00 02 00 00       	push   $0x200
    2709:	68 28 51 00 00       	push   $0x5128
    270e:	e8 ef 11 00 00       	call   3902 <open>
  if(fd < 0){
    2713:	83 c4 10             	add    $0x10,%esp
    2716:	85 c0                	test   %eax,%eax
    2718:	0f 88 ae 00 00 00    	js     27cc <fourteen+0x10c>
  close(fd);
    271e:	83 ec 0c             	sub    $0xc,%esp
    2721:	50                   	push   %eax
    2722:	e8 c3 11 00 00       	call   38ea <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2727:	58                   	pop    %eax
    2728:	5a                   	pop    %edx
    2729:	6a 00                	push   $0x0
    272b:	68 98 51 00 00       	push   $0x5198
    2730:	e8 cd 11 00 00       	call   3902 <open>
  if(fd < 0){
    2735:	83 c4 10             	add    $0x10,%esp
    2738:	85 c0                	test   %eax,%eax
    273a:	78 7d                	js     27b9 <fourteen+0xf9>
  close(fd);
    273c:	83 ec 0c             	sub    $0xc,%esp
    273f:	50                   	push   %eax
    2740:	e8 a5 11 00 00       	call   38ea <close>
  if(mkdir("12345678901234/12345678901234") == 0){
    2745:	c7 04 24 0c 49 00 00 	movl   $0x490c,(%esp)
    274c:	e8 d9 11 00 00       	call   392a <mkdir>
    2751:	83 c4 10             	add    $0x10,%esp
    2754:	85 c0                	test   %eax,%eax
    2756:	74 4e                	je     27a6 <fourteen+0xe6>
  if(mkdir("123456789012345/12345678901234") == 0){
    2758:	83 ec 0c             	sub    $0xc,%esp
    275b:	68 34 52 00 00       	push   $0x5234
    2760:	e8 c5 11 00 00       	call   392a <mkdir>
    2765:	83 c4 10             	add    $0x10,%esp
    2768:	85 c0                	test   %eax,%eax
    276a:	74 27                	je     2793 <fourteen+0xd3>
  printf(1, "fourteen ok\n");
    276c:	83 ec 08             	sub    $0x8,%esp
    276f:	68 2a 49 00 00       	push   $0x492a
    2774:	6a 01                	push   $0x1
    2776:	e8 a5 12 00 00       	call   3a20 <printf>
}
    277b:	83 c4 10             	add    $0x10,%esp
    277e:	c9                   	leave  
    277f:	c3                   	ret    
    printf(1, "mkdir 12345678901234 failed\n");
    2780:	50                   	push   %eax
    2781:	50                   	push   %eax
    2782:	68 ef 48 00 00       	push   $0x48ef
    2787:	6a 01                	push   $0x1
    2789:	e8 92 12 00 00       	call   3a20 <printf>
    exit();
    278e:	e8 2f 11 00 00       	call   38c2 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2793:	50                   	push   %eax
    2794:	50                   	push   %eax
    2795:	68 54 52 00 00       	push   $0x5254
    279a:	6a 01                	push   $0x1
    279c:	e8 7f 12 00 00       	call   3a20 <printf>
    exit();
    27a1:	e8 1c 11 00 00       	call   38c2 <exit>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    27a6:	52                   	push   %edx
    27a7:	52                   	push   %edx
    27a8:	68 04 52 00 00       	push   $0x5204
    27ad:	6a 01                	push   $0x1
    27af:	e8 6c 12 00 00       	call   3a20 <printf>
    exit();
    27b4:	e8 09 11 00 00       	call   38c2 <exit>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    27b9:	51                   	push   %ecx
    27ba:	51                   	push   %ecx
    27bb:	68 c8 51 00 00       	push   $0x51c8
    27c0:	6a 01                	push   $0x1
    27c2:	e8 59 12 00 00       	call   3a20 <printf>
    exit();
    27c7:	e8 f6 10 00 00       	call   38c2 <exit>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    27cc:	51                   	push   %ecx
    27cd:	51                   	push   %ecx
    27ce:	68 58 51 00 00       	push   $0x5158
    27d3:	6a 01                	push   $0x1
    27d5:	e8 46 12 00 00       	call   3a20 <printf>
    exit();
    27da:	e8 e3 10 00 00       	call   38c2 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    27df:	50                   	push   %eax
    27e0:	50                   	push   %eax
    27e1:	68 f8 50 00 00       	push   $0x50f8
    27e6:	6a 01                	push   $0x1
    27e8:	e8 33 12 00 00       	call   3a20 <printf>
    exit();
    27ed:	e8 d0 10 00 00       	call   38c2 <exit>
    27f2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    27f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002800 <rmdot>:
{
    2800:	55                   	push   %ebp
    2801:	89 e5                	mov    %esp,%ebp
    2803:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    2806:	68 37 49 00 00       	push   $0x4937
    280b:	6a 01                	push   $0x1
    280d:	e8 0e 12 00 00       	call   3a20 <printf>
  if(mkdir("dots") != 0){
    2812:	c7 04 24 43 49 00 00 	movl   $0x4943,(%esp)
    2819:	e8 0c 11 00 00       	call   392a <mkdir>
    281e:	83 c4 10             	add    $0x10,%esp
    2821:	85 c0                	test   %eax,%eax
    2823:	0f 85 b0 00 00 00    	jne    28d9 <rmdot+0xd9>
  if(chdir("dots") != 0){
    2829:	83 ec 0c             	sub    $0xc,%esp
    282c:	68 43 49 00 00       	push   $0x4943
    2831:	e8 fc 10 00 00       	call   3932 <chdir>
    2836:	83 c4 10             	add    $0x10,%esp
    2839:	85 c0                	test   %eax,%eax
    283b:	0f 85 1d 01 00 00    	jne    295e <rmdot+0x15e>
  if(unlink(".") == 0){
    2841:	83 ec 0c             	sub    $0xc,%esp
    2844:	68 ee 45 00 00       	push   $0x45ee
    2849:	e8 c4 10 00 00       	call   3912 <unlink>
    284e:	83 c4 10             	add    $0x10,%esp
    2851:	85 c0                	test   %eax,%eax
    2853:	0f 84 f2 00 00 00    	je     294b <rmdot+0x14b>
  if(unlink("..") == 0){
    2859:	83 ec 0c             	sub    $0xc,%esp
    285c:	68 ed 45 00 00       	push   $0x45ed
    2861:	e8 ac 10 00 00       	call   3912 <unlink>
    2866:	83 c4 10             	add    $0x10,%esp
    2869:	85 c0                	test   %eax,%eax
    286b:	0f 84 c7 00 00 00    	je     2938 <rmdot+0x138>
  if(chdir("/") != 0){
    2871:	83 ec 0c             	sub    $0xc,%esp
    2874:	68 c1 3d 00 00       	push   $0x3dc1
    2879:	e8 b4 10 00 00       	call   3932 <chdir>
    287e:	83 c4 10             	add    $0x10,%esp
    2881:	85 c0                	test   %eax,%eax
    2883:	0f 85 9c 00 00 00    	jne    2925 <rmdot+0x125>
  if(unlink("dots/.") == 0){
    2889:	83 ec 0c             	sub    $0xc,%esp
    288c:	68 8b 49 00 00       	push   $0x498b
    2891:	e8 7c 10 00 00       	call   3912 <unlink>
    2896:	83 c4 10             	add    $0x10,%esp
    2899:	85 c0                	test   %eax,%eax
    289b:	74 75                	je     2912 <rmdot+0x112>
  if(unlink("dots/..") == 0){
    289d:	83 ec 0c             	sub    $0xc,%esp
    28a0:	68 a9 49 00 00       	push   $0x49a9
    28a5:	e8 68 10 00 00       	call   3912 <unlink>
    28aa:	83 c4 10             	add    $0x10,%esp
    28ad:	85 c0                	test   %eax,%eax
    28af:	74 4e                	je     28ff <rmdot+0xff>
  if(unlink("dots") != 0){
    28b1:	83 ec 0c             	sub    $0xc,%esp
    28b4:	68 43 49 00 00       	push   $0x4943
    28b9:	e8 54 10 00 00       	call   3912 <unlink>
    28be:	83 c4 10             	add    $0x10,%esp
    28c1:	85 c0                	test   %eax,%eax
    28c3:	75 27                	jne    28ec <rmdot+0xec>
  printf(1, "rmdot ok\n");
    28c5:	83 ec 08             	sub    $0x8,%esp
    28c8:	68 de 49 00 00       	push   $0x49de
    28cd:	6a 01                	push   $0x1
    28cf:	e8 4c 11 00 00       	call   3a20 <printf>
}
    28d4:	83 c4 10             	add    $0x10,%esp
    28d7:	c9                   	leave  
    28d8:	c3                   	ret    
    printf(1, "mkdir dots failed\n");
    28d9:	50                   	push   %eax
    28da:	50                   	push   %eax
    28db:	68 48 49 00 00       	push   $0x4948
    28e0:	6a 01                	push   $0x1
    28e2:	e8 39 11 00 00       	call   3a20 <printf>
    exit();
    28e7:	e8 d6 0f 00 00       	call   38c2 <exit>
    printf(1, "unlink dots failed!\n");
    28ec:	50                   	push   %eax
    28ed:	50                   	push   %eax
    28ee:	68 c9 49 00 00       	push   $0x49c9
    28f3:	6a 01                	push   $0x1
    28f5:	e8 26 11 00 00       	call   3a20 <printf>
    exit();
    28fa:	e8 c3 0f 00 00       	call   38c2 <exit>
    printf(1, "unlink dots/.. worked!\n");
    28ff:	52                   	push   %edx
    2900:	52                   	push   %edx
    2901:	68 b1 49 00 00       	push   $0x49b1
    2906:	6a 01                	push   $0x1
    2908:	e8 13 11 00 00       	call   3a20 <printf>
    exit();
    290d:	e8 b0 0f 00 00       	call   38c2 <exit>
    printf(1, "unlink dots/. worked!\n");
    2912:	51                   	push   %ecx
    2913:	51                   	push   %ecx
    2914:	68 92 49 00 00       	push   $0x4992
    2919:	6a 01                	push   $0x1
    291b:	e8 00 11 00 00       	call   3a20 <printf>
    exit();
    2920:	e8 9d 0f 00 00       	call   38c2 <exit>
    printf(1, "chdir / failed\n");
    2925:	50                   	push   %eax
    2926:	50                   	push   %eax
    2927:	68 c3 3d 00 00       	push   $0x3dc3
    292c:	6a 01                	push   $0x1
    292e:	e8 ed 10 00 00       	call   3a20 <printf>
    exit();
    2933:	e8 8a 0f 00 00       	call   38c2 <exit>
    printf(1, "rm .. worked!\n");
    2938:	50                   	push   %eax
    2939:	50                   	push   %eax
    293a:	68 7c 49 00 00       	push   $0x497c
    293f:	6a 01                	push   $0x1
    2941:	e8 da 10 00 00       	call   3a20 <printf>
    exit();
    2946:	e8 77 0f 00 00       	call   38c2 <exit>
    printf(1, "rm . worked!\n");
    294b:	50                   	push   %eax
    294c:	50                   	push   %eax
    294d:	68 6e 49 00 00       	push   $0x496e
    2952:	6a 01                	push   $0x1
    2954:	e8 c7 10 00 00       	call   3a20 <printf>
    exit();
    2959:	e8 64 0f 00 00       	call   38c2 <exit>
    printf(1, "chdir dots failed\n");
    295e:	50                   	push   %eax
    295f:	50                   	push   %eax
    2960:	68 5b 49 00 00       	push   $0x495b
    2965:	6a 01                	push   $0x1
    2967:	e8 b4 10 00 00       	call   3a20 <printf>
    exit();
    296c:	e8 51 0f 00 00       	call   38c2 <exit>
    2971:	eb 0d                	jmp    2980 <dirfile>
    2973:	90                   	nop
    2974:	90                   	nop
    2975:	90                   	nop
    2976:	90                   	nop
    2977:	90                   	nop
    2978:	90                   	nop
    2979:	90                   	nop
    297a:	90                   	nop
    297b:	90                   	nop
    297c:	90                   	nop
    297d:	90                   	nop
    297e:	90                   	nop
    297f:	90                   	nop

00002980 <dirfile>:
{
    2980:	55                   	push   %ebp
    2981:	89 e5                	mov    %esp,%ebp
    2983:	53                   	push   %ebx
    2984:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "dir vs file\n");
    2987:	68 e8 49 00 00       	push   $0x49e8
    298c:	6a 01                	push   $0x1
    298e:	e8 8d 10 00 00       	call   3a20 <printf>
  fd = open("dirfile", O_CREATE);
    2993:	59                   	pop    %ecx
    2994:	5b                   	pop    %ebx
    2995:	68 00 02 00 00       	push   $0x200
    299a:	68 f5 49 00 00       	push   $0x49f5
    299f:	e8 5e 0f 00 00       	call   3902 <open>
  if(fd < 0){
    29a4:	83 c4 10             	add    $0x10,%esp
    29a7:	85 c0                	test   %eax,%eax
    29a9:	0f 88 43 01 00 00    	js     2af2 <dirfile+0x172>
  close(fd);
    29af:	83 ec 0c             	sub    $0xc,%esp
    29b2:	50                   	push   %eax
    29b3:	e8 32 0f 00 00       	call   38ea <close>
  if(chdir("dirfile") == 0){
    29b8:	c7 04 24 f5 49 00 00 	movl   $0x49f5,(%esp)
    29bf:	e8 6e 0f 00 00       	call   3932 <chdir>
    29c4:	83 c4 10             	add    $0x10,%esp
    29c7:	85 c0                	test   %eax,%eax
    29c9:	0f 84 10 01 00 00    	je     2adf <dirfile+0x15f>
  fd = open("dirfile/xx", 0);
    29cf:	83 ec 08             	sub    $0x8,%esp
    29d2:	6a 00                	push   $0x0
    29d4:	68 2e 4a 00 00       	push   $0x4a2e
    29d9:	e8 24 0f 00 00       	call   3902 <open>
  if(fd >= 0){
    29de:	83 c4 10             	add    $0x10,%esp
    29e1:	85 c0                	test   %eax,%eax
    29e3:	0f 89 e3 00 00 00    	jns    2acc <dirfile+0x14c>
  fd = open("dirfile/xx", O_CREATE);
    29e9:	83 ec 08             	sub    $0x8,%esp
    29ec:	68 00 02 00 00       	push   $0x200
    29f1:	68 2e 4a 00 00       	push   $0x4a2e
    29f6:	e8 07 0f 00 00       	call   3902 <open>
  if(fd >= 0){
    29fb:	83 c4 10             	add    $0x10,%esp
    29fe:	85 c0                	test   %eax,%eax
    2a00:	0f 89 c6 00 00 00    	jns    2acc <dirfile+0x14c>
  if(mkdir("dirfile/xx") == 0){
    2a06:	83 ec 0c             	sub    $0xc,%esp
    2a09:	68 2e 4a 00 00       	push   $0x4a2e
    2a0e:	e8 17 0f 00 00       	call   392a <mkdir>
    2a13:	83 c4 10             	add    $0x10,%esp
    2a16:	85 c0                	test   %eax,%eax
    2a18:	0f 84 46 01 00 00    	je     2b64 <dirfile+0x1e4>
  if(unlink("dirfile/xx") == 0){
    2a1e:	83 ec 0c             	sub    $0xc,%esp
    2a21:	68 2e 4a 00 00       	push   $0x4a2e
    2a26:	e8 e7 0e 00 00       	call   3912 <unlink>
    2a2b:	83 c4 10             	add    $0x10,%esp
    2a2e:	85 c0                	test   %eax,%eax
    2a30:	0f 84 1b 01 00 00    	je     2b51 <dirfile+0x1d1>
  if(link("README", "dirfile/xx") == 0){
    2a36:	83 ec 08             	sub    $0x8,%esp
    2a39:	68 2e 4a 00 00       	push   $0x4a2e
    2a3e:	68 92 4a 00 00       	push   $0x4a92
    2a43:	e8 da 0e 00 00       	call   3922 <link>
    2a48:	83 c4 10             	add    $0x10,%esp
    2a4b:	85 c0                	test   %eax,%eax
    2a4d:	0f 84 eb 00 00 00    	je     2b3e <dirfile+0x1be>
  if(unlink("dirfile") != 0){
    2a53:	83 ec 0c             	sub    $0xc,%esp
    2a56:	68 f5 49 00 00       	push   $0x49f5
    2a5b:	e8 b2 0e 00 00       	call   3912 <unlink>
    2a60:	83 c4 10             	add    $0x10,%esp
    2a63:	85 c0                	test   %eax,%eax
    2a65:	0f 85 c0 00 00 00    	jne    2b2b <dirfile+0x1ab>
  fd = open(".", O_RDWR);
    2a6b:	83 ec 08             	sub    $0x8,%esp
    2a6e:	6a 02                	push   $0x2
    2a70:	68 ee 45 00 00       	push   $0x45ee
    2a75:	e8 88 0e 00 00       	call   3902 <open>
  if(fd >= 0){
    2a7a:	83 c4 10             	add    $0x10,%esp
    2a7d:	85 c0                	test   %eax,%eax
    2a7f:	0f 89 93 00 00 00    	jns    2b18 <dirfile+0x198>
  fd = open(".", 0);
    2a85:	83 ec 08             	sub    $0x8,%esp
    2a88:	6a 00                	push   $0x0
    2a8a:	68 ee 45 00 00       	push   $0x45ee
    2a8f:	e8 6e 0e 00 00       	call   3902 <open>
  if(write(fd, "x", 1) > 0){
    2a94:	83 c4 0c             	add    $0xc,%esp
  fd = open(".", 0);
    2a97:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2a99:	6a 01                	push   $0x1
    2a9b:	68 d1 46 00 00       	push   $0x46d1
    2aa0:	50                   	push   %eax
    2aa1:	e8 3c 0e 00 00       	call   38e2 <write>
    2aa6:	83 c4 10             	add    $0x10,%esp
    2aa9:	85 c0                	test   %eax,%eax
    2aab:	7f 58                	jg     2b05 <dirfile+0x185>
  close(fd);
    2aad:	83 ec 0c             	sub    $0xc,%esp
    2ab0:	53                   	push   %ebx
    2ab1:	e8 34 0e 00 00       	call   38ea <close>
  printf(1, "dir vs file OK\n");
    2ab6:	58                   	pop    %eax
    2ab7:	5a                   	pop    %edx
    2ab8:	68 c5 4a 00 00       	push   $0x4ac5
    2abd:	6a 01                	push   $0x1
    2abf:	e8 5c 0f 00 00       	call   3a20 <printf>
}
    2ac4:	83 c4 10             	add    $0x10,%esp
    2ac7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2aca:	c9                   	leave  
    2acb:	c3                   	ret    
    printf(1, "create dirfile/xx succeeded!\n");
    2acc:	50                   	push   %eax
    2acd:	50                   	push   %eax
    2ace:	68 39 4a 00 00       	push   $0x4a39
    2ad3:	6a 01                	push   $0x1
    2ad5:	e8 46 0f 00 00       	call   3a20 <printf>
    exit();
    2ada:	e8 e3 0d 00 00       	call   38c2 <exit>
    printf(1, "chdir dirfile succeeded!\n");
    2adf:	50                   	push   %eax
    2ae0:	50                   	push   %eax
    2ae1:	68 14 4a 00 00       	push   $0x4a14
    2ae6:	6a 01                	push   $0x1
    2ae8:	e8 33 0f 00 00       	call   3a20 <printf>
    exit();
    2aed:	e8 d0 0d 00 00       	call   38c2 <exit>
    printf(1, "create dirfile failed\n");
    2af2:	52                   	push   %edx
    2af3:	52                   	push   %edx
    2af4:	68 fd 49 00 00       	push   $0x49fd
    2af9:	6a 01                	push   $0x1
    2afb:	e8 20 0f 00 00       	call   3a20 <printf>
    exit();
    2b00:	e8 bd 0d 00 00       	call   38c2 <exit>
    printf(1, "write . succeeded!\n");
    2b05:	51                   	push   %ecx
    2b06:	51                   	push   %ecx
    2b07:	68 b1 4a 00 00       	push   $0x4ab1
    2b0c:	6a 01                	push   $0x1
    2b0e:	e8 0d 0f 00 00       	call   3a20 <printf>
    exit();
    2b13:	e8 aa 0d 00 00       	call   38c2 <exit>
    printf(1, "open . for writing succeeded!\n");
    2b18:	53                   	push   %ebx
    2b19:	53                   	push   %ebx
    2b1a:	68 a8 52 00 00       	push   $0x52a8
    2b1f:	6a 01                	push   $0x1
    2b21:	e8 fa 0e 00 00       	call   3a20 <printf>
    exit();
    2b26:	e8 97 0d 00 00       	call   38c2 <exit>
    printf(1, "unlink dirfile failed!\n");
    2b2b:	50                   	push   %eax
    2b2c:	50                   	push   %eax
    2b2d:	68 99 4a 00 00       	push   $0x4a99
    2b32:	6a 01                	push   $0x1
    2b34:	e8 e7 0e 00 00       	call   3a20 <printf>
    exit();
    2b39:	e8 84 0d 00 00       	call   38c2 <exit>
    printf(1, "link to dirfile/xx succeeded!\n");
    2b3e:	50                   	push   %eax
    2b3f:	50                   	push   %eax
    2b40:	68 88 52 00 00       	push   $0x5288
    2b45:	6a 01                	push   $0x1
    2b47:	e8 d4 0e 00 00       	call   3a20 <printf>
    exit();
    2b4c:	e8 71 0d 00 00       	call   38c2 <exit>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2b51:	50                   	push   %eax
    2b52:	50                   	push   %eax
    2b53:	68 74 4a 00 00       	push   $0x4a74
    2b58:	6a 01                	push   $0x1
    2b5a:	e8 c1 0e 00 00       	call   3a20 <printf>
    exit();
    2b5f:	e8 5e 0d 00 00       	call   38c2 <exit>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2b64:	50                   	push   %eax
    2b65:	50                   	push   %eax
    2b66:	68 57 4a 00 00       	push   $0x4a57
    2b6b:	6a 01                	push   $0x1
    2b6d:	e8 ae 0e 00 00       	call   3a20 <printf>
    exit();
    2b72:	e8 4b 0d 00 00       	call   38c2 <exit>
    2b77:	89 f6                	mov    %esi,%esi
    2b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002b80 <iref>:
{
    2b80:	55                   	push   %ebp
    2b81:	89 e5                	mov    %esp,%ebp
    2b83:	53                   	push   %ebx
  printf(1, "empty file name\n");
    2b84:	bb 33 00 00 00       	mov    $0x33,%ebx
{
    2b89:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "empty file name\n");
    2b8c:	68 d5 4a 00 00       	push   $0x4ad5
    2b91:	6a 01                	push   $0x1
    2b93:	e8 88 0e 00 00       	call   3a20 <printf>
    2b98:	83 c4 10             	add    $0x10,%esp
    2b9b:	90                   	nop
    2b9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(mkdir("irefd") != 0){
    2ba0:	83 ec 0c             	sub    $0xc,%esp
    2ba3:	68 e6 4a 00 00       	push   $0x4ae6
    2ba8:	e8 7d 0d 00 00       	call   392a <mkdir>
    2bad:	83 c4 10             	add    $0x10,%esp
    2bb0:	85 c0                	test   %eax,%eax
    2bb2:	0f 85 bb 00 00 00    	jne    2c73 <iref+0xf3>
    if(chdir("irefd") != 0){
    2bb8:	83 ec 0c             	sub    $0xc,%esp
    2bbb:	68 e6 4a 00 00       	push   $0x4ae6
    2bc0:	e8 6d 0d 00 00       	call   3932 <chdir>
    2bc5:	83 c4 10             	add    $0x10,%esp
    2bc8:	85 c0                	test   %eax,%eax
    2bca:	0f 85 b7 00 00 00    	jne    2c87 <iref+0x107>
    mkdir("");
    2bd0:	83 ec 0c             	sub    $0xc,%esp
    2bd3:	68 9b 41 00 00       	push   $0x419b
    2bd8:	e8 4d 0d 00 00       	call   392a <mkdir>
    link("README", "");
    2bdd:	59                   	pop    %ecx
    2bde:	58                   	pop    %eax
    2bdf:	68 9b 41 00 00       	push   $0x419b
    2be4:	68 92 4a 00 00       	push   $0x4a92
    2be9:	e8 34 0d 00 00       	call   3922 <link>
    fd = open("", O_CREATE);
    2bee:	58                   	pop    %eax
    2bef:	5a                   	pop    %edx
    2bf0:	68 00 02 00 00       	push   $0x200
    2bf5:	68 9b 41 00 00       	push   $0x419b
    2bfa:	e8 03 0d 00 00       	call   3902 <open>
    if(fd >= 0)
    2bff:	83 c4 10             	add    $0x10,%esp
    2c02:	85 c0                	test   %eax,%eax
    2c04:	78 0c                	js     2c12 <iref+0x92>
      close(fd);
    2c06:	83 ec 0c             	sub    $0xc,%esp
    2c09:	50                   	push   %eax
    2c0a:	e8 db 0c 00 00       	call   38ea <close>
    2c0f:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2c12:	83 ec 08             	sub    $0x8,%esp
    2c15:	68 00 02 00 00       	push   $0x200
    2c1a:	68 d0 46 00 00       	push   $0x46d0
    2c1f:	e8 de 0c 00 00       	call   3902 <open>
    if(fd >= 0)
    2c24:	83 c4 10             	add    $0x10,%esp
    2c27:	85 c0                	test   %eax,%eax
    2c29:	78 0c                	js     2c37 <iref+0xb7>
      close(fd);
    2c2b:	83 ec 0c             	sub    $0xc,%esp
    2c2e:	50                   	push   %eax
    2c2f:	e8 b6 0c 00 00       	call   38ea <close>
    2c34:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2c37:	83 ec 0c             	sub    $0xc,%esp
    2c3a:	68 d0 46 00 00       	push   $0x46d0
    2c3f:	e8 ce 0c 00 00       	call   3912 <unlink>
  for(i = 0; i < 50 + 1; i++){
    2c44:	83 c4 10             	add    $0x10,%esp
    2c47:	83 eb 01             	sub    $0x1,%ebx
    2c4a:	0f 85 50 ff ff ff    	jne    2ba0 <iref+0x20>
  chdir("/");
    2c50:	83 ec 0c             	sub    $0xc,%esp
    2c53:	68 c1 3d 00 00       	push   $0x3dc1
    2c58:	e8 d5 0c 00 00       	call   3932 <chdir>
  printf(1, "empty file name OK\n");
    2c5d:	58                   	pop    %eax
    2c5e:	5a                   	pop    %edx
    2c5f:	68 14 4b 00 00       	push   $0x4b14
    2c64:	6a 01                	push   $0x1
    2c66:	e8 b5 0d 00 00       	call   3a20 <printf>
}
    2c6b:	83 c4 10             	add    $0x10,%esp
    2c6e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2c71:	c9                   	leave  
    2c72:	c3                   	ret    
      printf(1, "mkdir irefd failed\n");
    2c73:	83 ec 08             	sub    $0x8,%esp
    2c76:	68 ec 4a 00 00       	push   $0x4aec
    2c7b:	6a 01                	push   $0x1
    2c7d:	e8 9e 0d 00 00       	call   3a20 <printf>
      exit();
    2c82:	e8 3b 0c 00 00       	call   38c2 <exit>
      printf(1, "chdir irefd failed\n");
    2c87:	83 ec 08             	sub    $0x8,%esp
    2c8a:	68 00 4b 00 00       	push   $0x4b00
    2c8f:	6a 01                	push   $0x1
    2c91:	e8 8a 0d 00 00       	call   3a20 <printf>
      exit();
    2c96:	e8 27 0c 00 00       	call   38c2 <exit>
    2c9b:	90                   	nop
    2c9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002ca0 <forktest>:
{
    2ca0:	55                   	push   %ebp
    2ca1:	89 e5                	mov    %esp,%ebp
    2ca3:	53                   	push   %ebx
  for(n=0; n<1000; n++){
    2ca4:	31 db                	xor    %ebx,%ebx
{
    2ca6:	83 ec 0c             	sub    $0xc,%esp
  printf(1, "fork test\n");
    2ca9:	68 28 4b 00 00       	push   $0x4b28
    2cae:	6a 01                	push   $0x1
    2cb0:	e8 6b 0d 00 00       	call   3a20 <printf>
    2cb5:	83 c4 10             	add    $0x10,%esp
    2cb8:	eb 13                	jmp    2ccd <forktest+0x2d>
    2cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid == 0)
    2cc0:	74 62                	je     2d24 <forktest+0x84>
  for(n=0; n<1000; n++){
    2cc2:	83 c3 01             	add    $0x1,%ebx
    2cc5:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2ccb:	74 43                	je     2d10 <forktest+0x70>
    pid = fork();
    2ccd:	e8 e8 0b 00 00       	call   38ba <fork>
    if(pid < 0)
    2cd2:	85 c0                	test   %eax,%eax
    2cd4:	79 ea                	jns    2cc0 <forktest+0x20>
  for(; n > 0; n--){
    2cd6:	85 db                	test   %ebx,%ebx
    2cd8:	74 14                	je     2cee <forktest+0x4e>
    2cda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    2ce0:	e8 e5 0b 00 00       	call   38ca <wait>
    2ce5:	85 c0                	test   %eax,%eax
    2ce7:	78 40                	js     2d29 <forktest+0x89>
  for(; n > 0; n--){
    2ce9:	83 eb 01             	sub    $0x1,%ebx
    2cec:	75 f2                	jne    2ce0 <forktest+0x40>
  if(wait() != -1){
    2cee:	e8 d7 0b 00 00       	call   38ca <wait>
    2cf3:	83 f8 ff             	cmp    $0xffffffff,%eax
    2cf6:	75 45                	jne    2d3d <forktest+0x9d>
  printf(1, "fork test OK\n");
    2cf8:	83 ec 08             	sub    $0x8,%esp
    2cfb:	68 5a 4b 00 00       	push   $0x4b5a
    2d00:	6a 01                	push   $0x1
    2d02:	e8 19 0d 00 00       	call   3a20 <printf>
}
    2d07:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2d0a:	c9                   	leave  
    2d0b:	c3                   	ret    
    2d0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "fork claimed to work 1000 times!\n");
    2d10:	83 ec 08             	sub    $0x8,%esp
    2d13:	68 c8 52 00 00       	push   $0x52c8
    2d18:	6a 01                	push   $0x1
    2d1a:	e8 01 0d 00 00       	call   3a20 <printf>
    exit();
    2d1f:	e8 9e 0b 00 00       	call   38c2 <exit>
      exit();
    2d24:	e8 99 0b 00 00       	call   38c2 <exit>
      printf(1, "wait stopped early\n");
    2d29:	83 ec 08             	sub    $0x8,%esp
    2d2c:	68 33 4b 00 00       	push   $0x4b33
    2d31:	6a 01                	push   $0x1
    2d33:	e8 e8 0c 00 00       	call   3a20 <printf>
      exit();
    2d38:	e8 85 0b 00 00       	call   38c2 <exit>
    printf(1, "wait got too many\n");
    2d3d:	50                   	push   %eax
    2d3e:	50                   	push   %eax
    2d3f:	68 47 4b 00 00       	push   $0x4b47
    2d44:	6a 01                	push   $0x1
    2d46:	e8 d5 0c 00 00       	call   3a20 <printf>
    exit();
    2d4b:	e8 72 0b 00 00       	call   38c2 <exit>

00002d50 <sbrktest>:
{
    2d50:	55                   	push   %ebp
    2d51:	89 e5                	mov    %esp,%ebp
    2d53:	57                   	push   %edi
    2d54:	56                   	push   %esi
    2d55:	53                   	push   %ebx
  for(i = 0; i < 5000; i++){
    2d56:	31 ff                	xor    %edi,%edi
{
    2d58:	83 ec 64             	sub    $0x64,%esp
  printf(stdout, "sbrk test\n");
    2d5b:	68 68 4b 00 00       	push   $0x4b68
    2d60:	ff 35 28 5e 00 00    	pushl  0x5e28
    2d66:	e8 b5 0c 00 00       	call   3a20 <printf>
  oldbrk = sbrk(0);
    2d6b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d72:	e8 d3 0b 00 00       	call   394a <sbrk>
  a = sbrk(0);
    2d77:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  oldbrk = sbrk(0);
    2d7e:	89 c3                	mov    %eax,%ebx
  a = sbrk(0);
    2d80:	e8 c5 0b 00 00       	call   394a <sbrk>
    2d85:	83 c4 10             	add    $0x10,%esp
    2d88:	89 c6                	mov    %eax,%esi
    2d8a:	eb 06                	jmp    2d92 <sbrktest+0x42>
    2d8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    a = b + 1;
    2d90:	89 c6                	mov    %eax,%esi
    b = sbrk(1);
    2d92:	83 ec 0c             	sub    $0xc,%esp
    2d95:	6a 01                	push   $0x1
    2d97:	e8 ae 0b 00 00       	call   394a <sbrk>
		if(b != a){
    2d9c:	83 c4 10             	add    $0x10,%esp
    2d9f:	39 f0                	cmp    %esi,%eax
    2da1:	0f 85 62 02 00 00    	jne    3009 <sbrktest+0x2b9>
  for(i = 0; i < 5000; i++){
    2da7:	83 c7 01             	add    $0x1,%edi
    *b = 1;
    2daa:	c6 06 01             	movb   $0x1,(%esi)
    a = b + 1;
    2dad:	8d 46 01             	lea    0x1(%esi),%eax
  for(i = 0; i < 5000; i++){
    2db0:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    2db6:	75 d8                	jne    2d90 <sbrktest+0x40>
  pid = fork();
    2db8:	e8 fd 0a 00 00       	call   38ba <fork>
  if(pid < 0){
    2dbd:	85 c0                	test   %eax,%eax
  pid = fork();
    2dbf:	89 c7                	mov    %eax,%edi
  if(pid < 0){
    2dc1:	0f 88 82 03 00 00    	js     3149 <sbrktest+0x3f9>
  c = sbrk(1);
    2dc7:	83 ec 0c             	sub    $0xc,%esp
  if(c != a + 1){
    2dca:	83 c6 02             	add    $0x2,%esi
  c = sbrk(1);
    2dcd:	6a 01                	push   $0x1
    2dcf:	e8 76 0b 00 00       	call   394a <sbrk>
  c = sbrk(1);
    2dd4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ddb:	e8 6a 0b 00 00       	call   394a <sbrk>
  if(c != a + 1){
    2de0:	83 c4 10             	add    $0x10,%esp
    2de3:	39 f0                	cmp    %esi,%eax
    2de5:	0f 85 47 03 00 00    	jne    3132 <sbrktest+0x3e2>
  if(pid == 0)
    2deb:	85 ff                	test   %edi,%edi
    2ded:	0f 84 3a 03 00 00    	je     312d <sbrktest+0x3dd>
  wait();
    2df3:	e8 d2 0a 00 00       	call   38ca <wait>
  a = sbrk(0);
    2df8:	83 ec 0c             	sub    $0xc,%esp
    2dfb:	6a 00                	push   $0x0
    2dfd:	e8 48 0b 00 00       	call   394a <sbrk>
    2e02:	89 c6                	mov    %eax,%esi
  amt = (BIG) - (uint)a;
    2e04:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2e09:	29 f0                	sub    %esi,%eax
  p = sbrk(amt);
    2e0b:	89 04 24             	mov    %eax,(%esp)
    2e0e:	e8 37 0b 00 00       	call   394a <sbrk>
  if (p != a) {
    2e13:	83 c4 10             	add    $0x10,%esp
    2e16:	39 c6                	cmp    %eax,%esi
    2e18:	0f 85 f8 02 00 00    	jne    3116 <sbrktest+0x3c6>
  a = sbrk(0);
    2e1e:	83 ec 0c             	sub    $0xc,%esp
  *lastaddr = 99;
    2e21:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff
  a = sbrk(0);
    2e28:	6a 00                	push   $0x0
    2e2a:	e8 1b 0b 00 00       	call   394a <sbrk>
  c = sbrk(-4096);
    2e2f:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  a = sbrk(0);
    2e36:	89 c6                	mov    %eax,%esi
  c = sbrk(-4096);
    2e38:	e8 0d 0b 00 00       	call   394a <sbrk>
  if(c == (char*)0xffffffff){
    2e3d:	83 c4 10             	add    $0x10,%esp
    2e40:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e43:	0f 84 b6 02 00 00    	je     30ff <sbrktest+0x3af>
  c = sbrk(0);
    2e49:	83 ec 0c             	sub    $0xc,%esp
    2e4c:	6a 00                	push   $0x0
    2e4e:	e8 f7 0a 00 00       	call   394a <sbrk>
  if(c != a - 4096){
    2e53:	8d 96 00 f0 ff ff    	lea    -0x1000(%esi),%edx
    2e59:	83 c4 10             	add    $0x10,%esp
    2e5c:	39 d0                	cmp    %edx,%eax
    2e5e:	0f 85 84 02 00 00    	jne    30e8 <sbrktest+0x398>
  a = sbrk(0);
    2e64:	83 ec 0c             	sub    $0xc,%esp
    2e67:	6a 00                	push   $0x0
    2e69:	e8 dc 0a 00 00       	call   394a <sbrk>
    2e6e:	89 c6                	mov    %eax,%esi
  c = sbrk(4096);
    2e70:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2e77:	e8 ce 0a 00 00       	call   394a <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2e7c:	83 c4 10             	add    $0x10,%esp
    2e7f:	39 c6                	cmp    %eax,%esi
  c = sbrk(4096);
    2e81:	89 c7                	mov    %eax,%edi
  if(c != a || sbrk(0) != a + 4096){
    2e83:	0f 85 48 02 00 00    	jne    30d1 <sbrktest+0x381>
    2e89:	83 ec 0c             	sub    $0xc,%esp
    2e8c:	6a 00                	push   $0x0
    2e8e:	e8 b7 0a 00 00       	call   394a <sbrk>
    2e93:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
    2e99:	83 c4 10             	add    $0x10,%esp
    2e9c:	39 d0                	cmp    %edx,%eax
    2e9e:	0f 85 2d 02 00 00    	jne    30d1 <sbrktest+0x381>
  if(*lastaddr == 99){
    2ea4:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2eab:	0f 84 09 02 00 00    	je     30ba <sbrktest+0x36a>
  a = sbrk(0);
    2eb1:	83 ec 0c             	sub    $0xc,%esp
    2eb4:	6a 00                	push   $0x0
    2eb6:	e8 8f 0a 00 00       	call   394a <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    2ebb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  a = sbrk(0);
    2ec2:	89 c6                	mov    %eax,%esi
  c = sbrk(-(sbrk(0) - oldbrk));
    2ec4:	e8 81 0a 00 00       	call   394a <sbrk>
    2ec9:	89 d9                	mov    %ebx,%ecx
    2ecb:	29 c1                	sub    %eax,%ecx
    2ecd:	89 0c 24             	mov    %ecx,(%esp)
    2ed0:	e8 75 0a 00 00       	call   394a <sbrk>
  if(c != a){
    2ed5:	83 c4 10             	add    $0x10,%esp
    2ed8:	39 c6                	cmp    %eax,%esi
    2eda:	0f 85 c3 01 00 00    	jne    30a3 <sbrktest+0x353>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2ee0:	be 00 00 00 80       	mov    $0x80000000,%esi
    ppid = getpid();
    2ee5:	e8 58 0a 00 00       	call   3942 <getpid>
    2eea:	89 c7                	mov    %eax,%edi
    pid = fork();
    2eec:	e8 c9 09 00 00       	call   38ba <fork>
		if(pid < 0){
    2ef1:	85 c0                	test   %eax,%eax
    2ef3:	0f 88 93 01 00 00    	js     308c <sbrktest+0x33c>
    if(pid == 0){
    2ef9:	0f 84 6b 01 00 00    	je     306a <sbrktest+0x31a>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2eff:	81 c6 50 c3 00 00    	add    $0xc350,%esi
    wait();
    2f05:	e8 c0 09 00 00       	call   38ca <wait>
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2f0a:	81 fe 80 84 1e 80    	cmp    $0x801e8480,%esi
    2f10:	75 d3                	jne    2ee5 <sbrktest+0x195>
  if(pipe(fds) != 0){
    2f12:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2f15:	83 ec 0c             	sub    $0xc,%esp
    2f18:	50                   	push   %eax
    2f19:	e8 b4 09 00 00       	call   38d2 <pipe>
    2f1e:	83 c4 10             	add    $0x10,%esp
    2f21:	85 c0                	test   %eax,%eax
    2f23:	0f 85 2e 01 00 00    	jne    3057 <sbrktest+0x307>
    2f29:	8d 7d c0             	lea    -0x40(%ebp),%edi
    2f2c:	89 fe                	mov    %edi,%esi
    2f2e:	eb 23                	jmp    2f53 <sbrktest+0x203>
    if(pids[i] != -1)
    2f30:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f33:	74 14                	je     2f49 <sbrktest+0x1f9>
      read(fds[0], &scratch, 1);
    2f35:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2f38:	83 ec 04             	sub    $0x4,%esp
    2f3b:	6a 01                	push   $0x1
    2f3d:	50                   	push   %eax
    2f3e:	ff 75 b8             	pushl  -0x48(%ebp)
    2f41:	e8 94 09 00 00       	call   38da <read>
    2f46:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f49:	8d 45 e8             	lea    -0x18(%ebp),%eax
    2f4c:	83 c6 04             	add    $0x4,%esi
    2f4f:	39 c6                	cmp    %eax,%esi
    2f51:	74 4f                	je     2fa2 <sbrktest+0x252>
    if((pids[i] = fork()) == 0){
    2f53:	e8 62 09 00 00       	call   38ba <fork>
    2f58:	85 c0                	test   %eax,%eax
    2f5a:	89 06                	mov    %eax,(%esi)
    2f5c:	75 d2                	jne    2f30 <sbrktest+0x1e0>
      sbrk(BIG - (uint)sbrk(0));
    2f5e:	83 ec 0c             	sub    $0xc,%esp
    2f61:	6a 00                	push   $0x0
    2f63:	e8 e2 09 00 00       	call   394a <sbrk>
    2f68:	ba 00 00 40 06       	mov    $0x6400000,%edx
    2f6d:	29 c2                	sub    %eax,%edx
    2f6f:	89 14 24             	mov    %edx,(%esp)
    2f72:	e8 d3 09 00 00       	call   394a <sbrk>
      write(fds[1], "x", 1);
    2f77:	83 c4 0c             	add    $0xc,%esp
    2f7a:	6a 01                	push   $0x1
    2f7c:	68 d1 46 00 00       	push   $0x46d1
    2f81:	ff 75 bc             	pushl  -0x44(%ebp)
    2f84:	e8 59 09 00 00       	call   38e2 <write>
    2f89:	83 c4 10             	add    $0x10,%esp
    2f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(;;) sleep(1000);
    2f90:	83 ec 0c             	sub    $0xc,%esp
    2f93:	68 e8 03 00 00       	push   $0x3e8
    2f98:	e8 b5 09 00 00       	call   3952 <sleep>
    2f9d:	83 c4 10             	add    $0x10,%esp
    2fa0:	eb ee                	jmp    2f90 <sbrktest+0x240>
  c = sbrk(4096);
    2fa2:	83 ec 0c             	sub    $0xc,%esp
    2fa5:	68 00 10 00 00       	push   $0x1000
    2faa:	e8 9b 09 00 00       	call   394a <sbrk>
    2faf:	83 c4 10             	add    $0x10,%esp
    2fb2:	89 45 a4             	mov    %eax,-0x5c(%ebp)
    if(pids[i] == -1)
    2fb5:	8b 07                	mov    (%edi),%eax
    2fb7:	83 f8 ff             	cmp    $0xffffffff,%eax
    2fba:	74 11                	je     2fcd <sbrktest+0x27d>
    kill(pids[i]);
    2fbc:	83 ec 0c             	sub    $0xc,%esp
    2fbf:	50                   	push   %eax
    2fc0:	e8 2d 09 00 00       	call   38f2 <kill>
    wait();
    2fc5:	e8 00 09 00 00       	call   38ca <wait>
    2fca:	83 c4 10             	add    $0x10,%esp
    2fcd:	83 c7 04             	add    $0x4,%edi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2fd0:	39 fe                	cmp    %edi,%esi
    2fd2:	75 e1                	jne    2fb5 <sbrktest+0x265>
  if(c == (char*)0xffffffff){
    2fd4:	83 7d a4 ff          	cmpl   $0xffffffff,-0x5c(%ebp)
    2fd8:	74 66                	je     3040 <sbrktest+0x2f0>
  if(sbrk(0) > oldbrk)
    2fda:	83 ec 0c             	sub    $0xc,%esp
    2fdd:	6a 00                	push   $0x0
    2fdf:	e8 66 09 00 00       	call   394a <sbrk>
    2fe4:	83 c4 10             	add    $0x10,%esp
    2fe7:	39 d8                	cmp    %ebx,%eax
    2fe9:	77 3c                	ja     3027 <sbrktest+0x2d7>
  printf(stdout, "sbrk test OK\n");
    2feb:	83 ec 08             	sub    $0x8,%esp
    2fee:	68 10 4c 00 00       	push   $0x4c10
    2ff3:	ff 35 28 5e 00 00    	pushl  0x5e28
    2ff9:	e8 22 0a 00 00       	call   3a20 <printf>
}
    2ffe:	83 c4 10             	add    $0x10,%esp
    3001:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3004:	5b                   	pop    %ebx
    3005:	5e                   	pop    %esi
    3006:	5f                   	pop    %edi
    3007:	5d                   	pop    %ebp
    3008:	c3                   	ret    
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    3009:	83 ec 0c             	sub    $0xc,%esp
    300c:	50                   	push   %eax
    300d:	56                   	push   %esi
    300e:	57                   	push   %edi
    300f:	68 73 4b 00 00       	push   $0x4b73
    3014:	ff 35 28 5e 00 00    	pushl  0x5e28
    301a:	e8 01 0a 00 00       	call   3a20 <printf>
      exit();
    301f:	83 c4 20             	add    $0x20,%esp
    3022:	e8 9b 08 00 00       	call   38c2 <exit>
    sbrk(-(sbrk(0) - oldbrk));
    3027:	83 ec 0c             	sub    $0xc,%esp
    302a:	6a 00                	push   $0x0
    302c:	e8 19 09 00 00       	call   394a <sbrk>
    3031:	29 c3                	sub    %eax,%ebx
    3033:	89 1c 24             	mov    %ebx,(%esp)
    3036:	e8 0f 09 00 00       	call   394a <sbrk>
    303b:	83 c4 10             	add    $0x10,%esp
    303e:	eb ab                	jmp    2feb <sbrktest+0x29b>
    printf(stdout, "failed sbrk leaked memory\n");
    3040:	50                   	push   %eax
    3041:	50                   	push   %eax
    3042:	68 f5 4b 00 00       	push   $0x4bf5
    3047:	ff 35 28 5e 00 00    	pushl  0x5e28
    304d:	e8 ce 09 00 00       	call   3a20 <printf>
    exit();
    3052:	e8 6b 08 00 00       	call   38c2 <exit>
    printf(1, "pipe() failed\n");
    3057:	52                   	push   %edx
    3058:	52                   	push   %edx
    3059:	68 b1 40 00 00       	push   $0x40b1
    305e:	6a 01                	push   $0x1
    3060:	e8 bb 09 00 00       	call   3a20 <printf>
    exit();
    3065:	e8 58 08 00 00       	call   38c2 <exit>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    306a:	0f be 06             	movsbl (%esi),%eax
    306d:	50                   	push   %eax
    306e:	56                   	push   %esi
    306f:	68 dc 4b 00 00       	push   $0x4bdc
    3074:	ff 35 28 5e 00 00    	pushl  0x5e28
    307a:	e8 a1 09 00 00       	call   3a20 <printf>
      kill(ppid);
    307f:	89 3c 24             	mov    %edi,(%esp)
    3082:	e8 6b 08 00 00       	call   38f2 <kill>
      exit();
    3087:	e8 36 08 00 00       	call   38c2 <exit>
      printf(stdout, "fork failed\n");
    308c:	51                   	push   %ecx
    308d:	51                   	push   %ecx
    308e:	68 b9 4c 00 00       	push   $0x4cb9
    3093:	ff 35 28 5e 00 00    	pushl  0x5e28
    3099:	e8 82 09 00 00       	call   3a20 <printf>
      exit();
    309e:	e8 1f 08 00 00       	call   38c2 <exit>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    30a3:	50                   	push   %eax
    30a4:	56                   	push   %esi
    30a5:	68 bc 53 00 00       	push   $0x53bc
    30aa:	ff 35 28 5e 00 00    	pushl  0x5e28
    30b0:	e8 6b 09 00 00       	call   3a20 <printf>
    exit();
    30b5:	e8 08 08 00 00       	call   38c2 <exit>
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    30ba:	53                   	push   %ebx
    30bb:	53                   	push   %ebx
    30bc:	68 8c 53 00 00       	push   $0x538c
    30c1:	ff 35 28 5e 00 00    	pushl  0x5e28
    30c7:	e8 54 09 00 00       	call   3a20 <printf>
    exit();
    30cc:	e8 f1 07 00 00       	call   38c2 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    30d1:	57                   	push   %edi
    30d2:	56                   	push   %esi
    30d3:	68 64 53 00 00       	push   $0x5364
    30d8:	ff 35 28 5e 00 00    	pushl  0x5e28
    30de:	e8 3d 09 00 00       	call   3a20 <printf>
    exit();
    30e3:	e8 da 07 00 00       	call   38c2 <exit>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    30e8:	50                   	push   %eax
    30e9:	56                   	push   %esi
    30ea:	68 2c 53 00 00       	push   $0x532c
    30ef:	ff 35 28 5e 00 00    	pushl  0x5e28
    30f5:	e8 26 09 00 00       	call   3a20 <printf>
    exit();
    30fa:	e8 c3 07 00 00       	call   38c2 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    30ff:	56                   	push   %esi
    3100:	56                   	push   %esi
    3101:	68 c1 4b 00 00       	push   $0x4bc1
    3106:	ff 35 28 5e 00 00    	pushl  0x5e28
    310c:	e8 0f 09 00 00       	call   3a20 <printf>
    exit();
    3111:	e8 ac 07 00 00       	call   38c2 <exit>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    3116:	57                   	push   %edi
    3117:	57                   	push   %edi
    3118:	68 ec 52 00 00       	push   $0x52ec
    311d:	ff 35 28 5e 00 00    	pushl  0x5e28
    3123:	e8 f8 08 00 00       	call   3a20 <printf>
    exit();
    3128:	e8 95 07 00 00       	call   38c2 <exit>
    exit();
    312d:	e8 90 07 00 00       	call   38c2 <exit>
    printf(stdout, "sbrk test failed post-fork\n");
    3132:	50                   	push   %eax
    3133:	50                   	push   %eax
    3134:	68 a5 4b 00 00       	push   $0x4ba5
    3139:	ff 35 28 5e 00 00    	pushl  0x5e28
    313f:	e8 dc 08 00 00       	call   3a20 <printf>
    exit();
    3144:	e8 79 07 00 00       	call   38c2 <exit>
    printf(stdout, "sbrk test fork failed\n");
    3149:	50                   	push   %eax
    314a:	50                   	push   %eax
    314b:	68 8e 4b 00 00       	push   $0x4b8e
    3150:	ff 35 28 5e 00 00    	pushl  0x5e28
    3156:	e8 c5 08 00 00       	call   3a20 <printf>
    exit();
    315b:	e8 62 07 00 00       	call   38c2 <exit>

00003160 <validateint>:
{
    3160:	55                   	push   %ebp
    3161:	89 e5                	mov    %esp,%ebp
}
    3163:	5d                   	pop    %ebp
    3164:	c3                   	ret    
    3165:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003170 <validatetest>:
{
    3170:	55                   	push   %ebp
    3171:	89 e5                	mov    %esp,%ebp
    3173:	56                   	push   %esi
    3174:	53                   	push   %ebx
  for(p = 0; p <= (uint)hi; p += 4096){
    3175:	31 db                	xor    %ebx,%ebx
  printf(stdout, "validate test\n");
    3177:	83 ec 08             	sub    $0x8,%esp
    317a:	68 1e 4c 00 00       	push   $0x4c1e
    317f:	ff 35 28 5e 00 00    	pushl  0x5e28
    3185:	e8 96 08 00 00       	call   3a20 <printf>
    318a:	83 c4 10             	add    $0x10,%esp
    318d:	8d 76 00             	lea    0x0(%esi),%esi
    if((pid = fork()) == 0){
    3190:	e8 25 07 00 00       	call   38ba <fork>
    3195:	85 c0                	test   %eax,%eax
    3197:	89 c6                	mov    %eax,%esi
    3199:	74 63                	je     31fe <validatetest+0x8e>
    sleep(0);
    319b:	83 ec 0c             	sub    $0xc,%esp
    319e:	6a 00                	push   $0x0
    31a0:	e8 ad 07 00 00       	call   3952 <sleep>
    sleep(0);
    31a5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    31ac:	e8 a1 07 00 00       	call   3952 <sleep>
    kill(pid);
    31b1:	89 34 24             	mov    %esi,(%esp)
    31b4:	e8 39 07 00 00       	call   38f2 <kill>
    wait();
    31b9:	e8 0c 07 00 00       	call   38ca <wait>
    if(link("nosuchfile", (char*)p) != -1){
    31be:	58                   	pop    %eax
    31bf:	5a                   	pop    %edx
    31c0:	53                   	push   %ebx
    31c1:	68 2d 4c 00 00       	push   $0x4c2d
    31c6:	e8 57 07 00 00       	call   3922 <link>
    31cb:	83 c4 10             	add    $0x10,%esp
    31ce:	83 f8 ff             	cmp    $0xffffffff,%eax
    31d1:	75 30                	jne    3203 <validatetest+0x93>
  for(p = 0; p <= (uint)hi; p += 4096){
    31d3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    31d9:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    31df:	75 af                	jne    3190 <validatetest+0x20>
  printf(stdout, "validate ok\n");
    31e1:	83 ec 08             	sub    $0x8,%esp
    31e4:	68 51 4c 00 00       	push   $0x4c51
    31e9:	ff 35 28 5e 00 00    	pushl  0x5e28
    31ef:	e8 2c 08 00 00       	call   3a20 <printf>
}
    31f4:	83 c4 10             	add    $0x10,%esp
    31f7:	8d 65 f8             	lea    -0x8(%ebp),%esp
    31fa:	5b                   	pop    %ebx
    31fb:	5e                   	pop    %esi
    31fc:	5d                   	pop    %ebp
    31fd:	c3                   	ret    
      exit();
    31fe:	e8 bf 06 00 00       	call   38c2 <exit>
      printf(stdout, "link should not succeed\n");
    3203:	83 ec 08             	sub    $0x8,%esp
    3206:	68 38 4c 00 00       	push   $0x4c38
    320b:	ff 35 28 5e 00 00    	pushl  0x5e28
    3211:	e8 0a 08 00 00       	call   3a20 <printf>
      exit();
    3216:	e8 a7 06 00 00       	call   38c2 <exit>
    321b:	90                   	nop
    321c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003220 <bsstest>:
{
    3220:	55                   	push   %ebp
    3221:	89 e5                	mov    %esp,%ebp
    3223:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "bss test\n");
    3226:	68 5e 4c 00 00       	push   $0x4c5e
    322b:	ff 35 28 5e 00 00    	pushl  0x5e28
    3231:	e8 ea 07 00 00       	call   3a20 <printf>
    if(uninit[i] != '\0'){
    3236:	83 c4 10             	add    $0x10,%esp
    3239:	80 3d e0 5e 00 00 00 	cmpb   $0x0,0x5ee0
    3240:	75 39                	jne    327b <bsstest+0x5b>
  for(i = 0; i < sizeof(uninit); i++){
    3242:	b8 01 00 00 00       	mov    $0x1,%eax
    3247:	89 f6                	mov    %esi,%esi
    3249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    if(uninit[i] != '\0'){
    3250:	80 b8 e0 5e 00 00 00 	cmpb   $0x0,0x5ee0(%eax)
    3257:	75 22                	jne    327b <bsstest+0x5b>
  for(i = 0; i < sizeof(uninit); i++){
    3259:	83 c0 01             	add    $0x1,%eax
    325c:	3d 10 27 00 00       	cmp    $0x2710,%eax
    3261:	75 ed                	jne    3250 <bsstest+0x30>
  printf(stdout, "bss test ok\n");
    3263:	83 ec 08             	sub    $0x8,%esp
    3266:	68 79 4c 00 00       	push   $0x4c79
    326b:	ff 35 28 5e 00 00    	pushl  0x5e28
    3271:	e8 aa 07 00 00       	call   3a20 <printf>
}
    3276:	83 c4 10             	add    $0x10,%esp
    3279:	c9                   	leave  
    327a:	c3                   	ret    
      printf(stdout, "bss test failed\n");
    327b:	83 ec 08             	sub    $0x8,%esp
    327e:	68 68 4c 00 00       	push   $0x4c68
    3283:	ff 35 28 5e 00 00    	pushl  0x5e28
    3289:	e8 92 07 00 00       	call   3a20 <printf>
      exit();
    328e:	e8 2f 06 00 00       	call   38c2 <exit>
    3293:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000032a0 <bigargtest>:
{
    32a0:	55                   	push   %ebp
    32a1:	89 e5                	mov    %esp,%ebp
    32a3:	83 ec 14             	sub    $0x14,%esp
  unlink("bigarg-ok");
    32a6:	68 86 4c 00 00       	push   $0x4c86
    32ab:	e8 62 06 00 00       	call   3912 <unlink>
  pid = fork();
    32b0:	e8 05 06 00 00       	call   38ba <fork>
  if(pid == 0){
    32b5:	83 c4 10             	add    $0x10,%esp
    32b8:	85 c0                	test   %eax,%eax
    32ba:	74 3f                	je     32fb <bigargtest+0x5b>
  } else if(pid < 0){
    32bc:	0f 88 c2 00 00 00    	js     3384 <bigargtest+0xe4>
  wait();
    32c2:	e8 03 06 00 00       	call   38ca <wait>
  fd = open("bigarg-ok", 0);
    32c7:	83 ec 08             	sub    $0x8,%esp
    32ca:	6a 00                	push   $0x0
    32cc:	68 86 4c 00 00       	push   $0x4c86
    32d1:	e8 2c 06 00 00       	call   3902 <open>
  if(fd < 0){
    32d6:	83 c4 10             	add    $0x10,%esp
    32d9:	85 c0                	test   %eax,%eax
    32db:	0f 88 8c 00 00 00    	js     336d <bigargtest+0xcd>
  close(fd);
    32e1:	83 ec 0c             	sub    $0xc,%esp
    32e4:	50                   	push   %eax
    32e5:	e8 00 06 00 00       	call   38ea <close>
  unlink("bigarg-ok");
    32ea:	c7 04 24 86 4c 00 00 	movl   $0x4c86,(%esp)
    32f1:	e8 1c 06 00 00       	call   3912 <unlink>
}
    32f6:	83 c4 10             	add    $0x10,%esp
    32f9:	c9                   	leave  
    32fa:	c3                   	ret    
    32fb:	b8 40 5e 00 00       	mov    $0x5e40,%eax
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    3300:	c7 00 e0 53 00 00    	movl   $0x53e0,(%eax)
    3306:	83 c0 04             	add    $0x4,%eax
    for(i = 0; i < MAXARG-1; i++)
    3309:	3d bc 5e 00 00       	cmp    $0x5ebc,%eax
    330e:	75 f0                	jne    3300 <bigargtest+0x60>
    printf(stdout, "bigarg test\n");
    3310:	51                   	push   %ecx
    3311:	51                   	push   %ecx
    3312:	68 90 4c 00 00       	push   $0x4c90
    3317:	ff 35 28 5e 00 00    	pushl  0x5e28
    args[MAXARG-1] = 0;
    331d:	c7 05 bc 5e 00 00 00 	movl   $0x0,0x5ebc
    3324:	00 00 00 
    printf(stdout, "bigarg test\n");
    3327:	e8 f4 06 00 00       	call   3a20 <printf>
    exec("echo", args);
    332c:	58                   	pop    %eax
    332d:	5a                   	pop    %edx
    332e:	68 40 5e 00 00       	push   $0x5e40
    3333:	68 5d 3e 00 00       	push   $0x3e5d
    3338:	e8 bd 05 00 00       	call   38fa <exec>
    printf(stdout, "bigarg test ok\n");
    333d:	59                   	pop    %ecx
    333e:	58                   	pop    %eax
    333f:	68 9d 4c 00 00       	push   $0x4c9d
    3344:	ff 35 28 5e 00 00    	pushl  0x5e28
    334a:	e8 d1 06 00 00       	call   3a20 <printf>
    fd = open("bigarg-ok", O_CREATE);
    334f:	58                   	pop    %eax
    3350:	5a                   	pop    %edx
    3351:	68 00 02 00 00       	push   $0x200
    3356:	68 86 4c 00 00       	push   $0x4c86
    335b:	e8 a2 05 00 00       	call   3902 <open>
    close(fd);
    3360:	89 04 24             	mov    %eax,(%esp)
    3363:	e8 82 05 00 00       	call   38ea <close>
    exit();
    3368:	e8 55 05 00 00       	call   38c2 <exit>
    printf(stdout, "bigarg test failed!\n");
    336d:	50                   	push   %eax
    336e:	50                   	push   %eax
    336f:	68 c6 4c 00 00       	push   $0x4cc6
    3374:	ff 35 28 5e 00 00    	pushl  0x5e28
    337a:	e8 a1 06 00 00       	call   3a20 <printf>
    exit();
    337f:	e8 3e 05 00 00       	call   38c2 <exit>
    printf(stdout, "bigargtest: fork failed\n");
    3384:	52                   	push   %edx
    3385:	52                   	push   %edx
    3386:	68 ad 4c 00 00       	push   $0x4cad
    338b:	ff 35 28 5e 00 00    	pushl  0x5e28
    3391:	e8 8a 06 00 00       	call   3a20 <printf>
    exit();
    3396:	e8 27 05 00 00       	call   38c2 <exit>
    339b:	90                   	nop
    339c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000033a0 <fsfull>:
{
    33a0:	55                   	push   %ebp
    33a1:	89 e5                	mov    %esp,%ebp
    33a3:	57                   	push   %edi
    33a4:	56                   	push   %esi
    33a5:	53                   	push   %ebx
  for(nfiles = 0; ; nfiles++){
    33a6:	31 db                	xor    %ebx,%ebx
{
    33a8:	83 ec 54             	sub    $0x54,%esp
  printf(1, "fsfull test\n");
    33ab:	68 db 4c 00 00       	push   $0x4cdb
    33b0:	6a 01                	push   $0x1
    33b2:	e8 69 06 00 00       	call   3a20 <printf>
    33b7:	83 c4 10             	add    $0x10,%esp
    33ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    name[1] = '0' + nfiles / 1000;
    33c0:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    33c5:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    printf(1, "writing %s\n", name);
    33ca:	83 ec 04             	sub    $0x4,%esp
    name[1] = '0' + nfiles / 1000;
    33cd:	f7 e3                	mul    %ebx
    name[0] = 'f';
    33cf:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[5] = '\0';
    33d3:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    33d7:	c1 ea 06             	shr    $0x6,%edx
    33da:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    33dd:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    name[1] = '0' + nfiles / 1000;
    33e3:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    33e6:	89 d8                	mov    %ebx,%eax
    33e8:	29 d0                	sub    %edx,%eax
    33ea:	89 c2                	mov    %eax,%edx
    33ec:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    33f1:	f7 e2                	mul    %edx
    name[3] = '0' + (nfiles % 100) / 10;
    33f3:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    33f8:	c1 ea 05             	shr    $0x5,%edx
    33fb:	83 c2 30             	add    $0x30,%edx
    33fe:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3401:	f7 e3                	mul    %ebx
    3403:	89 d8                	mov    %ebx,%eax
    3405:	c1 ea 05             	shr    $0x5,%edx
    3408:	6b d2 64             	imul   $0x64,%edx,%edx
    340b:	29 d0                	sub    %edx,%eax
    340d:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    340f:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    3411:	c1 ea 03             	shr    $0x3,%edx
    3414:	83 c2 30             	add    $0x30,%edx
    3417:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    341a:	f7 e1                	mul    %ecx
    341c:	89 d9                	mov    %ebx,%ecx
    341e:	c1 ea 03             	shr    $0x3,%edx
    3421:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3424:	01 c0                	add    %eax,%eax
    3426:	29 c1                	sub    %eax,%ecx
    3428:	89 c8                	mov    %ecx,%eax
    342a:	83 c0 30             	add    $0x30,%eax
    342d:	88 45 ac             	mov    %al,-0x54(%ebp)
    printf(1, "writing %s\n", name);
    3430:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3433:	50                   	push   %eax
    3434:	68 e8 4c 00 00       	push   $0x4ce8
    3439:	6a 01                	push   $0x1
    343b:	e8 e0 05 00 00       	call   3a20 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3440:	58                   	pop    %eax
    3441:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3444:	5a                   	pop    %edx
    3445:	68 02 02 00 00       	push   $0x202
    344a:	50                   	push   %eax
    344b:	e8 b2 04 00 00       	call   3902 <open>
    if(fd < 0){
    3450:	83 c4 10             	add    $0x10,%esp
    3453:	85 c0                	test   %eax,%eax
    int fd = open(name, O_CREATE|O_RDWR);
    3455:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    3457:	78 57                	js     34b0 <fsfull+0x110>
    int total = 0;
    3459:	31 f6                	xor    %esi,%esi
    345b:	eb 05                	jmp    3462 <fsfull+0xc2>
    345d:	8d 76 00             	lea    0x0(%esi),%esi
      total += cc;
    3460:	01 c6                	add    %eax,%esi
      int cc = write(fd, buf, 512);
    3462:	83 ec 04             	sub    $0x4,%esp
    3465:	68 00 02 00 00       	push   $0x200
    346a:	68 00 86 00 00       	push   $0x8600
    346f:	57                   	push   %edi
    3470:	e8 6d 04 00 00       	call   38e2 <write>
      if(cc < 512)
    3475:	83 c4 10             	add    $0x10,%esp
    3478:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    347d:	7f e1                	jg     3460 <fsfull+0xc0>
    printf(1, "wrote %d bytes\n", total);
    347f:	83 ec 04             	sub    $0x4,%esp
    3482:	56                   	push   %esi
    3483:	68 04 4d 00 00       	push   $0x4d04
    3488:	6a 01                	push   $0x1
    348a:	e8 91 05 00 00       	call   3a20 <printf>
    close(fd);
    348f:	89 3c 24             	mov    %edi,(%esp)
    3492:	e8 53 04 00 00       	call   38ea <close>
    if(total == 0)
    3497:	83 c4 10             	add    $0x10,%esp
    349a:	85 f6                	test   %esi,%esi
    349c:	74 28                	je     34c6 <fsfull+0x126>
  for(nfiles = 0; ; nfiles++){
    349e:	83 c3 01             	add    $0x1,%ebx
    34a1:	e9 1a ff ff ff       	jmp    33c0 <fsfull+0x20>
    34a6:	8d 76 00             	lea    0x0(%esi),%esi
    34a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      printf(1, "open %s failed\n", name);
    34b0:	8d 45 a8             	lea    -0x58(%ebp),%eax
    34b3:	83 ec 04             	sub    $0x4,%esp
    34b6:	50                   	push   %eax
    34b7:	68 f4 4c 00 00       	push   $0x4cf4
    34bc:	6a 01                	push   $0x1
    34be:	e8 5d 05 00 00       	call   3a20 <printf>
      break;
    34c3:	83 c4 10             	add    $0x10,%esp
    name[1] = '0' + nfiles / 1000;
    34c6:	bf d3 4d 62 10       	mov    $0x10624dd3,%edi
    name[2] = '0' + (nfiles % 1000) / 100;
    34cb:	be 1f 85 eb 51       	mov    $0x51eb851f,%esi
    name[1] = '0' + nfiles / 1000;
    34d0:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    34d2:	b9 cd cc cc cc       	mov    $0xcccccccd,%ecx
    unlink(name);
    34d7:	83 ec 0c             	sub    $0xc,%esp
    name[1] = '0' + nfiles / 1000;
    34da:	f7 e7                	mul    %edi
    name[0] = 'f';
    34dc:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[5] = '\0';
    34e0:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
    name[1] = '0' + nfiles / 1000;
    34e4:	c1 ea 06             	shr    $0x6,%edx
    34e7:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    34ea:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
    name[1] = '0' + nfiles / 1000;
    34f0:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    34f3:	89 d8                	mov    %ebx,%eax
    34f5:	29 d0                	sub    %edx,%eax
    34f7:	f7 e6                	mul    %esi
    name[3] = '0' + (nfiles % 100) / 10;
    34f9:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    34fb:	c1 ea 05             	shr    $0x5,%edx
    34fe:	83 c2 30             	add    $0x30,%edx
    3501:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3504:	f7 e6                	mul    %esi
    3506:	89 d8                	mov    %ebx,%eax
    3508:	c1 ea 05             	shr    $0x5,%edx
    350b:	6b d2 64             	imul   $0x64,%edx,%edx
    350e:	29 d0                	sub    %edx,%eax
    3510:	f7 e1                	mul    %ecx
    name[4] = '0' + (nfiles % 10);
    3512:	89 d8                	mov    %ebx,%eax
    name[3] = '0' + (nfiles % 100) / 10;
    3514:	c1 ea 03             	shr    $0x3,%edx
    3517:	83 c2 30             	add    $0x30,%edx
    351a:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    351d:	f7 e1                	mul    %ecx
    351f:	89 d9                	mov    %ebx,%ecx
    nfiles--;
    3521:	83 eb 01             	sub    $0x1,%ebx
    name[4] = '0' + (nfiles % 10);
    3524:	c1 ea 03             	shr    $0x3,%edx
    3527:	8d 04 92             	lea    (%edx,%edx,4),%eax
    352a:	01 c0                	add    %eax,%eax
    352c:	29 c1                	sub    %eax,%ecx
    352e:	89 c8                	mov    %ecx,%eax
    3530:	83 c0 30             	add    $0x30,%eax
    3533:	88 45 ac             	mov    %al,-0x54(%ebp)
    unlink(name);
    3536:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3539:	50                   	push   %eax
    353a:	e8 d3 03 00 00       	call   3912 <unlink>
  while(nfiles >= 0){
    353f:	83 c4 10             	add    $0x10,%esp
    3542:	83 fb ff             	cmp    $0xffffffff,%ebx
    3545:	75 89                	jne    34d0 <fsfull+0x130>
  printf(1, "fsfull test finished\n");
    3547:	83 ec 08             	sub    $0x8,%esp
    354a:	68 14 4d 00 00       	push   $0x4d14
    354f:	6a 01                	push   $0x1
    3551:	e8 ca 04 00 00       	call   3a20 <printf>
}
    3556:	83 c4 10             	add    $0x10,%esp
    3559:	8d 65 f4             	lea    -0xc(%ebp),%esp
    355c:	5b                   	pop    %ebx
    355d:	5e                   	pop    %esi
    355e:	5f                   	pop    %edi
    355f:	5d                   	pop    %ebp
    3560:	c3                   	ret    
    3561:	eb 0d                	jmp    3570 <uio>
    3563:	90                   	nop
    3564:	90                   	nop
    3565:	90                   	nop
    3566:	90                   	nop
    3567:	90                   	nop
    3568:	90                   	nop
    3569:	90                   	nop
    356a:	90                   	nop
    356b:	90                   	nop
    356c:	90                   	nop
    356d:	90                   	nop
    356e:	90                   	nop
    356f:	90                   	nop

00003570 <uio>:
{
    3570:	55                   	push   %ebp
    3571:	89 e5                	mov    %esp,%ebp
    3573:	83 ec 10             	sub    $0x10,%esp
  printf(1, "uio test\n");
    3576:	68 2a 4d 00 00       	push   $0x4d2a
    357b:	6a 01                	push   $0x1
    357d:	e8 9e 04 00 00       	call   3a20 <printf>
  pid = fork();
    3582:	e8 33 03 00 00       	call   38ba <fork>
  if(pid == 0){
    3587:	83 c4 10             	add    $0x10,%esp
    358a:	85 c0                	test   %eax,%eax
    358c:	74 1b                	je     35a9 <uio+0x39>
  } else if(pid < 0){
    358e:	78 3d                	js     35cd <uio+0x5d>
  wait();
    3590:	e8 35 03 00 00       	call   38ca <wait>
  printf(1, "uio test done\n");
    3595:	83 ec 08             	sub    $0x8,%esp
    3598:	68 34 4d 00 00       	push   $0x4d34
    359d:	6a 01                	push   $0x1
    359f:	e8 7c 04 00 00       	call   3a20 <printf>
}
    35a4:	83 c4 10             	add    $0x10,%esp
    35a7:	c9                   	leave  
    35a8:	c3                   	ret    
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    35a9:	b8 09 00 00 00       	mov    $0x9,%eax
    35ae:	ba 70 00 00 00       	mov    $0x70,%edx
    35b3:	ee                   	out    %al,(%dx)
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    35b4:	ba 71 00 00 00       	mov    $0x71,%edx
    35b9:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    35ba:	52                   	push   %edx
    35bb:	52                   	push   %edx
    35bc:	68 c0 54 00 00       	push   $0x54c0
    35c1:	6a 01                	push   $0x1
    35c3:	e8 58 04 00 00       	call   3a20 <printf>
    exit();
    35c8:	e8 f5 02 00 00       	call   38c2 <exit>
    printf (1, "fork failed\n");
    35cd:	50                   	push   %eax
    35ce:	50                   	push   %eax
    35cf:	68 b9 4c 00 00       	push   $0x4cb9
    35d4:	6a 01                	push   $0x1
    35d6:	e8 45 04 00 00       	call   3a20 <printf>
    exit();
    35db:	e8 e2 02 00 00       	call   38c2 <exit>

000035e0 <argptest>:
{
    35e0:	55                   	push   %ebp
    35e1:	89 e5                	mov    %esp,%ebp
    35e3:	53                   	push   %ebx
    35e4:	83 ec 0c             	sub    $0xc,%esp
  fd = open("init", O_RDONLY);
    35e7:	6a 00                	push   $0x0
    35e9:	68 43 4d 00 00       	push   $0x4d43
    35ee:	e8 0f 03 00 00       	call   3902 <open>
  if (fd < 0) {
    35f3:	83 c4 10             	add    $0x10,%esp
    35f6:	85 c0                	test   %eax,%eax
    35f8:	78 39                	js     3633 <argptest+0x53>
  read(fd, sbrk(0) - 1, -1);
    35fa:	83 ec 0c             	sub    $0xc,%esp
    35fd:	89 c3                	mov    %eax,%ebx
    35ff:	6a 00                	push   $0x0
    3601:	e8 44 03 00 00       	call   394a <sbrk>
    3606:	83 c4 0c             	add    $0xc,%esp
    3609:	83 e8 01             	sub    $0x1,%eax
    360c:	6a ff                	push   $0xffffffff
    360e:	50                   	push   %eax
    360f:	53                   	push   %ebx
    3610:	e8 c5 02 00 00       	call   38da <read>
  close(fd);
    3615:	89 1c 24             	mov    %ebx,(%esp)
    3618:	e8 cd 02 00 00       	call   38ea <close>
  printf(1, "arg test passed\n");
    361d:	58                   	pop    %eax
    361e:	5a                   	pop    %edx
    361f:	68 55 4d 00 00       	push   $0x4d55
    3624:	6a 01                	push   $0x1
    3626:	e8 f5 03 00 00       	call   3a20 <printf>
}
    362b:	83 c4 10             	add    $0x10,%esp
    362e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3631:	c9                   	leave  
    3632:	c3                   	ret    
    printf(2, "open failed\n");
    3633:	51                   	push   %ecx
    3634:	51                   	push   %ecx
    3635:	68 48 4d 00 00       	push   $0x4d48
    363a:	6a 02                	push   $0x2
    363c:	e8 df 03 00 00       	call   3a20 <printf>
    exit();
    3641:	e8 7c 02 00 00       	call   38c2 <exit>
    3646:	8d 76 00             	lea    0x0(%esi),%esi
    3649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003650 <rand>:
  randstate = randstate * 1664525 + 1013904223;
    3650:	69 05 24 5e 00 00 0d 	imul   $0x19660d,0x5e24,%eax
    3657:	66 19 00 
{
    365a:	55                   	push   %ebp
    365b:	89 e5                	mov    %esp,%ebp
}
    365d:	5d                   	pop    %ebp
  randstate = randstate * 1664525 + 1013904223;
    365e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3663:	a3 24 5e 00 00       	mov    %eax,0x5e24
}
    3668:	c3                   	ret    
    3669:	66 90                	xchg   %ax,%ax
    366b:	66 90                	xchg   %ax,%ax
    366d:	66 90                	xchg   %ax,%ax
    366f:	90                   	nop

00003670 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    3670:	55                   	push   %ebp
    3671:	89 e5                	mov    %esp,%ebp
    3673:	53                   	push   %ebx
    3674:	8b 45 08             	mov    0x8(%ebp),%eax
    3677:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    367a:	89 c2                	mov    %eax,%edx
    367c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3680:	83 c1 01             	add    $0x1,%ecx
    3683:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    3687:	83 c2 01             	add    $0x1,%edx
    368a:	84 db                	test   %bl,%bl
    368c:	88 5a ff             	mov    %bl,-0x1(%edx)
    368f:	75 ef                	jne    3680 <strcpy+0x10>
    ;
  return os;
}
    3691:	5b                   	pop    %ebx
    3692:	5d                   	pop    %ebp
    3693:	c3                   	ret    
    3694:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    369a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000036a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    36a0:	55                   	push   %ebp
    36a1:	89 e5                	mov    %esp,%ebp
    36a3:	53                   	push   %ebx
    36a4:	8b 55 08             	mov    0x8(%ebp),%edx
    36a7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    36aa:	0f b6 02             	movzbl (%edx),%eax
    36ad:	0f b6 19             	movzbl (%ecx),%ebx
    36b0:	84 c0                	test   %al,%al
    36b2:	75 1c                	jne    36d0 <strcmp+0x30>
    36b4:	eb 2a                	jmp    36e0 <strcmp+0x40>
    36b6:	8d 76 00             	lea    0x0(%esi),%esi
    36b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    36c0:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
    36c3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    36c6:	83 c1 01             	add    $0x1,%ecx
    36c9:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
    36cc:	84 c0                	test   %al,%al
    36ce:	74 10                	je     36e0 <strcmp+0x40>
    36d0:	38 d8                	cmp    %bl,%al
    36d2:	74 ec                	je     36c0 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
    36d4:	29 d8                	sub    %ebx,%eax
}
    36d6:	5b                   	pop    %ebx
    36d7:	5d                   	pop    %ebp
    36d8:	c3                   	ret    
    36d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    36e0:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
    36e2:	29 d8                	sub    %ebx,%eax
}
    36e4:	5b                   	pop    %ebx
    36e5:	5d                   	pop    %ebp
    36e6:	c3                   	ret    
    36e7:	89 f6                	mov    %esi,%esi
    36e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000036f0 <strlen>:

uint
strlen(const char *s)
{
    36f0:	55                   	push   %ebp
    36f1:	89 e5                	mov    %esp,%ebp
    36f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    36f6:	80 39 00             	cmpb   $0x0,(%ecx)
    36f9:	74 15                	je     3710 <strlen+0x20>
    36fb:	31 d2                	xor    %edx,%edx
    36fd:	8d 76 00             	lea    0x0(%esi),%esi
    3700:	83 c2 01             	add    $0x1,%edx
    3703:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    3707:	89 d0                	mov    %edx,%eax
    3709:	75 f5                	jne    3700 <strlen+0x10>
    ;
  return n;
}
    370b:	5d                   	pop    %ebp
    370c:	c3                   	ret    
    370d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
    3710:	31 c0                	xor    %eax,%eax
}
    3712:	5d                   	pop    %ebp
    3713:	c3                   	ret    
    3714:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    371a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00003720 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3720:	55                   	push   %ebp
    3721:	89 e5                	mov    %esp,%ebp
    3723:	57                   	push   %edi
    3724:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3727:	8b 4d 10             	mov    0x10(%ebp),%ecx
    372a:	8b 45 0c             	mov    0xc(%ebp),%eax
    372d:	89 d7                	mov    %edx,%edi
    372f:	fc                   	cld    
    3730:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    3732:	89 d0                	mov    %edx,%eax
    3734:	5f                   	pop    %edi
    3735:	5d                   	pop    %ebp
    3736:	c3                   	ret    
    3737:	89 f6                	mov    %esi,%esi
    3739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003740 <strchr>:

char*
strchr(const char *s, char c)
{
    3740:	55                   	push   %ebp
    3741:	89 e5                	mov    %esp,%ebp
    3743:	53                   	push   %ebx
    3744:	8b 45 08             	mov    0x8(%ebp),%eax
    3747:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    374a:	0f b6 10             	movzbl (%eax),%edx
    374d:	84 d2                	test   %dl,%dl
    374f:	74 1d                	je     376e <strchr+0x2e>
    if(*s == c)
    3751:	38 d3                	cmp    %dl,%bl
    3753:	89 d9                	mov    %ebx,%ecx
    3755:	75 0d                	jne    3764 <strchr+0x24>
    3757:	eb 17                	jmp    3770 <strchr+0x30>
    3759:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3760:	38 ca                	cmp    %cl,%dl
    3762:	74 0c                	je     3770 <strchr+0x30>
  for(; *s; s++)
    3764:	83 c0 01             	add    $0x1,%eax
    3767:	0f b6 10             	movzbl (%eax),%edx
    376a:	84 d2                	test   %dl,%dl
    376c:	75 f2                	jne    3760 <strchr+0x20>
      return (char*)s;
  return 0;
    376e:	31 c0                	xor    %eax,%eax
}
    3770:	5b                   	pop    %ebx
    3771:	5d                   	pop    %ebp
    3772:	c3                   	ret    
    3773:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003780 <gets>:

char*
gets(char *buf, int max)
{
    3780:	55                   	push   %ebp
    3781:	89 e5                	mov    %esp,%ebp
    3783:	57                   	push   %edi
    3784:	56                   	push   %esi
    3785:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3786:	31 f6                	xor    %esi,%esi
    3788:	89 f3                	mov    %esi,%ebx
{
    378a:	83 ec 1c             	sub    $0x1c,%esp
    378d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
    3790:	eb 2f                	jmp    37c1 <gets+0x41>
    3792:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
    3798:	8d 45 e7             	lea    -0x19(%ebp),%eax
    379b:	83 ec 04             	sub    $0x4,%esp
    379e:	6a 01                	push   $0x1
    37a0:	50                   	push   %eax
    37a1:	6a 00                	push   $0x0
    37a3:	e8 32 01 00 00       	call   38da <read>
    if(cc < 1)
    37a8:	83 c4 10             	add    $0x10,%esp
    37ab:	85 c0                	test   %eax,%eax
    37ad:	7e 1c                	jle    37cb <gets+0x4b>
      break;
    buf[i++] = c;
    37af:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    37b3:	83 c7 01             	add    $0x1,%edi
    37b6:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
    37b9:	3c 0a                	cmp    $0xa,%al
    37bb:	74 23                	je     37e0 <gets+0x60>
    37bd:	3c 0d                	cmp    $0xd,%al
    37bf:	74 1f                	je     37e0 <gets+0x60>
  for(i=0; i+1 < max; ){
    37c1:	83 c3 01             	add    $0x1,%ebx
    37c4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    37c7:	89 fe                	mov    %edi,%esi
    37c9:	7c cd                	jl     3798 <gets+0x18>
    37cb:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
    37cd:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
    37d0:	c6 03 00             	movb   $0x0,(%ebx)
}
    37d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    37d6:	5b                   	pop    %ebx
    37d7:	5e                   	pop    %esi
    37d8:	5f                   	pop    %edi
    37d9:	5d                   	pop    %ebp
    37da:	c3                   	ret    
    37db:	90                   	nop
    37dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    37e0:	8b 75 08             	mov    0x8(%ebp),%esi
    37e3:	8b 45 08             	mov    0x8(%ebp),%eax
    37e6:	01 de                	add    %ebx,%esi
    37e8:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
    37ea:	c6 03 00             	movb   $0x0,(%ebx)
}
    37ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
    37f0:	5b                   	pop    %ebx
    37f1:	5e                   	pop    %esi
    37f2:	5f                   	pop    %edi
    37f3:	5d                   	pop    %ebp
    37f4:	c3                   	ret    
    37f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    37f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003800 <stat>:

int
stat(const char *n, struct stat *st)
{
    3800:	55                   	push   %ebp
    3801:	89 e5                	mov    %esp,%ebp
    3803:	56                   	push   %esi
    3804:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3805:	83 ec 08             	sub    $0x8,%esp
    3808:	6a 00                	push   $0x0
    380a:	ff 75 08             	pushl  0x8(%ebp)
    380d:	e8 f0 00 00 00       	call   3902 <open>
  if(fd < 0)
    3812:	83 c4 10             	add    $0x10,%esp
    3815:	85 c0                	test   %eax,%eax
    3817:	78 27                	js     3840 <stat+0x40>
    return -1;
  r = fstat(fd, st);
    3819:	83 ec 08             	sub    $0x8,%esp
    381c:	ff 75 0c             	pushl  0xc(%ebp)
    381f:	89 c3                	mov    %eax,%ebx
    3821:	50                   	push   %eax
    3822:	e8 f3 00 00 00       	call   391a <fstat>
  close(fd);
    3827:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
    382a:	89 c6                	mov    %eax,%esi
  close(fd);
    382c:	e8 b9 00 00 00       	call   38ea <close>
  return r;
    3831:	83 c4 10             	add    $0x10,%esp
}
    3834:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3837:	89 f0                	mov    %esi,%eax
    3839:	5b                   	pop    %ebx
    383a:	5e                   	pop    %esi
    383b:	5d                   	pop    %ebp
    383c:	c3                   	ret    
    383d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
    3840:	be ff ff ff ff       	mov    $0xffffffff,%esi
    3845:	eb ed                	jmp    3834 <stat+0x34>
    3847:	89 f6                	mov    %esi,%esi
    3849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003850 <atoi>:

int
atoi(const char *s)
{
    3850:	55                   	push   %ebp
    3851:	89 e5                	mov    %esp,%ebp
    3853:	53                   	push   %ebx
    3854:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3857:	0f be 11             	movsbl (%ecx),%edx
    385a:	8d 42 d0             	lea    -0x30(%edx),%eax
    385d:	3c 09                	cmp    $0x9,%al
  n = 0;
    385f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
    3864:	77 1f                	ja     3885 <atoi+0x35>
    3866:	8d 76 00             	lea    0x0(%esi),%esi
    3869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    3870:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3873:	83 c1 01             	add    $0x1,%ecx
    3876:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
    387a:	0f be 11             	movsbl (%ecx),%edx
    387d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    3880:	80 fb 09             	cmp    $0x9,%bl
    3883:	76 eb                	jbe    3870 <atoi+0x20>
  return n;
}
    3885:	5b                   	pop    %ebx
    3886:	5d                   	pop    %ebp
    3887:	c3                   	ret    
    3888:	90                   	nop
    3889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003890 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
    3890:	55                   	push   %ebp
    3891:	89 e5                	mov    %esp,%ebp
    3893:	56                   	push   %esi
    3894:	53                   	push   %ebx
    3895:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3898:	8b 45 08             	mov    0x8(%ebp),%eax
    389b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    389e:	85 db                	test   %ebx,%ebx
    38a0:	7e 14                	jle    38b6 <memmove+0x26>
    38a2:	31 d2                	xor    %edx,%edx
    38a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
    38a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
    38ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
    38af:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
    38b2:	39 d3                	cmp    %edx,%ebx
    38b4:	75 f2                	jne    38a8 <memmove+0x18>
  return vdst;
}
    38b6:	5b                   	pop    %ebx
    38b7:	5e                   	pop    %esi
    38b8:	5d                   	pop    %ebp
    38b9:	c3                   	ret    

000038ba <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    38ba:	b8 01 00 00 00       	mov    $0x1,%eax
    38bf:	cd 40                	int    $0x40
    38c1:	c3                   	ret    

000038c2 <exit>:
SYSCALL(exit)
    38c2:	b8 02 00 00 00       	mov    $0x2,%eax
    38c7:	cd 40                	int    $0x40
    38c9:	c3                   	ret    

000038ca <wait>:
SYSCALL(wait)
    38ca:	b8 03 00 00 00       	mov    $0x3,%eax
    38cf:	cd 40                	int    $0x40
    38d1:	c3                   	ret    

000038d2 <pipe>:
SYSCALL(pipe)
    38d2:	b8 04 00 00 00       	mov    $0x4,%eax
    38d7:	cd 40                	int    $0x40
    38d9:	c3                   	ret    

000038da <read>:
SYSCALL(read)
    38da:	b8 05 00 00 00       	mov    $0x5,%eax
    38df:	cd 40                	int    $0x40
    38e1:	c3                   	ret    

000038e2 <write>:
SYSCALL(write)
    38e2:	b8 10 00 00 00       	mov    $0x10,%eax
    38e7:	cd 40                	int    $0x40
    38e9:	c3                   	ret    

000038ea <close>:
SYSCALL(close)
    38ea:	b8 15 00 00 00       	mov    $0x15,%eax
    38ef:	cd 40                	int    $0x40
    38f1:	c3                   	ret    

000038f2 <kill>:
SYSCALL(kill)
    38f2:	b8 06 00 00 00       	mov    $0x6,%eax
    38f7:	cd 40                	int    $0x40
    38f9:	c3                   	ret    

000038fa <exec>:
SYSCALL(exec)
    38fa:	b8 07 00 00 00       	mov    $0x7,%eax
    38ff:	cd 40                	int    $0x40
    3901:	c3                   	ret    

00003902 <open>:
SYSCALL(open)
    3902:	b8 0f 00 00 00       	mov    $0xf,%eax
    3907:	cd 40                	int    $0x40
    3909:	c3                   	ret    

0000390a <mknod>:
SYSCALL(mknod)
    390a:	b8 11 00 00 00       	mov    $0x11,%eax
    390f:	cd 40                	int    $0x40
    3911:	c3                   	ret    

00003912 <unlink>:
SYSCALL(unlink)
    3912:	b8 12 00 00 00       	mov    $0x12,%eax
    3917:	cd 40                	int    $0x40
    3919:	c3                   	ret    

0000391a <fstat>:
SYSCALL(fstat)
    391a:	b8 08 00 00 00       	mov    $0x8,%eax
    391f:	cd 40                	int    $0x40
    3921:	c3                   	ret    

00003922 <link>:
SYSCALL(link)
    3922:	b8 13 00 00 00       	mov    $0x13,%eax
    3927:	cd 40                	int    $0x40
    3929:	c3                   	ret    

0000392a <mkdir>:
SYSCALL(mkdir)
    392a:	b8 14 00 00 00       	mov    $0x14,%eax
    392f:	cd 40                	int    $0x40
    3931:	c3                   	ret    

00003932 <chdir>:
SYSCALL(chdir)
    3932:	b8 09 00 00 00       	mov    $0x9,%eax
    3937:	cd 40                	int    $0x40
    3939:	c3                   	ret    

0000393a <dup>:
SYSCALL(dup)
    393a:	b8 0a 00 00 00       	mov    $0xa,%eax
    393f:	cd 40                	int    $0x40
    3941:	c3                   	ret    

00003942 <getpid>:
SYSCALL(getpid)
    3942:	b8 0b 00 00 00       	mov    $0xb,%eax
    3947:	cd 40                	int    $0x40
    3949:	c3                   	ret    

0000394a <sbrk>:
SYSCALL(sbrk)
    394a:	b8 0c 00 00 00       	mov    $0xc,%eax
    394f:	cd 40                	int    $0x40
    3951:	c3                   	ret    

00003952 <sleep>:
SYSCALL(sleep)
    3952:	b8 0d 00 00 00       	mov    $0xd,%eax
    3957:	cd 40                	int    $0x40
    3959:	c3                   	ret    

0000395a <uptime>:
SYSCALL(uptime)
    395a:	b8 0e 00 00 00       	mov    $0xe,%eax
    395f:	cd 40                	int    $0x40
    3961:	c3                   	ret    

00003962 <date>:
SYSCALL(date)
    3962:	b8 16 00 00 00       	mov    $0x16,%eax
    3967:	cd 40                	int    $0x40
    3969:	c3                   	ret    

0000396a <alarm>:
SYSCALL(alarm)
    396a:	b8 17 00 00 00       	mov    $0x17,%eax
    396f:	cd 40                	int    $0x40
    3971:	c3                   	ret    
    3972:	66 90                	xchg   %ax,%ax
    3974:	66 90                	xchg   %ax,%ax
    3976:	66 90                	xchg   %ax,%ax
    3978:	66 90                	xchg   %ax,%ax
    397a:	66 90                	xchg   %ax,%ax
    397c:	66 90                	xchg   %ax,%ax
    397e:	66 90                	xchg   %ax,%ax

00003980 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3980:	55                   	push   %ebp
    3981:	89 e5                	mov    %esp,%ebp
    3983:	57                   	push   %edi
    3984:	56                   	push   %esi
    3985:	53                   	push   %ebx
    3986:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    3989:	85 d2                	test   %edx,%edx
{
    398b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
    398e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
    3990:	79 76                	jns    3a08 <printint+0x88>
    3992:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
    3996:	74 70                	je     3a08 <printint+0x88>
    x = -xx;
    3998:	f7 d8                	neg    %eax
    neg = 1;
    399a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    39a1:	31 f6                	xor    %esi,%esi
    39a3:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    39a6:	eb 0a                	jmp    39b2 <printint+0x32>
    39a8:	90                   	nop
    39a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
    39b0:	89 fe                	mov    %edi,%esi
    39b2:	31 d2                	xor    %edx,%edx
    39b4:	8d 7e 01             	lea    0x1(%esi),%edi
    39b7:	f7 f1                	div    %ecx
    39b9:	0f b6 92 18 55 00 00 	movzbl 0x5518(%edx),%edx
  }while((x /= base) != 0);
    39c0:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
    39c2:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
    39c5:	75 e9                	jne    39b0 <printint+0x30>
  if(neg)
    39c7:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    39ca:	85 c0                	test   %eax,%eax
    39cc:	74 08                	je     39d6 <printint+0x56>
    buf[i++] = '-';
    39ce:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
    39d3:	8d 7e 02             	lea    0x2(%esi),%edi
    39d6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
    39da:	8b 7d c0             	mov    -0x40(%ebp),%edi
    39dd:	8d 76 00             	lea    0x0(%esi),%esi
    39e0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
    39e3:	83 ec 04             	sub    $0x4,%esp
    39e6:	83 ee 01             	sub    $0x1,%esi
    39e9:	6a 01                	push   $0x1
    39eb:	53                   	push   %ebx
    39ec:	57                   	push   %edi
    39ed:	88 45 d7             	mov    %al,-0x29(%ebp)
    39f0:	e8 ed fe ff ff       	call   38e2 <write>

  while(--i >= 0)
    39f5:	83 c4 10             	add    $0x10,%esp
    39f8:	39 de                	cmp    %ebx,%esi
    39fa:	75 e4                	jne    39e0 <printint+0x60>
    putc(fd, buf[i]);
}
    39fc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    39ff:	5b                   	pop    %ebx
    3a00:	5e                   	pop    %esi
    3a01:	5f                   	pop    %edi
    3a02:	5d                   	pop    %ebp
    3a03:	c3                   	ret    
    3a04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
    3a08:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    3a0f:	eb 90                	jmp    39a1 <printint+0x21>
    3a11:	eb 0d                	jmp    3a20 <printf>
    3a13:	90                   	nop
    3a14:	90                   	nop
    3a15:	90                   	nop
    3a16:	90                   	nop
    3a17:	90                   	nop
    3a18:	90                   	nop
    3a19:	90                   	nop
    3a1a:	90                   	nop
    3a1b:	90                   	nop
    3a1c:	90                   	nop
    3a1d:	90                   	nop
    3a1e:	90                   	nop
    3a1f:	90                   	nop

00003a20 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    3a20:	55                   	push   %ebp
    3a21:	89 e5                	mov    %esp,%ebp
    3a23:	57                   	push   %edi
    3a24:	56                   	push   %esi
    3a25:	53                   	push   %ebx
    3a26:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a29:	8b 75 0c             	mov    0xc(%ebp),%esi
    3a2c:	0f b6 1e             	movzbl (%esi),%ebx
    3a2f:	84 db                	test   %bl,%bl
    3a31:	0f 84 b3 00 00 00    	je     3aea <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
    3a37:	8d 45 10             	lea    0x10(%ebp),%eax
    3a3a:	83 c6 01             	add    $0x1,%esi
  state = 0;
    3a3d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
    3a3f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3a42:	eb 2f                	jmp    3a73 <printf+0x53>
    3a44:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3a48:	83 f8 25             	cmp    $0x25,%eax
    3a4b:	0f 84 a7 00 00 00    	je     3af8 <printf+0xd8>
  write(fd, &c, 1);
    3a51:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    3a54:	83 ec 04             	sub    $0x4,%esp
    3a57:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    3a5a:	6a 01                	push   $0x1
    3a5c:	50                   	push   %eax
    3a5d:	ff 75 08             	pushl  0x8(%ebp)
    3a60:	e8 7d fe ff ff       	call   38e2 <write>
    3a65:	83 c4 10             	add    $0x10,%esp
    3a68:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
    3a6b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    3a6f:	84 db                	test   %bl,%bl
    3a71:	74 77                	je     3aea <printf+0xca>
    if(state == 0){
    3a73:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
    3a75:	0f be cb             	movsbl %bl,%ecx
    3a78:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    3a7b:	74 cb                	je     3a48 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3a7d:	83 ff 25             	cmp    $0x25,%edi
    3a80:	75 e6                	jne    3a68 <printf+0x48>
      if(c == 'd'){
    3a82:	83 f8 64             	cmp    $0x64,%eax
    3a85:	0f 84 05 01 00 00    	je     3b90 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3a8b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    3a91:	83 f9 70             	cmp    $0x70,%ecx
    3a94:	74 72                	je     3b08 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3a96:	83 f8 73             	cmp    $0x73,%eax
    3a99:	0f 84 99 00 00 00    	je     3b38 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3a9f:	83 f8 63             	cmp    $0x63,%eax
    3aa2:	0f 84 08 01 00 00    	je     3bb0 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3aa8:	83 f8 25             	cmp    $0x25,%eax
    3aab:	0f 84 ef 00 00 00    	je     3ba0 <printf+0x180>
  write(fd, &c, 1);
    3ab1:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3ab4:	83 ec 04             	sub    $0x4,%esp
    3ab7:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3abb:	6a 01                	push   $0x1
    3abd:	50                   	push   %eax
    3abe:	ff 75 08             	pushl  0x8(%ebp)
    3ac1:	e8 1c fe ff ff       	call   38e2 <write>
    3ac6:	83 c4 0c             	add    $0xc,%esp
    3ac9:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    3acc:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    3acf:	6a 01                	push   $0x1
    3ad1:	50                   	push   %eax
    3ad2:	ff 75 08             	pushl  0x8(%ebp)
    3ad5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3ad8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
    3ada:	e8 03 fe ff ff       	call   38e2 <write>
  for(i = 0; fmt[i]; i++){
    3adf:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
    3ae3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
    3ae6:	84 db                	test   %bl,%bl
    3ae8:	75 89                	jne    3a73 <printf+0x53>
    }
  }
}
    3aea:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3aed:	5b                   	pop    %ebx
    3aee:	5e                   	pop    %esi
    3aef:	5f                   	pop    %edi
    3af0:	5d                   	pop    %ebp
    3af1:	c3                   	ret    
    3af2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
    3af8:	bf 25 00 00 00       	mov    $0x25,%edi
    3afd:	e9 66 ff ff ff       	jmp    3a68 <printf+0x48>
    3b02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
    3b08:	83 ec 0c             	sub    $0xc,%esp
    3b0b:	b9 10 00 00 00       	mov    $0x10,%ecx
    3b10:	6a 00                	push   $0x0
    3b12:	8b 7d d4             	mov    -0x2c(%ebp),%edi
    3b15:	8b 45 08             	mov    0x8(%ebp),%eax
    3b18:	8b 17                	mov    (%edi),%edx
    3b1a:	e8 61 fe ff ff       	call   3980 <printint>
        ap++;
    3b1f:	89 f8                	mov    %edi,%eax
    3b21:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3b24:	31 ff                	xor    %edi,%edi
        ap++;
    3b26:	83 c0 04             	add    $0x4,%eax
    3b29:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    3b2c:	e9 37 ff ff ff       	jmp    3a68 <printf+0x48>
    3b31:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
    3b38:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3b3b:	8b 08                	mov    (%eax),%ecx
        ap++;
    3b3d:	83 c0 04             	add    $0x4,%eax
    3b40:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
    3b43:	85 c9                	test   %ecx,%ecx
    3b45:	0f 84 8e 00 00 00    	je     3bd9 <printf+0x1b9>
        while(*s != 0){
    3b4b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
    3b4e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
    3b50:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
    3b52:	84 c0                	test   %al,%al
    3b54:	0f 84 0e ff ff ff    	je     3a68 <printf+0x48>
    3b5a:	89 75 d0             	mov    %esi,-0x30(%ebp)
    3b5d:	89 de                	mov    %ebx,%esi
    3b5f:	8b 5d 08             	mov    0x8(%ebp),%ebx
    3b62:	8d 7d e3             	lea    -0x1d(%ebp),%edi
    3b65:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    3b68:	83 ec 04             	sub    $0x4,%esp
          s++;
    3b6b:	83 c6 01             	add    $0x1,%esi
    3b6e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
    3b71:	6a 01                	push   $0x1
    3b73:	57                   	push   %edi
    3b74:	53                   	push   %ebx
    3b75:	e8 68 fd ff ff       	call   38e2 <write>
        while(*s != 0){
    3b7a:	0f b6 06             	movzbl (%esi),%eax
    3b7d:	83 c4 10             	add    $0x10,%esp
    3b80:	84 c0                	test   %al,%al
    3b82:	75 e4                	jne    3b68 <printf+0x148>
    3b84:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
    3b87:	31 ff                	xor    %edi,%edi
    3b89:	e9 da fe ff ff       	jmp    3a68 <printf+0x48>
    3b8e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
    3b90:	83 ec 0c             	sub    $0xc,%esp
    3b93:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3b98:	6a 01                	push   $0x1
    3b9a:	e9 73 ff ff ff       	jmp    3b12 <printf+0xf2>
    3b9f:	90                   	nop
  write(fd, &c, 1);
    3ba0:	83 ec 04             	sub    $0x4,%esp
    3ba3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    3ba6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    3ba9:	6a 01                	push   $0x1
    3bab:	e9 21 ff ff ff       	jmp    3ad1 <printf+0xb1>
        putc(fd, *ap);
    3bb0:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
    3bb3:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
    3bb6:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
    3bb8:	6a 01                	push   $0x1
        ap++;
    3bba:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
    3bbd:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
    3bc0:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3bc3:	50                   	push   %eax
    3bc4:	ff 75 08             	pushl  0x8(%ebp)
    3bc7:	e8 16 fd ff ff       	call   38e2 <write>
        ap++;
    3bcc:	89 7d d4             	mov    %edi,-0x2c(%ebp)
    3bcf:	83 c4 10             	add    $0x10,%esp
      state = 0;
    3bd2:	31 ff                	xor    %edi,%edi
    3bd4:	e9 8f fe ff ff       	jmp    3a68 <printf+0x48>
          s = "(null)";
    3bd9:	bb 10 55 00 00       	mov    $0x5510,%ebx
        while(*s != 0){
    3bde:	b8 28 00 00 00       	mov    $0x28,%eax
    3be3:	e9 72 ff ff ff       	jmp    3b5a <printf+0x13a>
    3be8:	66 90                	xchg   %ax,%ax
    3bea:	66 90                	xchg   %ax,%ax
    3bec:	66 90                	xchg   %ax,%ax
    3bee:	66 90                	xchg   %ax,%ax

00003bf0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3bf0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3bf1:	a1 c0 5e 00 00       	mov    0x5ec0,%eax
{
    3bf6:	89 e5                	mov    %esp,%ebp
    3bf8:	57                   	push   %edi
    3bf9:	56                   	push   %esi
    3bfa:	53                   	push   %ebx
    3bfb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    3bfe:	8d 4b f8             	lea    -0x8(%ebx),%ecx
    3c01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3c08:	39 c8                	cmp    %ecx,%eax
    3c0a:	8b 10                	mov    (%eax),%edx
    3c0c:	73 32                	jae    3c40 <free+0x50>
    3c0e:	39 d1                	cmp    %edx,%ecx
    3c10:	72 04                	jb     3c16 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c12:	39 d0                	cmp    %edx,%eax
    3c14:	72 32                	jb     3c48 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
    3c16:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3c19:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3c1c:	39 fa                	cmp    %edi,%edx
    3c1e:	74 30                	je     3c50 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    3c20:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3c23:	8b 50 04             	mov    0x4(%eax),%edx
    3c26:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3c29:	39 f1                	cmp    %esi,%ecx
    3c2b:	74 3a                	je     3c67 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3c2d:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3c2f:	a3 c0 5e 00 00       	mov    %eax,0x5ec0
}
    3c34:	5b                   	pop    %ebx
    3c35:	5e                   	pop    %esi
    3c36:	5f                   	pop    %edi
    3c37:	5d                   	pop    %ebp
    3c38:	c3                   	ret    
    3c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3c40:	39 d0                	cmp    %edx,%eax
    3c42:	72 04                	jb     3c48 <free+0x58>
    3c44:	39 d1                	cmp    %edx,%ecx
    3c46:	72 ce                	jb     3c16 <free+0x26>
{
    3c48:	89 d0                	mov    %edx,%eax
    3c4a:	eb bc                	jmp    3c08 <free+0x18>
    3c4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
    3c50:	03 72 04             	add    0x4(%edx),%esi
    3c53:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3c56:	8b 10                	mov    (%eax),%edx
    3c58:	8b 12                	mov    (%edx),%edx
    3c5a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3c5d:	8b 50 04             	mov    0x4(%eax),%edx
    3c60:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3c63:	39 f1                	cmp    %esi,%ecx
    3c65:	75 c6                	jne    3c2d <free+0x3d>
    p->s.size += bp->s.size;
    3c67:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
    3c6a:	a3 c0 5e 00 00       	mov    %eax,0x5ec0
    p->s.size += bp->s.size;
    3c6f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3c72:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3c75:	89 10                	mov    %edx,(%eax)
}
    3c77:	5b                   	pop    %ebx
    3c78:	5e                   	pop    %esi
    3c79:	5f                   	pop    %edi
    3c7a:	5d                   	pop    %ebp
    3c7b:	c3                   	ret    
    3c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003c80 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3c80:	55                   	push   %ebp
    3c81:	89 e5                	mov    %esp,%ebp
    3c83:	57                   	push   %edi
    3c84:	56                   	push   %esi
    3c85:	53                   	push   %ebx
    3c86:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3c89:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    3c8c:	8b 15 c0 5e 00 00    	mov    0x5ec0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3c92:	8d 78 07             	lea    0x7(%eax),%edi
    3c95:	c1 ef 03             	shr    $0x3,%edi
    3c98:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    3c9b:	85 d2                	test   %edx,%edx
    3c9d:	0f 84 9d 00 00 00    	je     3d40 <malloc+0xc0>
    3ca3:	8b 02                	mov    (%edx),%eax
    3ca5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    3ca8:	39 cf                	cmp    %ecx,%edi
    3caa:	76 6c                	jbe    3d18 <malloc+0x98>
    3cac:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    3cb2:	bb 00 10 00 00       	mov    $0x1000,%ebx
    3cb7:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    3cba:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    3cc1:	eb 0e                	jmp    3cd1 <malloc+0x51>
    3cc3:	90                   	nop
    3cc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3cc8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    3cca:	8b 48 04             	mov    0x4(%eax),%ecx
    3ccd:	39 f9                	cmp    %edi,%ecx
    3ccf:	73 47                	jae    3d18 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3cd1:	39 05 c0 5e 00 00    	cmp    %eax,0x5ec0
    3cd7:	89 c2                	mov    %eax,%edx
    3cd9:	75 ed                	jne    3cc8 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
    3cdb:	83 ec 0c             	sub    $0xc,%esp
    3cde:	56                   	push   %esi
    3cdf:	e8 66 fc ff ff       	call   394a <sbrk>
  if(p == (char*)-1)
    3ce4:	83 c4 10             	add    $0x10,%esp
    3ce7:	83 f8 ff             	cmp    $0xffffffff,%eax
    3cea:	74 1c                	je     3d08 <malloc+0x88>
  hp->s.size = nu;
    3cec:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    3cef:	83 ec 0c             	sub    $0xc,%esp
    3cf2:	83 c0 08             	add    $0x8,%eax
    3cf5:	50                   	push   %eax
    3cf6:	e8 f5 fe ff ff       	call   3bf0 <free>
  return freep;
    3cfb:	8b 15 c0 5e 00 00    	mov    0x5ec0,%edx
      if((p = morecore(nunits)) == 0)
    3d01:	83 c4 10             	add    $0x10,%esp
    3d04:	85 d2                	test   %edx,%edx
    3d06:	75 c0                	jne    3cc8 <malloc+0x48>
        return 0;
  }
}
    3d08:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    3d0b:	31 c0                	xor    %eax,%eax
}
    3d0d:	5b                   	pop    %ebx
    3d0e:	5e                   	pop    %esi
    3d0f:	5f                   	pop    %edi
    3d10:	5d                   	pop    %ebp
    3d11:	c3                   	ret    
    3d12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    3d18:	39 cf                	cmp    %ecx,%edi
    3d1a:	74 54                	je     3d70 <malloc+0xf0>
        p->s.size -= nunits;
    3d1c:	29 f9                	sub    %edi,%ecx
    3d1e:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    3d21:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    3d24:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    3d27:	89 15 c0 5e 00 00    	mov    %edx,0x5ec0
}
    3d2d:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    3d30:	83 c0 08             	add    $0x8,%eax
}
    3d33:	5b                   	pop    %ebx
    3d34:	5e                   	pop    %esi
    3d35:	5f                   	pop    %edi
    3d36:	5d                   	pop    %ebp
    3d37:	c3                   	ret    
    3d38:	90                   	nop
    3d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    3d40:	c7 05 c0 5e 00 00 c4 	movl   $0x5ec4,0x5ec0
    3d47:	5e 00 00 
    3d4a:	c7 05 c4 5e 00 00 c4 	movl   $0x5ec4,0x5ec4
    3d51:	5e 00 00 
    base.s.size = 0;
    3d54:	b8 c4 5e 00 00       	mov    $0x5ec4,%eax
    3d59:	c7 05 c8 5e 00 00 00 	movl   $0x0,0x5ec8
    3d60:	00 00 00 
    3d63:	e9 44 ff ff ff       	jmp    3cac <malloc+0x2c>
    3d68:	90                   	nop
    3d69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
    3d70:	8b 08                	mov    (%eax),%ecx
    3d72:	89 0a                	mov    %ecx,(%edx)
    3d74:	eb b1                	jmp    3d27 <malloc+0xa7>
