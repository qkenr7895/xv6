
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
      11:	68 1e 4d 00 00       	push   $0x4d1e
      16:	6a 01                	push   $0x1
      18:	e8 f3 39 00 00       	call   3a10 <printf>

  if(open("usertests.ran", 0) >= 0){
      1d:	5a                   	pop    %edx
      1e:	59                   	pop    %ecx
      1f:	6a 00                	push   $0x0
      21:	68 32 4d 00 00       	push   $0x4d32
      26:	e8 d7 38 00 00       	call   3902 <open>
      2b:	83 c4 10             	add    $0x10,%esp
      2e:	85 c0                	test   %eax,%eax
      30:	78 14                	js     46 <main+0x46>
    printf(1, "already ran user tests -- rebuild fs.img\n");
      32:	83 ec 08             	sub    $0x8,%esp
      35:	68 9c 54 00 00       	push   $0x549c
      3a:	6a 01                	push   $0x1
      3c:	e8 cf 39 00 00       	call   3a10 <printf>
    exit();
      41:	e8 7c 38 00 00       	call   38c2 <exit>
  }
  close(open("usertests.ran", O_CREATE));
      46:	50                   	push   %eax
      47:	50                   	push   %eax
      48:	68 00 02 00 00       	push   $0x200
      4d:	68 32 4d 00 00       	push   $0x4d32
      52:	e8 ab 38 00 00       	call   3902 <open>
      57:	89 04 24             	mov    %eax,(%esp)
      5a:	e8 8b 38 00 00       	call   38ea <close>

  argptest();
      5f:	e8 8c 35 00 00       	call   35f0 <argptest>
  createdelete();
      64:	e8 a7 11 00 00       	call   1210 <createdelete>
  linkunlink();
      69:	e8 62 1a 00 00       	call   1ad0 <linkunlink>
  concreate();
      6e:	e8 4d 17 00 00       	call   17c0 <concreate>
  fourfiles();
      73:	e8 a8 0f 00 00       	call   1020 <fourfiles>
  sharedfd();
      78:	e8 e3 0d 00 00       	call   e60 <sharedfd>

  bigargtest();
      7d:	e8 0e 32 00 00       	call   3290 <bigargtest>
  bigwrite();
      82:	e8 69 23 00 00       	call   23f0 <bigwrite>
  bigargtest();
      87:	e8 04 32 00 00       	call   3290 <bigargtest>
  bsstest();
      8c:	e8 8f 31 00 00       	call   3220 <bsstest>
  sbrktest();
      91:	e8 aa 2c 00 00       	call   2d40 <sbrktest>
  validatetest();
      96:	e8 d5 30 00 00       	call   3170 <validatetest>

  opentest();
      9b:	e8 50 03 00 00       	call   3f0 <opentest>
  writetest();
      a0:	e8 db 03 00 00       	call   480 <writetest>
  writetest1();
      a5:	e8 b6 05 00 00       	call   660 <writetest1>
  createtest();
      aa:	e8 81 07 00 00       	call   830 <createtest>

  openiputtest();
      af:	e8 3c 02 00 00       	call   2f0 <openiputtest>
  exitiputtest();
      b4:	e8 47 01 00 00       	call   200 <exitiputtest>
  iputtest();
      b9:	e8 62 00 00 00       	call   120 <iputtest>

  mem();
      be:	e8 ad 0c 00 00       	call   d70 <mem>
  pipe1();
      c3:	e8 48 09 00 00       	call   a10 <pipe1>
  preempt();
      c8:	e8 d3 0a 00 00       	call   ba0 <preempt>
  exitwait();
      cd:	e8 0e 0c 00 00       	call   ce0 <exitwait>

  rmdot();
      d2:	e8 09 27 00 00       	call   27e0 <rmdot>
  fourteen();
      d7:	e8 c4 25 00 00       	call   26a0 <fourteen>
  bigfile();
      dc:	e8 ef 23 00 00       	call   24d0 <bigfile>
  subdir();
      e1:	e8 2a 1c 00 00       	call   1d10 <subdir>
  linktest();
      e6:	e8 c5 14 00 00       	call   15b0 <linktest>
  unlinkread();
      eb:	e8 30 13 00 00       	call   1420 <unlinkread>
  dirfile();
      f0:	e8 6b 28 00 00       	call   2960 <dirfile>
  iref();
      f5:	e8 66 2a 00 00       	call   2b60 <iref>
  forktest();
      fa:	e8 81 2b 00 00       	call   2c80 <forktest>
  bigdir(); // slow
      ff:	e8 dc 1a 00 00       	call   1be0 <bigdir>

  uio();
     104:	e8 77 34 00 00       	call   3580 <uio>

  exectest();
     109:	e8 b2 08 00 00       	call   9c0 <exectest>

  exit();
     10e:	e8 af 37 00 00       	call   38c2 <exit>
     113:	66 90                	xchg   %ax,%ax
     115:	66 90                	xchg   %ax,%ax
     117:	66 90                	xchg   %ax,%ax
     119:	66 90                	xchg   %ax,%ax
     11b:	66 90                	xchg   %ax,%ax
     11d:	66 90                	xchg   %ax,%ax
     11f:	90                   	nop

00000120 <iputtest>:
int stdout = 1;

// does chdir() call iput(p->cwd) in a transaction?
void
iputtest(void)
{
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "iput test\n");
     126:	68 c4 3d 00 00       	push   $0x3dc4
     12b:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     131:	e8 da 38 00 00       	call   3a10 <printf>

  if(mkdir("iputdir") < 0){
     136:	c7 04 24 57 3d 00 00 	movl   $0x3d57,(%esp)
     13d:	e8 e8 37 00 00       	call   392a <mkdir>
     142:	83 c4 10             	add    $0x10,%esp
     145:	85 c0                	test   %eax,%eax
     147:	78 58                	js     1a1 <iputtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
     149:	83 ec 0c             	sub    $0xc,%esp
     14c:	68 57 3d 00 00       	push   $0x3d57
     151:	e8 dc 37 00 00       	call   3932 <chdir>
     156:	83 c4 10             	add    $0x10,%esp
     159:	85 c0                	test   %eax,%eax
     15b:	0f 88 85 00 00 00    	js     1e6 <iputtest+0xc6>
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
     161:	83 ec 0c             	sub    $0xc,%esp
     164:	68 54 3d 00 00       	push   $0x3d54
     169:	e8 a4 37 00 00       	call   3912 <unlink>
     16e:	83 c4 10             	add    $0x10,%esp
     171:	85 c0                	test   %eax,%eax
     173:	78 5a                	js     1cf <iputtest+0xaf>
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
     175:	83 ec 0c             	sub    $0xc,%esp
     178:	68 79 3d 00 00       	push   $0x3d79
     17d:	e8 b0 37 00 00       	call   3932 <chdir>
     182:	83 c4 10             	add    $0x10,%esp
     185:	85 c0                	test   %eax,%eax
     187:	78 2f                	js     1b8 <iputtest+0x98>
    printf(stdout, "chdir / failed\n");
    exit();
  }
  printf(stdout, "iput test ok\n");
     189:	83 ec 08             	sub    $0x8,%esp
     18c:	68 fc 3d 00 00       	push   $0x3dfc
     191:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     197:	e8 74 38 00 00       	call   3a10 <printf>
}
     19c:	83 c4 10             	add    $0x10,%esp
     19f:	c9                   	leave  
     1a0:	c3                   	ret    
iputtest(void)
{
  printf(stdout, "iput test\n");

  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
     1a1:	50                   	push   %eax
     1a2:	50                   	push   %eax
     1a3:	68 30 3d 00 00       	push   $0x3d30
     1a8:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     1ae:	e8 5d 38 00 00       	call   3a10 <printf>
    exit();
     1b3:	e8 0a 37 00 00       	call   38c2 <exit>
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
    exit();
  }
  if(chdir("/") < 0){
    printf(stdout, "chdir / failed\n");
     1b8:	50                   	push   %eax
     1b9:	50                   	push   %eax
     1ba:	68 7b 3d 00 00       	push   $0x3d7b
     1bf:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     1c5:	e8 46 38 00 00       	call   3a10 <printf>
    exit();
     1ca:	e8 f3 36 00 00       	call   38c2 <exit>
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
    exit();
  }
  if(unlink("../iputdir") < 0){
    printf(stdout, "unlink ../iputdir failed\n");
     1cf:	52                   	push   %edx
     1d0:	52                   	push   %edx
     1d1:	68 5f 3d 00 00       	push   $0x3d5f
     1d6:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     1dc:	e8 2f 38 00 00       	call   3a10 <printf>
    exit();
     1e1:	e8 dc 36 00 00       	call   38c2 <exit>
  if(mkdir("iputdir") < 0){
    printf(stdout, "mkdir failed\n");
    exit();
  }
  if(chdir("iputdir") < 0){
    printf(stdout, "chdir iputdir failed\n");
     1e6:	51                   	push   %ecx
     1e7:	51                   	push   %ecx
     1e8:	68 3e 3d 00 00       	push   $0x3d3e
     1ed:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     1f3:	e8 18 38 00 00       	call   3a10 <printf>
    exit();
     1f8:	e8 c5 36 00 00       	call   38c2 <exit>
     1fd:	8d 76 00             	lea    0x0(%esi),%esi

00000200 <exitiputtest>:
}

// does exit() call iput(p->cwd) in a transaction?
void
exitiputtest(void)
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "exitiput test\n");
     206:	68 8b 3d 00 00       	push   $0x3d8b
     20b:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     211:	e8 fa 37 00 00       	call   3a10 <printf>

  pid = fork();
     216:	e8 9f 36 00 00       	call   38ba <fork>
  if(pid < 0){
     21b:	83 c4 10             	add    $0x10,%esp
     21e:	85 c0                	test   %eax,%eax
     220:	0f 88 82 00 00 00    	js     2a8 <exitiputtest+0xa8>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     226:	75 48                	jne    270 <exitiputtest+0x70>
    if(mkdir("iputdir") < 0){
     228:	83 ec 0c             	sub    $0xc,%esp
     22b:	68 57 3d 00 00       	push   $0x3d57
     230:	e8 f5 36 00 00       	call   392a <mkdir>
     235:	83 c4 10             	add    $0x10,%esp
     238:	85 c0                	test   %eax,%eax
     23a:	0f 88 96 00 00 00    	js     2d6 <exitiputtest+0xd6>
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
     240:	83 ec 0c             	sub    $0xc,%esp
     243:	68 57 3d 00 00       	push   $0x3d57
     248:	e8 e5 36 00 00       	call   3932 <chdir>
     24d:	83 c4 10             	add    $0x10,%esp
     250:	85 c0                	test   %eax,%eax
     252:	78 6b                	js     2bf <exitiputtest+0xbf>
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
     254:	83 ec 0c             	sub    $0xc,%esp
     257:	68 54 3d 00 00       	push   $0x3d54
     25c:	e8 b1 36 00 00       	call   3912 <unlink>
     261:	83 c4 10             	add    $0x10,%esp
     264:	85 c0                	test   %eax,%eax
     266:	78 28                	js     290 <exitiputtest+0x90>
      printf(stdout, "unlink ../iputdir failed\n");
      exit();
    }
    exit();
     268:	e8 55 36 00 00       	call   38c2 <exit>
     26d:	8d 76 00             	lea    0x0(%esi),%esi
  }
  wait();
     270:	e8 55 36 00 00       	call   38ca <wait>
  printf(stdout, "exitiput test ok\n");
     275:	83 ec 08             	sub    $0x8,%esp
     278:	68 ae 3d 00 00       	push   $0x3dae
     27d:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     283:	e8 88 37 00 00       	call   3a10 <printf>
}
     288:	83 c4 10             	add    $0x10,%esp
     28b:	c9                   	leave  
     28c:	c3                   	ret    
     28d:	8d 76 00             	lea    0x0(%esi),%esi
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
      exit();
    }
    if(unlink("../iputdir") < 0){
      printf(stdout, "unlink ../iputdir failed\n");
     290:	83 ec 08             	sub    $0x8,%esp
     293:	68 5f 3d 00 00       	push   $0x3d5f
     298:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     29e:	e8 6d 37 00 00       	call   3a10 <printf>
      exit();
     2a3:	e8 1a 36 00 00       	call   38c2 <exit>

  printf(stdout, "exitiput test\n");

  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     2a8:	51                   	push   %ecx
     2a9:	51                   	push   %ecx
     2aa:	68 71 4c 00 00       	push   $0x4c71
     2af:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     2b5:	e8 56 37 00 00       	call   3a10 <printf>
    exit();
     2ba:	e8 03 36 00 00       	call   38c2 <exit>
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
      exit();
    }
    if(chdir("iputdir") < 0){
      printf(stdout, "child chdir failed\n");
     2bf:	50                   	push   %eax
     2c0:	50                   	push   %eax
     2c1:	68 9a 3d 00 00       	push   $0x3d9a
     2c6:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     2cc:	e8 3f 37 00 00       	call   3a10 <printf>
      exit();
     2d1:	e8 ec 35 00 00       	call   38c2 <exit>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
    if(mkdir("iputdir") < 0){
      printf(stdout, "mkdir failed\n");
     2d6:	52                   	push   %edx
     2d7:	52                   	push   %edx
     2d8:	68 30 3d 00 00       	push   $0x3d30
     2dd:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     2e3:	e8 28 37 00 00       	call   3a10 <printf>
      exit();
     2e8:	e8 d5 35 00 00       	call   38c2 <exit>
     2ed:	8d 76 00             	lea    0x0(%esi),%esi

000002f0 <openiputtest>:
//      for(i = 0; i < 10000; i++)
//        yield();
//    }
void
openiputtest(void)
{
     2f0:	55                   	push   %ebp
     2f1:	89 e5                	mov    %esp,%ebp
     2f3:	83 ec 10             	sub    $0x10,%esp
  int pid;

  printf(stdout, "openiput test\n");
     2f6:	68 c0 3d 00 00       	push   $0x3dc0
     2fb:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     301:	e8 0a 37 00 00       	call   3a10 <printf>
  if(mkdir("oidir") < 0){
     306:	c7 04 24 cf 3d 00 00 	movl   $0x3dcf,(%esp)
     30d:	e8 18 36 00 00       	call   392a <mkdir>
     312:	83 c4 10             	add    $0x10,%esp
     315:	85 c0                	test   %eax,%eax
     317:	0f 88 88 00 00 00    	js     3a5 <openiputtest+0xb5>
    printf(stdout, "mkdir oidir failed\n");
    exit();
  }
  pid = fork();
     31d:	e8 98 35 00 00       	call   38ba <fork>
  if(pid < 0){
     322:	85 c0                	test   %eax,%eax
     324:	0f 88 92 00 00 00    	js     3bc <openiputtest+0xcc>
    printf(stdout, "fork failed\n");
    exit();
  }
  if(pid == 0){
     32a:	75 34                	jne    360 <openiputtest+0x70>
    int fd = open("oidir", O_RDWR);
     32c:	83 ec 08             	sub    $0x8,%esp
     32f:	6a 02                	push   $0x2
     331:	68 cf 3d 00 00       	push   $0x3dcf
     336:	e8 c7 35 00 00       	call   3902 <open>
    if(fd >= 0){
     33b:	83 c4 10             	add    $0x10,%esp
     33e:	85 c0                	test   %eax,%eax
     340:	78 5e                	js     3a0 <openiputtest+0xb0>
      printf(stdout, "open directory for write succeeded\n");
     342:	83 ec 08             	sub    $0x8,%esp
     345:	68 54 4d 00 00       	push   $0x4d54
     34a:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     350:	e8 bb 36 00 00       	call   3a10 <printf>
      exit();
     355:	e8 68 35 00 00       	call   38c2 <exit>
     35a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    }
    exit();
  }
  sleep(1);
     360:	83 ec 0c             	sub    $0xc,%esp
     363:	6a 01                	push   $0x1
     365:	e8 e8 35 00 00       	call   3952 <sleep>
  if(unlink("oidir") != 0){
     36a:	c7 04 24 cf 3d 00 00 	movl   $0x3dcf,(%esp)
     371:	e8 9c 35 00 00       	call   3912 <unlink>
     376:	83 c4 10             	add    $0x10,%esp
     379:	85 c0                	test   %eax,%eax
     37b:	75 56                	jne    3d3 <openiputtest+0xe3>
    printf(stdout, "unlink failed\n");
    exit();
  }
  wait();
     37d:	e8 48 35 00 00       	call   38ca <wait>
  printf(stdout, "openiput test ok\n");
     382:	83 ec 08             	sub    $0x8,%esp
     385:	68 f8 3d 00 00       	push   $0x3df8
     38a:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     390:	e8 7b 36 00 00       	call   3a10 <printf>
     395:	83 c4 10             	add    $0x10,%esp
}
     398:	c9                   	leave  
     399:	c3                   	ret    
     39a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int fd = open("oidir", O_RDWR);
    if(fd >= 0){
      printf(stdout, "open directory for write succeeded\n");
      exit();
    }
    exit();
     3a0:	e8 1d 35 00 00       	call   38c2 <exit>
{
  int pid;

  printf(stdout, "openiput test\n");
  if(mkdir("oidir") < 0){
    printf(stdout, "mkdir oidir failed\n");
     3a5:	51                   	push   %ecx
     3a6:	51                   	push   %ecx
     3a7:	68 d5 3d 00 00       	push   $0x3dd5
     3ac:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     3b2:	e8 59 36 00 00       	call   3a10 <printf>
    exit();
     3b7:	e8 06 35 00 00       	call   38c2 <exit>
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "fork failed\n");
     3bc:	52                   	push   %edx
     3bd:	52                   	push   %edx
     3be:	68 71 4c 00 00       	push   $0x4c71
     3c3:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     3c9:	e8 42 36 00 00       	call   3a10 <printf>
    exit();
     3ce:	e8 ef 34 00 00       	call   38c2 <exit>
    }
    exit();
  }
  sleep(1);
  if(unlink("oidir") != 0){
    printf(stdout, "unlink failed\n");
     3d3:	50                   	push   %eax
     3d4:	50                   	push   %eax
     3d5:	68 e9 3d 00 00       	push   $0x3de9
     3da:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     3e0:	e8 2b 36 00 00       	call   3a10 <printf>
    exit();
     3e5:	e8 d8 34 00 00       	call   38c2 <exit>
     3ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000003f0 <opentest>:

// simple file system tests

void
opentest(void)
{
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	83 ec 10             	sub    $0x10,%esp
  int fd;

  printf(stdout, "open test\n");
     3f6:	68 0a 3e 00 00       	push   $0x3e0a
     3fb:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     401:	e8 0a 36 00 00       	call   3a10 <printf>
  fd = open("echo", 0);
     406:	58                   	pop    %eax
     407:	5a                   	pop    %edx
     408:	6a 00                	push   $0x0
     40a:	68 15 3e 00 00       	push   $0x3e15
     40f:	e8 ee 34 00 00       	call   3902 <open>
  if(fd < 0){
     414:	83 c4 10             	add    $0x10,%esp
     417:	85 c0                	test   %eax,%eax
     419:	78 36                	js     451 <opentest+0x61>
    printf(stdout, "open echo failed!\n");
    exit();
  }
  close(fd);
     41b:	83 ec 0c             	sub    $0xc,%esp
     41e:	50                   	push   %eax
     41f:	e8 c6 34 00 00       	call   38ea <close>
  fd = open("doesnotexist", 0);
     424:	5a                   	pop    %edx
     425:	59                   	pop    %ecx
     426:	6a 00                	push   $0x0
     428:	68 2d 3e 00 00       	push   $0x3e2d
     42d:	e8 d0 34 00 00       	call   3902 <open>
  if(fd >= 0){
     432:	83 c4 10             	add    $0x10,%esp
     435:	85 c0                	test   %eax,%eax
     437:	79 2f                	jns    468 <opentest+0x78>
    printf(stdout, "open doesnotexist succeeded!\n");
    exit();
  }
  printf(stdout, "open test ok\n");
     439:	83 ec 08             	sub    $0x8,%esp
     43c:	68 58 3e 00 00       	push   $0x3e58
     441:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     447:	e8 c4 35 00 00       	call   3a10 <printf>
}
     44c:	83 c4 10             	add    $0x10,%esp
     44f:	c9                   	leave  
     450:	c3                   	ret    
  int fd;

  printf(stdout, "open test\n");
  fd = open("echo", 0);
  if(fd < 0){
    printf(stdout, "open echo failed!\n");
     451:	50                   	push   %eax
     452:	50                   	push   %eax
     453:	68 1a 3e 00 00       	push   $0x3e1a
     458:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     45e:	e8 ad 35 00 00       	call   3a10 <printf>
    exit();
     463:	e8 5a 34 00 00       	call   38c2 <exit>
  }
  close(fd);
  fd = open("doesnotexist", 0);
  if(fd >= 0){
    printf(stdout, "open doesnotexist succeeded!\n");
     468:	50                   	push   %eax
     469:	50                   	push   %eax
     46a:	68 3a 3e 00 00       	push   $0x3e3a
     46f:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     475:	e8 96 35 00 00       	call   3a10 <printf>
    exit();
     47a:	e8 43 34 00 00       	call   38c2 <exit>
     47f:	90                   	nop

00000480 <writetest>:
  printf(stdout, "open test ok\n");
}

void
writetest(void)
{
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	56                   	push   %esi
     484:	53                   	push   %ebx
  int fd;
  int i;

  printf(stdout, "small file test\n");
     485:	83 ec 08             	sub    $0x8,%esp
     488:	68 66 3e 00 00       	push   $0x3e66
     48d:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     493:	e8 78 35 00 00       	call   3a10 <printf>
  fd = open("small", O_CREATE|O_RDWR);
     498:	59                   	pop    %ecx
     499:	5b                   	pop    %ebx
     49a:	68 02 02 00 00       	push   $0x202
     49f:	68 77 3e 00 00       	push   $0x3e77
     4a4:	e8 59 34 00 00       	call   3902 <open>
  if(fd >= 0){
     4a9:	83 c4 10             	add    $0x10,%esp
     4ac:	85 c0                	test   %eax,%eax
     4ae:	0f 88 8b 01 00 00    	js     63f <writetest+0x1bf>
    printf(stdout, "creat small succeeded; ok\n");
     4b4:	83 ec 08             	sub    $0x8,%esp
     4b7:	89 c6                	mov    %eax,%esi
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     4b9:	31 db                	xor    %ebx,%ebx
  int i;

  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
     4bb:	68 7d 3e 00 00       	push   $0x3e7d
     4c0:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     4c6:	e8 45 35 00 00       	call   3a10 <printf>
     4cb:	83 c4 10             	add    $0x10,%esp
     4ce:	66 90                	xchg   %ax,%ax
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     4d0:	83 ec 04             	sub    $0x4,%esp
     4d3:	6a 0a                	push   $0xa
     4d5:	68 b4 3e 00 00       	push   $0x3eb4
     4da:	56                   	push   %esi
     4db:	e8 02 34 00 00       	call   38e2 <write>
     4e0:	83 c4 10             	add    $0x10,%esp
     4e3:	83 f8 0a             	cmp    $0xa,%eax
     4e6:	0f 85 d9 00 00 00    	jne    5c5 <writetest+0x145>
      printf(stdout, "error: write aa %d new file failed\n", i);
      exit();
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     4ec:	83 ec 04             	sub    $0x4,%esp
     4ef:	6a 0a                	push   $0xa
     4f1:	68 bf 3e 00 00       	push   $0x3ebf
     4f6:	56                   	push   %esi
     4f7:	e8 e6 33 00 00       	call   38e2 <write>
     4fc:	83 c4 10             	add    $0x10,%esp
     4ff:	83 f8 0a             	cmp    $0xa,%eax
     502:	0f 85 d6 00 00 00    	jne    5de <writetest+0x15e>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     508:	83 c3 01             	add    $0x1,%ebx
     50b:	83 fb 64             	cmp    $0x64,%ebx
     50e:	75 c0                	jne    4d0 <writetest+0x50>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     510:	83 ec 08             	sub    $0x8,%esp
     513:	68 ca 3e 00 00       	push   $0x3eca
     518:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     51e:	e8 ed 34 00 00       	call   3a10 <printf>
  close(fd);
     523:	89 34 24             	mov    %esi,(%esp)
     526:	e8 bf 33 00 00       	call   38ea <close>
  fd = open("small", O_RDONLY);
     52b:	58                   	pop    %eax
     52c:	5a                   	pop    %edx
     52d:	6a 00                	push   $0x0
     52f:	68 77 3e 00 00       	push   $0x3e77
     534:	e8 c9 33 00 00       	call   3902 <open>
  if(fd >= 0){
     539:	83 c4 10             	add    $0x10,%esp
     53c:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  printf(stdout, "writes ok\n");
  close(fd);
  fd = open("small", O_RDONLY);
     53e:	89 c3                	mov    %eax,%ebx
  if(fd >= 0){
     540:	0f 88 b1 00 00 00    	js     5f7 <writetest+0x177>
    printf(stdout, "open small succeeded ok\n");
     546:	83 ec 08             	sub    $0x8,%esp
     549:	68 d5 3e 00 00       	push   $0x3ed5
     54e:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     554:	e8 b7 34 00 00       	call   3a10 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     559:	83 c4 0c             	add    $0xc,%esp
     55c:	68 d0 07 00 00       	push   $0x7d0
     561:	68 a0 85 00 00       	push   $0x85a0
     566:	53                   	push   %ebx
     567:	e8 6e 33 00 00       	call   38da <read>
  if(i == 2000){
     56c:	83 c4 10             	add    $0x10,%esp
     56f:	3d d0 07 00 00       	cmp    $0x7d0,%eax
     574:	0f 85 95 00 00 00    	jne    60f <writetest+0x18f>
    printf(stdout, "read succeeded ok\n");
     57a:	83 ec 08             	sub    $0x8,%esp
     57d:	68 09 3f 00 00       	push   $0x3f09
     582:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     588:	e8 83 34 00 00       	call   3a10 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     58d:	89 1c 24             	mov    %ebx,(%esp)
     590:	e8 55 33 00 00       	call   38ea <close>

  if(unlink("small") < 0){
     595:	c7 04 24 77 3e 00 00 	movl   $0x3e77,(%esp)
     59c:	e8 71 33 00 00       	call   3912 <unlink>
     5a1:	83 c4 10             	add    $0x10,%esp
     5a4:	85 c0                	test   %eax,%eax
     5a6:	78 7f                	js     627 <writetest+0x1a7>
    printf(stdout, "unlink small failed\n");
    exit();
  }
  printf(stdout, "small file test ok\n");
     5a8:	83 ec 08             	sub    $0x8,%esp
     5ab:	68 31 3f 00 00       	push   $0x3f31
     5b0:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     5b6:	e8 55 34 00 00       	call   3a10 <printf>
}
     5bb:	83 c4 10             	add    $0x10,%esp
     5be:	8d 65 f8             	lea    -0x8(%ebp),%esp
     5c1:	5b                   	pop    %ebx
     5c2:	5e                   	pop    %esi
     5c3:	5d                   	pop    %ebp
     5c4:	c3                   	ret    
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
      printf(stdout, "error: write aa %d new file failed\n", i);
     5c5:	83 ec 04             	sub    $0x4,%esp
     5c8:	53                   	push   %ebx
     5c9:	68 78 4d 00 00       	push   $0x4d78
     5ce:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     5d4:	e8 37 34 00 00       	call   3a10 <printf>
      exit();
     5d9:	e8 e4 32 00 00       	call   38c2 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
     5de:	83 ec 04             	sub    $0x4,%esp
     5e1:	53                   	push   %ebx
     5e2:	68 9c 4d 00 00       	push   $0x4d9c
     5e7:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     5ed:	e8 1e 34 00 00       	call   3a10 <printf>
      exit();
     5f2:	e8 cb 32 00 00       	call   38c2 <exit>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     5f7:	83 ec 08             	sub    $0x8,%esp
     5fa:	68 ee 3e 00 00       	push   $0x3eee
     5ff:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     605:	e8 06 34 00 00       	call   3a10 <printf>
    exit();
     60a:	e8 b3 32 00 00       	call   38c2 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     60f:	83 ec 08             	sub    $0x8,%esp
     612:	68 35 42 00 00       	push   $0x4235
     617:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     61d:	e8 ee 33 00 00       	call   3a10 <printf>
    exit();
     622:	e8 9b 32 00 00       	call   38c2 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     627:	83 ec 08             	sub    $0x8,%esp
     62a:	68 1c 3f 00 00       	push   $0x3f1c
     62f:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     635:	e8 d6 33 00 00       	call   3a10 <printf>
    exit();
     63a:	e8 83 32 00 00       	call   38c2 <exit>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     63f:	83 ec 08             	sub    $0x8,%esp
     642:	68 98 3e 00 00       	push   $0x3e98
     647:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     64d:	e8 be 33 00 00       	call   3a10 <printf>
    exit();
     652:	e8 6b 32 00 00       	call   38c2 <exit>
     657:	89 f6                	mov    %esi,%esi
     659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000660 <writetest1>:
  printf(stdout, "small file test ok\n");
}

void
writetest1(void)
{
     660:	55                   	push   %ebp
     661:	89 e5                	mov    %esp,%ebp
     663:	56                   	push   %esi
     664:	53                   	push   %ebx
  int i, fd, n;

  printf(stdout, "big files test\n");
     665:	83 ec 08             	sub    $0x8,%esp
     668:	68 45 3f 00 00       	push   $0x3f45
     66d:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     673:	e8 98 33 00 00       	call   3a10 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     678:	59                   	pop    %ecx
     679:	5b                   	pop    %ebx
     67a:	68 02 02 00 00       	push   $0x202
     67f:	68 bf 3f 00 00       	push   $0x3fbf
     684:	e8 79 32 00 00       	call   3902 <open>
  if(fd < 0){
     689:	83 c4 10             	add    $0x10,%esp
     68c:	85 c0                	test   %eax,%eax
     68e:	0f 88 64 01 00 00    	js     7f8 <writetest1+0x198>
     694:	89 c6                	mov    %eax,%esi
     696:	31 db                	xor    %ebx,%ebx
     698:	90                   	nop
     699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
     6a0:	83 ec 04             	sub    $0x4,%esp
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
     6a3:	89 1d a0 85 00 00    	mov    %ebx,0x85a0
    if(write(fd, buf, 512) != 512){
     6a9:	68 00 02 00 00       	push   $0x200
     6ae:	68 a0 85 00 00       	push   $0x85a0
     6b3:	56                   	push   %esi
     6b4:	e8 29 32 00 00       	call   38e2 <write>
     6b9:	83 c4 10             	add    $0x10,%esp
     6bc:	3d 00 02 00 00       	cmp    $0x200,%eax
     6c1:	0f 85 b3 00 00 00    	jne    77a <writetest1+0x11a>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     6c7:	83 c3 01             	add    $0x1,%ebx
     6ca:	81 fb 8c 00 00 00    	cmp    $0x8c,%ebx
     6d0:	75 ce                	jne    6a0 <writetest1+0x40>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
     6d2:	83 ec 0c             	sub    $0xc,%esp
     6d5:	56                   	push   %esi
     6d6:	e8 0f 32 00 00       	call   38ea <close>

  fd = open("big", O_RDONLY);
     6db:	58                   	pop    %eax
     6dc:	5a                   	pop    %edx
     6dd:	6a 00                	push   $0x0
     6df:	68 bf 3f 00 00       	push   $0x3fbf
     6e4:	e8 19 32 00 00       	call   3902 <open>
  if(fd < 0){
     6e9:	83 c4 10             	add    $0x10,%esp
     6ec:	85 c0                	test   %eax,%eax
    }
  }

  close(fd);

  fd = open("big", O_RDONLY);
     6ee:	89 c6                	mov    %eax,%esi
  if(fd < 0){
     6f0:	0f 88 ea 00 00 00    	js     7e0 <writetest1+0x180>
     6f6:	31 db                	xor    %ebx,%ebx
     6f8:	eb 1d                	jmp    717 <writetest1+0xb7>
     6fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
     700:	3d 00 02 00 00       	cmp    $0x200,%eax
     705:	0f 85 9f 00 00 00    	jne    7aa <writetest1+0x14a>
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
     70b:	a1 a0 85 00 00       	mov    0x85a0,%eax
     710:	39 c3                	cmp    %eax,%ebx
     712:	75 7f                	jne    793 <writetest1+0x133>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
     714:	83 c3 01             	add    $0x1,%ebx
    exit();
  }

  n = 0;
  for(;;){
    i = read(fd, buf, 512);
     717:	83 ec 04             	sub    $0x4,%esp
     71a:	68 00 02 00 00       	push   $0x200
     71f:	68 a0 85 00 00       	push   $0x85a0
     724:	56                   	push   %esi
     725:	e8 b0 31 00 00       	call   38da <read>
    if(i == 0){
     72a:	83 c4 10             	add    $0x10,%esp
     72d:	85 c0                	test   %eax,%eax
     72f:	75 cf                	jne    700 <writetest1+0xa0>
      if(n == MAXFILE - 1){
     731:	81 fb 8b 00 00 00    	cmp    $0x8b,%ebx
     737:	0f 84 86 00 00 00    	je     7c3 <writetest1+0x163>
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
     73d:	83 ec 0c             	sub    $0xc,%esp
     740:	56                   	push   %esi
     741:	e8 a4 31 00 00       	call   38ea <close>
  if(unlink("big") < 0){
     746:	c7 04 24 bf 3f 00 00 	movl   $0x3fbf,(%esp)
     74d:	e8 c0 31 00 00       	call   3912 <unlink>
     752:	83 c4 10             	add    $0x10,%esp
     755:	85 c0                	test   %eax,%eax
     757:	0f 88 b3 00 00 00    	js     810 <writetest1+0x1b0>
    printf(stdout, "unlink big failed\n");
    exit();
  }
  printf(stdout, "big files ok\n");
     75d:	83 ec 08             	sub    $0x8,%esp
     760:	68 e6 3f 00 00       	push   $0x3fe6
     765:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     76b:	e8 a0 32 00 00       	call   3a10 <printf>
}
     770:	83 c4 10             	add    $0x10,%esp
     773:	8d 65 f8             	lea    -0x8(%ebp),%esp
     776:	5b                   	pop    %ebx
     777:	5e                   	pop    %esi
     778:	5d                   	pop    %ebp
     779:	c3                   	ret    
  }

  for(i = 0; i < MAXFILE; i++){
    ((int*)buf)[0] = i;
    if(write(fd, buf, 512) != 512){
      printf(stdout, "error: write big file failed\n", i);
     77a:	83 ec 04             	sub    $0x4,%esp
     77d:	53                   	push   %ebx
     77e:	68 6f 3f 00 00       	push   $0x3f6f
     783:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     789:	e8 82 32 00 00       	call   3a10 <printf>
      exit();
     78e:	e8 2f 31 00 00       	call   38c2 <exit>
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     793:	50                   	push   %eax
     794:	53                   	push   %ebx
     795:	68 c0 4d 00 00       	push   $0x4dc0
     79a:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     7a0:	e8 6b 32 00 00       	call   3a10 <printf>
             n, ((int*)buf)[0]);
      exit();
     7a5:	e8 18 31 00 00       	call   38c2 <exit>
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
     7aa:	83 ec 04             	sub    $0x4,%esp
     7ad:	50                   	push   %eax
     7ae:	68 c3 3f 00 00       	push   $0x3fc3
     7b3:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     7b9:	e8 52 32 00 00       	call   3a10 <printf>
      exit();
     7be:	e8 ff 30 00 00       	call   38c2 <exit>
  n = 0;
  for(;;){
    i = read(fd, buf, 512);
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
     7c3:	83 ec 04             	sub    $0x4,%esp
     7c6:	68 8b 00 00 00       	push   $0x8b
     7cb:	68 a6 3f 00 00       	push   $0x3fa6
     7d0:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     7d6:	e8 35 32 00 00       	call   3a10 <printf>
        exit();
     7db:	e8 e2 30 00 00       	call   38c2 <exit>

  close(fd);

  fd = open("big", O_RDONLY);
  if(fd < 0){
    printf(stdout, "error: open big failed!\n");
     7e0:	83 ec 08             	sub    $0x8,%esp
     7e3:	68 8d 3f 00 00       	push   $0x3f8d
     7e8:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     7ee:	e8 1d 32 00 00       	call   3a10 <printf>
    exit();
     7f3:	e8 ca 30 00 00       	call   38c2 <exit>

  printf(stdout, "big files test\n");

  fd = open("big", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
     7f8:	83 ec 08             	sub    $0x8,%esp
     7fb:	68 55 3f 00 00       	push   $0x3f55
     800:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     806:	e8 05 32 00 00       	call   3a10 <printf>
    exit();
     80b:	e8 b2 30 00 00       	call   38c2 <exit>
    }
    n++;
  }
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     810:	83 ec 08             	sub    $0x8,%esp
     813:	68 d3 3f 00 00       	push   $0x3fd3
     818:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     81e:	e8 ed 31 00 00       	call   3a10 <printf>
    exit();
     823:	e8 9a 30 00 00       	call   38c2 <exit>
     828:	90                   	nop
     829:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000830 <createtest>:
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     830:	55                   	push   %ebp
     831:	89 e5                	mov    %esp,%ebp
     833:	53                   	push   %ebx
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
     834:	bb 30 00 00 00       	mov    $0x30,%ebx
  printf(stdout, "big files ok\n");
}

void
createtest(void)
{
     839:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     83c:	68 e0 4d 00 00       	push   $0x4de0
     841:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     847:	e8 c4 31 00 00       	call   3a10 <printf>

  name[0] = 'a';
     84c:	c6 05 a0 a5 00 00 61 	movb   $0x61,0xa5a0
  name[2] = '\0';
     853:	c6 05 a2 a5 00 00 00 	movb   $0x0,0xa5a2
     85a:	83 c4 10             	add    $0x10,%esp
     85d:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
     860:	83 ec 08             	sub    $0x8,%esp
  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     863:	88 1d a1 a5 00 00    	mov    %bl,0xa5a1
     869:	83 c3 01             	add    $0x1,%ebx
    fd = open(name, O_CREATE|O_RDWR);
     86c:	68 02 02 00 00       	push   $0x202
     871:	68 a0 a5 00 00       	push   $0xa5a0
     876:	e8 87 30 00 00       	call   3902 <open>
    close(fd);
     87b:	89 04 24             	mov    %eax,(%esp)
     87e:	e8 67 30 00 00       	call   38ea <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     883:	83 c4 10             	add    $0x10,%esp
     886:	80 fb 64             	cmp    $0x64,%bl
     889:	75 d5                	jne    860 <createtest+0x30>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     88b:	c6 05 a0 a5 00 00 61 	movb   $0x61,0xa5a0
  name[2] = '\0';
     892:	c6 05 a2 a5 00 00 00 	movb   $0x0,0xa5a2
     899:	bb 30 00 00 00       	mov    $0x30,%ebx
     89e:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
    unlink(name);
     8a0:	83 ec 0c             	sub    $0xc,%esp
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
    name[1] = '0' + i;
     8a3:	88 1d a1 a5 00 00    	mov    %bl,0xa5a1
     8a9:	83 c3 01             	add    $0x1,%ebx
    unlink(name);
     8ac:	68 a0 a5 00 00       	push   $0xa5a0
     8b1:	e8 5c 30 00 00       	call   3912 <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     8b6:	83 c4 10             	add    $0x10,%esp
     8b9:	80 fb 64             	cmp    $0x64,%bl
     8bc:	75 e2                	jne    8a0 <createtest+0x70>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     8be:	83 ec 08             	sub    $0x8,%esp
     8c1:	68 08 4e 00 00       	push   $0x4e08
     8c6:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     8cc:	e8 3f 31 00 00       	call   3a10 <printf>
}
     8d1:	83 c4 10             	add    $0x10,%esp
     8d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8d7:	c9                   	leave  
     8d8:	c3                   	ret    
     8d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000008e0 <dirtest>:

void dirtest(void)
{
     8e0:	55                   	push   %ebp
     8e1:	89 e5                	mov    %esp,%ebp
     8e3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "mkdir test\n");
     8e6:	68 f4 3f 00 00       	push   $0x3ff4
     8eb:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     8f1:	e8 1a 31 00 00       	call   3a10 <printf>

  if(mkdir("dir0") < 0){
     8f6:	c7 04 24 00 40 00 00 	movl   $0x4000,(%esp)
     8fd:	e8 28 30 00 00       	call   392a <mkdir>
     902:	83 c4 10             	add    $0x10,%esp
     905:	85 c0                	test   %eax,%eax
     907:	78 58                	js     961 <dirtest+0x81>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
     909:	83 ec 0c             	sub    $0xc,%esp
     90c:	68 00 40 00 00       	push   $0x4000
     911:	e8 1c 30 00 00       	call   3932 <chdir>
     916:	83 c4 10             	add    $0x10,%esp
     919:	85 c0                	test   %eax,%eax
     91b:	0f 88 85 00 00 00    	js     9a6 <dirtest+0xc6>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
     921:	83 ec 0c             	sub    $0xc,%esp
     924:	68 a5 45 00 00       	push   $0x45a5
     929:	e8 04 30 00 00       	call   3932 <chdir>
     92e:	83 c4 10             	add    $0x10,%esp
     931:	85 c0                	test   %eax,%eax
     933:	78 5a                	js     98f <dirtest+0xaf>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
     935:	83 ec 0c             	sub    $0xc,%esp
     938:	68 00 40 00 00       	push   $0x4000
     93d:	e8 d0 2f 00 00       	call   3912 <unlink>
     942:	83 c4 10             	add    $0x10,%esp
     945:	85 c0                	test   %eax,%eax
     947:	78 2f                	js     978 <dirtest+0x98>
    printf(stdout, "unlink dir0 failed\n");
    exit();
  }
  printf(stdout, "mkdir test ok\n");
     949:	83 ec 08             	sub    $0x8,%esp
     94c:	68 3d 40 00 00       	push   $0x403d
     951:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     957:	e8 b4 30 00 00       	call   3a10 <printf>
}
     95c:	83 c4 10             	add    $0x10,%esp
     95f:	c9                   	leave  
     960:	c3                   	ret    
void dirtest(void)
{
  printf(stdout, "mkdir test\n");

  if(mkdir("dir0") < 0){
    printf(stdout, "mkdir failed\n");
     961:	50                   	push   %eax
     962:	50                   	push   %eax
     963:	68 30 3d 00 00       	push   $0x3d30
     968:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     96e:	e8 9d 30 00 00       	call   3a10 <printf>
    exit();
     973:	e8 4a 2f 00 00       	call   38c2 <exit>
    printf(stdout, "chdir .. failed\n");
    exit();
  }

  if(unlink("dir0") < 0){
    printf(stdout, "unlink dir0 failed\n");
     978:	50                   	push   %eax
     979:	50                   	push   %eax
     97a:	68 29 40 00 00       	push   $0x4029
     97f:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     985:	e8 86 30 00 00       	call   3a10 <printf>
    exit();
     98a:	e8 33 2f 00 00       	call   38c2 <exit>
    printf(stdout, "chdir dir0 failed\n");
    exit();
  }

  if(chdir("..") < 0){
    printf(stdout, "chdir .. failed\n");
     98f:	52                   	push   %edx
     990:	52                   	push   %edx
     991:	68 18 40 00 00       	push   $0x4018
     996:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     99c:	e8 6f 30 00 00       	call   3a10 <printf>
    exit();
     9a1:	e8 1c 2f 00 00       	call   38c2 <exit>
    printf(stdout, "mkdir failed\n");
    exit();
  }

  if(chdir("dir0") < 0){
    printf(stdout, "chdir dir0 failed\n");
     9a6:	51                   	push   %ecx
     9a7:	51                   	push   %ecx
     9a8:	68 05 40 00 00       	push   $0x4005
     9ad:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     9b3:	e8 58 30 00 00       	call   3a10 <printf>
    exit();
     9b8:	e8 05 2f 00 00       	call   38c2 <exit>
     9bd:	8d 76 00             	lea    0x0(%esi),%esi

000009c0 <exectest>:
  printf(stdout, "mkdir test ok\n");
}

void
exectest(void)
{
     9c0:	55                   	push   %ebp
     9c1:	89 e5                	mov    %esp,%ebp
     9c3:	83 ec 10             	sub    $0x10,%esp
  printf(stdout, "exec test\n");
     9c6:	68 4c 40 00 00       	push   $0x404c
     9cb:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     9d1:	e8 3a 30 00 00       	call   3a10 <printf>
  if(exec("echo", echoargv) < 0){
     9d6:	5a                   	pop    %edx
     9d7:	59                   	pop    %ecx
     9d8:	68 c8 5d 00 00       	push   $0x5dc8
     9dd:	68 15 3e 00 00       	push   $0x3e15
     9e2:	e8 13 2f 00 00       	call   38fa <exec>
     9e7:	83 c4 10             	add    $0x10,%esp
     9ea:	85 c0                	test   %eax,%eax
     9ec:	78 02                	js     9f0 <exectest+0x30>
    printf(stdout, "exec echo failed\n");
    exit();
  }
}
     9ee:	c9                   	leave  
     9ef:	c3                   	ret    
void
exectest(void)
{
  printf(stdout, "exec test\n");
  if(exec("echo", echoargv) < 0){
    printf(stdout, "exec echo failed\n");
     9f0:	50                   	push   %eax
     9f1:	50                   	push   %eax
     9f2:	68 57 40 00 00       	push   $0x4057
     9f7:	ff 35 c4 5d 00 00    	pushl  0x5dc4
     9fd:	e8 0e 30 00 00       	call   3a10 <printf>
    exit();
     a02:	e8 bb 2e 00 00       	call   38c2 <exit>
     a07:	89 f6                	mov    %esi,%esi
     a09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a10 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	57                   	push   %edi
     a14:	56                   	push   %esi
     a15:	53                   	push   %ebx
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     a16:	8d 45 e0             	lea    -0x20(%ebp),%eax

// simple fork and pipe read/write

void
pipe1(void)
{
     a19:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     a1c:	50                   	push   %eax
     a1d:	e8 b0 2e 00 00       	call   38d2 <pipe>
     a22:	83 c4 10             	add    $0x10,%esp
     a25:	85 c0                	test   %eax,%eax
     a27:	0f 85 35 01 00 00    	jne    b62 <pipe1+0x152>
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
     a2d:	e8 88 2e 00 00       	call   38ba <fork>
  seq = 0;
  if(pid == 0){
     a32:	83 f8 00             	cmp    $0x0,%eax
     a35:	0f 84 86 00 00 00    	je     ac1 <pipe1+0xb1>
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
  } else if(pid > 0){
     a3b:	0f 8e 35 01 00 00    	jle    b76 <pipe1+0x166>
    close(fds[1]);
     a41:	83 ec 0c             	sub    $0xc,%esp
     a44:	ff 75 e4             	pushl  -0x1c(%ebp)
    total = 0;
    cc = 1;
     a47:	bf 01 00 00 00       	mov    $0x1,%edi
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
  seq = 0;
     a4c:	31 db                	xor    %ebx,%ebx
        exit();
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
     a4e:	e8 97 2e 00 00       	call   38ea <close>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     a53:	83 c4 10             	add    $0x10,%esp
      }
    }
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
     a56:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     a5d:	83 ec 04             	sub    $0x4,%esp
     a60:	57                   	push   %edi
     a61:	68 a0 85 00 00       	push   $0x85a0
     a66:	ff 75 e0             	pushl  -0x20(%ebp)
     a69:	e8 6c 2e 00 00       	call   38da <read>
     a6e:	83 c4 10             	add    $0x10,%esp
     a71:	85 c0                	test   %eax,%eax
     a73:	0f 8e a3 00 00 00    	jle    b1c <pipe1+0x10c>
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     a79:	89 d9                	mov    %ebx,%ecx
     a7b:	8d 34 18             	lea    (%eax,%ebx,1),%esi
     a7e:	f7 d9                	neg    %ecx
     a80:	38 9c 0b a0 85 00 00 	cmp    %bl,0x85a0(%ebx,%ecx,1)
     a87:	8d 53 01             	lea    0x1(%ebx),%edx
     a8a:	75 1b                	jne    aa7 <pipe1+0x97>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     a8c:	39 f2                	cmp    %esi,%edx
     a8e:	89 d3                	mov    %edx,%ebx
     a90:	75 ee                	jne    a80 <pipe1+0x70>
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
      cc = cc * 2;
     a92:	01 ff                	add    %edi,%edi
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     a94:	01 45 d4             	add    %eax,-0x2c(%ebp)
     a97:	b8 00 20 00 00       	mov    $0x2000,%eax
     a9c:	81 ff 00 20 00 00    	cmp    $0x2000,%edi
     aa2:	0f 4f f8             	cmovg  %eax,%edi
     aa5:	eb b6                	jmp    a5d <pipe1+0x4d>
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
     aa7:	83 ec 08             	sub    $0x8,%esp
     aaa:	68 86 40 00 00       	push   $0x4086
     aaf:	6a 01                	push   $0x1
     ab1:	e8 5a 2f 00 00       	call   3a10 <printf>
          return;
     ab6:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
}
     ab9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     abc:	5b                   	pop    %ebx
     abd:	5e                   	pop    %esi
     abe:	5f                   	pop    %edi
     abf:	5d                   	pop    %ebp
     ac0:	c3                   	ret    
    exit();
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
     ac1:	83 ec 0c             	sub    $0xc,%esp
     ac4:	ff 75 e0             	pushl  -0x20(%ebp)
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  pid = fork();
  seq = 0;
     ac7:	31 f6                	xor    %esi,%esi
  if(pid == 0){
    close(fds[0]);
     ac9:	e8 1c 2e 00 00       	call   38ea <close>
     ace:	83 c4 10             	add    $0x10,%esp
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     ad1:	89 f0                	mov    %esi,%eax
     ad3:	8d 96 09 04 00 00    	lea    0x409(%esi),%edx

// simple fork and pipe read/write

void
pipe1(void)
{
     ad9:	89 f3                	mov    %esi,%ebx
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
     adb:	f7 d8                	neg    %eax
     add:	8d 76 00             	lea    0x0(%esi),%esi
     ae0:	88 9c 18 a0 85 00 00 	mov    %bl,0x85a0(%eax,%ebx,1)
     ae7:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     aea:	39 d3                	cmp    %edx,%ebx
     aec:	75 f2                	jne    ae0 <pipe1+0xd0>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     aee:	83 ec 04             	sub    $0x4,%esp
     af1:	89 de                	mov    %ebx,%esi
     af3:	68 09 04 00 00       	push   $0x409
     af8:	68 a0 85 00 00       	push   $0x85a0
     afd:	ff 75 e4             	pushl  -0x1c(%ebp)
     b00:	e8 dd 2d 00 00       	call   38e2 <write>
     b05:	83 c4 10             	add    $0x10,%esp
     b08:	3d 09 04 00 00       	cmp    $0x409,%eax
     b0d:	75 7b                	jne    b8a <pipe1+0x17a>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     b0f:	81 fb 2d 14 00 00    	cmp    $0x142d,%ebx
     b15:	75 ba                	jne    ad1 <pipe1+0xc1>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
     b17:	e8 a6 2d 00 00       	call   38c2 <exit>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     b1c:	81 7d d4 2d 14 00 00 	cmpl   $0x142d,-0x2c(%ebp)
     b23:	75 26                	jne    b4b <pipe1+0x13b>
      printf(1, "pipe1 oops 3 total %d\n", total);
      exit();
    }
    close(fds[0]);
     b25:	83 ec 0c             	sub    $0xc,%esp
     b28:	ff 75 e0             	pushl  -0x20(%ebp)
     b2b:	e8 ba 2d 00 00       	call   38ea <close>
    wait();
     b30:	e8 95 2d 00 00       	call   38ca <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     b35:	58                   	pop    %eax
     b36:	5a                   	pop    %edx
     b37:	68 ab 40 00 00       	push   $0x40ab
     b3c:	6a 01                	push   $0x1
     b3e:	e8 cd 2e 00 00       	call   3a10 <printf>
     b43:	83 c4 10             	add    $0x10,%esp
     b46:	e9 6e ff ff ff       	jmp    ab9 <pipe1+0xa9>
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
      printf(1, "pipe1 oops 3 total %d\n", total);
     b4b:	83 ec 04             	sub    $0x4,%esp
     b4e:	ff 75 d4             	pushl  -0x2c(%ebp)
     b51:	68 94 40 00 00       	push   $0x4094
     b56:	6a 01                	push   $0x1
     b58:	e8 b3 2e 00 00       	call   3a10 <printf>
      exit();
     b5d:	e8 60 2d 00 00       	call   38c2 <exit>
{
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
     b62:	83 ec 08             	sub    $0x8,%esp
     b65:	68 69 40 00 00       	push   $0x4069
     b6a:	6a 01                	push   $0x1
     b6c:	e8 9f 2e 00 00       	call   3a10 <printf>
    exit();
     b71:	e8 4c 2d 00 00       	call   38c2 <exit>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     b76:	83 ec 08             	sub    $0x8,%esp
     b79:	68 b5 40 00 00       	push   $0x40b5
     b7e:	6a 01                	push   $0x1
     b80:	e8 8b 2e 00 00       	call   3a10 <printf>
    exit();
     b85:	e8 38 2d 00 00       	call   38c2 <exit>
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
     b8a:	83 ec 08             	sub    $0x8,%esp
     b8d:	68 78 40 00 00       	push   $0x4078
     b92:	6a 01                	push   $0x1
     b94:	e8 77 2e 00 00       	call   3a10 <printf>
        exit();
     b99:	e8 24 2d 00 00       	call   38c2 <exit>
     b9e:	66 90                	xchg   %ax,%ax

00000ba0 <preempt>:
}

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     ba0:	55                   	push   %ebp
     ba1:	89 e5                	mov    %esp,%ebp
     ba3:	57                   	push   %edi
     ba4:	56                   	push   %esi
     ba5:	53                   	push   %ebx
     ba6:	83 ec 24             	sub    $0x24,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     ba9:	68 c4 40 00 00       	push   $0x40c4
     bae:	6a 01                	push   $0x1
     bb0:	e8 5b 2e 00 00       	call   3a10 <printf>
  pid1 = fork();
     bb5:	e8 00 2d 00 00       	call   38ba <fork>
  if(pid1 == 0)
     bba:	83 c4 10             	add    $0x10,%esp
     bbd:	85 c0                	test   %eax,%eax
     bbf:	75 02                	jne    bc3 <preempt+0x23>
     bc1:	eb fe                	jmp    bc1 <preempt+0x21>
     bc3:	89 c7                	mov    %eax,%edi
    for(;;)
      ;

  pid2 = fork();
     bc5:	e8 f0 2c 00 00       	call   38ba <fork>
  if(pid2 == 0)
     bca:	85 c0                	test   %eax,%eax
  pid1 = fork();
  if(pid1 == 0)
    for(;;)
      ;

  pid2 = fork();
     bcc:	89 c6                	mov    %eax,%esi
  if(pid2 == 0)
     bce:	75 02                	jne    bd2 <preempt+0x32>
     bd0:	eb fe                	jmp    bd0 <preempt+0x30>
    for(;;)
      ;

  pipe(pfds);
     bd2:	8d 45 e0             	lea    -0x20(%ebp),%eax
     bd5:	83 ec 0c             	sub    $0xc,%esp
     bd8:	50                   	push   %eax
     bd9:	e8 f4 2c 00 00       	call   38d2 <pipe>
  pid3 = fork();
     bde:	e8 d7 2c 00 00       	call   38ba <fork>
  if(pid3 == 0){
     be3:	83 c4 10             	add    $0x10,%esp
     be6:	85 c0                	test   %eax,%eax
  if(pid2 == 0)
    for(;;)
      ;

  pipe(pfds);
  pid3 = fork();
     be8:	89 c3                	mov    %eax,%ebx
  if(pid3 == 0){
     bea:	75 47                	jne    c33 <preempt+0x93>
    close(pfds[0]);
     bec:	83 ec 0c             	sub    $0xc,%esp
     bef:	ff 75 e0             	pushl  -0x20(%ebp)
     bf2:	e8 f3 2c 00 00       	call   38ea <close>
    if(write(pfds[1], "x", 1) != 1)
     bf7:	83 c4 0c             	add    $0xc,%esp
     bfa:	6a 01                	push   $0x1
     bfc:	68 89 46 00 00       	push   $0x4689
     c01:	ff 75 e4             	pushl  -0x1c(%ebp)
     c04:	e8 d9 2c 00 00       	call   38e2 <write>
     c09:	83 c4 10             	add    $0x10,%esp
     c0c:	83 f8 01             	cmp    $0x1,%eax
     c0f:	74 12                	je     c23 <preempt+0x83>
      printf(1, "preempt write error");
     c11:	83 ec 08             	sub    $0x8,%esp
     c14:	68 ce 40 00 00       	push   $0x40ce
     c19:	6a 01                	push   $0x1
     c1b:	e8 f0 2d 00 00       	call   3a10 <printf>
     c20:	83 c4 10             	add    $0x10,%esp
    close(pfds[1]);
     c23:	83 ec 0c             	sub    $0xc,%esp
     c26:	ff 75 e4             	pushl  -0x1c(%ebp)
     c29:	e8 bc 2c 00 00       	call   38ea <close>
     c2e:	83 c4 10             	add    $0x10,%esp
     c31:	eb fe                	jmp    c31 <preempt+0x91>
    for(;;)
      ;
  }

  close(pfds[1]);
     c33:	83 ec 0c             	sub    $0xc,%esp
     c36:	ff 75 e4             	pushl  -0x1c(%ebp)
     c39:	e8 ac 2c 00 00       	call   38ea <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     c3e:	83 c4 0c             	add    $0xc,%esp
     c41:	68 00 20 00 00       	push   $0x2000
     c46:	68 a0 85 00 00       	push   $0x85a0
     c4b:	ff 75 e0             	pushl  -0x20(%ebp)
     c4e:	e8 87 2c 00 00       	call   38da <read>
     c53:	83 c4 10             	add    $0x10,%esp
     c56:	83 f8 01             	cmp    $0x1,%eax
     c59:	74 1a                	je     c75 <preempt+0xd5>
    printf(1, "preempt read error");
     c5b:	83 ec 08             	sub    $0x8,%esp
     c5e:	68 e2 40 00 00       	push   $0x40e2
     c63:	6a 01                	push   $0x1
     c65:	e8 a6 2d 00 00       	call   3a10 <printf>
    return;
     c6a:	83 c4 10             	add    $0x10,%esp
  printf(1, "wait... ");
  wait();
  wait();
  wait();
  printf(1, "preempt ok\n");
}
     c6d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c70:	5b                   	pop    %ebx
     c71:	5e                   	pop    %esi
     c72:	5f                   	pop    %edi
     c73:	5d                   	pop    %ebp
     c74:	c3                   	ret    
  close(pfds[1]);
  if(read(pfds[0], buf, sizeof(buf)) != 1){
    printf(1, "preempt read error");
    return;
  }
  close(pfds[0]);
     c75:	83 ec 0c             	sub    $0xc,%esp
     c78:	ff 75 e0             	pushl  -0x20(%ebp)
     c7b:	e8 6a 2c 00 00       	call   38ea <close>
  printf(1, "kill... ");
     c80:	58                   	pop    %eax
     c81:	5a                   	pop    %edx
     c82:	68 f5 40 00 00       	push   $0x40f5
     c87:	6a 01                	push   $0x1
     c89:	e8 82 2d 00 00       	call   3a10 <printf>
  kill(pid1);
     c8e:	89 3c 24             	mov    %edi,(%esp)
     c91:	e8 5c 2c 00 00       	call   38f2 <kill>
  kill(pid2);
     c96:	89 34 24             	mov    %esi,(%esp)
     c99:	e8 54 2c 00 00       	call   38f2 <kill>
  kill(pid3);
     c9e:	89 1c 24             	mov    %ebx,(%esp)
     ca1:	e8 4c 2c 00 00       	call   38f2 <kill>
  printf(1, "wait... ");
     ca6:	59                   	pop    %ecx
     ca7:	5b                   	pop    %ebx
     ca8:	68 fe 40 00 00       	push   $0x40fe
     cad:	6a 01                	push   $0x1
     caf:	e8 5c 2d 00 00       	call   3a10 <printf>
  wait();
     cb4:	e8 11 2c 00 00       	call   38ca <wait>
  wait();
     cb9:	e8 0c 2c 00 00       	call   38ca <wait>
  wait();
     cbe:	e8 07 2c 00 00       	call   38ca <wait>
  printf(1, "preempt ok\n");
     cc3:	5e                   	pop    %esi
     cc4:	5f                   	pop    %edi
     cc5:	68 07 41 00 00       	push   $0x4107
     cca:	6a 01                	push   $0x1
     ccc:	e8 3f 2d 00 00       	call   3a10 <printf>
     cd1:	83 c4 10             	add    $0x10,%esp
     cd4:	eb 97                	jmp    c6d <preempt+0xcd>
     cd6:	8d 76 00             	lea    0x0(%esi),%esi
     cd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ce0 <exitwait>:
}

// try to find any races between exit and wait
void
exitwait(void)
{
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	56                   	push   %esi
     ce4:	be 64 00 00 00       	mov    $0x64,%esi
     ce9:	53                   	push   %ebx
     cea:	eb 14                	jmp    d00 <exitwait+0x20>
     cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
     cf0:	74 6f                	je     d61 <exitwait+0x81>
      if(wait() != pid){
     cf2:	e8 d3 2b 00 00       	call   38ca <wait>
     cf7:	39 c3                	cmp    %eax,%ebx
     cf9:	75 2d                	jne    d28 <exitwait+0x48>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     cfb:	83 ee 01             	sub    $0x1,%esi
     cfe:	74 48                	je     d48 <exitwait+0x68>
    pid = fork();
     d00:	e8 b5 2b 00 00       	call   38ba <fork>
    if(pid < 0){
     d05:	85 c0                	test   %eax,%eax
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
    pid = fork();
     d07:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
     d09:	79 e5                	jns    cf0 <exitwait+0x10>
      printf(1, "fork failed\n");
     d0b:	83 ec 08             	sub    $0x8,%esp
     d0e:	68 71 4c 00 00       	push   $0x4c71
     d13:	6a 01                	push   $0x1
     d15:	e8 f6 2c 00 00       	call   3a10 <printf>
      return;
     d1a:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     d1d:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d20:	5b                   	pop    %ebx
     d21:	5e                   	pop    %esi
     d22:	5d                   	pop    %ebp
     d23:	c3                   	ret    
     d24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      printf(1, "fork failed\n");
      return;
    }
    if(pid){
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
     d28:	83 ec 08             	sub    $0x8,%esp
     d2b:	68 13 41 00 00       	push   $0x4113
     d30:	6a 01                	push   $0x1
     d32:	e8 d9 2c 00 00       	call   3a10 <printf>
        return;
     d37:	83 c4 10             	add    $0x10,%esp
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
}
     d3a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d3d:	5b                   	pop    %ebx
     d3e:	5e                   	pop    %esi
     d3f:	5d                   	pop    %ebp
     d40:	c3                   	ret    
     d41:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     d48:	83 ec 08             	sub    $0x8,%esp
     d4b:	68 23 41 00 00       	push   $0x4123
     d50:	6a 01                	push   $0x1
     d52:	e8 b9 2c 00 00       	call   3a10 <printf>
     d57:	83 c4 10             	add    $0x10,%esp
}
     d5a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d5d:	5b                   	pop    %ebx
     d5e:	5e                   	pop    %esi
     d5f:	5d                   	pop    %ebp
     d60:	c3                   	ret    
      if(wait() != pid){
        printf(1, "wait wrong pid\n");
        return;
      }
    } else {
      exit();
     d61:	e8 5c 2b 00 00       	call   38c2 <exit>
     d66:	8d 76 00             	lea    0x0(%esi),%esi
     d69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000d70 <mem>:
  printf(1, "exitwait ok\n");
}

void
mem(void)
{
     d70:	55                   	push   %ebp
     d71:	89 e5                	mov    %esp,%ebp
     d73:	57                   	push   %edi
     d74:	56                   	push   %esi
     d75:	53                   	push   %ebx
     d76:	83 ec 14             	sub    $0x14,%esp
  void *m1, *m2;
  int pid, ppid;

 	printf(1, "mem test\n");
     d79:	68 30 41 00 00       	push   $0x4130
     d7e:	6a 01                	push   $0x1
     d80:	e8 8b 2c 00 00       	call   3a10 <printf>
  ppid = getpid();
     d85:	e8 b8 2b 00 00       	call   3942 <getpid>
     d8a:	89 c6                	mov    %eax,%esi
  if((pid = fork()) == 0){
     d8c:	e8 29 2b 00 00       	call   38ba <fork>
     d91:	83 c4 10             	add    $0x10,%esp
     d94:	85 c0                	test   %eax,%eax
     d96:	0f 85 8c 00 00 00    	jne    e28 <mem+0xb8>
     d9c:	31 ff                	xor    %edi,%edi
    m1 = 0;
		while((m2 = malloc(10001)) != 0){
			if((int)m2 % 1000 == 0)
     d9e:	bb d3 4d 62 10       	mov    $0x10624dd3,%ebx
     da3:	90                   	nop
     da4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

 	printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
		while((m2 = malloc(10001)) != 0){
     da8:	83 ec 0c             	sub    $0xc,%esp
     dab:	68 11 27 00 00       	push   $0x2711
     db0:	e8 8b 2e 00 00       	call   3c40 <malloc>
     db5:	83 c4 10             	add    $0x10,%esp
     db8:	85 c0                	test   %eax,%eax
     dba:	89 c1                	mov    %eax,%ecx
     dbc:	74 32                	je     df0 <mem+0x80>
			if((int)m2 % 1000 == 0)
     dbe:	89 c8                	mov    %ecx,%eax
     dc0:	f7 eb                	imul   %ebx
     dc2:	89 c8                	mov    %ecx,%eax
     dc4:	c1 f8 1f             	sar    $0x1f,%eax
     dc7:	c1 fa 06             	sar    $0x6,%edx
     dca:	29 c2                	sub    %eax,%edx
     dcc:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
     dd2:	39 d1                	cmp    %edx,%ecx
     dd4:	75 02                	jne    dd8 <mem+0x68>
			*(char**)m2 = m1;
     dd6:	89 39                	mov    %edi,(%ecx)
     dd8:	89 cf                	mov    %ecx,%edi
     dda:	eb cc                	jmp    da8 <mem+0x38>
     ddc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      m1 = m2;
    }
    while(m1){
      m2 = *(char**)m1;
     de0:	8b 1f                	mov    (%edi),%ebx
      free(m1);
     de2:	83 ec 0c             	sub    $0xc,%esp
     de5:	57                   	push   %edi
     de6:	89 df                	mov    %ebx,%edi
     de8:	e8 c3 2d 00 00       	call   3bb0 <free>
		while((m2 = malloc(10001)) != 0){
			if((int)m2 % 1000 == 0)
			*(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     ded:	83 c4 10             	add    $0x10,%esp
     df0:	85 ff                	test   %edi,%edi
     df2:	75 ec                	jne    de0 <mem+0x70>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     df4:	83 ec 0c             	sub    $0xc,%esp
     df7:	68 00 50 00 00       	push   $0x5000
     dfc:	e8 3f 2e 00 00       	call   3c40 <malloc>
    if(m1 == 0){
     e01:	83 c4 10             	add    $0x10,%esp
     e04:	85 c0                	test   %eax,%eax
     e06:	74 30                	je     e38 <mem+0xc8>
      printf(1, "couldn't allocate mem?!!\n");
      kill(ppid);
      exit();
    }
    free(m1);
     e08:	83 ec 0c             	sub    $0xc,%esp
     e0b:	50                   	push   %eax
     e0c:	e8 9f 2d 00 00       	call   3bb0 <free>
    printf(1, "mem ok\n");
     e11:	58                   	pop    %eax
     e12:	5a                   	pop    %edx
     e13:	68 54 41 00 00       	push   $0x4154
     e18:	6a 01                	push   $0x1
     e1a:	e8 f1 2b 00 00       	call   3a10 <printf>
    exit();
     e1f:	e8 9e 2a 00 00       	call   38c2 <exit>
     e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  } else {
    wait();
  }
}
     e28:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e2b:	5b                   	pop    %ebx
     e2c:	5e                   	pop    %esi
     e2d:	5f                   	pop    %edi
     e2e:	5d                   	pop    %ebp
    }
    free(m1);
    printf(1, "mem ok\n");
    exit();
  } else {
    wait();
     e2f:	e9 96 2a 00 00       	jmp    38ca <wait>
     e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
    if(m1 == 0){
      printf(1, "couldn't allocate mem?!!\n");
     e38:	83 ec 08             	sub    $0x8,%esp
     e3b:	68 3a 41 00 00       	push   $0x413a
     e40:	6a 01                	push   $0x1
     e42:	e8 c9 2b 00 00       	call   3a10 <printf>
      kill(ppid);
     e47:	89 34 24             	mov    %esi,(%esp)
     e4a:	e8 a3 2a 00 00       	call   38f2 <kill>
      exit();
     e4f:	e8 6e 2a 00 00       	call   38c2 <exit>
     e54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     e5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000e60 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     e60:	55                   	push   %ebp
     e61:	89 e5                	mov    %esp,%ebp
     e63:	57                   	push   %edi
     e64:	56                   	push   %esi
     e65:	53                   	push   %ebx
     e66:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     e69:	68 5c 41 00 00       	push   $0x415c
     e6e:	6a 01                	push   $0x1
     e70:	e8 9b 2b 00 00       	call   3a10 <printf>

  unlink("sharedfd");
     e75:	c7 04 24 6b 41 00 00 	movl   $0x416b,(%esp)
     e7c:	e8 91 2a 00 00       	call   3912 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     e81:	5b                   	pop    %ebx
     e82:	5e                   	pop    %esi
     e83:	68 02 02 00 00       	push   $0x202
     e88:	68 6b 41 00 00       	push   $0x416b
     e8d:	e8 70 2a 00 00       	call   3902 <open>
  if(fd < 0){
     e92:	83 c4 10             	add    $0x10,%esp
     e95:	85 c0                	test   %eax,%eax
     e97:	0f 88 29 01 00 00    	js     fc6 <sharedfd+0x166>
     e9d:	89 c7                	mov    %eax,%edi
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
  memset(buf, pid==0?'c':'p', sizeof(buf));
     e9f:	8d 75 de             	lea    -0x22(%ebp),%esi
     ea2:	bb e8 03 00 00       	mov    $0x3e8,%ebx
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     ea7:	e8 0e 2a 00 00       	call   38ba <fork>
  memset(buf, pid==0?'c':'p', sizeof(buf));
     eac:	83 f8 01             	cmp    $0x1,%eax
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
     eaf:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     eb2:	19 c0                	sbb    %eax,%eax
     eb4:	83 ec 04             	sub    $0x4,%esp
     eb7:	83 e0 f3             	and    $0xfffffff3,%eax
     eba:	6a 0a                	push   $0xa
     ebc:	83 c0 70             	add    $0x70,%eax
     ebf:	50                   	push   %eax
     ec0:	56                   	push   %esi
     ec1:	e8 6a 28 00 00       	call   3730 <memset>
     ec6:	83 c4 10             	add    $0x10,%esp
     ec9:	eb 0a                	jmp    ed5 <sharedfd+0x75>
     ecb:	90                   	nop
     ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 1000; i++){
     ed0:	83 eb 01             	sub    $0x1,%ebx
     ed3:	74 26                	je     efb <sharedfd+0x9b>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     ed5:	83 ec 04             	sub    $0x4,%esp
     ed8:	6a 0a                	push   $0xa
     eda:	56                   	push   %esi
     edb:	57                   	push   %edi
     edc:	e8 01 2a 00 00       	call   38e2 <write>
     ee1:	83 c4 10             	add    $0x10,%esp
     ee4:	83 f8 0a             	cmp    $0xa,%eax
     ee7:	74 e7                	je     ed0 <sharedfd+0x70>
      printf(1, "fstests: write sharedfd failed\n");
     ee9:	83 ec 08             	sub    $0x8,%esp
     eec:	68 5c 4e 00 00       	push   $0x4e5c
     ef1:	6a 01                	push   $0x1
     ef3:	e8 18 2b 00 00       	call   3a10 <printf>
      break;
     ef8:	83 c4 10             	add    $0x10,%esp
    }
  }
  if(pid == 0)
     efb:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     efe:	85 c9                	test   %ecx,%ecx
     f00:	0f 84 f4 00 00 00    	je     ffa <sharedfd+0x19a>
    exit();
  else
    wait();
     f06:	e8 bf 29 00 00       	call   38ca <wait>
  close(fd);
     f0b:	83 ec 0c             	sub    $0xc,%esp
     f0e:	31 db                	xor    %ebx,%ebx
     f10:	57                   	push   %edi
     f11:	8d 7d e8             	lea    -0x18(%ebp),%edi
     f14:	e8 d1 29 00 00       	call   38ea <close>
  fd = open("sharedfd", 0);
     f19:	58                   	pop    %eax
     f1a:	5a                   	pop    %edx
     f1b:	6a 00                	push   $0x0
     f1d:	68 6b 41 00 00       	push   $0x416b
     f22:	e8 db 29 00 00       	call   3902 <open>
  if(fd < 0){
     f27:	83 c4 10             	add    $0x10,%esp
     f2a:	31 d2                	xor    %edx,%edx
     f2c:	85 c0                	test   %eax,%eax
  if(pid == 0)
    exit();
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
     f2e:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(fd < 0){
     f31:	0f 88 a9 00 00 00    	js     fe0 <sharedfd+0x180>
     f37:	89 f6                	mov    %esi,%esi
     f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     f40:	83 ec 04             	sub    $0x4,%esp
     f43:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     f46:	6a 0a                	push   $0xa
     f48:	56                   	push   %esi
     f49:	ff 75 d0             	pushl  -0x30(%ebp)
     f4c:	e8 89 29 00 00       	call   38da <read>
     f51:	83 c4 10             	add    $0x10,%esp
     f54:	85 c0                	test   %eax,%eax
     f56:	7e 27                	jle    f7f <sharedfd+0x11f>
     f58:	89 f0                	mov    %esi,%eax
     f5a:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f5d:	eb 13                	jmp    f72 <sharedfd+0x112>
     f5f:	90                   	nop
    for(i = 0; i < sizeof(buf); i++){
      if(buf[i] == 'c')
        nc++;
      if(buf[i] == 'p')
        np++;
     f60:	80 f9 70             	cmp    $0x70,%cl
     f63:	0f 94 c1             	sete   %cl
     f66:	0f b6 c9             	movzbl %cl,%ecx
     f69:	01 cb                	add    %ecx,%ebx
     f6b:	83 c0 01             	add    $0x1,%eax
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
     f6e:	39 c7                	cmp    %eax,%edi
     f70:	74 ce                	je     f40 <sharedfd+0xe0>
      if(buf[i] == 'c')
     f72:	0f b6 08             	movzbl (%eax),%ecx
     f75:	80 f9 63             	cmp    $0x63,%cl
     f78:	75 e6                	jne    f60 <sharedfd+0x100>
        nc++;
     f7a:	83 c2 01             	add    $0x1,%edx
     f7d:	eb ec                	jmp    f6b <sharedfd+0x10b>
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
     f7f:	83 ec 0c             	sub    $0xc,%esp
     f82:	ff 75 d0             	pushl  -0x30(%ebp)
     f85:	e8 60 29 00 00       	call   38ea <close>
  unlink("sharedfd");
     f8a:	c7 04 24 6b 41 00 00 	movl   $0x416b,(%esp)
     f91:	e8 7c 29 00 00       	call   3912 <unlink>
  if(nc == 10000 && np == 10000){
     f96:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     f99:	83 c4 10             	add    $0x10,%esp
     f9c:	81 fa 10 27 00 00    	cmp    $0x2710,%edx
     fa2:	75 5b                	jne    fff <sharedfd+0x19f>
     fa4:	81 fb 10 27 00 00    	cmp    $0x2710,%ebx
     faa:	75 53                	jne    fff <sharedfd+0x19f>
    printf(1, "sharedfd ok\n");
     fac:	83 ec 08             	sub    $0x8,%esp
     faf:	68 74 41 00 00       	push   $0x4174
     fb4:	6a 01                	push   $0x1
     fb6:	e8 55 2a 00 00       	call   3a10 <printf>
     fbb:	83 c4 10             	add    $0x10,%esp
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     fbe:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fc1:	5b                   	pop    %ebx
     fc2:	5e                   	pop    %esi
     fc3:	5f                   	pop    %edi
     fc4:	5d                   	pop    %ebp
     fc5:	c3                   	ret    
  printf(1, "sharedfd test\n");

  unlink("sharedfd");
  fd = open("sharedfd", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for writing");
     fc6:	83 ec 08             	sub    $0x8,%esp
     fc9:	68 30 4e 00 00       	push   $0x4e30
     fce:	6a 01                	push   $0x1
     fd0:	e8 3b 2a 00 00       	call   3a10 <printf>
    return;
     fd5:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     fd8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     fdb:	5b                   	pop    %ebx
     fdc:	5e                   	pop    %esi
     fdd:	5f                   	pop    %edi
     fde:	5d                   	pop    %ebp
     fdf:	c3                   	ret    
  else
    wait();
  close(fd);
  fd = open("sharedfd", 0);
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
     fe0:	83 ec 08             	sub    $0x8,%esp
     fe3:	68 7c 4e 00 00       	push   $0x4e7c
     fe8:	6a 01                	push   $0x1
     fea:	e8 21 2a 00 00       	call   3a10 <printf>
    return;
     fef:	83 c4 10             	add    $0x10,%esp
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
    exit();
  }
}
     ff2:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ff5:	5b                   	pop    %ebx
     ff6:	5e                   	pop    %esi
     ff7:	5f                   	pop    %edi
     ff8:	5d                   	pop    %ebp
     ff9:	c3                   	ret    
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
    exit();
     ffa:	e8 c3 28 00 00       	call   38c2 <exit>
  close(fd);
  unlink("sharedfd");
  if(nc == 10000 && np == 10000){
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
     fff:	53                   	push   %ebx
    1000:	52                   	push   %edx
    1001:	68 81 41 00 00       	push   $0x4181
    1006:	6a 01                	push   $0x1
    1008:	e8 03 2a 00 00       	call   3a10 <printf>
    exit();
    100d:	e8 b0 28 00 00       	call   38c2 <exit>
    1012:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001020 <fourfiles>:

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    1020:	55                   	push   %ebp
    1021:	89 e5                	mov    %esp,%ebp
    1023:	57                   	push   %edi
    1024:	56                   	push   %esi
    1025:	53                   	push   %ebx
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");
    1026:	be 96 41 00 00       	mov    $0x4196,%esi

  for(pi = 0; pi < 4; pi++){
    102b:	31 db                	xor    %ebx,%ebx

// four processes write different files at the same
// time, to test block allocation.
void
fourfiles(void)
{
    102d:	83 ec 34             	sub    $0x34,%esp
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1030:	c7 45 d8 96 41 00 00 	movl   $0x4196,-0x28(%ebp)
    1037:	c7 45 dc df 42 00 00 	movl   $0x42df,-0x24(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    103e:	68 9c 41 00 00       	push   $0x419c
    1043:	6a 01                	push   $0x1
// time, to test block allocation.
void
fourfiles(void)
{
  int fd, pid, i, j, n, total, pi;
  char *names[] = { "f0", "f1", "f2", "f3" };
    1045:	c7 45 e0 e3 42 00 00 	movl   $0x42e3,-0x20(%ebp)
    104c:	c7 45 e4 99 41 00 00 	movl   $0x4199,-0x1c(%ebp)
  char *fname;

  printf(1, "fourfiles test\n");
    1053:	e8 b8 29 00 00       	call   3a10 <printf>
    1058:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    fname = names[pi];
    unlink(fname);
    105b:	83 ec 0c             	sub    $0xc,%esp
    105e:	56                   	push   %esi
    105f:	e8 ae 28 00 00       	call   3912 <unlink>

    pid = fork();
    1064:	e8 51 28 00 00       	call   38ba <fork>
    if(pid < 0){
    1069:	83 c4 10             	add    $0x10,%esp
    106c:	85 c0                	test   %eax,%eax
    106e:	0f 88 83 01 00 00    	js     11f7 <fourfiles+0x1d7>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    1074:	0f 84 e3 00 00 00    	je     115d <fourfiles+0x13d>
  char *names[] = { "f0", "f1", "f2", "f3" };
  char *fname;

  printf(1, "fourfiles test\n");

  for(pi = 0; pi < 4; pi++){
    107a:	83 c3 01             	add    $0x1,%ebx
    107d:	83 fb 04             	cmp    $0x4,%ebx
    1080:	74 06                	je     1088 <fourfiles+0x68>
    1082:	8b 74 9d d8          	mov    -0x28(%ebp,%ebx,4),%esi
    1086:	eb d3                	jmp    105b <fourfiles+0x3b>
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    1088:	e8 3d 28 00 00       	call   38ca <wait>
    108d:	bf 30 00 00 00       	mov    $0x30,%edi
    1092:	e8 33 28 00 00       	call   38ca <wait>
    1097:	e8 2e 28 00 00       	call   38ca <wait>
    109c:	e8 29 28 00 00       	call   38ca <wait>
    10a1:	c7 45 d4 96 41 00 00 	movl   $0x4196,-0x2c(%ebp)
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    10a8:	83 ec 08             	sub    $0x8,%esp
    total = 0;
    10ab:	31 db                	xor    %ebx,%ebx
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    10ad:	6a 00                	push   $0x0
    10af:	ff 75 d4             	pushl  -0x2c(%ebp)
    10b2:	e8 4b 28 00 00       	call   3902 <open>
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10b7:	83 c4 10             	add    $0x10,%esp
    wait();
  }

  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    10ba:	89 c6                	mov    %eax,%esi
    10bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    10c0:	83 ec 04             	sub    $0x4,%esp
    10c3:	68 00 20 00 00       	push   $0x2000
    10c8:	68 a0 85 00 00       	push   $0x85a0
    10cd:	56                   	push   %esi
    10ce:	e8 07 28 00 00       	call   38da <read>
    10d3:	83 c4 10             	add    $0x10,%esp
    10d6:	85 c0                	test   %eax,%eax
    10d8:	7e 1c                	jle    10f6 <fourfiles+0xd6>
    10da:	31 d2                	xor    %edx,%edx
    10dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
    10e0:	0f be 8a a0 85 00 00 	movsbl 0x85a0(%edx),%ecx
    10e7:	39 cf                	cmp    %ecx,%edi
    10e9:	75 5e                	jne    1149 <fourfiles+0x129>
  for(i = 0; i < 2; i++){
    fname = names[i];
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    10eb:	83 c2 01             	add    $0x1,%edx
    10ee:	39 d0                	cmp    %edx,%eax
    10f0:	75 ee                	jne    10e0 <fourfiles+0xc0>
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
    10f2:	01 c3                	add    %eax,%ebx
    10f4:	eb ca                	jmp    10c0 <fourfiles+0xa0>
    }
    close(fd);
    10f6:	83 ec 0c             	sub    $0xc,%esp
    10f9:	56                   	push   %esi
    10fa:	e8 eb 27 00 00       	call   38ea <close>
    if(total != 12*500){
    10ff:	83 c4 10             	add    $0x10,%esp
    1102:	81 fb 70 17 00 00    	cmp    $0x1770,%ebx
    1108:	0f 85 d4 00 00 00    	jne    11e2 <fourfiles+0x1c2>
      printf(1, "wrong length %d\n", total);
      exit();
    }
    unlink(fname);
    110e:	83 ec 0c             	sub    $0xc,%esp
    1111:	ff 75 d4             	pushl  -0x2c(%ebp)
    1114:	83 c7 01             	add    $0x1,%edi
    1117:	e8 f6 27 00 00       	call   3912 <unlink>

  for(pi = 0; pi < 4; pi++){
    wait();
  }

  for(i = 0; i < 2; i++){
    111c:	83 c4 10             	add    $0x10,%esp
    111f:	83 ff 32             	cmp    $0x32,%edi
    1122:	75 1a                	jne    113e <fourfiles+0x11e>
      exit();
    }
    unlink(fname);
  }

  printf(1, "fourfiles ok\n");
    1124:	83 ec 08             	sub    $0x8,%esp
    1127:	68 da 41 00 00       	push   $0x41da
    112c:	6a 01                	push   $0x1
    112e:	e8 dd 28 00 00       	call   3a10 <printf>
}
    1133:	83 c4 10             	add    $0x10,%esp
    1136:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1139:	5b                   	pop    %ebx
    113a:	5e                   	pop    %esi
    113b:	5f                   	pop    %edi
    113c:	5d                   	pop    %ebp
    113d:	c3                   	ret    
    113e:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1141:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    1144:	e9 5f ff ff ff       	jmp    10a8 <fourfiles+0x88>
    fd = open(fname, 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
        if(buf[j] != '0'+i){
          printf(1, "wrong char\n");
    1149:	83 ec 08             	sub    $0x8,%esp
    114c:	68 bd 41 00 00       	push   $0x41bd
    1151:	6a 01                	push   $0x1
    1153:	e8 b8 28 00 00       	call   3a10 <printf>
          exit();
    1158:	e8 65 27 00 00       	call   38c2 <exit>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    115d:	83 ec 08             	sub    $0x8,%esp
    1160:	68 02 02 00 00       	push   $0x202
    1165:	56                   	push   %esi
    1166:	e8 97 27 00 00       	call   3902 <open>
      if(fd < 0){
    116b:	83 c4 10             	add    $0x10,%esp
    116e:	85 c0                	test   %eax,%eax
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
    1170:	89 c6                	mov    %eax,%esi
      if(fd < 0){
    1172:	78 5a                	js     11ce <fourfiles+0x1ae>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
    1174:	83 ec 04             	sub    $0x4,%esp
    1177:	83 c3 30             	add    $0x30,%ebx
    117a:	68 00 02 00 00       	push   $0x200
    117f:	53                   	push   %ebx
    1180:	bb 0c 00 00 00       	mov    $0xc,%ebx
    1185:	68 a0 85 00 00       	push   $0x85a0
    118a:	e8 a1 25 00 00       	call   3730 <memset>
    118f:	83 c4 10             	add    $0x10,%esp
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
    1192:	83 ec 04             	sub    $0x4,%esp
    1195:	68 f4 01 00 00       	push   $0x1f4
    119a:	68 a0 85 00 00       	push   $0x85a0
    119f:	56                   	push   %esi
    11a0:	e8 3d 27 00 00       	call   38e2 <write>
    11a5:	83 c4 10             	add    $0x10,%esp
    11a8:	3d f4 01 00 00       	cmp    $0x1f4,%eax
    11ad:	75 0a                	jne    11b9 <fourfiles+0x199>
        printf(1, "create failed\n");
        exit();
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
    11af:	83 eb 01             	sub    $0x1,%ebx
    11b2:	75 de                	jne    1192 <fourfiles+0x172>
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
          exit();
        }
      }
      exit();
    11b4:	e8 09 27 00 00       	call   38c2 <exit>
      }

      memset(buf, '0'+pi, 512);
      for(i = 0; i < 12; i++){
        if((n = write(fd, buf, 500)) != 500){
          printf(1, "write failed %d\n", n);
    11b9:	83 ec 04             	sub    $0x4,%esp
    11bc:	50                   	push   %eax
    11bd:	68 ac 41 00 00       	push   $0x41ac
    11c2:	6a 01                	push   $0x1
    11c4:	e8 47 28 00 00       	call   3a10 <printf>
          exit();
    11c9:	e8 f4 26 00 00       	call   38c2 <exit>
    }

    if(pid == 0){
      fd = open(fname, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "create failed\n");
    11ce:	83 ec 08             	sub    $0x8,%esp
    11d1:	68 37 44 00 00       	push   $0x4437
    11d6:	6a 01                	push   $0x1
    11d8:	e8 33 28 00 00       	call   3a10 <printf>
        exit();
    11dd:	e8 e0 26 00 00       	call   38c2 <exit>
      }
      total += n;
    }
    close(fd);
    if(total != 12*500){
      printf(1, "wrong length %d\n", total);
    11e2:	83 ec 04             	sub    $0x4,%esp
    11e5:	53                   	push   %ebx
    11e6:	68 c9 41 00 00       	push   $0x41c9
    11eb:	6a 01                	push   $0x1
    11ed:	e8 1e 28 00 00       	call   3a10 <printf>
      exit();
    11f2:	e8 cb 26 00 00       	call   38c2 <exit>
    fname = names[pi];
    unlink(fname);

    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    11f7:	83 ec 08             	sub    $0x8,%esp
    11fa:	68 71 4c 00 00       	push   $0x4c71
    11ff:	6a 01                	push   $0x1
    1201:	e8 0a 28 00 00       	call   3a10 <printf>
      exit();
    1206:	e8 b7 26 00 00       	call   38c2 <exit>
    120b:	90                   	nop
    120c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001210 <createdelete>:
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	57                   	push   %edi
    1214:	56                   	push   %esi
    1215:	53                   	push   %ebx
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    1216:	31 db                	xor    %ebx,%ebx
}

// four processes create and delete different files in same directory
void
createdelete(void)
{
    1218:	83 ec 44             	sub    $0x44,%esp
  enum { N = 20 };
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");
    121b:	68 e8 41 00 00       	push   $0x41e8
    1220:	6a 01                	push   $0x1
    1222:	e8 e9 27 00 00       	call   3a10 <printf>
    1227:	83 c4 10             	add    $0x10,%esp

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    122a:	e8 8b 26 00 00       	call   38ba <fork>
    if(pid < 0){
    122f:	85 c0                	test   %eax,%eax
    1231:	0f 88 b7 01 00 00    	js     13ee <createdelete+0x1de>
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
    1237:	0f 84 f6 00 00 00    	je     1333 <createdelete+0x123>
  int pid, i, fd, pi;
  char name[32];

  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    123d:	83 c3 01             	add    $0x1,%ebx
    1240:	83 fb 04             	cmp    $0x4,%ebx
    1243:	75 e5                	jne    122a <createdelete+0x1a>
    1245:	8d 7d c8             	lea    -0x38(%ebp),%edi
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    1248:	31 f6                	xor    %esi,%esi
      exit();
    }
  }

  for(pi = 0; pi < 4; pi++){
    wait();
    124a:	e8 7b 26 00 00       	call   38ca <wait>
    124f:	e8 76 26 00 00       	call   38ca <wait>
    1254:	e8 71 26 00 00       	call   38ca <wait>
    1259:	e8 6c 26 00 00       	call   38ca <wait>
  }

  name[0] = name[1] = name[2] = 0;
    125e:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    1262:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1268:	8d 46 30             	lea    0x30(%esi),%eax
    126b:	83 fe 09             	cmp    $0x9,%esi
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
    126e:	bb 70 00 00 00       	mov    $0x70,%ebx
    1273:	0f 9f c2             	setg   %dl
    1276:	85 f6                	test   %esi,%esi
    1278:	88 45 c7             	mov    %al,-0x39(%ebp)
    127b:	0f 94 c0             	sete   %al
    127e:	09 c2                	or     %eax,%edx
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1280:	8d 46 ff             	lea    -0x1(%esi),%eax
    1283:	88 55 c6             	mov    %dl,-0x3a(%ebp)
    1286:	89 45 c0             	mov    %eax,-0x40(%ebp)

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    1289:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      fd = open(name, 0);
    128d:	83 ec 08             	sub    $0x8,%esp
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
    1290:	88 5d c8             	mov    %bl,-0x38(%ebp)
      name[1] = '0' + i;
      fd = open(name, 0);
    1293:	6a 00                	push   $0x0
    1295:	57                   	push   %edi

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
    1296:	88 45 c9             	mov    %al,-0x37(%ebp)
      fd = open(name, 0);
    1299:	e8 64 26 00 00       	call   3902 <open>
      if((i == 0 || i >= N/2) && fd < 0){
    129e:	89 c1                	mov    %eax,%ecx
    12a0:	83 c4 10             	add    $0x10,%esp
    12a3:	c1 e9 1f             	shr    $0x1f,%ecx
    12a6:	84 c9                	test   %cl,%cl
    12a8:	74 0a                	je     12b4 <createdelete+0xa4>
    12aa:	80 7d c6 00          	cmpb   $0x0,-0x3a(%ebp)
    12ae:	0f 85 11 01 00 00    	jne    13c5 <createdelete+0x1b5>
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    12b4:	83 7d c0 08          	cmpl   $0x8,-0x40(%ebp)
    12b8:	0f 86 44 01 00 00    	jbe    1402 <createdelete+0x1f2>
        printf(1, "oops createdelete %s did exist\n", name);
        exit();
      }
      if(fd >= 0)
    12be:	85 c0                	test   %eax,%eax
    12c0:	78 0c                	js     12ce <createdelete+0xbe>
        close(fd);
    12c2:	83 ec 0c             	sub    $0xc,%esp
    12c5:	50                   	push   %eax
    12c6:	e8 1f 26 00 00       	call   38ea <close>
    12cb:	83 c4 10             	add    $0x10,%esp
    12ce:	83 c3 01             	add    $0x1,%ebx
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    12d1:	80 fb 74             	cmp    $0x74,%bl
    12d4:	75 b3                	jne    1289 <createdelete+0x79>
  for(pi = 0; pi < 4; pi++){
    wait();
  }

  name[0] = name[1] = name[2] = 0;
  for(i = 0; i < N; i++){
    12d6:	83 c6 01             	add    $0x1,%esi
    12d9:	83 fe 14             	cmp    $0x14,%esi
    12dc:	75 8a                	jne    1268 <createdelete+0x58>
    12de:	be 70 00 00 00       	mov    $0x70,%esi
    12e3:	90                   	nop
    12e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    12e8:	8d 46 c0             	lea    -0x40(%esi),%eax
    12eb:	bb 04 00 00 00       	mov    $0x4,%ebx
    12f0:	88 45 c7             	mov    %al,-0x39(%ebp)
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    12f3:	89 f0                	mov    %esi,%eax
      name[1] = '0' + i;
      unlink(name);
    12f5:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
    12f8:	88 45 c8             	mov    %al,-0x38(%ebp)
      name[1] = '0' + i;
    12fb:	0f b6 45 c7          	movzbl -0x39(%ebp),%eax
      unlink(name);
    12ff:	57                   	push   %edi
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + i;
      name[1] = '0' + i;
    1300:	88 45 c9             	mov    %al,-0x37(%ebp)
      unlink(name);
    1303:	e8 0a 26 00 00       	call   3912 <unlink>
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    for(pi = 0; pi < 4; pi++){
    1308:	83 c4 10             	add    $0x10,%esp
    130b:	83 eb 01             	sub    $0x1,%ebx
    130e:	75 e3                	jne    12f3 <createdelete+0xe3>
    1310:	83 c6 01             	add    $0x1,%esi
      if(fd >= 0)
        close(fd);
    }
  }

  for(i = 0; i < N; i++){
    1313:	89 f0                	mov    %esi,%eax
    1315:	3c 84                	cmp    $0x84,%al
    1317:	75 cf                	jne    12e8 <createdelete+0xd8>
      name[1] = '0' + i;
      unlink(name);
    }
  }

  printf(1, "createdelete ok\n");
    1319:	83 ec 08             	sub    $0x8,%esp
    131c:	68 fb 41 00 00       	push   $0x41fb
    1321:	6a 01                	push   $0x1
    1323:	e8 e8 26 00 00       	call   3a10 <printf>
}
    1328:	83 c4 10             	add    $0x10,%esp
    132b:	8d 65 f4             	lea    -0xc(%ebp),%esp
    132e:	5b                   	pop    %ebx
    132f:	5e                   	pop    %esi
    1330:	5f                   	pop    %edi
    1331:	5d                   	pop    %ebp
    1332:	c3                   	ret    
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    1333:	83 c3 70             	add    $0x70,%ebx
      name[2] = '\0';
    1336:	c6 45 ca 00          	movb   $0x0,-0x36(%ebp)
    133a:	be 01 00 00 00       	mov    $0x1,%esi
      printf(1, "fork failed\n");
      exit();
    }

    if(pid == 0){
      name[0] = 'p' + pi;
    133f:	88 5d c8             	mov    %bl,-0x38(%ebp)
    1342:	8d 7d c8             	lea    -0x38(%ebp),%edi
      name[2] = '\0';
    1345:	31 db                	xor    %ebx,%ebx
    1347:	eb 12                	jmp    135b <createdelete+0x14b>
    1349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      for(i = 0; i < N; i++){
    1350:	83 fe 14             	cmp    $0x14,%esi
    1353:	74 6b                	je     13c0 <createdelete+0x1b0>
    1355:	83 c3 01             	add    $0x1,%ebx
    1358:	83 c6 01             	add    $0x1,%esi
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
    135b:	83 ec 08             	sub    $0x8,%esp

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    135e:	8d 43 30             	lea    0x30(%ebx),%eax
        fd = open(name, O_CREATE | O_RDWR);
    1361:	68 02 02 00 00       	push   $0x202
    1366:	57                   	push   %edi

    if(pid == 0){
      name[0] = 'p' + pi;
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
    1367:	88 45 c9             	mov    %al,-0x37(%ebp)
        fd = open(name, O_CREATE | O_RDWR);
    136a:	e8 93 25 00 00       	call   3902 <open>
        if(fd < 0){
    136f:	83 c4 10             	add    $0x10,%esp
    1372:	85 c0                	test   %eax,%eax
    1374:	78 64                	js     13da <createdelete+0x1ca>
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
    1376:	83 ec 0c             	sub    $0xc,%esp
    1379:	50                   	push   %eax
    137a:	e8 6b 25 00 00       	call   38ea <close>
        if(i > 0 && (i % 2 ) == 0){
    137f:	83 c4 10             	add    $0x10,%esp
    1382:	85 db                	test   %ebx,%ebx
    1384:	74 cf                	je     1355 <createdelete+0x145>
    1386:	f6 c3 01             	test   $0x1,%bl
    1389:	75 c5                	jne    1350 <createdelete+0x140>
          name[1] = '0' + (i / 2);
          if(unlink(name) < 0){
    138b:	83 ec 0c             	sub    $0xc,%esp
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    138e:	89 d8                	mov    %ebx,%eax
    1390:	d1 f8                	sar    %eax
          if(unlink(name) < 0){
    1392:	57                   	push   %edi
          printf(1, "create failed\n");
          exit();
        }
        close(fd);
        if(i > 0 && (i % 2 ) == 0){
          name[1] = '0' + (i / 2);
    1393:	83 c0 30             	add    $0x30,%eax
    1396:	88 45 c9             	mov    %al,-0x37(%ebp)
          if(unlink(name) < 0){
    1399:	e8 74 25 00 00       	call   3912 <unlink>
    139e:	83 c4 10             	add    $0x10,%esp
    13a1:	85 c0                	test   %eax,%eax
    13a3:	79 ab                	jns    1350 <createdelete+0x140>
            printf(1, "unlink failed\n");
    13a5:	83 ec 08             	sub    $0x8,%esp
    13a8:	68 e9 3d 00 00       	push   $0x3de9
    13ad:	6a 01                	push   $0x1
    13af:	e8 5c 26 00 00       	call   3a10 <printf>
            exit();
    13b4:	e8 09 25 00 00       	call   38c2 <exit>
    13b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
          }
        }
      }
      exit();
    13c0:	e8 fd 24 00 00       	call   38c2 <exit>
    for(pi = 0; pi < 4; pi++){
      name[0] = 'p' + pi;
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
    13c5:	83 ec 04             	sub    $0x4,%esp
    13c8:	57                   	push   %edi
    13c9:	68 a8 4e 00 00       	push   $0x4ea8
    13ce:	6a 01                	push   $0x1
    13d0:	e8 3b 26 00 00       	call   3a10 <printf>
        exit();
    13d5:	e8 e8 24 00 00       	call   38c2 <exit>
      name[2] = '\0';
      for(i = 0; i < N; i++){
        name[1] = '0' + i;
        fd = open(name, O_CREATE | O_RDWR);
        if(fd < 0){
          printf(1, "create failed\n");
    13da:	83 ec 08             	sub    $0x8,%esp
    13dd:	68 37 44 00 00       	push   $0x4437
    13e2:	6a 01                	push   $0x1
    13e4:	e8 27 26 00 00       	call   3a10 <printf>
          exit();
    13e9:	e8 d4 24 00 00       	call   38c2 <exit>
  printf(1, "createdelete test\n");

  for(pi = 0; pi < 4; pi++){
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    13ee:	83 ec 08             	sub    $0x8,%esp
    13f1:	68 71 4c 00 00       	push   $0x4c71
    13f6:	6a 01                	push   $0x1
    13f8:	e8 13 26 00 00       	call   3a10 <printf>
      exit();
    13fd:	e8 c0 24 00 00       	call   38c2 <exit>
      name[1] = '0' + i;
      fd = open(name, 0);
      if((i == 0 || i >= N/2) && fd < 0){
        printf(1, "oops createdelete %s didn't exist\n", name);
        exit();
      } else if((i >= 1 && i < N/2) && fd >= 0){
    1402:	85 c0                	test   %eax,%eax
    1404:	0f 88 c4 fe ff ff    	js     12ce <createdelete+0xbe>
        printf(1, "oops createdelete %s did exist\n", name);
    140a:	83 ec 04             	sub    $0x4,%esp
    140d:	57                   	push   %edi
    140e:	68 cc 4e 00 00       	push   $0x4ecc
    1413:	6a 01                	push   $0x1
    1415:	e8 f6 25 00 00       	call   3a10 <printf>
        exit();
    141a:	e8 a3 24 00 00       	call   38c2 <exit>
    141f:	90                   	nop

00001420 <unlinkread>:
}

// can I unlink a file and still read it?
void
unlinkread(void)
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	56                   	push   %esi
    1424:	53                   	push   %ebx
  int fd, fd1;

  printf(1, "unlinkread test\n");
    1425:	83 ec 08             	sub    $0x8,%esp
    1428:	68 0c 42 00 00       	push   $0x420c
    142d:	6a 01                	push   $0x1
    142f:	e8 dc 25 00 00       	call   3a10 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1434:	5b                   	pop    %ebx
    1435:	5e                   	pop    %esi
    1436:	68 02 02 00 00       	push   $0x202
    143b:	68 1d 42 00 00       	push   $0x421d
    1440:	e8 bd 24 00 00       	call   3902 <open>
  if(fd < 0){
    1445:	83 c4 10             	add    $0x10,%esp
    1448:	85 c0                	test   %eax,%eax
    144a:	0f 88 e6 00 00 00    	js     1536 <unlinkread+0x116>
    printf(1, "create unlinkread failed\n");
    exit();
  }
  write(fd, "hello", 5);
    1450:	83 ec 04             	sub    $0x4,%esp
    1453:	89 c3                	mov    %eax,%ebx
    1455:	6a 05                	push   $0x5
    1457:	68 42 42 00 00       	push   $0x4242
    145c:	50                   	push   %eax
    145d:	e8 80 24 00 00       	call   38e2 <write>
  close(fd);
    1462:	89 1c 24             	mov    %ebx,(%esp)
    1465:	e8 80 24 00 00       	call   38ea <close>

  fd = open("unlinkread", O_RDWR);
    146a:	58                   	pop    %eax
    146b:	5a                   	pop    %edx
    146c:	6a 02                	push   $0x2
    146e:	68 1d 42 00 00       	push   $0x421d
    1473:	e8 8a 24 00 00       	call   3902 <open>
  if(fd < 0){
    1478:	83 c4 10             	add    $0x10,%esp
    147b:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
    147d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    147f:	0f 88 10 01 00 00    	js     1595 <unlinkread+0x175>
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    1485:	83 ec 0c             	sub    $0xc,%esp
    1488:	68 1d 42 00 00       	push   $0x421d
    148d:	e8 80 24 00 00       	call   3912 <unlink>
    1492:	83 c4 10             	add    $0x10,%esp
    1495:	85 c0                	test   %eax,%eax
    1497:	0f 85 e5 00 00 00    	jne    1582 <unlinkread+0x162>
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    149d:	83 ec 08             	sub    $0x8,%esp
    14a0:	68 02 02 00 00       	push   $0x202
    14a5:	68 1d 42 00 00       	push   $0x421d
    14aa:	e8 53 24 00 00       	call   3902 <open>
  write(fd1, "yyy", 3);
    14af:	83 c4 0c             	add    $0xc,%esp
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    exit();
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    14b2:	89 c6                	mov    %eax,%esi
  write(fd1, "yyy", 3);
    14b4:	6a 03                	push   $0x3
    14b6:	68 7a 42 00 00       	push   $0x427a
    14bb:	50                   	push   %eax
    14bc:	e8 21 24 00 00       	call   38e2 <write>
  close(fd1);
    14c1:	89 34 24             	mov    %esi,(%esp)
    14c4:	e8 21 24 00 00       	call   38ea <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    14c9:	83 c4 0c             	add    $0xc,%esp
    14cc:	68 00 20 00 00       	push   $0x2000
    14d1:	68 a0 85 00 00       	push   $0x85a0
    14d6:	53                   	push   %ebx
    14d7:	e8 fe 23 00 00       	call   38da <read>
    14dc:	83 c4 10             	add    $0x10,%esp
    14df:	83 f8 05             	cmp    $0x5,%eax
    14e2:	0f 85 87 00 00 00    	jne    156f <unlinkread+0x14f>
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    14e8:	80 3d a0 85 00 00 68 	cmpb   $0x68,0x85a0
    14ef:	75 6b                	jne    155c <unlinkread+0x13c>
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    14f1:	83 ec 04             	sub    $0x4,%esp
    14f4:	6a 0a                	push   $0xa
    14f6:	68 a0 85 00 00       	push   $0x85a0
    14fb:	53                   	push   %ebx
    14fc:	e8 e1 23 00 00       	call   38e2 <write>
    1501:	83 c4 10             	add    $0x10,%esp
    1504:	83 f8 0a             	cmp    $0xa,%eax
    1507:	75 40                	jne    1549 <unlinkread+0x129>
    printf(1, "unlinkread write failed\n");
    exit();
  }
  close(fd);
    1509:	83 ec 0c             	sub    $0xc,%esp
    150c:	53                   	push   %ebx
    150d:	e8 d8 23 00 00       	call   38ea <close>
  unlink("unlinkread");
    1512:	c7 04 24 1d 42 00 00 	movl   $0x421d,(%esp)
    1519:	e8 f4 23 00 00       	call   3912 <unlink>
  printf(1, "unlinkread ok\n");
    151e:	58                   	pop    %eax
    151f:	5a                   	pop    %edx
    1520:	68 c5 42 00 00       	push   $0x42c5
    1525:	6a 01                	push   $0x1
    1527:	e8 e4 24 00 00       	call   3a10 <printf>
}
    152c:	83 c4 10             	add    $0x10,%esp
    152f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1532:	5b                   	pop    %ebx
    1533:	5e                   	pop    %esi
    1534:	5d                   	pop    %ebp
    1535:	c3                   	ret    
  int fd, fd1;

  printf(1, "unlinkread test\n");
  fd = open("unlinkread", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create unlinkread failed\n");
    1536:	51                   	push   %ecx
    1537:	51                   	push   %ecx
    1538:	68 28 42 00 00       	push   $0x4228
    153d:	6a 01                	push   $0x1
    153f:	e8 cc 24 00 00       	call   3a10 <printf>
    exit();
    1544:	e8 79 23 00 00       	call   38c2 <exit>
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    exit();
  }
  if(write(fd, buf, 10) != 10){
    printf(1, "unlinkread write failed\n");
    1549:	51                   	push   %ecx
    154a:	51                   	push   %ecx
    154b:	68 ac 42 00 00       	push   $0x42ac
    1550:	6a 01                	push   $0x1
    1552:	e8 b9 24 00 00       	call   3a10 <printf>
    exit();
    1557:	e8 66 23 00 00       	call   38c2 <exit>
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    exit();
  }
  if(buf[0] != 'h'){
    printf(1, "unlinkread wrong data\n");
    155c:	53                   	push   %ebx
    155d:	53                   	push   %ebx
    155e:	68 95 42 00 00       	push   $0x4295
    1563:	6a 01                	push   $0x1
    1565:	e8 a6 24 00 00       	call   3a10 <printf>
    exit();
    156a:	e8 53 23 00 00       	call   38c2 <exit>
  fd1 = open("unlinkread", O_CREATE | O_RDWR);
  write(fd1, "yyy", 3);
  close(fd1);

  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "unlinkread read failed");
    156f:	56                   	push   %esi
    1570:	56                   	push   %esi
    1571:	68 7e 42 00 00       	push   $0x427e
    1576:	6a 01                	push   $0x1
    1578:	e8 93 24 00 00       	call   3a10 <printf>
    exit();
    157d:	e8 40 23 00 00       	call   38c2 <exit>
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    exit();
  }
  if(unlink("unlinkread") != 0){
    printf(1, "unlink unlinkread failed\n");
    1582:	50                   	push   %eax
    1583:	50                   	push   %eax
    1584:	68 60 42 00 00       	push   $0x4260
    1589:	6a 01                	push   $0x1
    158b:	e8 80 24 00 00       	call   3a10 <printf>
    exit();
    1590:	e8 2d 23 00 00       	call   38c2 <exit>
  write(fd, "hello", 5);
  close(fd);

  fd = open("unlinkread", O_RDWR);
  if(fd < 0){
    printf(1, "open unlinkread failed\n");
    1595:	50                   	push   %eax
    1596:	50                   	push   %eax
    1597:	68 48 42 00 00       	push   $0x4248
    159c:	6a 01                	push   $0x1
    159e:	e8 6d 24 00 00       	call   3a10 <printf>
    exit();
    15a3:	e8 1a 23 00 00       	call   38c2 <exit>
    15a8:	90                   	nop
    15a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000015b0 <linktest>:
  printf(1, "unlinkread ok\n");
}

void
linktest(void)
{
    15b0:	55                   	push   %ebp
    15b1:	89 e5                	mov    %esp,%ebp
    15b3:	53                   	push   %ebx
    15b4:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "linktest\n");
    15b7:	68 d4 42 00 00       	push   $0x42d4
    15bc:	6a 01                	push   $0x1
    15be:	e8 4d 24 00 00       	call   3a10 <printf>

  unlink("lf1");
    15c3:	c7 04 24 de 42 00 00 	movl   $0x42de,(%esp)
    15ca:	e8 43 23 00 00       	call   3912 <unlink>
  unlink("lf2");
    15cf:	c7 04 24 e2 42 00 00 	movl   $0x42e2,(%esp)
    15d6:	e8 37 23 00 00       	call   3912 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    15db:	58                   	pop    %eax
    15dc:	5a                   	pop    %edx
    15dd:	68 02 02 00 00       	push   $0x202
    15e2:	68 de 42 00 00       	push   $0x42de
    15e7:	e8 16 23 00 00       	call   3902 <open>
  if(fd < 0){
    15ec:	83 c4 10             	add    $0x10,%esp
    15ef:	85 c0                	test   %eax,%eax
    15f1:	0f 88 1e 01 00 00    	js     1715 <linktest+0x165>
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    15f7:	83 ec 04             	sub    $0x4,%esp
    15fa:	89 c3                	mov    %eax,%ebx
    15fc:	6a 05                	push   $0x5
    15fe:	68 42 42 00 00       	push   $0x4242
    1603:	50                   	push   %eax
    1604:	e8 d9 22 00 00       	call   38e2 <write>
    1609:	83 c4 10             	add    $0x10,%esp
    160c:	83 f8 05             	cmp    $0x5,%eax
    160f:	0f 85 98 01 00 00    	jne    17ad <linktest+0x1fd>
    printf(1, "write lf1 failed\n");
    exit();
  }
  close(fd);
    1615:	83 ec 0c             	sub    $0xc,%esp
    1618:	53                   	push   %ebx
    1619:	e8 cc 22 00 00       	call   38ea <close>

  if(link("lf1", "lf2") < 0){
    161e:	5b                   	pop    %ebx
    161f:	58                   	pop    %eax
    1620:	68 e2 42 00 00       	push   $0x42e2
    1625:	68 de 42 00 00       	push   $0x42de
    162a:	e8 f3 22 00 00       	call   3922 <link>
    162f:	83 c4 10             	add    $0x10,%esp
    1632:	85 c0                	test   %eax,%eax
    1634:	0f 88 60 01 00 00    	js     179a <linktest+0x1ea>
    printf(1, "link lf1 lf2 failed\n");
    exit();
  }
  unlink("lf1");
    163a:	83 ec 0c             	sub    $0xc,%esp
    163d:	68 de 42 00 00       	push   $0x42de
    1642:	e8 cb 22 00 00       	call   3912 <unlink>

  if(open("lf1", 0) >= 0){
    1647:	58                   	pop    %eax
    1648:	5a                   	pop    %edx
    1649:	6a 00                	push   $0x0
    164b:	68 de 42 00 00       	push   $0x42de
    1650:	e8 ad 22 00 00       	call   3902 <open>
    1655:	83 c4 10             	add    $0x10,%esp
    1658:	85 c0                	test   %eax,%eax
    165a:	0f 89 27 01 00 00    	jns    1787 <linktest+0x1d7>
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    1660:	83 ec 08             	sub    $0x8,%esp
    1663:	6a 00                	push   $0x0
    1665:	68 e2 42 00 00       	push   $0x42e2
    166a:	e8 93 22 00 00       	call   3902 <open>
  if(fd < 0){
    166f:	83 c4 10             	add    $0x10,%esp
    1672:	85 c0                	test   %eax,%eax
  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    exit();
  }

  fd = open("lf2", 0);
    1674:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1676:	0f 88 f8 00 00 00    	js     1774 <linktest+0x1c4>
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    167c:	83 ec 04             	sub    $0x4,%esp
    167f:	68 00 20 00 00       	push   $0x2000
    1684:	68 a0 85 00 00       	push   $0x85a0
    1689:	50                   	push   %eax
    168a:	e8 4b 22 00 00       	call   38da <read>
    168f:	83 c4 10             	add    $0x10,%esp
    1692:	83 f8 05             	cmp    $0x5,%eax
    1695:	0f 85 c6 00 00 00    	jne    1761 <linktest+0x1b1>
    printf(1, "read lf2 failed\n");
    exit();
  }
  close(fd);
    169b:	83 ec 0c             	sub    $0xc,%esp
    169e:	53                   	push   %ebx
    169f:	e8 46 22 00 00       	call   38ea <close>

  if(link("lf2", "lf2") >= 0){
    16a4:	58                   	pop    %eax
    16a5:	5a                   	pop    %edx
    16a6:	68 e2 42 00 00       	push   $0x42e2
    16ab:	68 e2 42 00 00       	push   $0x42e2
    16b0:	e8 6d 22 00 00       	call   3922 <link>
    16b5:	83 c4 10             	add    $0x10,%esp
    16b8:	85 c0                	test   %eax,%eax
    16ba:	0f 89 8e 00 00 00    	jns    174e <linktest+0x19e>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    exit();
  }

  unlink("lf2");
    16c0:	83 ec 0c             	sub    $0xc,%esp
    16c3:	68 e2 42 00 00       	push   $0x42e2
    16c8:	e8 45 22 00 00       	call   3912 <unlink>
  if(link("lf2", "lf1") >= 0){
    16cd:	59                   	pop    %ecx
    16ce:	5b                   	pop    %ebx
    16cf:	68 de 42 00 00       	push   $0x42de
    16d4:	68 e2 42 00 00       	push   $0x42e2
    16d9:	e8 44 22 00 00       	call   3922 <link>
    16de:	83 c4 10             	add    $0x10,%esp
    16e1:	85 c0                	test   %eax,%eax
    16e3:	79 56                	jns    173b <linktest+0x18b>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    16e5:	83 ec 08             	sub    $0x8,%esp
    16e8:	68 de 42 00 00       	push   $0x42de
    16ed:	68 a6 45 00 00       	push   $0x45a6
    16f2:	e8 2b 22 00 00       	call   3922 <link>
    16f7:	83 c4 10             	add    $0x10,%esp
    16fa:	85 c0                	test   %eax,%eax
    16fc:	79 2a                	jns    1728 <linktest+0x178>
    printf(1, "link . lf1 succeeded! oops\n");
    exit();
  }

  printf(1, "linktest ok\n");
    16fe:	83 ec 08             	sub    $0x8,%esp
    1701:	68 7c 43 00 00       	push   $0x437c
    1706:	6a 01                	push   $0x1
    1708:	e8 03 23 00 00       	call   3a10 <printf>
}
    170d:	83 c4 10             	add    $0x10,%esp
    1710:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1713:	c9                   	leave  
    1714:	c3                   	ret    
  unlink("lf1");
  unlink("lf2");

  fd = open("lf1", O_CREATE|O_RDWR);
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    1715:	50                   	push   %eax
    1716:	50                   	push   %eax
    1717:	68 e6 42 00 00       	push   $0x42e6
    171c:	6a 01                	push   $0x1
    171e:	e8 ed 22 00 00       	call   3a10 <printf>
    exit();
    1723:	e8 9a 21 00 00       	call   38c2 <exit>
    printf(1, "link non-existant succeeded! oops\n");
    exit();
  }

  if(link(".", "lf1") >= 0){
    printf(1, "link . lf1 succeeded! oops\n");
    1728:	50                   	push   %eax
    1729:	50                   	push   %eax
    172a:	68 60 43 00 00       	push   $0x4360
    172f:	6a 01                	push   $0x1
    1731:	e8 da 22 00 00       	call   3a10 <printf>
    exit();
    1736:	e8 87 21 00 00       	call   38c2 <exit>
    exit();
  }

  unlink("lf2");
  if(link("lf2", "lf1") >= 0){
    printf(1, "link non-existant succeeded! oops\n");
    173b:	52                   	push   %edx
    173c:	52                   	push   %edx
    173d:	68 14 4f 00 00       	push   $0x4f14
    1742:	6a 01                	push   $0x1
    1744:	e8 c7 22 00 00       	call   3a10 <printf>
    exit();
    1749:	e8 74 21 00 00       	call   38c2 <exit>
    exit();
  }
  close(fd);

  if(link("lf2", "lf2") >= 0){
    printf(1, "link lf2 lf2 succeeded! oops\n");
    174e:	50                   	push   %eax
    174f:	50                   	push   %eax
    1750:	68 42 43 00 00       	push   $0x4342
    1755:	6a 01                	push   $0x1
    1757:	e8 b4 22 00 00       	call   3a10 <printf>
    exit();
    175c:	e8 61 21 00 00       	call   38c2 <exit>
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    printf(1, "read lf2 failed\n");
    1761:	51                   	push   %ecx
    1762:	51                   	push   %ecx
    1763:	68 31 43 00 00       	push   $0x4331
    1768:	6a 01                	push   $0x1
    176a:	e8 a1 22 00 00       	call   3a10 <printf>
    exit();
    176f:	e8 4e 21 00 00       	call   38c2 <exit>
    exit();
  }

  fd = open("lf2", 0);
  if(fd < 0){
    printf(1, "open lf2 failed\n");
    1774:	53                   	push   %ebx
    1775:	53                   	push   %ebx
    1776:	68 20 43 00 00       	push   $0x4320
    177b:	6a 01                	push   $0x1
    177d:	e8 8e 22 00 00       	call   3a10 <printf>
    exit();
    1782:	e8 3b 21 00 00       	call   38c2 <exit>
    exit();
  }
  unlink("lf1");

  if(open("lf1", 0) >= 0){
    printf(1, "unlinked lf1 but it is still there!\n");
    1787:	50                   	push   %eax
    1788:	50                   	push   %eax
    1789:	68 ec 4e 00 00       	push   $0x4eec
    178e:	6a 01                	push   $0x1
    1790:	e8 7b 22 00 00       	call   3a10 <printf>
    exit();
    1795:	e8 28 21 00 00       	call   38c2 <exit>
    exit();
  }
  close(fd);

  if(link("lf1", "lf2") < 0){
    printf(1, "link lf1 lf2 failed\n");
    179a:	51                   	push   %ecx
    179b:	51                   	push   %ecx
    179c:	68 0b 43 00 00       	push   $0x430b
    17a1:	6a 01                	push   $0x1
    17a3:	e8 68 22 00 00       	call   3a10 <printf>
    exit();
    17a8:	e8 15 21 00 00       	call   38c2 <exit>
  if(fd < 0){
    printf(1, "create lf1 failed\n");
    exit();
  }
  if(write(fd, "hello", 5) != 5){
    printf(1, "write lf1 failed\n");
    17ad:	50                   	push   %eax
    17ae:	50                   	push   %eax
    17af:	68 f9 42 00 00       	push   $0x42f9
    17b4:	6a 01                	push   $0x1
    17b6:	e8 55 22 00 00       	call   3a10 <printf>
    exit();
    17bb:	e8 02 21 00 00       	call   38c2 <exit>

000017c0 <concreate>:
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    17c0:	55                   	push   %ebp
    17c1:	89 e5                	mov    %esp,%ebp
    17c3:	57                   	push   %edi
    17c4:	56                   	push   %esi
    17c5:	53                   	push   %ebx
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    17c6:	31 f6                	xor    %esi,%esi
    17c8:	8d 5d ad             	lea    -0x53(%ebp),%ebx
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    17cb:	bf 56 55 55 55       	mov    $0x55555556,%edi
}

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    17d0:	83 ec 64             	sub    $0x64,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    17d3:	68 89 43 00 00       	push   $0x4389
    17d8:	6a 01                	push   $0x1
    17da:	e8 31 22 00 00       	call   3a10 <printf>
  file[0] = 'C';
    17df:	c6 45 ad 43          	movb   $0x43,-0x53(%ebp)
  file[2] = '\0';
    17e3:	c6 45 af 00          	movb   $0x0,-0x51(%ebp)
    17e7:	83 c4 10             	add    $0x10,%esp
    17ea:	eb 51                	jmp    183d <concreate+0x7d>
    17ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    17f0:	89 f0                	mov    %esi,%eax
    17f2:	89 f1                	mov    %esi,%ecx
    17f4:	f7 ef                	imul   %edi
    17f6:	89 f0                	mov    %esi,%eax
    17f8:	c1 f8 1f             	sar    $0x1f,%eax
    17fb:	29 c2                	sub    %eax,%edx
    17fd:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1800:	29 c1                	sub    %eax,%ecx
    1802:	83 f9 01             	cmp    $0x1,%ecx
    1805:	0f 84 b5 00 00 00    	je     18c0 <concreate+0x100>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    180b:	83 ec 08             	sub    $0x8,%esp
    180e:	68 02 02 00 00       	push   $0x202
    1813:	53                   	push   %ebx
    1814:	e8 e9 20 00 00       	call   3902 <open>
      if(fd < 0){
    1819:	83 c4 10             	add    $0x10,%esp
    181c:	85 c0                	test   %eax,%eax
    181e:	78 6d                	js     188d <concreate+0xcd>
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1820:	83 ec 0c             	sub    $0xc,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1823:	83 c6 01             	add    $0x1,%esi
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1826:	50                   	push   %eax
    1827:	e8 be 20 00 00       	call   38ea <close>
    182c:	83 c4 10             	add    $0x10,%esp
    }
    if(pid == 0)
      exit();
    else
      wait();
    182f:	e8 96 20 00 00       	call   38ca <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    1834:	83 fe 28             	cmp    $0x28,%esi
    1837:	0f 84 ab 00 00 00    	je     18e8 <concreate+0x128>
    file[1] = '0' + i;
    unlink(file);
    183d:	83 ec 0c             	sub    $0xc,%esp

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1840:	8d 46 30             	lea    0x30(%esi),%eax
    unlink(file);
    1843:	53                   	push   %ebx

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    1844:	88 45 ae             	mov    %al,-0x52(%ebp)
    unlink(file);
    1847:	e8 c6 20 00 00       	call   3912 <unlink>
    pid = fork();
    184c:	e8 69 20 00 00       	call   38ba <fork>
    if(pid && (i % 3) == 1){
    1851:	83 c4 10             	add    $0x10,%esp
    1854:	85 c0                	test   %eax,%eax
    1856:	75 98                	jne    17f0 <concreate+0x30>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    1858:	89 f0                	mov    %esi,%eax
    185a:	ba 67 66 66 66       	mov    $0x66666667,%edx
    185f:	f7 ea                	imul   %edx
    1861:	89 f0                	mov    %esi,%eax
    1863:	c1 f8 1f             	sar    $0x1f,%eax
    1866:	d1 fa                	sar    %edx
    1868:	29 c2                	sub    %eax,%edx
    186a:	8d 04 92             	lea    (%edx,%edx,4),%eax
    186d:	29 c6                	sub    %eax,%esi
    186f:	83 fe 01             	cmp    $0x1,%esi
    1872:	74 34                	je     18a8 <concreate+0xe8>
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1874:	83 ec 08             	sub    $0x8,%esp
    1877:	68 02 02 00 00       	push   $0x202
    187c:	53                   	push   %ebx
    187d:	e8 80 20 00 00       	call   3902 <open>
      if(fd < 0){
    1882:	83 c4 10             	add    $0x10,%esp
    1885:	85 c0                	test   %eax,%eax
    1887:	0f 89 32 02 00 00    	jns    1abf <concreate+0x2ff>
        printf(1, "concreate create %s failed\n", file);
    188d:	83 ec 04             	sub    $0x4,%esp
    1890:	53                   	push   %ebx
    1891:	68 9c 43 00 00       	push   $0x439c
    1896:	6a 01                	push   $0x1
    1898:	e8 73 21 00 00       	call   3a10 <printf>
        exit();
    189d:	e8 20 20 00 00       	call   38c2 <exit>
    18a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
      link("C0", file);
    18a8:	83 ec 08             	sub    $0x8,%esp
    18ab:	53                   	push   %ebx
    18ac:	68 99 43 00 00       	push   $0x4399
    18b1:	e8 6c 20 00 00       	call   3922 <link>
    18b6:	83 c4 10             	add    $0x10,%esp
        exit();
      }
      close(fd);
    }
    if(pid == 0)
      exit();
    18b9:	e8 04 20 00 00       	call   38c2 <exit>
    18be:	66 90                	xchg   %ax,%ax
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    18c0:	83 ec 08             	sub    $0x8,%esp
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    18c3:	83 c6 01             	add    $0x1,%esi
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    18c6:	53                   	push   %ebx
    18c7:	68 99 43 00 00       	push   $0x4399
    18cc:	e8 51 20 00 00       	call   3922 <link>
    18d1:	83 c4 10             	add    $0x10,%esp
      close(fd);
    }
    if(pid == 0)
      exit();
    else
      wait();
    18d4:	e8 f1 1f 00 00       	call   38ca <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    18d9:	83 fe 28             	cmp    $0x28,%esi
    18dc:	0f 85 5b ff ff ff    	jne    183d <concreate+0x7d>
    18e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    18e8:	8d 45 c0             	lea    -0x40(%ebp),%eax
    18eb:	83 ec 04             	sub    $0x4,%esp
    18ee:	8d 7d b0             	lea    -0x50(%ebp),%edi
    18f1:	6a 28                	push   $0x28
    18f3:	6a 00                	push   $0x0
    18f5:	50                   	push   %eax
    18f6:	e8 35 1e 00 00       	call   3730 <memset>
  fd = open(".", 0);
    18fb:	59                   	pop    %ecx
    18fc:	5e                   	pop    %esi
    18fd:	6a 00                	push   $0x0
    18ff:	68 a6 45 00 00       	push   $0x45a6
    1904:	e8 f9 1f 00 00       	call   3902 <open>
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1909:	83 c4 10             	add    $0x10,%esp
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
    190c:	89 c6                	mov    %eax,%esi
  n = 0;
    190e:	c7 45 a4 00 00 00 00 	movl   $0x0,-0x5c(%ebp)
    1915:	8d 76 00             	lea    0x0(%esi),%esi
  while(read(fd, &de, sizeof(de)) > 0){
    1918:	83 ec 04             	sub    $0x4,%esp
    191b:	6a 10                	push   $0x10
    191d:	57                   	push   %edi
    191e:	56                   	push   %esi
    191f:	e8 b6 1f 00 00       	call   38da <read>
    1924:	83 c4 10             	add    $0x10,%esp
    1927:	85 c0                	test   %eax,%eax
    1929:	7e 3d                	jle    1968 <concreate+0x1a8>
    if(de.inum == 0)
    192b:	66 83 7d b0 00       	cmpw   $0x0,-0x50(%ebp)
    1930:	74 e6                	je     1918 <concreate+0x158>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1932:	80 7d b2 43          	cmpb   $0x43,-0x4e(%ebp)
    1936:	75 e0                	jne    1918 <concreate+0x158>
    1938:	80 7d b4 00          	cmpb   $0x0,-0x4c(%ebp)
    193c:	75 da                	jne    1918 <concreate+0x158>
      i = de.name[1] - '0';
    193e:	0f be 45 b3          	movsbl -0x4d(%ebp),%eax
    1942:	83 e8 30             	sub    $0x30,%eax
      if(i < 0 || i >= sizeof(fa)){
    1945:	83 f8 27             	cmp    $0x27,%eax
    1948:	0f 87 59 01 00 00    	ja     1aa7 <concreate+0x2e7>
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
    194e:	80 7c 05 c0 00       	cmpb   $0x0,-0x40(%ebp,%eax,1)
    1953:	0f 85 36 01 00 00    	jne    1a8f <concreate+0x2cf>
        printf(1, "concreate duplicate file %s\n", de.name);
        exit();
      }
      fa[i] = 1;
    1959:	c6 44 05 c0 01       	movb   $0x1,-0x40(%ebp,%eax,1)
      n++;
    195e:	83 45 a4 01          	addl   $0x1,-0x5c(%ebp)
    1962:	eb b4                	jmp    1918 <concreate+0x158>
    1964:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
  }
  close(fd);
    1968:	83 ec 0c             	sub    $0xc,%esp
    196b:	56                   	push   %esi
    196c:	e8 79 1f 00 00       	call   38ea <close>

  if(n != 40){
    1971:	83 c4 10             	add    $0x10,%esp
    1974:	83 7d a4 28          	cmpl   $0x28,-0x5c(%ebp)
    1978:	0f 85 fd 00 00 00    	jne    1a7b <concreate+0x2bb>
    197e:	31 f6                	xor    %esi,%esi
    1980:	eb 70                	jmp    19f2 <concreate+0x232>
    1982:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
       ((i % 3) == 1 && pid != 0)){
    1988:	83 fa 01             	cmp    $0x1,%edx
    198b:	0f 85 99 00 00 00    	jne    1a2a <concreate+0x26a>
      close(open(file, 0));
    1991:	83 ec 08             	sub    $0x8,%esp
    1994:	6a 00                	push   $0x0
    1996:	53                   	push   %ebx
    1997:	e8 66 1f 00 00       	call   3902 <open>
    199c:	89 04 24             	mov    %eax,(%esp)
    199f:	e8 46 1f 00 00       	call   38ea <close>
      close(open(file, 0));
    19a4:	58                   	pop    %eax
    19a5:	5a                   	pop    %edx
    19a6:	6a 00                	push   $0x0
    19a8:	53                   	push   %ebx
    19a9:	e8 54 1f 00 00       	call   3902 <open>
    19ae:	89 04 24             	mov    %eax,(%esp)
    19b1:	e8 34 1f 00 00       	call   38ea <close>
      close(open(file, 0));
    19b6:	59                   	pop    %ecx
    19b7:	58                   	pop    %eax
    19b8:	6a 00                	push   $0x0
    19ba:	53                   	push   %ebx
    19bb:	e8 42 1f 00 00       	call   3902 <open>
    19c0:	89 04 24             	mov    %eax,(%esp)
    19c3:	e8 22 1f 00 00       	call   38ea <close>
      close(open(file, 0));
    19c8:	58                   	pop    %eax
    19c9:	5a                   	pop    %edx
    19ca:	6a 00                	push   $0x0
    19cc:	53                   	push   %ebx
    19cd:	e8 30 1f 00 00       	call   3902 <open>
    19d2:	89 04 24             	mov    %eax,(%esp)
    19d5:	e8 10 1f 00 00       	call   38ea <close>
    19da:	83 c4 10             	add    $0x10,%esp
      unlink(file);
      unlink(file);
      unlink(file);
      unlink(file);
    }
    if(pid == 0)
    19dd:	85 ff                	test   %edi,%edi
    19df:	0f 84 d4 fe ff ff    	je     18b9 <concreate+0xf9>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    19e5:	83 c6 01             	add    $0x1,%esi
      unlink(file);
    }
    if(pid == 0)
      exit();
    else
      wait();
    19e8:	e8 dd 1e 00 00       	call   38ca <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    19ed:	83 fe 28             	cmp    $0x28,%esi
    19f0:	74 5e                	je     1a50 <concreate+0x290>
    file[1] = '0' + i;
    19f2:	8d 46 30             	lea    0x30(%esi),%eax
    19f5:	88 45 ae             	mov    %al,-0x52(%ebp)
    pid = fork();
    19f8:	e8 bd 1e 00 00       	call   38ba <fork>
    if(pid < 0){
    19fd:	85 c0                	test   %eax,%eax
    exit();
  }

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    19ff:	89 c7                	mov    %eax,%edi
    if(pid < 0){
    1a01:	78 64                	js     1a67 <concreate+0x2a7>
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    1a03:	b8 56 55 55 55       	mov    $0x55555556,%eax
    1a08:	f7 ee                	imul   %esi
    1a0a:	89 f0                	mov    %esi,%eax
    1a0c:	c1 f8 1f             	sar    $0x1f,%eax
    1a0f:	29 c2                	sub    %eax,%edx
    1a11:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1a14:	89 f2                	mov    %esi,%edx
    1a16:	29 c2                	sub    %eax,%edx
    1a18:	89 f8                	mov    %edi,%eax
    1a1a:	09 d0                	or     %edx,%eax
    1a1c:	0f 84 6f ff ff ff    	je     1991 <concreate+0x1d1>
       ((i % 3) == 1 && pid != 0)){
    1a22:	85 ff                	test   %edi,%edi
    1a24:	0f 85 5e ff ff ff    	jne    1988 <concreate+0x1c8>
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
    } else {
      unlink(file);
    1a2a:	83 ec 0c             	sub    $0xc,%esp
    1a2d:	53                   	push   %ebx
    1a2e:	e8 df 1e 00 00       	call   3912 <unlink>
      unlink(file);
    1a33:	89 1c 24             	mov    %ebx,(%esp)
    1a36:	e8 d7 1e 00 00       	call   3912 <unlink>
      unlink(file);
    1a3b:	89 1c 24             	mov    %ebx,(%esp)
    1a3e:	e8 cf 1e 00 00       	call   3912 <unlink>
      unlink(file);
    1a43:	89 1c 24             	mov    %ebx,(%esp)
    1a46:	e8 c7 1e 00 00       	call   3912 <unlink>
    1a4b:	83 c4 10             	add    $0x10,%esp
    1a4e:	eb 8d                	jmp    19dd <concreate+0x21d>
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    1a50:	83 ec 08             	sub    $0x8,%esp
    1a53:	68 ee 43 00 00       	push   $0x43ee
    1a58:	6a 01                	push   $0x1
    1a5a:	e8 b1 1f 00 00       	call   3a10 <printf>
}
    1a5f:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1a62:	5b                   	pop    %ebx
    1a63:	5e                   	pop    %esi
    1a64:	5f                   	pop    %edi
    1a65:	5d                   	pop    %ebp
    1a66:	c3                   	ret    

  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
    1a67:	83 ec 08             	sub    $0x8,%esp
    1a6a:	68 71 4c 00 00       	push   $0x4c71
    1a6f:	6a 01                	push   $0x1
    1a71:	e8 9a 1f 00 00       	call   3a10 <printf>
      exit();
    1a76:	e8 47 1e 00 00       	call   38c2 <exit>
    }
  }
  close(fd);

  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    1a7b:	83 ec 08             	sub    $0x8,%esp
    1a7e:	68 38 4f 00 00       	push   $0x4f38
    1a83:	6a 01                	push   $0x1
    1a85:	e8 86 1f 00 00       	call   3a10 <printf>
    exit();
    1a8a:	e8 33 1e 00 00       	call   38c2 <exit>
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
        exit();
      }
      if(fa[i]){
        printf(1, "concreate duplicate file %s\n", de.name);
    1a8f:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1a92:	83 ec 04             	sub    $0x4,%esp
    1a95:	50                   	push   %eax
    1a96:	68 d1 43 00 00       	push   $0x43d1
    1a9b:	6a 01                	push   $0x1
    1a9d:	e8 6e 1f 00 00       	call   3a10 <printf>
        exit();
    1aa2:	e8 1b 1e 00 00       	call   38c2 <exit>
    if(de.inum == 0)
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
      i = de.name[1] - '0';
      if(i < 0 || i >= sizeof(fa)){
        printf(1, "concreate weird file %s\n", de.name);
    1aa7:	8d 45 b2             	lea    -0x4e(%ebp),%eax
    1aaa:	83 ec 04             	sub    $0x4,%esp
    1aad:	50                   	push   %eax
    1aae:	68 b8 43 00 00       	push   $0x43b8
    1ab3:	6a 01                	push   $0x1
    1ab5:	e8 56 1f 00 00       	call   3a10 <printf>
        exit();
    1aba:	e8 03 1e 00 00       	call   38c2 <exit>
      fd = open(file, O_CREATE | O_RDWR);
      if(fd < 0){
        printf(1, "concreate create %s failed\n", file);
        exit();
      }
      close(fd);
    1abf:	83 ec 0c             	sub    $0xc,%esp
    1ac2:	50                   	push   %eax
    1ac3:	e8 22 1e 00 00       	call   38ea <close>
    1ac8:	83 c4 10             	add    $0x10,%esp
    1acb:	e9 e9 fd ff ff       	jmp    18b9 <concreate+0xf9>

00001ad0 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1ad0:	55                   	push   %ebp
    1ad1:	89 e5                	mov    %esp,%ebp
    1ad3:	57                   	push   %edi
    1ad4:	56                   	push   %esi
    1ad5:	53                   	push   %ebx
    1ad6:	83 ec 24             	sub    $0x24,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1ad9:	68 fc 43 00 00       	push   $0x43fc
    1ade:	6a 01                	push   $0x1
    1ae0:	e8 2b 1f 00 00       	call   3a10 <printf>

  unlink("x");
    1ae5:	c7 04 24 89 46 00 00 	movl   $0x4689,(%esp)
    1aec:	e8 21 1e 00 00       	call   3912 <unlink>
  pid = fork();
    1af1:	e8 c4 1d 00 00       	call   38ba <fork>
  if(pid < 0){
    1af6:	83 c4 10             	add    $0x10,%esp
    1af9:	85 c0                	test   %eax,%eax
  int pid, i;

  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
    1afb:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    1afe:	0f 88 b6 00 00 00    	js     1bba <linkunlink+0xea>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1b04:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    1b08:	bb 64 00 00 00       	mov    $0x64,%ebx
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
    1b0d:	be ab aa aa aa       	mov    $0xaaaaaaab,%esi
  if(pid < 0){
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
    1b12:	19 ff                	sbb    %edi,%edi
    1b14:	83 e7 60             	and    $0x60,%edi
    1b17:	83 c7 01             	add    $0x1,%edi
    1b1a:	eb 1e                	jmp    1b3a <linkunlink+0x6a>
    1b1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
    1b20:	83 fa 01             	cmp    $0x1,%edx
    1b23:	74 7b                	je     1ba0 <linkunlink+0xd0>
      link("cat", "x");
    } else {
      unlink("x");
    1b25:	83 ec 0c             	sub    $0xc,%esp
    1b28:	68 89 46 00 00       	push   $0x4689
    1b2d:	e8 e0 1d 00 00       	call   3912 <unlink>
    1b32:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1b35:	83 eb 01             	sub    $0x1,%ebx
    1b38:	74 3d                	je     1b77 <linkunlink+0xa7>
    x = x * 1103515245 + 12345;
    1b3a:	69 cf 6d 4e c6 41    	imul   $0x41c64e6d,%edi,%ecx
    1b40:	8d b9 39 30 00 00    	lea    0x3039(%ecx),%edi
    if((x % 3) == 0){
    1b46:	89 f8                	mov    %edi,%eax
    1b48:	f7 e6                	mul    %esi
    1b4a:	d1 ea                	shr    %edx
    1b4c:	8d 04 52             	lea    (%edx,%edx,2),%eax
    1b4f:	89 fa                	mov    %edi,%edx
    1b51:	29 c2                	sub    %eax,%edx
    1b53:	75 cb                	jne    1b20 <linkunlink+0x50>
      close(open("x", O_RDWR | O_CREATE));
    1b55:	83 ec 08             	sub    $0x8,%esp
    1b58:	68 02 02 00 00       	push   $0x202
    1b5d:	68 89 46 00 00       	push   $0x4689
    1b62:	e8 9b 1d 00 00       	call   3902 <open>
    1b67:	89 04 24             	mov    %eax,(%esp)
    1b6a:	e8 7b 1d 00 00       	call   38ea <close>
    1b6f:	83 c4 10             	add    $0x10,%esp
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1b72:	83 eb 01             	sub    $0x1,%ebx
    1b75:	75 c3                	jne    1b3a <linkunlink+0x6a>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1b77:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1b7a:	85 c0                	test   %eax,%eax
    1b7c:	74 50                	je     1bce <linkunlink+0xfe>
    wait();
    1b7e:	e8 47 1d 00 00       	call   38ca <wait>
  else
    exit();

  printf(1, "linkunlink ok\n");
    1b83:	83 ec 08             	sub    $0x8,%esp
    1b86:	68 11 44 00 00       	push   $0x4411
    1b8b:	6a 01                	push   $0x1
    1b8d:	e8 7e 1e 00 00       	call   3a10 <printf>
}
    1b92:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1b95:	5b                   	pop    %ebx
    1b96:	5e                   	pop    %esi
    1b97:	5f                   	pop    %edi
    1b98:	5d                   	pop    %ebp
    1b99:	c3                   	ret    
    1b9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  for(i = 0; i < 100; i++){
    x = x * 1103515245 + 12345;
    if((x % 3) == 0){
      close(open("x", O_RDWR | O_CREATE));
    } else if((x % 3) == 1){
      link("cat", "x");
    1ba0:	83 ec 08             	sub    $0x8,%esp
    1ba3:	68 89 46 00 00       	push   $0x4689
    1ba8:	68 0d 44 00 00       	push   $0x440d
    1bad:	e8 70 1d 00 00       	call   3922 <link>
    1bb2:	83 c4 10             	add    $0x10,%esp
    1bb5:	e9 7b ff ff ff       	jmp    1b35 <linkunlink+0x65>
  printf(1, "linkunlink test\n");

  unlink("x");
  pid = fork();
  if(pid < 0){
    printf(1, "fork failed\n");
    1bba:	83 ec 08             	sub    $0x8,%esp
    1bbd:	68 71 4c 00 00       	push   $0x4c71
    1bc2:	6a 01                	push   $0x1
    1bc4:	e8 47 1e 00 00       	call   3a10 <printf>
    exit();
    1bc9:	e8 f4 1c 00 00       	call   38c2 <exit>
  }

  if(pid)
    wait();
  else
    exit();
    1bce:	e8 ef 1c 00 00       	call   38c2 <exit>
    1bd3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1bd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001be0 <bigdir>:
}

// directory that uses indirect blocks
void
bigdir(void)
{
    1be0:	55                   	push   %ebp
    1be1:	89 e5                	mov    %esp,%ebp
    1be3:	56                   	push   %esi
    1be4:	53                   	push   %ebx
    1be5:	83 ec 18             	sub    $0x18,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1be8:	68 20 44 00 00       	push   $0x4420
    1bed:	6a 01                	push   $0x1
    1bef:	e8 1c 1e 00 00       	call   3a10 <printf>
  unlink("bd");
    1bf4:	c7 04 24 2d 44 00 00 	movl   $0x442d,(%esp)
    1bfb:	e8 12 1d 00 00       	call   3912 <unlink>

  fd = open("bd", O_CREATE);
    1c00:	58                   	pop    %eax
    1c01:	5a                   	pop    %edx
    1c02:	68 00 02 00 00       	push   $0x200
    1c07:	68 2d 44 00 00       	push   $0x442d
    1c0c:	e8 f1 1c 00 00       	call   3902 <open>
  if(fd < 0){
    1c11:	83 c4 10             	add    $0x10,%esp
    1c14:	85 c0                	test   %eax,%eax
    1c16:	0f 88 de 00 00 00    	js     1cfa <bigdir+0x11a>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1c1c:	83 ec 0c             	sub    $0xc,%esp
    1c1f:	8d 75 ee             	lea    -0x12(%ebp),%esi

  for(i = 0; i < 500; i++){
    1c22:	31 db                	xor    %ebx,%ebx
  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);
    1c24:	50                   	push   %eax
    1c25:	e8 c0 1c 00 00       	call   38ea <close>
    1c2a:	83 c4 10             	add    $0x10,%esp
    1c2d:	8d 76 00             	lea    0x0(%esi),%esi

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c30:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c32:	83 ec 08             	sub    $0x8,%esp
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1c35:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1c39:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c3c:	56                   	push   %esi
    1c3d:	68 2d 44 00 00       	push   $0x442d
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c42:	83 c0 30             	add    $0x30,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1c45:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }
  close(fd);

  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c49:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1c4c:	89 d8                	mov    %ebx,%eax
    1c4e:	83 e0 3f             	and    $0x3f,%eax
    1c51:	83 c0 30             	add    $0x30,%eax
    1c54:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(link("bd", name) != 0){
    1c57:	e8 c6 1c 00 00       	call   3922 <link>
    1c5c:	83 c4 10             	add    $0x10,%esp
    1c5f:	85 c0                	test   %eax,%eax
    1c61:	75 6f                	jne    1cd2 <bigdir+0xf2>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1c63:	83 c3 01             	add    $0x1,%ebx
    1c66:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1c6c:	75 c2                	jne    1c30 <bigdir+0x50>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1c6e:	83 ec 0c             	sub    $0xc,%esp
  for(i = 0; i < 500; i++){
    1c71:	31 db                	xor    %ebx,%ebx
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1c73:	68 2d 44 00 00       	push   $0x442d
    1c78:	e8 95 1c 00 00       	call   3912 <unlink>
    1c7d:	83 c4 10             	add    $0x10,%esp
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c80:	89 d8                	mov    %ebx,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1c82:	83 ec 0c             	sub    $0xc,%esp
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    1c85:	c6 45 ee 78          	movb   $0x78,-0x12(%ebp)
    name[1] = '0' + (i / 64);
    1c89:	c1 f8 06             	sar    $0x6,%eax
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
    1c8c:	56                   	push   %esi
  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    1c8d:	c6 45 f1 00          	movb   $0x0,-0xf(%ebp)
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    1c91:	83 c0 30             	add    $0x30,%eax
    1c94:	88 45 ef             	mov    %al,-0x11(%ebp)
    name[2] = '0' + (i % 64);
    1c97:	89 d8                	mov    %ebx,%eax
    1c99:	83 e0 3f             	and    $0x3f,%eax
    1c9c:	83 c0 30             	add    $0x30,%eax
    1c9f:	88 45 f0             	mov    %al,-0x10(%ebp)
    name[3] = '\0';
    if(unlink(name) != 0){
    1ca2:	e8 6b 1c 00 00       	call   3912 <unlink>
    1ca7:	83 c4 10             	add    $0x10,%esp
    1caa:	85 c0                	test   %eax,%eax
    1cac:	75 38                	jne    1ce6 <bigdir+0x106>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1cae:	83 c3 01             	add    $0x1,%ebx
    1cb1:	81 fb f4 01 00 00    	cmp    $0x1f4,%ebx
    1cb7:	75 c7                	jne    1c80 <bigdir+0xa0>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    1cb9:	83 ec 08             	sub    $0x8,%esp
    1cbc:	68 6f 44 00 00       	push   $0x446f
    1cc1:	6a 01                	push   $0x1
    1cc3:	e8 48 1d 00 00       	call   3a10 <printf>
}
    1cc8:	83 c4 10             	add    $0x10,%esp
    1ccb:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1cce:	5b                   	pop    %ebx
    1ccf:	5e                   	pop    %esi
    1cd0:	5d                   	pop    %ebp
    1cd1:	c3                   	ret    
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(link("bd", name) != 0){
      printf(1, "bigdir link failed\n");
    1cd2:	83 ec 08             	sub    $0x8,%esp
    1cd5:	68 46 44 00 00       	push   $0x4446
    1cda:	6a 01                	push   $0x1
    1cdc:	e8 2f 1d 00 00       	call   3a10 <printf>
      exit();
    1ce1:	e8 dc 1b 00 00       	call   38c2 <exit>
    name[0] = 'x';
    name[1] = '0' + (i / 64);
    name[2] = '0' + (i % 64);
    name[3] = '\0';
    if(unlink(name) != 0){
      printf(1, "bigdir unlink failed");
    1ce6:	83 ec 08             	sub    $0x8,%esp
    1ce9:	68 5a 44 00 00       	push   $0x445a
    1cee:	6a 01                	push   $0x1
    1cf0:	e8 1b 1d 00 00       	call   3a10 <printf>
      exit();
    1cf5:	e8 c8 1b 00 00       	call   38c2 <exit>
  printf(1, "bigdir test\n");
  unlink("bd");

  fd = open("bd", O_CREATE);
  if(fd < 0){
    printf(1, "bigdir create failed\n");
    1cfa:	83 ec 08             	sub    $0x8,%esp
    1cfd:	68 30 44 00 00       	push   $0x4430
    1d02:	6a 01                	push   $0x1
    1d04:	e8 07 1d 00 00       	call   3a10 <printf>
    exit();
    1d09:	e8 b4 1b 00 00       	call   38c2 <exit>
    1d0e:	66 90                	xchg   %ax,%ax

00001d10 <subdir>:
  printf(1, "bigdir ok\n");
}

void
subdir(void)
{
    1d10:	55                   	push   %ebp
    1d11:	89 e5                	mov    %esp,%ebp
    1d13:	53                   	push   %ebx
    1d14:	83 ec 0c             	sub    $0xc,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1d17:	68 7a 44 00 00       	push   $0x447a
    1d1c:	6a 01                	push   $0x1
    1d1e:	e8 ed 1c 00 00       	call   3a10 <printf>

  unlink("ff");
    1d23:	c7 04 24 03 45 00 00 	movl   $0x4503,(%esp)
    1d2a:	e8 e3 1b 00 00       	call   3912 <unlink>
  if(mkdir("dd") != 0){
    1d2f:	c7 04 24 a0 45 00 00 	movl   $0x45a0,(%esp)
    1d36:	e8 ef 1b 00 00       	call   392a <mkdir>
    1d3b:	83 c4 10             	add    $0x10,%esp
    1d3e:	85 c0                	test   %eax,%eax
    1d40:	0f 85 b3 05 00 00    	jne    22f9 <subdir+0x5e9>
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d46:	83 ec 08             	sub    $0x8,%esp
    1d49:	68 02 02 00 00       	push   $0x202
    1d4e:	68 d9 44 00 00       	push   $0x44d9
    1d53:	e8 aa 1b 00 00       	call   3902 <open>
  if(fd < 0){
    1d58:	83 c4 10             	add    $0x10,%esp
    1d5b:	85 c0                	test   %eax,%eax
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d5d:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1d5f:	0f 88 81 05 00 00    	js     22e6 <subdir+0x5d6>
    printf(1, "create dd/ff failed\n");
    exit();
  }
  write(fd, "ff", 2);
    1d65:	83 ec 04             	sub    $0x4,%esp
    1d68:	6a 02                	push   $0x2
    1d6a:	68 03 45 00 00       	push   $0x4503
    1d6f:	50                   	push   %eax
    1d70:	e8 6d 1b 00 00       	call   38e2 <write>
  close(fd);
    1d75:	89 1c 24             	mov    %ebx,(%esp)
    1d78:	e8 6d 1b 00 00       	call   38ea <close>

  if(unlink("dd") >= 0){
    1d7d:	c7 04 24 a0 45 00 00 	movl   $0x45a0,(%esp)
    1d84:	e8 89 1b 00 00       	call   3912 <unlink>
    1d89:	83 c4 10             	add    $0x10,%esp
    1d8c:	85 c0                	test   %eax,%eax
    1d8e:	0f 89 3f 05 00 00    	jns    22d3 <subdir+0x5c3>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    1d94:	83 ec 0c             	sub    $0xc,%esp
    1d97:	68 b4 44 00 00       	push   $0x44b4
    1d9c:	e8 89 1b 00 00       	call   392a <mkdir>
    1da1:	83 c4 10             	add    $0x10,%esp
    1da4:	85 c0                	test   %eax,%eax
    1da6:	0f 85 14 05 00 00    	jne    22c0 <subdir+0x5b0>
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1dac:	83 ec 08             	sub    $0x8,%esp
    1daf:	68 02 02 00 00       	push   $0x202
    1db4:	68 d6 44 00 00       	push   $0x44d6
    1db9:	e8 44 1b 00 00       	call   3902 <open>
  if(fd < 0){
    1dbe:	83 c4 10             	add    $0x10,%esp
    1dc1:	85 c0                	test   %eax,%eax
  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1dc3:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1dc5:	0f 88 24 04 00 00    	js     21ef <subdir+0x4df>
    printf(1, "create dd/dd/ff failed\n");
    exit();
  }
  write(fd, "FF", 2);
    1dcb:	83 ec 04             	sub    $0x4,%esp
    1dce:	6a 02                	push   $0x2
    1dd0:	68 f7 44 00 00       	push   $0x44f7
    1dd5:	50                   	push   %eax
    1dd6:	e8 07 1b 00 00       	call   38e2 <write>
  close(fd);
    1ddb:	89 1c 24             	mov    %ebx,(%esp)
    1dde:	e8 07 1b 00 00       	call   38ea <close>

  fd = open("dd/dd/../ff", 0);
    1de3:	58                   	pop    %eax
    1de4:	5a                   	pop    %edx
    1de5:	6a 00                	push   $0x0
    1de7:	68 fa 44 00 00       	push   $0x44fa
    1dec:	e8 11 1b 00 00       	call   3902 <open>
  if(fd < 0){
    1df1:	83 c4 10             	add    $0x10,%esp
    1df4:	85 c0                	test   %eax,%eax
    exit();
  }
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
    1df6:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1df8:	0f 88 de 03 00 00    	js     21dc <subdir+0x4cc>
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
    1dfe:	83 ec 04             	sub    $0x4,%esp
    1e01:	68 00 20 00 00       	push   $0x2000
    1e06:	68 a0 85 00 00       	push   $0x85a0
    1e0b:	50                   	push   %eax
    1e0c:	e8 c9 1a 00 00       	call   38da <read>
  if(cc != 2 || buf[0] != 'f'){
    1e11:	83 c4 10             	add    $0x10,%esp
    1e14:	83 f8 02             	cmp    $0x2,%eax
    1e17:	0f 85 3a 03 00 00    	jne    2157 <subdir+0x447>
    1e1d:	80 3d a0 85 00 00 66 	cmpb   $0x66,0x85a0
    1e24:	0f 85 2d 03 00 00    	jne    2157 <subdir+0x447>
    printf(1, "dd/dd/../ff wrong content\n");
    exit();
  }
  close(fd);
    1e2a:	83 ec 0c             	sub    $0xc,%esp
    1e2d:	53                   	push   %ebx
    1e2e:	e8 b7 1a 00 00       	call   38ea <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1e33:	5b                   	pop    %ebx
    1e34:	58                   	pop    %eax
    1e35:	68 3a 45 00 00       	push   $0x453a
    1e3a:	68 d6 44 00 00       	push   $0x44d6
    1e3f:	e8 de 1a 00 00       	call   3922 <link>
    1e44:	83 c4 10             	add    $0x10,%esp
    1e47:	85 c0                	test   %eax,%eax
    1e49:	0f 85 c6 03 00 00    	jne    2215 <subdir+0x505>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    1e4f:	83 ec 0c             	sub    $0xc,%esp
    1e52:	68 d6 44 00 00       	push   $0x44d6
    1e57:	e8 b6 1a 00 00       	call   3912 <unlink>
    1e5c:	83 c4 10             	add    $0x10,%esp
    1e5f:	85 c0                	test   %eax,%eax
    1e61:	0f 85 16 03 00 00    	jne    217d <subdir+0x46d>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1e67:	83 ec 08             	sub    $0x8,%esp
    1e6a:	6a 00                	push   $0x0
    1e6c:	68 d6 44 00 00       	push   $0x44d6
    1e71:	e8 8c 1a 00 00       	call   3902 <open>
    1e76:	83 c4 10             	add    $0x10,%esp
    1e79:	85 c0                	test   %eax,%eax
    1e7b:	0f 89 2c 04 00 00    	jns    22ad <subdir+0x59d>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    1e81:	83 ec 0c             	sub    $0xc,%esp
    1e84:	68 a0 45 00 00       	push   $0x45a0
    1e89:	e8 a4 1a 00 00       	call   3932 <chdir>
    1e8e:	83 c4 10             	add    $0x10,%esp
    1e91:	85 c0                	test   %eax,%eax
    1e93:	0f 85 01 04 00 00    	jne    229a <subdir+0x58a>
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    1e99:	83 ec 0c             	sub    $0xc,%esp
    1e9c:	68 6e 45 00 00       	push   $0x456e
    1ea1:	e8 8c 1a 00 00       	call   3932 <chdir>
    1ea6:	83 c4 10             	add    $0x10,%esp
    1ea9:	85 c0                	test   %eax,%eax
    1eab:	0f 85 b9 02 00 00    	jne    216a <subdir+0x45a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("dd/../../../dd") != 0){
    1eb1:	83 ec 0c             	sub    $0xc,%esp
    1eb4:	68 94 45 00 00       	push   $0x4594
    1eb9:	e8 74 1a 00 00       	call   3932 <chdir>
    1ebe:	83 c4 10             	add    $0x10,%esp
    1ec1:	85 c0                	test   %eax,%eax
    1ec3:	0f 85 a1 02 00 00    	jne    216a <subdir+0x45a>
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    1ec9:	83 ec 0c             	sub    $0xc,%esp
    1ecc:	68 a3 45 00 00       	push   $0x45a3
    1ed1:	e8 5c 1a 00 00       	call   3932 <chdir>
    1ed6:	83 c4 10             	add    $0x10,%esp
    1ed9:	85 c0                	test   %eax,%eax
    1edb:	0f 85 21 03 00 00    	jne    2202 <subdir+0x4f2>
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1ee1:	83 ec 08             	sub    $0x8,%esp
    1ee4:	6a 00                	push   $0x0
    1ee6:	68 3a 45 00 00       	push   $0x453a
    1eeb:	e8 12 1a 00 00       	call   3902 <open>
  if(fd < 0){
    1ef0:	83 c4 10             	add    $0x10,%esp
    1ef3:	85 c0                	test   %eax,%eax
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    exit();
  }

  fd = open("dd/dd/ffff", 0);
    1ef5:	89 c3                	mov    %eax,%ebx
  if(fd < 0){
    1ef7:	0f 88 e0 04 00 00    	js     23dd <subdir+0x6cd>
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    1efd:	83 ec 04             	sub    $0x4,%esp
    1f00:	68 00 20 00 00       	push   $0x2000
    1f05:	68 a0 85 00 00       	push   $0x85a0
    1f0a:	50                   	push   %eax
    1f0b:	e8 ca 19 00 00       	call   38da <read>
    1f10:	83 c4 10             	add    $0x10,%esp
    1f13:	83 f8 02             	cmp    $0x2,%eax
    1f16:	0f 85 ae 04 00 00    	jne    23ca <subdir+0x6ba>
    printf(1, "read dd/dd/ffff wrong len\n");
    exit();
  }
  close(fd);
    1f1c:	83 ec 0c             	sub    $0xc,%esp
    1f1f:	53                   	push   %ebx
    1f20:	e8 c5 19 00 00       	call   38ea <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1f25:	59                   	pop    %ecx
    1f26:	5b                   	pop    %ebx
    1f27:	6a 00                	push   $0x0
    1f29:	68 d6 44 00 00       	push   $0x44d6
    1f2e:	e8 cf 19 00 00       	call   3902 <open>
    1f33:	83 c4 10             	add    $0x10,%esp
    1f36:	85 c0                	test   %eax,%eax
    1f38:	0f 89 65 02 00 00    	jns    21a3 <subdir+0x493>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    1f3e:	83 ec 08             	sub    $0x8,%esp
    1f41:	68 02 02 00 00       	push   $0x202
    1f46:	68 ee 45 00 00       	push   $0x45ee
    1f4b:	e8 b2 19 00 00       	call   3902 <open>
    1f50:	83 c4 10             	add    $0x10,%esp
    1f53:	85 c0                	test   %eax,%eax
    1f55:	0f 89 35 02 00 00    	jns    2190 <subdir+0x480>
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    1f5b:	83 ec 08             	sub    $0x8,%esp
    1f5e:	68 02 02 00 00       	push   $0x202
    1f63:	68 13 46 00 00       	push   $0x4613
    1f68:	e8 95 19 00 00       	call   3902 <open>
    1f6d:	83 c4 10             	add    $0x10,%esp
    1f70:	85 c0                	test   %eax,%eax
    1f72:	0f 89 0f 03 00 00    	jns    2287 <subdir+0x577>
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    1f78:	83 ec 08             	sub    $0x8,%esp
    1f7b:	68 00 02 00 00       	push   $0x200
    1f80:	68 a0 45 00 00       	push   $0x45a0
    1f85:	e8 78 19 00 00       	call   3902 <open>
    1f8a:	83 c4 10             	add    $0x10,%esp
    1f8d:	85 c0                	test   %eax,%eax
    1f8f:	0f 89 df 02 00 00    	jns    2274 <subdir+0x564>
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    1f95:	83 ec 08             	sub    $0x8,%esp
    1f98:	6a 02                	push   $0x2
    1f9a:	68 a0 45 00 00       	push   $0x45a0
    1f9f:	e8 5e 19 00 00       	call   3902 <open>
    1fa4:	83 c4 10             	add    $0x10,%esp
    1fa7:	85 c0                	test   %eax,%eax
    1fa9:	0f 89 b2 02 00 00    	jns    2261 <subdir+0x551>
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    1faf:	83 ec 08             	sub    $0x8,%esp
    1fb2:	6a 01                	push   $0x1
    1fb4:	68 a0 45 00 00       	push   $0x45a0
    1fb9:	e8 44 19 00 00       	call   3902 <open>
    1fbe:	83 c4 10             	add    $0x10,%esp
    1fc1:	85 c0                	test   %eax,%eax
    1fc3:	0f 89 85 02 00 00    	jns    224e <subdir+0x53e>
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    1fc9:	83 ec 08             	sub    $0x8,%esp
    1fcc:	68 82 46 00 00       	push   $0x4682
    1fd1:	68 ee 45 00 00       	push   $0x45ee
    1fd6:	e8 47 19 00 00       	call   3922 <link>
    1fdb:	83 c4 10             	add    $0x10,%esp
    1fde:	85 c0                	test   %eax,%eax
    1fe0:	0f 84 55 02 00 00    	je     223b <subdir+0x52b>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    1fe6:	83 ec 08             	sub    $0x8,%esp
    1fe9:	68 82 46 00 00       	push   $0x4682
    1fee:	68 13 46 00 00       	push   $0x4613
    1ff3:	e8 2a 19 00 00       	call   3922 <link>
    1ff8:	83 c4 10             	add    $0x10,%esp
    1ffb:	85 c0                	test   %eax,%eax
    1ffd:	0f 84 25 02 00 00    	je     2228 <subdir+0x518>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    2003:	83 ec 08             	sub    $0x8,%esp
    2006:	68 3a 45 00 00       	push   $0x453a
    200b:	68 d9 44 00 00       	push   $0x44d9
    2010:	e8 0d 19 00 00       	call   3922 <link>
    2015:	83 c4 10             	add    $0x10,%esp
    2018:	85 c0                	test   %eax,%eax
    201a:	0f 84 a9 01 00 00    	je     21c9 <subdir+0x4b9>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    2020:	83 ec 0c             	sub    $0xc,%esp
    2023:	68 ee 45 00 00       	push   $0x45ee
    2028:	e8 fd 18 00 00       	call   392a <mkdir>
    202d:	83 c4 10             	add    $0x10,%esp
    2030:	85 c0                	test   %eax,%eax
    2032:	0f 84 7e 01 00 00    	je     21b6 <subdir+0x4a6>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    2038:	83 ec 0c             	sub    $0xc,%esp
    203b:	68 13 46 00 00       	push   $0x4613
    2040:	e8 e5 18 00 00       	call   392a <mkdir>
    2045:	83 c4 10             	add    $0x10,%esp
    2048:	85 c0                	test   %eax,%eax
    204a:	0f 84 67 03 00 00    	je     23b7 <subdir+0x6a7>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    2050:	83 ec 0c             	sub    $0xc,%esp
    2053:	68 3a 45 00 00       	push   $0x453a
    2058:	e8 cd 18 00 00       	call   392a <mkdir>
    205d:	83 c4 10             	add    $0x10,%esp
    2060:	85 c0                	test   %eax,%eax
    2062:	0f 84 3c 03 00 00    	je     23a4 <subdir+0x694>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    2068:	83 ec 0c             	sub    $0xc,%esp
    206b:	68 13 46 00 00       	push   $0x4613
    2070:	e8 9d 18 00 00       	call   3912 <unlink>
    2075:	83 c4 10             	add    $0x10,%esp
    2078:	85 c0                	test   %eax,%eax
    207a:	0f 84 11 03 00 00    	je     2391 <subdir+0x681>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    2080:	83 ec 0c             	sub    $0xc,%esp
    2083:	68 ee 45 00 00       	push   $0x45ee
    2088:	e8 85 18 00 00       	call   3912 <unlink>
    208d:	83 c4 10             	add    $0x10,%esp
    2090:	85 c0                	test   %eax,%eax
    2092:	0f 84 e6 02 00 00    	je     237e <subdir+0x66e>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    2098:	83 ec 0c             	sub    $0xc,%esp
    209b:	68 d9 44 00 00       	push   $0x44d9
    20a0:	e8 8d 18 00 00       	call   3932 <chdir>
    20a5:	83 c4 10             	add    $0x10,%esp
    20a8:	85 c0                	test   %eax,%eax
    20aa:	0f 84 bb 02 00 00    	je     236b <subdir+0x65b>
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    20b0:	83 ec 0c             	sub    $0xc,%esp
    20b3:	68 85 46 00 00       	push   $0x4685
    20b8:	e8 75 18 00 00       	call   3932 <chdir>
    20bd:	83 c4 10             	add    $0x10,%esp
    20c0:	85 c0                	test   %eax,%eax
    20c2:	0f 84 90 02 00 00    	je     2358 <subdir+0x648>
    printf(1, "chdir dd/xx succeeded!\n");
    exit();
  }

  if(unlink("dd/dd/ffff") != 0){
    20c8:	83 ec 0c             	sub    $0xc,%esp
    20cb:	68 3a 45 00 00       	push   $0x453a
    20d0:	e8 3d 18 00 00       	call   3912 <unlink>
    20d5:	83 c4 10             	add    $0x10,%esp
    20d8:	85 c0                	test   %eax,%eax
    20da:	0f 85 9d 00 00 00    	jne    217d <subdir+0x46d>
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    20e0:	83 ec 0c             	sub    $0xc,%esp
    20e3:	68 d9 44 00 00       	push   $0x44d9
    20e8:	e8 25 18 00 00       	call   3912 <unlink>
    20ed:	83 c4 10             	add    $0x10,%esp
    20f0:	85 c0                	test   %eax,%eax
    20f2:	0f 85 4d 02 00 00    	jne    2345 <subdir+0x635>
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    20f8:	83 ec 0c             	sub    $0xc,%esp
    20fb:	68 a0 45 00 00       	push   $0x45a0
    2100:	e8 0d 18 00 00       	call   3912 <unlink>
    2105:	83 c4 10             	add    $0x10,%esp
    2108:	85 c0                	test   %eax,%eax
    210a:	0f 84 22 02 00 00    	je     2332 <subdir+0x622>
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    2110:	83 ec 0c             	sub    $0xc,%esp
    2113:	68 b5 44 00 00       	push   $0x44b5
    2118:	e8 f5 17 00 00       	call   3912 <unlink>
    211d:	83 c4 10             	add    $0x10,%esp
    2120:	85 c0                	test   %eax,%eax
    2122:	0f 88 f7 01 00 00    	js     231f <subdir+0x60f>
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    2128:	83 ec 0c             	sub    $0xc,%esp
    212b:	68 a0 45 00 00       	push   $0x45a0
    2130:	e8 dd 17 00 00       	call   3912 <unlink>
    2135:	83 c4 10             	add    $0x10,%esp
    2138:	85 c0                	test   %eax,%eax
    213a:	0f 88 cc 01 00 00    	js     230c <subdir+0x5fc>
    printf(1, "unlink dd failed\n");
    exit();
  }

  printf(1, "subdir ok\n");
    2140:	83 ec 08             	sub    $0x8,%esp
    2143:	68 82 47 00 00       	push   $0x4782
    2148:	6a 01                	push   $0x1
    214a:	e8 c1 18 00 00       	call   3a10 <printf>
}
    214f:	83 c4 10             	add    $0x10,%esp
    2152:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2155:	c9                   	leave  
    2156:	c3                   	ret    
    printf(1, "open dd/dd/../ff failed\n");
    exit();
  }
  cc = read(fd, buf, sizeof(buf));
  if(cc != 2 || buf[0] != 'f'){
    printf(1, "dd/dd/../ff wrong content\n");
    2157:	50                   	push   %eax
    2158:	50                   	push   %eax
    2159:	68 1f 45 00 00       	push   $0x451f
    215e:	6a 01                	push   $0x1
    2160:	e8 ab 18 00 00       	call   3a10 <printf>
    exit();
    2165:	e8 58 17 00 00       	call   38c2 <exit>
  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    exit();
  }
  if(chdir("dd/../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    216a:	50                   	push   %eax
    216b:	50                   	push   %eax
    216c:	68 7a 45 00 00       	push   $0x457a
    2171:	6a 01                	push   $0x1
    2173:	e8 98 18 00 00       	call   3a10 <printf>
    exit();
    2178:	e8 45 17 00 00       	call   38c2 <exit>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    exit();
  }

  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    217d:	52                   	push   %edx
    217e:	52                   	push   %edx
    217f:	68 45 45 00 00       	push   $0x4545
    2184:	6a 01                	push   $0x1
    2186:	e8 85 18 00 00       	call   3a10 <printf>
    exit();
    218b:	e8 32 17 00 00       	call   38c2 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    exit();
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    2190:	50                   	push   %eax
    2191:	50                   	push   %eax
    2192:	68 f7 45 00 00       	push   $0x45f7
    2197:	6a 01                	push   $0x1
    2199:	e8 72 18 00 00       	call   3a10 <printf>
    exit();
    219e:	e8 1f 17 00 00       	call   38c2 <exit>
    exit();
  }
  close(fd);

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    21a3:	52                   	push   %edx
    21a4:	52                   	push   %edx
    21a5:	68 dc 4f 00 00       	push   $0x4fdc
    21aa:	6a 01                	push   $0x1
    21ac:	e8 5f 18 00 00       	call   3a10 <printf>
    exit();
    21b1:	e8 0c 17 00 00       	call   38c2 <exit>
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    exit();
  }
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    21b6:	52                   	push   %edx
    21b7:	52                   	push   %edx
    21b8:	68 8b 46 00 00       	push   $0x468b
    21bd:	6a 01                	push   $0x1
    21bf:	e8 4c 18 00 00       	call   3a10 <printf>
    exit();
    21c4:	e8 f9 16 00 00       	call   38c2 <exit>
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    21c9:	51                   	push   %ecx
    21ca:	51                   	push   %ecx
    21cb:	68 4c 50 00 00       	push   $0x504c
    21d0:	6a 01                	push   $0x1
    21d2:	e8 39 18 00 00       	call   3a10 <printf>
    exit();
    21d7:	e8 e6 16 00 00       	call   38c2 <exit>
  write(fd, "FF", 2);
  close(fd);

  fd = open("dd/dd/../ff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/../ff failed\n");
    21dc:	50                   	push   %eax
    21dd:	50                   	push   %eax
    21de:	68 06 45 00 00       	push   $0x4506
    21e3:	6a 01                	push   $0x1
    21e5:	e8 26 18 00 00       	call   3a10 <printf>
    exit();
    21ea:	e8 d3 16 00 00       	call   38c2 <exit>
    exit();
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/dd/ff failed\n");
    21ef:	51                   	push   %ecx
    21f0:	51                   	push   %ecx
    21f1:	68 df 44 00 00       	push   $0x44df
    21f6:	6a 01                	push   $0x1
    21f8:	e8 13 18 00 00       	call   3a10 <printf>
    exit();
    21fd:	e8 c0 16 00 00       	call   38c2 <exit>
  if(chdir("dd/../../../dd") != 0){
    printf(1, "chdir dd/../../dd failed\n");
    exit();
  }
  if(chdir("./..") != 0){
    printf(1, "chdir ./.. failed\n");
    2202:	50                   	push   %eax
    2203:	50                   	push   %eax
    2204:	68 a8 45 00 00       	push   $0x45a8
    2209:	6a 01                	push   $0x1
    220b:	e8 00 18 00 00       	call   3a10 <printf>
    exit();
    2210:	e8 ad 16 00 00       	call   38c2 <exit>
    exit();
  }
  close(fd);

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    2215:	51                   	push   %ecx
    2216:	51                   	push   %ecx
    2217:	68 94 4f 00 00       	push   $0x4f94
    221c:	6a 01                	push   $0x1
    221e:	e8 ed 17 00 00       	call   3a10 <printf>
    exit();
    2223:	e8 9a 16 00 00       	call   38c2 <exit>
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    exit();
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    2228:	53                   	push   %ebx
    2229:	53                   	push   %ebx
    222a:	68 28 50 00 00       	push   $0x5028
    222f:	6a 01                	push   $0x1
    2231:	e8 da 17 00 00       	call   3a10 <printf>
    exit();
    2236:	e8 87 16 00 00       	call   38c2 <exit>
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    exit();
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    223b:	50                   	push   %eax
    223c:	50                   	push   %eax
    223d:	68 04 50 00 00       	push   $0x5004
    2242:	6a 01                	push   $0x1
    2244:	e8 c7 17 00 00       	call   3a10 <printf>
    exit();
    2249:	e8 74 16 00 00       	call   38c2 <exit>
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    exit();
  }
  if(open("dd", O_WRONLY) >= 0){
    printf(1, "open dd wronly succeeded!\n");
    224e:	50                   	push   %eax
    224f:	50                   	push   %eax
    2250:	68 67 46 00 00       	push   $0x4667
    2255:	6a 01                	push   $0x1
    2257:	e8 b4 17 00 00       	call   3a10 <printf>
    exit();
    225c:	e8 61 16 00 00       	call   38c2 <exit>
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    exit();
  }
  if(open("dd", O_RDWR) >= 0){
    printf(1, "open dd rdwr succeeded!\n");
    2261:	50                   	push   %eax
    2262:	50                   	push   %eax
    2263:	68 4e 46 00 00       	push   $0x464e
    2268:	6a 01                	push   $0x1
    226a:	e8 a1 17 00 00       	call   3a10 <printf>
    exit();
    226f:	e8 4e 16 00 00       	call   38c2 <exit>
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    exit();
  }
  if(open("dd", O_CREATE) >= 0){
    printf(1, "create dd succeeded!\n");
    2274:	50                   	push   %eax
    2275:	50                   	push   %eax
    2276:	68 38 46 00 00       	push   $0x4638
    227b:	6a 01                	push   $0x1
    227d:	e8 8e 17 00 00       	call   3a10 <printf>
    exit();
    2282:	e8 3b 16 00 00       	call   38c2 <exit>
  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/ff/ff succeeded!\n");
    exit();
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    printf(1, "create dd/xx/ff succeeded!\n");
    2287:	50                   	push   %eax
    2288:	50                   	push   %eax
    2289:	68 1c 46 00 00       	push   $0x461c
    228e:	6a 01                	push   $0x1
    2290:	e8 7b 17 00 00       	call   3a10 <printf>
    exit();
    2295:	e8 28 16 00 00       	call   38c2 <exit>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    exit();
  }

  if(chdir("dd") != 0){
    printf(1, "chdir dd failed\n");
    229a:	50                   	push   %eax
    229b:	50                   	push   %eax
    229c:	68 5d 45 00 00       	push   $0x455d
    22a1:	6a 01                	push   $0x1
    22a3:	e8 68 17 00 00       	call   3a10 <printf>
    exit();
    22a8:	e8 15 16 00 00       	call   38c2 <exit>
  if(unlink("dd/dd/ff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    22ad:	50                   	push   %eax
    22ae:	50                   	push   %eax
    22af:	68 b8 4f 00 00       	push   $0x4fb8
    22b4:	6a 01                	push   $0x1
    22b6:	e8 55 17 00 00       	call   3a10 <printf>
    exit();
    22bb:	e8 02 16 00 00       	call   38c2 <exit>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    exit();
  }

  if(mkdir("/dd/dd") != 0){
    printf(1, "subdir mkdir dd/dd failed\n");
    22c0:	53                   	push   %ebx
    22c1:	53                   	push   %ebx
    22c2:	68 bb 44 00 00       	push   $0x44bb
    22c7:	6a 01                	push   $0x1
    22c9:	e8 42 17 00 00       	call   3a10 <printf>
    exit();
    22ce:	e8 ef 15 00 00       	call   38c2 <exit>
  }
  write(fd, "ff", 2);
  close(fd);

  if(unlink("dd") >= 0){
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    22d3:	50                   	push   %eax
    22d4:	50                   	push   %eax
    22d5:	68 6c 4f 00 00       	push   $0x4f6c
    22da:	6a 01                	push   $0x1
    22dc:	e8 2f 17 00 00       	call   3a10 <printf>
    exit();
    22e1:	e8 dc 15 00 00       	call   38c2 <exit>
    exit();
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "create dd/ff failed\n");
    22e6:	50                   	push   %eax
    22e7:	50                   	push   %eax
    22e8:	68 9f 44 00 00       	push   $0x449f
    22ed:	6a 01                	push   $0x1
    22ef:	e8 1c 17 00 00       	call   3a10 <printf>
    exit();
    22f4:	e8 c9 15 00 00       	call   38c2 <exit>

  printf(1, "subdir test\n");

  unlink("ff");
  if(mkdir("dd") != 0){
    printf(1, "subdir mkdir dd failed\n");
    22f9:	50                   	push   %eax
    22fa:	50                   	push   %eax
    22fb:	68 87 44 00 00       	push   $0x4487
    2300:	6a 01                	push   $0x1
    2302:	e8 09 17 00 00       	call   3a10 <printf>
    exit();
    2307:	e8 b6 15 00 00       	call   38c2 <exit>
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    exit();
  }
  if(unlink("dd") < 0){
    printf(1, "unlink dd failed\n");
    230c:	50                   	push   %eax
    230d:	50                   	push   %eax
    230e:	68 70 47 00 00       	push   $0x4770
    2313:	6a 01                	push   $0x1
    2315:	e8 f6 16 00 00       	call   3a10 <printf>
    exit();
    231a:	e8 a3 15 00 00       	call   38c2 <exit>
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    exit();
  }
  if(unlink("dd/dd") < 0){
    printf(1, "unlink dd/dd failed\n");
    231f:	52                   	push   %edx
    2320:	52                   	push   %edx
    2321:	68 5b 47 00 00       	push   $0x475b
    2326:	6a 01                	push   $0x1
    2328:	e8 e3 16 00 00       	call   3a10 <printf>
    exit();
    232d:	e8 90 15 00 00       	call   38c2 <exit>
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    exit();
  }
  if(unlink("dd") == 0){
    printf(1, "unlink non-empty dd succeeded!\n");
    2332:	51                   	push   %ecx
    2333:	51                   	push   %ecx
    2334:	68 70 50 00 00       	push   $0x5070
    2339:	6a 01                	push   $0x1
    233b:	e8 d0 16 00 00       	call   3a10 <printf>
    exit();
    2340:	e8 7d 15 00 00       	call   38c2 <exit>
  if(unlink("dd/dd/ffff") != 0){
    printf(1, "unlink dd/dd/ff failed\n");
    exit();
  }
  if(unlink("dd/ff") != 0){
    printf(1, "unlink dd/ff failed\n");
    2345:	53                   	push   %ebx
    2346:	53                   	push   %ebx
    2347:	68 46 47 00 00       	push   $0x4746
    234c:	6a 01                	push   $0x1
    234e:	e8 bd 16 00 00       	call   3a10 <printf>
    exit();
    2353:	e8 6a 15 00 00       	call   38c2 <exit>
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/xx") == 0){
    printf(1, "chdir dd/xx succeeded!\n");
    2358:	50                   	push   %eax
    2359:	50                   	push   %eax
    235a:	68 2e 47 00 00       	push   $0x472e
    235f:	6a 01                	push   $0x1
    2361:	e8 aa 16 00 00       	call   3a10 <printf>
    exit();
    2366:	e8 57 15 00 00       	call   38c2 <exit>
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    exit();
  }
  if(chdir("dd/ff") == 0){
    printf(1, "chdir dd/ff succeeded!\n");
    236b:	50                   	push   %eax
    236c:	50                   	push   %eax
    236d:	68 16 47 00 00       	push   $0x4716
    2372:	6a 01                	push   $0x1
    2374:	e8 97 16 00 00       	call   3a10 <printf>
    exit();
    2379:	e8 44 15 00 00       	call   38c2 <exit>
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    exit();
  }
  if(unlink("dd/ff/ff") == 0){
    printf(1, "unlink dd/ff/ff succeeded!\n");
    237e:	50                   	push   %eax
    237f:	50                   	push   %eax
    2380:	68 fa 46 00 00       	push   $0x46fa
    2385:	6a 01                	push   $0x1
    2387:	e8 84 16 00 00       	call   3a10 <printf>
    exit();
    238c:	e8 31 15 00 00       	call   38c2 <exit>
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    exit();
  }
  if(unlink("dd/xx/ff") == 0){
    printf(1, "unlink dd/xx/ff succeeded!\n");
    2391:	50                   	push   %eax
    2392:	50                   	push   %eax
    2393:	68 de 46 00 00       	push   $0x46de
    2398:	6a 01                	push   $0x1
    239a:	e8 71 16 00 00       	call   3a10 <printf>
    exit();
    239f:	e8 1e 15 00 00       	call   38c2 <exit>
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/dd/ffff") == 0){
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    23a4:	50                   	push   %eax
    23a5:	50                   	push   %eax
    23a6:	68 c1 46 00 00       	push   $0x46c1
    23ab:	6a 01                	push   $0x1
    23ad:	e8 5e 16 00 00       	call   3a10 <printf>
    exit();
    23b2:	e8 0b 15 00 00       	call   38c2 <exit>
  if(mkdir("dd/ff/ff") == 0){
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    exit();
  }
  if(mkdir("dd/xx/ff") == 0){
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    23b7:	50                   	push   %eax
    23b8:	50                   	push   %eax
    23b9:	68 a6 46 00 00       	push   $0x46a6
    23be:	6a 01                	push   $0x1
    23c0:	e8 4b 16 00 00       	call   3a10 <printf>
    exit();
    23c5:	e8 f8 14 00 00       	call   38c2 <exit>
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    exit();
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    printf(1, "read dd/dd/ffff wrong len\n");
    23ca:	50                   	push   %eax
    23cb:	50                   	push   %eax
    23cc:	68 d3 45 00 00       	push   $0x45d3
    23d1:	6a 01                	push   $0x1
    23d3:	e8 38 16 00 00       	call   3a10 <printf>
    exit();
    23d8:	e8 e5 14 00 00       	call   38c2 <exit>
    exit();
  }

  fd = open("dd/dd/ffff", 0);
  if(fd < 0){
    printf(1, "open dd/dd/ffff failed\n");
    23dd:	50                   	push   %eax
    23de:	50                   	push   %eax
    23df:	68 bb 45 00 00       	push   $0x45bb
    23e4:	6a 01                	push   $0x1
    23e6:	e8 25 16 00 00       	call   3a10 <printf>
    exit();
    23eb:	e8 d2 14 00 00       	call   38c2 <exit>

000023f0 <bigwrite>:
}

// test writes that are larger than the log.
void
bigwrite(void)
{
    23f0:	55                   	push   %ebp
    23f1:	89 e5                	mov    %esp,%ebp
    23f3:	56                   	push   %esi
    23f4:	53                   	push   %ebx
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    23f5:	bb f3 01 00 00       	mov    $0x1f3,%ebx
void
bigwrite(void)
{
  int fd, sz;

  printf(1, "bigwrite test\n");
    23fa:	83 ec 08             	sub    $0x8,%esp
    23fd:	68 8d 47 00 00       	push   $0x478d
    2402:	6a 01                	push   $0x1
    2404:	e8 07 16 00 00       	call   3a10 <printf>

  unlink("bigwrite");
    2409:	c7 04 24 9c 47 00 00 	movl   $0x479c,(%esp)
    2410:	e8 fd 14 00 00       	call   3912 <unlink>
    2415:	83 c4 10             	add    $0x10,%esp
    2418:	90                   	nop
    2419:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2420:	83 ec 08             	sub    $0x8,%esp
    2423:	68 02 02 00 00       	push   $0x202
    2428:	68 9c 47 00 00       	push   $0x479c
    242d:	e8 d0 14 00 00       	call   3902 <open>
    if(fd < 0){
    2432:	83 c4 10             	add    $0x10,%esp
    2435:	85 c0                	test   %eax,%eax

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2437:	89 c6                	mov    %eax,%esi
    if(fd < 0){
    2439:	78 7e                	js     24b9 <bigwrite+0xc9>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    243b:	83 ec 04             	sub    $0x4,%esp
    243e:	53                   	push   %ebx
    243f:	68 a0 85 00 00       	push   $0x85a0
    2444:	50                   	push   %eax
    2445:	e8 98 14 00 00       	call   38e2 <write>
      if(cc != sz){
    244a:	83 c4 10             	add    $0x10,%esp
    244d:	39 c3                	cmp    %eax,%ebx
    244f:	75 55                	jne    24a6 <bigwrite+0xb6>
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
    2451:	83 ec 04             	sub    $0x4,%esp
    2454:	53                   	push   %ebx
    2455:	68 a0 85 00 00       	push   $0x85a0
    245a:	56                   	push   %esi
    245b:	e8 82 14 00 00       	call   38e2 <write>
      if(cc != sz){
    2460:	83 c4 10             	add    $0x10,%esp
    2463:	39 c3                	cmp    %eax,%ebx
    2465:	75 3f                	jne    24a6 <bigwrite+0xb6>
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    2467:	83 ec 0c             	sub    $0xc,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    246a:	81 c3 d7 01 00 00    	add    $0x1d7,%ebx
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    2470:	56                   	push   %esi
    2471:	e8 74 14 00 00       	call   38ea <close>
    unlink("bigwrite");
    2476:	c7 04 24 9c 47 00 00 	movl   $0x479c,(%esp)
    247d:	e8 90 14 00 00       	call   3912 <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2482:	83 c4 10             	add    $0x10,%esp
    2485:	81 fb 07 18 00 00    	cmp    $0x1807,%ebx
    248b:	75 93                	jne    2420 <bigwrite+0x30>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    248d:	83 ec 08             	sub    $0x8,%esp
    2490:	68 cf 47 00 00       	push   $0x47cf
    2495:	6a 01                	push   $0x1
    2497:	e8 74 15 00 00       	call   3a10 <printf>
}
    249c:	83 c4 10             	add    $0x10,%esp
    249f:	8d 65 f8             	lea    -0x8(%ebp),%esp
    24a2:	5b                   	pop    %ebx
    24a3:	5e                   	pop    %esi
    24a4:	5d                   	pop    %ebp
    24a5:	c3                   	ret    
    }
    int i;
    for(i = 0; i < 2; i++){
      int cc = write(fd, buf, sz);
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
    24a6:	50                   	push   %eax
    24a7:	53                   	push   %ebx
    24a8:	68 bd 47 00 00       	push   $0x47bd
    24ad:	6a 01                	push   $0x1
    24af:	e8 5c 15 00 00       	call   3a10 <printf>
        exit();
    24b4:	e8 09 14 00 00       	call   38c2 <exit>

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    fd = open("bigwrite", O_CREATE | O_RDWR);
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
    24b9:	83 ec 08             	sub    $0x8,%esp
    24bc:	68 a5 47 00 00       	push   $0x47a5
    24c1:	6a 01                	push   $0x1
    24c3:	e8 48 15 00 00       	call   3a10 <printf>
      exit();
    24c8:	e8 f5 13 00 00       	call   38c2 <exit>
    24cd:	8d 76 00             	lea    0x0(%esi),%esi

000024d0 <bigfile>:
  printf(1, "bigwrite ok\n");
}

void
bigfile(void)
{
    24d0:	55                   	push   %ebp
    24d1:	89 e5                	mov    %esp,%ebp
    24d3:	57                   	push   %edi
    24d4:	56                   	push   %esi
    24d5:	53                   	push   %ebx
    24d6:	83 ec 14             	sub    $0x14,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    24d9:	68 dc 47 00 00       	push   $0x47dc
    24de:	6a 01                	push   $0x1
    24e0:	e8 2b 15 00 00       	call   3a10 <printf>

  unlink("bigfile");
    24e5:	c7 04 24 f8 47 00 00 	movl   $0x47f8,(%esp)
    24ec:	e8 21 14 00 00       	call   3912 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    24f1:	5e                   	pop    %esi
    24f2:	5f                   	pop    %edi
    24f3:	68 02 02 00 00       	push   $0x202
    24f8:	68 f8 47 00 00       	push   $0x47f8
    24fd:	e8 00 14 00 00       	call   3902 <open>
  if(fd < 0){
    2502:	83 c4 10             	add    $0x10,%esp
    2505:	85 c0                	test   %eax,%eax
    2507:	0f 88 5f 01 00 00    	js     266c <bigfile+0x19c>
    250d:	89 c6                	mov    %eax,%esi
    250f:	31 db                	xor    %ebx,%ebx
    2511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    2518:	83 ec 04             	sub    $0x4,%esp
    251b:	68 58 02 00 00       	push   $0x258
    2520:	53                   	push   %ebx
    2521:	68 a0 85 00 00       	push   $0x85a0
    2526:	e8 05 12 00 00       	call   3730 <memset>
    if(write(fd, buf, 600) != 600){
    252b:	83 c4 0c             	add    $0xc,%esp
    252e:	68 58 02 00 00       	push   $0x258
    2533:	68 a0 85 00 00       	push   $0x85a0
    2538:	56                   	push   %esi
    2539:	e8 a4 13 00 00       	call   38e2 <write>
    253e:	83 c4 10             	add    $0x10,%esp
    2541:	3d 58 02 00 00       	cmp    $0x258,%eax
    2546:	0f 85 f8 00 00 00    	jne    2644 <bigfile+0x174>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    254c:	83 c3 01             	add    $0x1,%ebx
    254f:	83 fb 14             	cmp    $0x14,%ebx
    2552:	75 c4                	jne    2518 <bigfile+0x48>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    2554:	83 ec 0c             	sub    $0xc,%esp
    2557:	56                   	push   %esi
    2558:	e8 8d 13 00 00       	call   38ea <close>

  fd = open("bigfile", 0);
    255d:	59                   	pop    %ecx
    255e:	5b                   	pop    %ebx
    255f:	6a 00                	push   $0x0
    2561:	68 f8 47 00 00       	push   $0x47f8
    2566:	e8 97 13 00 00       	call   3902 <open>
  if(fd < 0){
    256b:	83 c4 10             	add    $0x10,%esp
    256e:	85 c0                	test   %eax,%eax
      exit();
    }
  }
  close(fd);

  fd = open("bigfile", 0);
    2570:	89 c6                	mov    %eax,%esi
  if(fd < 0){
    2572:	0f 88 e0 00 00 00    	js     2658 <bigfile+0x188>
    2578:	31 db                	xor    %ebx,%ebx
    257a:	31 ff                	xor    %edi,%edi
    257c:	eb 30                	jmp    25ae <bigfile+0xde>
    257e:	66 90                	xchg   %ax,%ax
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
    2580:	3d 2c 01 00 00       	cmp    $0x12c,%eax
    2585:	0f 85 91 00 00 00    	jne    261c <bigfile+0x14c>
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    258b:	0f be 05 a0 85 00 00 	movsbl 0x85a0,%eax
    2592:	89 fa                	mov    %edi,%edx
    2594:	d1 fa                	sar    %edx
    2596:	39 d0                	cmp    %edx,%eax
    2598:	75 6e                	jne    2608 <bigfile+0x138>
    259a:	0f be 15 cb 86 00 00 	movsbl 0x86cb,%edx
    25a1:	39 d0                	cmp    %edx,%eax
    25a3:	75 63                	jne    2608 <bigfile+0x138>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
    25a5:	81 c3 2c 01 00 00    	add    $0x12c,%ebx
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    25ab:	83 c7 01             	add    $0x1,%edi
    cc = read(fd, buf, 300);
    25ae:	83 ec 04             	sub    $0x4,%esp
    25b1:	68 2c 01 00 00       	push   $0x12c
    25b6:	68 a0 85 00 00       	push   $0x85a0
    25bb:	56                   	push   %esi
    25bc:	e8 19 13 00 00       	call   38da <read>
    if(cc < 0){
    25c1:	83 c4 10             	add    $0x10,%esp
    25c4:	85 c0                	test   %eax,%eax
    25c6:	78 68                	js     2630 <bigfile+0x160>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
    25c8:	75 b6                	jne    2580 <bigfile+0xb0>
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    25ca:	83 ec 0c             	sub    $0xc,%esp
    25cd:	56                   	push   %esi
    25ce:	e8 17 13 00 00       	call   38ea <close>
  if(total != 20*600){
    25d3:	83 c4 10             	add    $0x10,%esp
    25d6:	81 fb e0 2e 00 00    	cmp    $0x2ee0,%ebx
    25dc:	0f 85 9e 00 00 00    	jne    2680 <bigfile+0x1b0>
    printf(1, "read bigfile wrong total\n");
    exit();
  }
  unlink("bigfile");
    25e2:	83 ec 0c             	sub    $0xc,%esp
    25e5:	68 f8 47 00 00       	push   $0x47f8
    25ea:	e8 23 13 00 00       	call   3912 <unlink>

  printf(1, "bigfile test ok\n");
    25ef:	58                   	pop    %eax
    25f0:	5a                   	pop    %edx
    25f1:	68 87 48 00 00       	push   $0x4887
    25f6:	6a 01                	push   $0x1
    25f8:	e8 13 14 00 00       	call   3a10 <printf>
}
    25fd:	83 c4 10             	add    $0x10,%esp
    2600:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2603:	5b                   	pop    %ebx
    2604:	5e                   	pop    %esi
    2605:	5f                   	pop    %edi
    2606:	5d                   	pop    %ebp
    2607:	c3                   	ret    
    if(cc != 300){
      printf(1, "short read bigfile\n");
      exit();
    }
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
    2608:	83 ec 08             	sub    $0x8,%esp
    260b:	68 54 48 00 00       	push   $0x4854
    2610:	6a 01                	push   $0x1
    2612:	e8 f9 13 00 00       	call   3a10 <printf>
      exit();
    2617:	e8 a6 12 00 00       	call   38c2 <exit>
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
      printf(1, "short read bigfile\n");
    261c:	83 ec 08             	sub    $0x8,%esp
    261f:	68 40 48 00 00       	push   $0x4840
    2624:	6a 01                	push   $0x1
    2626:	e8 e5 13 00 00       	call   3a10 <printf>
      exit();
    262b:	e8 92 12 00 00       	call   38c2 <exit>
  }
  total = 0;
  for(i = 0; ; i++){
    cc = read(fd, buf, 300);
    if(cc < 0){
      printf(1, "read bigfile failed\n");
    2630:	83 ec 08             	sub    $0x8,%esp
    2633:	68 2b 48 00 00       	push   $0x482b
    2638:	6a 01                	push   $0x1
    263a:	e8 d1 13 00 00       	call   3a10 <printf>
      exit();
    263f:	e8 7e 12 00 00       	call   38c2 <exit>
    exit();
  }
  for(i = 0; i < 20; i++){
    memset(buf, i, 600);
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
    2644:	83 ec 08             	sub    $0x8,%esp
    2647:	68 00 48 00 00       	push   $0x4800
    264c:	6a 01                	push   $0x1
    264e:	e8 bd 13 00 00       	call   3a10 <printf>
      exit();
    2653:	e8 6a 12 00 00       	call   38c2 <exit>
  }
  close(fd);

  fd = open("bigfile", 0);
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    2658:	83 ec 08             	sub    $0x8,%esp
    265b:	68 16 48 00 00       	push   $0x4816
    2660:	6a 01                	push   $0x1
    2662:	e8 a9 13 00 00       	call   3a10 <printf>
    exit();
    2667:	e8 56 12 00 00       	call   38c2 <exit>
  printf(1, "bigfile test\n");

  unlink("bigfile");
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    266c:	83 ec 08             	sub    $0x8,%esp
    266f:	68 ea 47 00 00       	push   $0x47ea
    2674:	6a 01                	push   $0x1
    2676:	e8 95 13 00 00       	call   3a10 <printf>
    exit();
    267b:	e8 42 12 00 00       	call   38c2 <exit>
    }
    total += cc;
  }
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    2680:	83 ec 08             	sub    $0x8,%esp
    2683:	68 6d 48 00 00       	push   $0x486d
    2688:	6a 01                	push   $0x1
    268a:	e8 81 13 00 00       	call   3a10 <printf>
    exit();
    268f:	e8 2e 12 00 00       	call   38c2 <exit>
    2694:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    269a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000026a0 <fourteen>:
  printf(1, "bigfile test ok\n");
}

void
fourteen(void)
{
    26a0:	55                   	push   %ebp
    26a1:	89 e5                	mov    %esp,%ebp
    26a3:	83 ec 10             	sub    $0x10,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    26a6:	68 98 48 00 00       	push   $0x4898
    26ab:	6a 01                	push   $0x1
    26ad:	e8 5e 13 00 00       	call   3a10 <printf>

  if(mkdir("12345678901234") != 0){
    26b2:	c7 04 24 d3 48 00 00 	movl   $0x48d3,(%esp)
    26b9:	e8 6c 12 00 00       	call   392a <mkdir>
    26be:	83 c4 10             	add    $0x10,%esp
    26c1:	85 c0                	test   %eax,%eax
    26c3:	0f 85 97 00 00 00    	jne    2760 <fourteen+0xc0>
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    26c9:	83 ec 0c             	sub    $0xc,%esp
    26cc:	68 90 50 00 00       	push   $0x5090
    26d1:	e8 54 12 00 00       	call   392a <mkdir>
    26d6:	83 c4 10             	add    $0x10,%esp
    26d9:	85 c0                	test   %eax,%eax
    26db:	0f 85 de 00 00 00    	jne    27bf <fourteen+0x11f>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    26e1:	83 ec 08             	sub    $0x8,%esp
    26e4:	68 00 02 00 00       	push   $0x200
    26e9:	68 e0 50 00 00       	push   $0x50e0
    26ee:	e8 0f 12 00 00       	call   3902 <open>
  if(fd < 0){
    26f3:	83 c4 10             	add    $0x10,%esp
    26f6:	85 c0                	test   %eax,%eax
    26f8:	0f 88 ae 00 00 00    	js     27ac <fourteen+0x10c>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    exit();
  }
  close(fd);
    26fe:	83 ec 0c             	sub    $0xc,%esp
    2701:	50                   	push   %eax
    2702:	e8 e3 11 00 00       	call   38ea <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2707:	58                   	pop    %eax
    2708:	5a                   	pop    %edx
    2709:	6a 00                	push   $0x0
    270b:	68 50 51 00 00       	push   $0x5150
    2710:	e8 ed 11 00 00       	call   3902 <open>
  if(fd < 0){
    2715:	83 c4 10             	add    $0x10,%esp
    2718:	85 c0                	test   %eax,%eax
    271a:	78 7d                	js     2799 <fourteen+0xf9>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    exit();
  }
  close(fd);
    271c:	83 ec 0c             	sub    $0xc,%esp
    271f:	50                   	push   %eax
    2720:	e8 c5 11 00 00       	call   38ea <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    2725:	c7 04 24 c4 48 00 00 	movl   $0x48c4,(%esp)
    272c:	e8 f9 11 00 00       	call   392a <mkdir>
    2731:	83 c4 10             	add    $0x10,%esp
    2734:	85 c0                	test   %eax,%eax
    2736:	74 4e                	je     2786 <fourteen+0xe6>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2738:	83 ec 0c             	sub    $0xc,%esp
    273b:	68 ec 51 00 00       	push   $0x51ec
    2740:	e8 e5 11 00 00       	call   392a <mkdir>
    2745:	83 c4 10             	add    $0x10,%esp
    2748:	85 c0                	test   %eax,%eax
    274a:	74 27                	je     2773 <fourteen+0xd3>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    exit();
  }

  printf(1, "fourteen ok\n");
    274c:	83 ec 08             	sub    $0x8,%esp
    274f:	68 e2 48 00 00       	push   $0x48e2
    2754:	6a 01                	push   $0x1
    2756:	e8 b5 12 00 00       	call   3a10 <printf>
}
    275b:	83 c4 10             	add    $0x10,%esp
    275e:	c9                   	leave  
    275f:	c3                   	ret    

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");

  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    2760:	50                   	push   %eax
    2761:	50                   	push   %eax
    2762:	68 a7 48 00 00       	push   $0x48a7
    2767:	6a 01                	push   $0x1
    2769:	e8 a2 12 00 00       	call   3a10 <printf>
    exit();
    276e:	e8 4f 11 00 00       	call   38c2 <exit>
  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    exit();
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2773:	50                   	push   %eax
    2774:	50                   	push   %eax
    2775:	68 0c 52 00 00       	push   $0x520c
    277a:	6a 01                	push   $0x1
    277c:	e8 8f 12 00 00       	call   3a10 <printf>
    exit();
    2781:	e8 3c 11 00 00       	call   38c2 <exit>
    exit();
  }
  close(fd);

  if(mkdir("12345678901234/12345678901234") == 0){
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2786:	52                   	push   %edx
    2787:	52                   	push   %edx
    2788:	68 bc 51 00 00       	push   $0x51bc
    278d:	6a 01                	push   $0x1
    278f:	e8 7c 12 00 00       	call   3a10 <printf>
    exit();
    2794:	e8 29 11 00 00       	call   38c2 <exit>
    exit();
  }
  close(fd);
  fd = open("12345678901234/12345678901234/12345678901234", 0);
  if(fd < 0){
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2799:	51                   	push   %ecx
    279a:	51                   	push   %ecx
    279b:	68 80 51 00 00       	push   $0x5180
    27a0:	6a 01                	push   $0x1
    27a2:	e8 69 12 00 00       	call   3a10 <printf>
    exit();
    27a7:	e8 16 11 00 00       	call   38c2 <exit>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    exit();
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
  if(fd < 0){
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    27ac:	51                   	push   %ecx
    27ad:	51                   	push   %ecx
    27ae:	68 10 51 00 00       	push   $0x5110
    27b3:	6a 01                	push   $0x1
    27b5:	e8 56 12 00 00       	call   3a10 <printf>
    exit();
    27ba:	e8 03 11 00 00       	call   38c2 <exit>
  if(mkdir("12345678901234") != 0){
    printf(1, "mkdir 12345678901234 failed\n");
    exit();
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    27bf:	50                   	push   %eax
    27c0:	50                   	push   %eax
    27c1:	68 b0 50 00 00       	push   $0x50b0
    27c6:	6a 01                	push   $0x1
    27c8:	e8 43 12 00 00       	call   3a10 <printf>
    exit();
    27cd:	e8 f0 10 00 00       	call   38c2 <exit>
    27d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    27d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000027e0 <rmdot>:
  printf(1, "fourteen ok\n");
}

void
rmdot(void)
{
    27e0:	55                   	push   %ebp
    27e1:	89 e5                	mov    %esp,%ebp
    27e3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "rmdot test\n");
    27e6:	68 ef 48 00 00       	push   $0x48ef
    27eb:	6a 01                	push   $0x1
    27ed:	e8 1e 12 00 00       	call   3a10 <printf>
  if(mkdir("dots") != 0){
    27f2:	c7 04 24 fb 48 00 00 	movl   $0x48fb,(%esp)
    27f9:	e8 2c 11 00 00       	call   392a <mkdir>
    27fe:	83 c4 10             	add    $0x10,%esp
    2801:	85 c0                	test   %eax,%eax
    2803:	0f 85 b0 00 00 00    	jne    28b9 <rmdot+0xd9>
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    2809:	83 ec 0c             	sub    $0xc,%esp
    280c:	68 fb 48 00 00       	push   $0x48fb
    2811:	e8 1c 11 00 00       	call   3932 <chdir>
    2816:	83 c4 10             	add    $0x10,%esp
    2819:	85 c0                	test   %eax,%eax
    281b:	0f 85 1d 01 00 00    	jne    293e <rmdot+0x15e>
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    2821:	83 ec 0c             	sub    $0xc,%esp
    2824:	68 a6 45 00 00       	push   $0x45a6
    2829:	e8 e4 10 00 00       	call   3912 <unlink>
    282e:	83 c4 10             	add    $0x10,%esp
    2831:	85 c0                	test   %eax,%eax
    2833:	0f 84 f2 00 00 00    	je     292b <rmdot+0x14b>
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    2839:	83 ec 0c             	sub    $0xc,%esp
    283c:	68 a5 45 00 00       	push   $0x45a5
    2841:	e8 cc 10 00 00       	call   3912 <unlink>
    2846:	83 c4 10             	add    $0x10,%esp
    2849:	85 c0                	test   %eax,%eax
    284b:	0f 84 c7 00 00 00    	je     2918 <rmdot+0x138>
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    2851:	83 ec 0c             	sub    $0xc,%esp
    2854:	68 79 3d 00 00       	push   $0x3d79
    2859:	e8 d4 10 00 00       	call   3932 <chdir>
    285e:	83 c4 10             	add    $0x10,%esp
    2861:	85 c0                	test   %eax,%eax
    2863:	0f 85 9c 00 00 00    	jne    2905 <rmdot+0x125>
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    2869:	83 ec 0c             	sub    $0xc,%esp
    286c:	68 43 49 00 00       	push   $0x4943
    2871:	e8 9c 10 00 00       	call   3912 <unlink>
    2876:	83 c4 10             	add    $0x10,%esp
    2879:	85 c0                	test   %eax,%eax
    287b:	74 75                	je     28f2 <rmdot+0x112>
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    287d:	83 ec 0c             	sub    $0xc,%esp
    2880:	68 61 49 00 00       	push   $0x4961
    2885:	e8 88 10 00 00       	call   3912 <unlink>
    288a:	83 c4 10             	add    $0x10,%esp
    288d:	85 c0                	test   %eax,%eax
    288f:	74 4e                	je     28df <rmdot+0xff>
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    2891:	83 ec 0c             	sub    $0xc,%esp
    2894:	68 fb 48 00 00       	push   $0x48fb
    2899:	e8 74 10 00 00       	call   3912 <unlink>
    289e:	83 c4 10             	add    $0x10,%esp
    28a1:	85 c0                	test   %eax,%eax
    28a3:	75 27                	jne    28cc <rmdot+0xec>
    printf(1, "unlink dots failed!\n");
    exit();
  }
  printf(1, "rmdot ok\n");
    28a5:	83 ec 08             	sub    $0x8,%esp
    28a8:	68 96 49 00 00       	push   $0x4996
    28ad:	6a 01                	push   $0x1
    28af:	e8 5c 11 00 00       	call   3a10 <printf>
}
    28b4:	83 c4 10             	add    $0x10,%esp
    28b7:	c9                   	leave  
    28b8:	c3                   	ret    
void
rmdot(void)
{
  printf(1, "rmdot test\n");
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    28b9:	50                   	push   %eax
    28ba:	50                   	push   %eax
    28bb:	68 00 49 00 00       	push   $0x4900
    28c0:	6a 01                	push   $0x1
    28c2:	e8 49 11 00 00       	call   3a10 <printf>
    exit();
    28c7:	e8 f6 0f 00 00       	call   38c2 <exit>
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    exit();
  }
  if(unlink("dots") != 0){
    printf(1, "unlink dots failed!\n");
    28cc:	50                   	push   %eax
    28cd:	50                   	push   %eax
    28ce:	68 81 49 00 00       	push   $0x4981
    28d3:	6a 01                	push   $0x1
    28d5:	e8 36 11 00 00       	call   3a10 <printf>
    exit();
    28da:	e8 e3 0f 00 00       	call   38c2 <exit>
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    exit();
  }
  if(unlink("dots/..") == 0){
    printf(1, "unlink dots/.. worked!\n");
    28df:	52                   	push   %edx
    28e0:	52                   	push   %edx
    28e1:	68 69 49 00 00       	push   $0x4969
    28e6:	6a 01                	push   $0x1
    28e8:	e8 23 11 00 00       	call   3a10 <printf>
    exit();
    28ed:	e8 d0 0f 00 00       	call   38c2 <exit>
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    exit();
  }
  if(unlink("dots/.") == 0){
    printf(1, "unlink dots/. worked!\n");
    28f2:	51                   	push   %ecx
    28f3:	51                   	push   %ecx
    28f4:	68 4a 49 00 00       	push   $0x494a
    28f9:	6a 01                	push   $0x1
    28fb:	e8 10 11 00 00       	call   3a10 <printf>
    exit();
    2900:	e8 bd 0f 00 00       	call   38c2 <exit>
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    exit();
  }
  if(chdir("/") != 0){
    printf(1, "chdir / failed\n");
    2905:	50                   	push   %eax
    2906:	50                   	push   %eax
    2907:	68 7b 3d 00 00       	push   $0x3d7b
    290c:	6a 01                	push   $0x1
    290e:	e8 fd 10 00 00       	call   3a10 <printf>
    exit();
    2913:	e8 aa 0f 00 00       	call   38c2 <exit>
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    exit();
  }
  if(unlink("..") == 0){
    printf(1, "rm .. worked!\n");
    2918:	50                   	push   %eax
    2919:	50                   	push   %eax
    291a:	68 34 49 00 00       	push   $0x4934
    291f:	6a 01                	push   $0x1
    2921:	e8 ea 10 00 00       	call   3a10 <printf>
    exit();
    2926:	e8 97 0f 00 00       	call   38c2 <exit>
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    exit();
  }
  if(unlink(".") == 0){
    printf(1, "rm . worked!\n");
    292b:	50                   	push   %eax
    292c:	50                   	push   %eax
    292d:	68 26 49 00 00       	push   $0x4926
    2932:	6a 01                	push   $0x1
    2934:	e8 d7 10 00 00       	call   3a10 <printf>
    exit();
    2939:	e8 84 0f 00 00       	call   38c2 <exit>
  if(mkdir("dots") != 0){
    printf(1, "mkdir dots failed\n");
    exit();
  }
  if(chdir("dots") != 0){
    printf(1, "chdir dots failed\n");
    293e:	50                   	push   %eax
    293f:	50                   	push   %eax
    2940:	68 13 49 00 00       	push   $0x4913
    2945:	6a 01                	push   $0x1
    2947:	e8 c4 10 00 00       	call   3a10 <printf>
    exit();
    294c:	e8 71 0f 00 00       	call   38c2 <exit>
    2951:	eb 0d                	jmp    2960 <dirfile>
    2953:	90                   	nop
    2954:	90                   	nop
    2955:	90                   	nop
    2956:	90                   	nop
    2957:	90                   	nop
    2958:	90                   	nop
    2959:	90                   	nop
    295a:	90                   	nop
    295b:	90                   	nop
    295c:	90                   	nop
    295d:	90                   	nop
    295e:	90                   	nop
    295f:	90                   	nop

00002960 <dirfile>:
  printf(1, "rmdot ok\n");
}

void
dirfile(void)
{
    2960:	55                   	push   %ebp
    2961:	89 e5                	mov    %esp,%ebp
    2963:	53                   	push   %ebx
    2964:	83 ec 0c             	sub    $0xc,%esp
  int fd;

  printf(1, "dir vs file\n");
    2967:	68 a0 49 00 00       	push   $0x49a0
    296c:	6a 01                	push   $0x1
    296e:	e8 9d 10 00 00       	call   3a10 <printf>

  fd = open("dirfile", O_CREATE);
    2973:	59                   	pop    %ecx
    2974:	5b                   	pop    %ebx
    2975:	68 00 02 00 00       	push   $0x200
    297a:	68 ad 49 00 00       	push   $0x49ad
    297f:	e8 7e 0f 00 00       	call   3902 <open>
  if(fd < 0){
    2984:	83 c4 10             	add    $0x10,%esp
    2987:	85 c0                	test   %eax,%eax
    2989:	0f 88 43 01 00 00    	js     2ad2 <dirfile+0x172>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
    298f:	83 ec 0c             	sub    $0xc,%esp
    2992:	50                   	push   %eax
    2993:	e8 52 0f 00 00       	call   38ea <close>
  if(chdir("dirfile") == 0){
    2998:	c7 04 24 ad 49 00 00 	movl   $0x49ad,(%esp)
    299f:	e8 8e 0f 00 00       	call   3932 <chdir>
    29a4:	83 c4 10             	add    $0x10,%esp
    29a7:	85 c0                	test   %eax,%eax
    29a9:	0f 84 10 01 00 00    	je     2abf <dirfile+0x15f>
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
    29af:	83 ec 08             	sub    $0x8,%esp
    29b2:	6a 00                	push   $0x0
    29b4:	68 e6 49 00 00       	push   $0x49e6
    29b9:	e8 44 0f 00 00       	call   3902 <open>
  if(fd >= 0){
    29be:	83 c4 10             	add    $0x10,%esp
    29c1:	85 c0                	test   %eax,%eax
    29c3:	0f 89 e3 00 00 00    	jns    2aac <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", O_CREATE);
    29c9:	83 ec 08             	sub    $0x8,%esp
    29cc:	68 00 02 00 00       	push   $0x200
    29d1:	68 e6 49 00 00       	push   $0x49e6
    29d6:	e8 27 0f 00 00       	call   3902 <open>
  if(fd >= 0){
    29db:	83 c4 10             	add    $0x10,%esp
    29de:	85 c0                	test   %eax,%eax
    29e0:	0f 89 c6 00 00 00    	jns    2aac <dirfile+0x14c>
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    29e6:	83 ec 0c             	sub    $0xc,%esp
    29e9:	68 e6 49 00 00       	push   $0x49e6
    29ee:	e8 37 0f 00 00       	call   392a <mkdir>
    29f3:	83 c4 10             	add    $0x10,%esp
    29f6:	85 c0                	test   %eax,%eax
    29f8:	0f 84 46 01 00 00    	je     2b44 <dirfile+0x1e4>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    29fe:	83 ec 0c             	sub    $0xc,%esp
    2a01:	68 e6 49 00 00       	push   $0x49e6
    2a06:	e8 07 0f 00 00       	call   3912 <unlink>
    2a0b:	83 c4 10             	add    $0x10,%esp
    2a0e:	85 c0                	test   %eax,%eax
    2a10:	0f 84 1b 01 00 00    	je     2b31 <dirfile+0x1d1>
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    2a16:	83 ec 08             	sub    $0x8,%esp
    2a19:	68 e6 49 00 00       	push   $0x49e6
    2a1e:	68 4a 4a 00 00       	push   $0x4a4a
    2a23:	e8 fa 0e 00 00       	call   3922 <link>
    2a28:	83 c4 10             	add    $0x10,%esp
    2a2b:	85 c0                	test   %eax,%eax
    2a2d:	0f 84 eb 00 00 00    	je     2b1e <dirfile+0x1be>
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    2a33:	83 ec 0c             	sub    $0xc,%esp
    2a36:	68 ad 49 00 00       	push   $0x49ad
    2a3b:	e8 d2 0e 00 00       	call   3912 <unlink>
    2a40:	83 c4 10             	add    $0x10,%esp
    2a43:	85 c0                	test   %eax,%eax
    2a45:	0f 85 c0 00 00 00    	jne    2b0b <dirfile+0x1ab>
    printf(1, "unlink dirfile failed!\n");
    exit();
  }

  fd = open(".", O_RDWR);
    2a4b:	83 ec 08             	sub    $0x8,%esp
    2a4e:	6a 02                	push   $0x2
    2a50:	68 a6 45 00 00       	push   $0x45a6
    2a55:	e8 a8 0e 00 00       	call   3902 <open>
  if(fd >= 0){
    2a5a:	83 c4 10             	add    $0x10,%esp
    2a5d:	85 c0                	test   %eax,%eax
    2a5f:	0f 89 93 00 00 00    	jns    2af8 <dirfile+0x198>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2a65:	83 ec 08             	sub    $0x8,%esp
    2a68:	6a 00                	push   $0x0
    2a6a:	68 a6 45 00 00       	push   $0x45a6
    2a6f:	e8 8e 0e 00 00       	call   3902 <open>
  if(write(fd, "x", 1) > 0){
    2a74:	83 c4 0c             	add    $0xc,%esp
  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
    2a77:	89 c3                	mov    %eax,%ebx
  if(write(fd, "x", 1) > 0){
    2a79:	6a 01                	push   $0x1
    2a7b:	68 89 46 00 00       	push   $0x4689
    2a80:	50                   	push   %eax
    2a81:	e8 5c 0e 00 00       	call   38e2 <write>
    2a86:	83 c4 10             	add    $0x10,%esp
    2a89:	85 c0                	test   %eax,%eax
    2a8b:	7f 58                	jg     2ae5 <dirfile+0x185>
    printf(1, "write . succeeded!\n");
    exit();
  }
  close(fd);
    2a8d:	83 ec 0c             	sub    $0xc,%esp
    2a90:	53                   	push   %ebx
    2a91:	e8 54 0e 00 00       	call   38ea <close>

  printf(1, "dir vs file OK\n");
    2a96:	58                   	pop    %eax
    2a97:	5a                   	pop    %edx
    2a98:	68 7d 4a 00 00       	push   $0x4a7d
    2a9d:	6a 01                	push   $0x1
    2a9f:	e8 6c 0f 00 00       	call   3a10 <printf>
}
    2aa4:	83 c4 10             	add    $0x10,%esp
    2aa7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2aaa:	c9                   	leave  
    2aab:	c3                   	ret    
    printf(1, "chdir dirfile succeeded!\n");
    exit();
  }
  fd = open("dirfile/xx", 0);
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    2aac:	50                   	push   %eax
    2aad:	50                   	push   %eax
    2aae:	68 f1 49 00 00       	push   $0x49f1
    2ab3:	6a 01                	push   $0x1
    2ab5:	e8 56 0f 00 00       	call   3a10 <printf>
    exit();
    2aba:	e8 03 0e 00 00       	call   38c2 <exit>
    printf(1, "create dirfile failed\n");
    exit();
  }
  close(fd);
  if(chdir("dirfile") == 0){
    printf(1, "chdir dirfile succeeded!\n");
    2abf:	50                   	push   %eax
    2ac0:	50                   	push   %eax
    2ac1:	68 cc 49 00 00       	push   $0x49cc
    2ac6:	6a 01                	push   $0x1
    2ac8:	e8 43 0f 00 00       	call   3a10 <printf>
    exit();
    2acd:	e8 f0 0d 00 00       	call   38c2 <exit>

  printf(1, "dir vs file\n");

  fd = open("dirfile", O_CREATE);
  if(fd < 0){
    printf(1, "create dirfile failed\n");
    2ad2:	52                   	push   %edx
    2ad3:	52                   	push   %edx
    2ad4:	68 b5 49 00 00       	push   $0x49b5
    2ad9:	6a 01                	push   $0x1
    2adb:	e8 30 0f 00 00       	call   3a10 <printf>
    exit();
    2ae0:	e8 dd 0d 00 00       	call   38c2 <exit>
    printf(1, "open . for writing succeeded!\n");
    exit();
  }
  fd = open(".", 0);
  if(write(fd, "x", 1) > 0){
    printf(1, "write . succeeded!\n");
    2ae5:	51                   	push   %ecx
    2ae6:	51                   	push   %ecx
    2ae7:	68 69 4a 00 00       	push   $0x4a69
    2aec:	6a 01                	push   $0x1
    2aee:	e8 1d 0f 00 00       	call   3a10 <printf>
    exit();
    2af3:	e8 ca 0d 00 00       	call   38c2 <exit>
    exit();
  }

  fd = open(".", O_RDWR);
  if(fd >= 0){
    printf(1, "open . for writing succeeded!\n");
    2af8:	53                   	push   %ebx
    2af9:	53                   	push   %ebx
    2afa:	68 60 52 00 00       	push   $0x5260
    2aff:	6a 01                	push   $0x1
    2b01:	e8 0a 0f 00 00       	call   3a10 <printf>
    exit();
    2b06:	e8 b7 0d 00 00       	call   38c2 <exit>
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile") != 0){
    printf(1, "unlink dirfile failed!\n");
    2b0b:	50                   	push   %eax
    2b0c:	50                   	push   %eax
    2b0d:	68 51 4a 00 00       	push   $0x4a51
    2b12:	6a 01                	push   $0x1
    2b14:	e8 f7 0e 00 00       	call   3a10 <printf>
    exit();
    2b19:	e8 a4 0d 00 00       	call   38c2 <exit>
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    exit();
  }
  if(link("README", "dirfile/xx") == 0){
    printf(1, "link to dirfile/xx succeeded!\n");
    2b1e:	50                   	push   %eax
    2b1f:	50                   	push   %eax
    2b20:	68 40 52 00 00       	push   $0x5240
    2b25:	6a 01                	push   $0x1
    2b27:	e8 e4 0e 00 00       	call   3a10 <printf>
    exit();
    2b2c:	e8 91 0d 00 00       	call   38c2 <exit>
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    exit();
  }
  if(unlink("dirfile/xx") == 0){
    printf(1, "unlink dirfile/xx succeeded!\n");
    2b31:	50                   	push   %eax
    2b32:	50                   	push   %eax
    2b33:	68 2c 4a 00 00       	push   $0x4a2c
    2b38:	6a 01                	push   $0x1
    2b3a:	e8 d1 0e 00 00       	call   3a10 <printf>
    exit();
    2b3f:	e8 7e 0d 00 00       	call   38c2 <exit>
  if(fd >= 0){
    printf(1, "create dirfile/xx succeeded!\n");
    exit();
  }
  if(mkdir("dirfile/xx") == 0){
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2b44:	50                   	push   %eax
    2b45:	50                   	push   %eax
    2b46:	68 0f 4a 00 00       	push   $0x4a0f
    2b4b:	6a 01                	push   $0x1
    2b4d:	e8 be 0e 00 00       	call   3a10 <printf>
    exit();
    2b52:	e8 6b 0d 00 00       	call   38c2 <exit>
    2b57:	89 f6                	mov    %esi,%esi
    2b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00002b60 <iref>:
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2b60:	55                   	push   %ebp
    2b61:	89 e5                	mov    %esp,%ebp
    2b63:	53                   	push   %ebx
  int i, fd;

  printf(1, "empty file name\n");
    2b64:	bb 33 00 00 00       	mov    $0x33,%ebx
}

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2b69:	83 ec 0c             	sub    $0xc,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2b6c:	68 8d 4a 00 00       	push   $0x4a8d
    2b71:	6a 01                	push   $0x1
    2b73:	e8 98 0e 00 00       	call   3a10 <printf>
    2b78:	83 c4 10             	add    $0x10,%esp
    2b7b:	90                   	nop
    2b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
    2b80:	83 ec 0c             	sub    $0xc,%esp
    2b83:	68 9e 4a 00 00       	push   $0x4a9e
    2b88:	e8 9d 0d 00 00       	call   392a <mkdir>
    2b8d:	83 c4 10             	add    $0x10,%esp
    2b90:	85 c0                	test   %eax,%eax
    2b92:	0f 85 bb 00 00 00    	jne    2c53 <iref+0xf3>
      printf(1, "mkdir irefd failed\n");
      exit();
    }
    if(chdir("irefd") != 0){
    2b98:	83 ec 0c             	sub    $0xc,%esp
    2b9b:	68 9e 4a 00 00       	push   $0x4a9e
    2ba0:	e8 8d 0d 00 00       	call   3932 <chdir>
    2ba5:	83 c4 10             	add    $0x10,%esp
    2ba8:	85 c0                	test   %eax,%eax
    2baa:	0f 85 b7 00 00 00    	jne    2c67 <iref+0x107>
      printf(1, "chdir irefd failed\n");
      exit();
    }

    mkdir("");
    2bb0:	83 ec 0c             	sub    $0xc,%esp
    2bb3:	68 53 41 00 00       	push   $0x4153
    2bb8:	e8 6d 0d 00 00       	call   392a <mkdir>
    link("README", "");
    2bbd:	59                   	pop    %ecx
    2bbe:	58                   	pop    %eax
    2bbf:	68 53 41 00 00       	push   $0x4153
    2bc4:	68 4a 4a 00 00       	push   $0x4a4a
    2bc9:	e8 54 0d 00 00       	call   3922 <link>
    fd = open("", O_CREATE);
    2bce:	58                   	pop    %eax
    2bcf:	5a                   	pop    %edx
    2bd0:	68 00 02 00 00       	push   $0x200
    2bd5:	68 53 41 00 00       	push   $0x4153
    2bda:	e8 23 0d 00 00       	call   3902 <open>
    if(fd >= 0)
    2bdf:	83 c4 10             	add    $0x10,%esp
    2be2:	85 c0                	test   %eax,%eax
    2be4:	78 0c                	js     2bf2 <iref+0x92>
      close(fd);
    2be6:	83 ec 0c             	sub    $0xc,%esp
    2be9:	50                   	push   %eax
    2bea:	e8 fb 0c 00 00       	call   38ea <close>
    2bef:	83 c4 10             	add    $0x10,%esp
    fd = open("xx", O_CREATE);
    2bf2:	83 ec 08             	sub    $0x8,%esp
    2bf5:	68 00 02 00 00       	push   $0x200
    2bfa:	68 88 46 00 00       	push   $0x4688
    2bff:	e8 fe 0c 00 00       	call   3902 <open>
    if(fd >= 0)
    2c04:	83 c4 10             	add    $0x10,%esp
    2c07:	85 c0                	test   %eax,%eax
    2c09:	78 0c                	js     2c17 <iref+0xb7>
      close(fd);
    2c0b:	83 ec 0c             	sub    $0xc,%esp
    2c0e:	50                   	push   %eax
    2c0f:	e8 d6 0c 00 00       	call   38ea <close>
    2c14:	83 c4 10             	add    $0x10,%esp
    unlink("xx");
    2c17:	83 ec 0c             	sub    $0xc,%esp
    2c1a:	68 88 46 00 00       	push   $0x4688
    2c1f:	e8 ee 0c 00 00       	call   3912 <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2c24:	83 c4 10             	add    $0x10,%esp
    2c27:	83 eb 01             	sub    $0x1,%ebx
    2c2a:	0f 85 50 ff ff ff    	jne    2b80 <iref+0x20>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    2c30:	83 ec 0c             	sub    $0xc,%esp
    2c33:	68 79 3d 00 00       	push   $0x3d79
    2c38:	e8 f5 0c 00 00       	call   3932 <chdir>
  printf(1, "empty file name OK\n");
    2c3d:	58                   	pop    %eax
    2c3e:	5a                   	pop    %edx
    2c3f:	68 cc 4a 00 00       	push   $0x4acc
    2c44:	6a 01                	push   $0x1
    2c46:	e8 c5 0d 00 00       	call   3a10 <printf>
}
    2c4b:	83 c4 10             	add    $0x10,%esp
    2c4e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2c51:	c9                   	leave  
    2c52:	c3                   	ret    
  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    if(mkdir("irefd") != 0){
      printf(1, "mkdir irefd failed\n");
    2c53:	83 ec 08             	sub    $0x8,%esp
    2c56:	68 a4 4a 00 00       	push   $0x4aa4
    2c5b:	6a 01                	push   $0x1
    2c5d:	e8 ae 0d 00 00       	call   3a10 <printf>
      exit();
    2c62:	e8 5b 0c 00 00       	call   38c2 <exit>
    }
    if(chdir("irefd") != 0){
      printf(1, "chdir irefd failed\n");
    2c67:	83 ec 08             	sub    $0x8,%esp
    2c6a:	68 b8 4a 00 00       	push   $0x4ab8
    2c6f:	6a 01                	push   $0x1
    2c71:	e8 9a 0d 00 00       	call   3a10 <printf>
      exit();
    2c76:	e8 47 0c 00 00       	call   38c2 <exit>
    2c7b:	90                   	nop
    2c7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00002c80 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2c80:	55                   	push   %ebp
    2c81:	89 e5                	mov    %esp,%ebp
    2c83:	53                   	push   %ebx
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2c84:	31 db                	xor    %ebx,%ebx
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2c86:	83 ec 0c             	sub    $0xc,%esp
  int n, pid;

  printf(1, "fork test\n");
    2c89:	68 e0 4a 00 00       	push   $0x4ae0
    2c8e:	6a 01                	push   $0x1
    2c90:	e8 7b 0d 00 00       	call   3a10 <printf>
    2c95:	83 c4 10             	add    $0x10,%esp
    2c98:	eb 13                	jmp    2cad <forktest+0x2d>
    2c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
    2ca0:	74 62                	je     2d04 <forktest+0x84>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2ca2:	83 c3 01             	add    $0x1,%ebx
    2ca5:	81 fb e8 03 00 00    	cmp    $0x3e8,%ebx
    2cab:	74 43                	je     2cf0 <forktest+0x70>
    pid = fork();
    2cad:	e8 08 0c 00 00       	call   38ba <fork>
    if(pid < 0)
    2cb2:	85 c0                	test   %eax,%eax
    2cb4:	79 ea                	jns    2ca0 <forktest+0x20>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2cb6:	85 db                	test   %ebx,%ebx
    2cb8:	74 14                	je     2cce <forktest+0x4e>
    2cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if(wait() < 0){
    2cc0:	e8 05 0c 00 00       	call   38ca <wait>
    2cc5:	85 c0                	test   %eax,%eax
    2cc7:	78 40                	js     2d09 <forktest+0x89>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }

  for(; n > 0; n--){
    2cc9:	83 eb 01             	sub    $0x1,%ebx
    2ccc:	75 f2                	jne    2cc0 <forktest+0x40>
      printf(1, "wait stopped early\n");
      exit();
    }
  }

  if(wait() != -1){
    2cce:	e8 f7 0b 00 00       	call   38ca <wait>
    2cd3:	83 f8 ff             	cmp    $0xffffffff,%eax
    2cd6:	75 45                	jne    2d1d <forktest+0x9d>
    printf(1, "wait got too many\n");
    exit();
  }

  printf(1, "fork test OK\n");
    2cd8:	83 ec 08             	sub    $0x8,%esp
    2cdb:	68 12 4b 00 00       	push   $0x4b12
    2ce0:	6a 01                	push   $0x1
    2ce2:	e8 29 0d 00 00       	call   3a10 <printf>
}
    2ce7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    2cea:	c9                   	leave  
    2ceb:	c3                   	ret    
    2cec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(pid == 0)
      exit();
  }

  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    2cf0:	83 ec 08             	sub    $0x8,%esp
    2cf3:	68 80 52 00 00       	push   $0x5280
    2cf8:	6a 01                	push   $0x1
    2cfa:	e8 11 0d 00 00       	call   3a10 <printf>
    exit();
    2cff:	e8 be 0b 00 00       	call   38c2 <exit>
  for(n=0; n<1000; n++){
    pid = fork();
    if(pid < 0)
      break;
    if(pid == 0)
      exit();
    2d04:	e8 b9 0b 00 00       	call   38c2 <exit>
    exit();
  }

  for(; n > 0; n--){
    if(wait() < 0){
      printf(1, "wait stopped early\n");
    2d09:	83 ec 08             	sub    $0x8,%esp
    2d0c:	68 eb 4a 00 00       	push   $0x4aeb
    2d11:	6a 01                	push   $0x1
    2d13:	e8 f8 0c 00 00       	call   3a10 <printf>
      exit();
    2d18:	e8 a5 0b 00 00       	call   38c2 <exit>
    }
  }

  if(wait() != -1){
    printf(1, "wait got too many\n");
    2d1d:	83 ec 08             	sub    $0x8,%esp
    2d20:	68 ff 4a 00 00       	push   $0x4aff
    2d25:	6a 01                	push   $0x1
    2d27:	e8 e4 0c 00 00       	call   3a10 <printf>
    exit();
    2d2c:	e8 91 0b 00 00       	call   38c2 <exit>
    2d31:	eb 0d                	jmp    2d40 <sbrktest>
    2d33:	90                   	nop
    2d34:	90                   	nop
    2d35:	90                   	nop
    2d36:	90                   	nop
    2d37:	90                   	nop
    2d38:	90                   	nop
    2d39:	90                   	nop
    2d3a:	90                   	nop
    2d3b:	90                   	nop
    2d3c:	90                   	nop
    2d3d:	90                   	nop
    2d3e:	90                   	nop
    2d3f:	90                   	nop

00002d40 <sbrktest>:
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    2d40:	55                   	push   %ebp
    2d41:	89 e5                	mov    %esp,%ebp
    2d43:	57                   	push   %edi
    2d44:	56                   	push   %esi
    2d45:	53                   	push   %ebx
  oldbrk = sbrk(0);
	
  // can one sbrk() less than a page?
  a = sbrk(0);
	int i;
  for(i = 0; i < 5000; i++){
    2d46:	31 ff                	xor    %edi,%edi
  printf(1, "fork test OK\n");
}

void
sbrktest(void)
{
    2d48:	83 ec 64             	sub    $0x64,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    2d4b:	68 20 4b 00 00       	push   $0x4b20
    2d50:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    2d56:	e8 b5 0c 00 00       	call   3a10 <printf>
  oldbrk = sbrk(0);
    2d5b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d62:	e8 e3 0b 00 00       	call   394a <sbrk>
	
  // can one sbrk() less than a page?
  a = sbrk(0);
    2d67:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
  oldbrk = sbrk(0);
    2d6e:	89 45 a4             	mov    %eax,-0x5c(%ebp)
	
  // can one sbrk() less than a page?
  a = sbrk(0);
    2d71:	e8 d4 0b 00 00       	call   394a <sbrk>
    2d76:	83 c4 10             	add    $0x10,%esp
    2d79:	89 c3                	mov    %eax,%ebx
    2d7b:	90                   	nop
    2d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
    2d80:	83 ec 0c             	sub    $0xc,%esp
    2d83:	6a 01                	push   $0x1
    2d85:	e8 c0 0b 00 00       	call   394a <sbrk>
		if(b != a){
    2d8a:	83 c4 10             	add    $0x10,%esp
    2d8d:	39 d8                	cmp    %ebx,%eax
    2d8f:	0f 85 85 02 00 00    	jne    301a <sbrktest+0x2da>
  oldbrk = sbrk(0);
	
  // can one sbrk() less than a page?
  a = sbrk(0);
	int i;
  for(i = 0; i < 5000; i++){
    2d95:	83 c7 01             	add    $0x1,%edi
    b = sbrk(1);
		if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
      exit();
    }
    *b = 1;
    2d98:	c6 03 01             	movb   $0x1,(%ebx)
    a = b + 1;
    2d9b:	83 c3 01             	add    $0x1,%ebx
  oldbrk = sbrk(0);
	
  // can one sbrk() less than a page?
  a = sbrk(0);
	int i;
  for(i = 0; i < 5000; i++){
    2d9e:	81 ff 88 13 00 00    	cmp    $0x1388,%edi
    2da4:	75 da                	jne    2d80 <sbrktest+0x40>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    2da6:	e8 0f 0b 00 00       	call   38ba <fork>
  if(pid < 0){
    2dab:	85 c0                	test   %eax,%eax
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    2dad:	89 c7                	mov    %eax,%edi
  if(pid < 0){
    2daf:	0f 88 93 03 00 00    	js     3148 <sbrktest+0x408>
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2db5:	83 ec 0c             	sub    $0xc,%esp
  c = sbrk(1);
  if(c != a + 1){
    2db8:	83 c3 01             	add    $0x1,%ebx
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    exit();
  }
  c = sbrk(1);
    2dbb:	6a 01                	push   $0x1
    2dbd:	e8 88 0b 00 00       	call   394a <sbrk>
  c = sbrk(1);
    2dc2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2dc9:	e8 7c 0b 00 00       	call   394a <sbrk>
  if(c != a + 1){
    2dce:	83 c4 10             	add    $0x10,%esp
    2dd1:	39 d8                	cmp    %ebx,%eax
    2dd3:	0f 85 57 03 00 00    	jne    3130 <sbrktest+0x3f0>
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    2dd9:	85 ff                	test   %edi,%edi
    2ddb:	0f 84 4a 03 00 00    	je     312b <sbrktest+0x3eb>
    exit();
  wait();
    2de1:	e8 e4 0a 00 00       	call   38ca <wait>
	
  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    2de6:	83 ec 0c             	sub    $0xc,%esp
    2de9:	6a 00                	push   $0x0
    2deb:	e8 5a 0b 00 00       	call   394a <sbrk>
    2df0:	89 c3                	mov    %eax,%ebx
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
    2df2:	b8 00 00 40 06       	mov    $0x6400000,%eax
    2df7:	29 d8                	sub    %ebx,%eax
    2df9:	89 04 24             	mov    %eax,(%esp)
    2dfc:	e8 49 0b 00 00       	call   394a <sbrk>
  if (p != a) {
    2e01:	83 c4 10             	add    $0x10,%esp
    2e04:	39 c3                	cmp    %eax,%ebx
    2e06:	0f 85 07 03 00 00    	jne    3113 <sbrktest+0x3d3>
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    2e0c:	83 ec 0c             	sub    $0xc,%esp
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    exit();
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;
    2e0f:	c6 05 ff ff 3f 06 63 	movb   $0x63,0x63fffff

  // can one de-allocate?
  a = sbrk(0);
    2e16:	6a 00                	push   $0x0
    2e18:	e8 2d 0b 00 00       	call   394a <sbrk>
  c = sbrk(-4096);
    2e1d:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
  }
  lastaddr = (char*) (BIG-1);
  *lastaddr = 99;

  // can one de-allocate?
  a = sbrk(0);
    2e24:	89 c3                	mov    %eax,%ebx
  c = sbrk(-4096);
    2e26:	e8 1f 0b 00 00       	call   394a <sbrk>
  if(c == (char*)0xffffffff){
    2e2b:	83 c4 10             	add    $0x10,%esp
    2e2e:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e31:	0f 84 c4 02 00 00    	je     30fb <sbrktest+0x3bb>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
    2e37:	83 ec 0c             	sub    $0xc,%esp
    2e3a:	6a 00                	push   $0x0
    2e3c:	e8 09 0b 00 00       	call   394a <sbrk>
  if(c != a - 4096){
    2e41:	8d 93 00 f0 ff ff    	lea    -0x1000(%ebx),%edx
    2e47:	83 c4 10             	add    $0x10,%esp
    2e4a:	39 d0                	cmp    %edx,%eax
    2e4c:	0f 85 92 02 00 00    	jne    30e4 <sbrktest+0x3a4>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
    2e52:	83 ec 0c             	sub    $0xc,%esp
    2e55:	6a 00                	push   $0x0
    2e57:	e8 ee 0a 00 00       	call   394a <sbrk>
    2e5c:	89 c3                	mov    %eax,%ebx
  c = sbrk(4096);
    2e5e:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    2e65:	e8 e0 0a 00 00       	call   394a <sbrk>
  if(c != a || sbrk(0) != a + 4096){
    2e6a:	83 c4 10             	add    $0x10,%esp
    2e6d:	39 c3                	cmp    %eax,%ebx
    exit();
  }

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
    2e6f:	89 c7                	mov    %eax,%edi
  if(c != a || sbrk(0) != a + 4096){
    2e71:	0f 85 56 02 00 00    	jne    30cd <sbrktest+0x38d>
    2e77:	83 ec 0c             	sub    $0xc,%esp
    2e7a:	6a 00                	push   $0x0
    2e7c:	e8 c9 0a 00 00       	call   394a <sbrk>
    2e81:	8d 93 00 10 00 00    	lea    0x1000(%ebx),%edx
    2e87:	83 c4 10             	add    $0x10,%esp
    2e8a:	39 d0                	cmp    %edx,%eax
    2e8c:	0f 85 3b 02 00 00    	jne    30cd <sbrktest+0x38d>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    2e92:	80 3d ff ff 3f 06 63 	cmpb   $0x63,0x63fffff
    2e99:	0f 84 16 02 00 00    	je     30b5 <sbrktest+0x375>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2e9f:	83 ec 0c             	sub    $0xc,%esp
    2ea2:	6a 00                	push   $0x0
    2ea4:	e8 a1 0a 00 00       	call   394a <sbrk>
  c = sbrk(-(sbrk(0) - oldbrk));
    2ea9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    exit();
  }

  a = sbrk(0);
    2eb0:	89 c3                	mov    %eax,%ebx
  c = sbrk(-(sbrk(0) - oldbrk));
    2eb2:	e8 93 0a 00 00       	call   394a <sbrk>
    2eb7:	8b 4d a4             	mov    -0x5c(%ebp),%ecx
    2eba:	29 c1                	sub    %eax,%ecx
    2ebc:	89 0c 24             	mov    %ecx,(%esp)
    2ebf:	e8 86 0a 00 00       	call   394a <sbrk>
  if(c != a){
    2ec4:	83 c4 10             	add    $0x10,%esp
    2ec7:	39 c3                	cmp    %eax,%ebx
    2ec9:	0f 85 cf 01 00 00    	jne    309e <sbrktest+0x35e>
    2ecf:	bb 00 00 00 80       	mov    $0x80000000,%ebx
    2ed4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    2ed8:	e8 65 0a 00 00       	call   3942 <getpid>
    2edd:	89 c7                	mov    %eax,%edi
    pid = fork();
    2edf:	e8 d6 09 00 00       	call   38ba <fork>
		if(pid < 0){
    2ee4:	85 c0                	test   %eax,%eax
    2ee6:	0f 88 9a 01 00 00    	js     3086 <sbrktest+0x346>
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
    2eec:	0f 84 72 01 00 00    	je     3064 <sbrktest+0x324>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2ef2:	81 c3 50 c3 00 00    	add    $0xc350,%ebx
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
      kill(ppid);
      exit();
    }
    wait();
    2ef8:	e8 cd 09 00 00       	call   38ca <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }

  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    2efd:	81 fb 80 84 1e 80    	cmp    $0x801e8480,%ebx
    2f03:	75 d3                	jne    2ed8 <sbrktest+0x198>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    2f05:	8d 45 b8             	lea    -0x48(%ebp),%eax
    2f08:	83 ec 0c             	sub    $0xc,%esp
    2f0b:	50                   	push   %eax
    2f0c:	e8 c1 09 00 00       	call   38d2 <pipe>
    2f11:	83 c4 10             	add    $0x10,%esp
    2f14:	85 c0                	test   %eax,%eax
    2f16:	0f 85 34 01 00 00    	jne    3050 <sbrktest+0x310>
    2f1c:	8d 5d c0             	lea    -0x40(%ebp),%ebx
    2f1f:	8d 7d e8             	lea    -0x18(%ebp),%edi
    2f22:	89 de                	mov    %ebx,%esi
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
    2f24:	e8 91 09 00 00       	call   38ba <fork>
    2f29:	85 c0                	test   %eax,%eax
    2f2b:	89 06                	mov    %eax,(%esi)
    2f2d:	0f 84 a1 00 00 00    	je     2fd4 <sbrktest+0x294>
      sbrk(BIG - (uint)sbrk(0));
      write(fds[1], "x", 1);
      // sit around until killed
      for(;;) sleep(1000);
    }
    if(pids[i] != -1)
    2f33:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f36:	74 14                	je     2f4c <sbrktest+0x20c>
      read(fds[0], &scratch, 1);
    2f38:	8d 45 b7             	lea    -0x49(%ebp),%eax
    2f3b:	83 ec 04             	sub    $0x4,%esp
    2f3e:	6a 01                	push   $0x1
    2f40:	50                   	push   %eax
    2f41:	ff 75 b8             	pushl  -0x48(%ebp)
    2f44:	e8 91 09 00 00       	call   38da <read>
    2f49:	83 c4 10             	add    $0x10,%esp
    2f4c:	83 c6 04             	add    $0x4,%esi
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f4f:	39 f7                	cmp    %esi,%edi
    2f51:	75 d1                	jne    2f24 <sbrktest+0x1e4>
      read(fds[0], &scratch, 1);
  }

  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    2f53:	83 ec 0c             	sub    $0xc,%esp
    2f56:	68 00 10 00 00       	push   $0x1000
    2f5b:	e8 ea 09 00 00       	call   394a <sbrk>
    2f60:	83 c4 10             	add    $0x10,%esp
    2f63:	89 c6                	mov    %eax,%esi
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
    2f65:	8b 03                	mov    (%ebx),%eax
    2f67:	83 f8 ff             	cmp    $0xffffffff,%eax
    2f6a:	74 11                	je     2f7d <sbrktest+0x23d>
      continue;
    kill(pids[i]);
    2f6c:	83 ec 0c             	sub    $0xc,%esp
    2f6f:	50                   	push   %eax
    2f70:	e8 7d 09 00 00       	call   38f2 <kill>
    wait();
    2f75:	e8 50 09 00 00       	call   38ca <wait>
    2f7a:	83 c4 10             	add    $0x10,%esp
    2f7d:	83 c3 04             	add    $0x4,%ebx
  }

  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    2f80:	39 fb                	cmp    %edi,%ebx
    2f82:	75 e1                	jne    2f65 <sbrktest+0x225>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    2f84:	83 fe ff             	cmp    $0xffffffff,%esi
    2f87:	0f 84 ab 00 00 00    	je     3038 <sbrktest+0x2f8>
    printf(stdout, "failed sbrk leaked memory\n");
    exit();
  }

  if(sbrk(0) > oldbrk)
    2f8d:	83 ec 0c             	sub    $0xc,%esp
    2f90:	6a 00                	push   $0x0
    2f92:	e8 b3 09 00 00       	call   394a <sbrk>
    2f97:	83 c4 10             	add    $0x10,%esp
    2f9a:	39 45 a4             	cmp    %eax,-0x5c(%ebp)
    2f9d:	73 1a                	jae    2fb9 <sbrktest+0x279>
    sbrk(-(sbrk(0) - oldbrk));
    2f9f:	83 ec 0c             	sub    $0xc,%esp
    2fa2:	6a 00                	push   $0x0
    2fa4:	e8 a1 09 00 00       	call   394a <sbrk>
    2fa9:	8b 75 a4             	mov    -0x5c(%ebp),%esi
    2fac:	29 c6                	sub    %eax,%esi
    2fae:	89 34 24             	mov    %esi,(%esp)
    2fb1:	e8 94 09 00 00       	call   394a <sbrk>
    2fb6:	83 c4 10             	add    $0x10,%esp

  printf(stdout, "sbrk test OK\n");
    2fb9:	83 ec 08             	sub    $0x8,%esp
    2fbc:	68 c8 4b 00 00       	push   $0x4bc8
    2fc1:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    2fc7:	e8 44 0a 00 00       	call   3a10 <printf>
}
    2fcc:	8d 65 f4             	lea    -0xc(%ebp),%esp
    2fcf:	5b                   	pop    %ebx
    2fd0:	5e                   	pop    %esi
    2fd1:	5f                   	pop    %edi
    2fd2:	5d                   	pop    %ebp
    2fd3:	c3                   	ret    
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if((pids[i] = fork()) == 0){
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    2fd4:	83 ec 0c             	sub    $0xc,%esp
    2fd7:	6a 00                	push   $0x0
    2fd9:	e8 6c 09 00 00       	call   394a <sbrk>
    2fde:	ba 00 00 40 06       	mov    $0x6400000,%edx
    2fe3:	29 c2                	sub    %eax,%edx
    2fe5:	89 14 24             	mov    %edx,(%esp)
    2fe8:	e8 5d 09 00 00       	call   394a <sbrk>
      write(fds[1], "x", 1);
    2fed:	83 c4 0c             	add    $0xc,%esp
    2ff0:	6a 01                	push   $0x1
    2ff2:	68 89 46 00 00       	push   $0x4689
    2ff7:	ff 75 bc             	pushl  -0x44(%ebp)
    2ffa:	e8 e3 08 00 00       	call   38e2 <write>
    2fff:	83 c4 10             	add    $0x10,%esp
    3002:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      // sit around until killed
      for(;;) sleep(1000);
    3008:	83 ec 0c             	sub    $0xc,%esp
    300b:	68 e8 03 00 00       	push   $0x3e8
    3010:	e8 3d 09 00 00       	call   3952 <sleep>
    3015:	83 c4 10             	add    $0x10,%esp
    3018:	eb ee                	jmp    3008 <sbrktest+0x2c8>
  a = sbrk(0);
	int i;
  for(i = 0; i < 5000; i++){
    b = sbrk(1);
		if(b != a){
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    301a:	83 ec 0c             	sub    $0xc,%esp
    301d:	50                   	push   %eax
    301e:	53                   	push   %ebx
    301f:	57                   	push   %edi
    3020:	68 2b 4b 00 00       	push   $0x4b2b
    3025:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    302b:	e8 e0 09 00 00       	call   3a10 <printf>
      exit();
    3030:	83 c4 20             	add    $0x20,%esp
    3033:	e8 8a 08 00 00       	call   38c2 <exit>
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    printf(stdout, "failed sbrk leaked memory\n");
    3038:	83 ec 08             	sub    $0x8,%esp
    303b:	68 ad 4b 00 00       	push   $0x4bad
    3040:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    3046:	e8 c5 09 00 00       	call   3a10 <printf>
    exit();
    304b:	e8 72 08 00 00       	call   38c2 <exit>
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    3050:	83 ec 08             	sub    $0x8,%esp
    3053:	68 69 40 00 00       	push   $0x4069
    3058:	6a 01                	push   $0x1
    305a:	e8 b1 09 00 00       	call   3a10 <printf>
    exit();
    305f:	e8 5e 08 00 00       	call   38c2 <exit>
		if(pid < 0){
      printf(stdout, "fork failed\n");
      exit();
    }
    if(pid == 0){
      printf(stdout, "oops could read %x = %x\n", a, *a);
    3064:	0f be 03             	movsbl (%ebx),%eax
    3067:	50                   	push   %eax
    3068:	53                   	push   %ebx
    3069:	68 94 4b 00 00       	push   $0x4b94
    306e:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    3074:	e8 97 09 00 00       	call   3a10 <printf>
      kill(ppid);
    3079:	89 3c 24             	mov    %edi,(%esp)
    307c:	e8 71 08 00 00       	call   38f2 <kill>
      exit();
    3081:	e8 3c 08 00 00       	call   38c2 <exit>
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    ppid = getpid();
    pid = fork();
		if(pid < 0){
      printf(stdout, "fork failed\n");
    3086:	83 ec 08             	sub    $0x8,%esp
    3089:	68 71 4c 00 00       	push   $0x4c71
    308e:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    3094:	e8 77 09 00 00       	call   3a10 <printf>
      exit();
    3099:	e8 24 08 00 00       	call   38c2 <exit>
  }

  a = sbrk(0);
  c = sbrk(-(sbrk(0) - oldbrk));
  if(c != a){
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    309e:	50                   	push   %eax
    309f:	53                   	push   %ebx
    30a0:	68 74 53 00 00       	push   $0x5374
    30a5:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    30ab:	e8 60 09 00 00       	call   3a10 <printf>
    exit();
    30b0:	e8 0d 08 00 00       	call   38c2 <exit>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    exit();
  }
  if(*lastaddr == 99){
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    30b5:	83 ec 08             	sub    $0x8,%esp
    30b8:	68 44 53 00 00       	push   $0x5344
    30bd:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    30c3:	e8 48 09 00 00       	call   3a10 <printf>
    exit();
    30c8:	e8 f5 07 00 00       	call   38c2 <exit>

  // can one re-allocate that page?
  a = sbrk(0);
  c = sbrk(4096);
  if(c != a || sbrk(0) != a + 4096){
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    30cd:	57                   	push   %edi
    30ce:	53                   	push   %ebx
    30cf:	68 1c 53 00 00       	push   $0x531c
    30d4:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    30da:	e8 31 09 00 00       	call   3a10 <printf>
    exit();
    30df:	e8 de 07 00 00       	call   38c2 <exit>
    printf(stdout, "sbrk could not deallocate\n");
    exit();
  }
  c = sbrk(0);
  if(c != a - 4096){
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    30e4:	50                   	push   %eax
    30e5:	53                   	push   %ebx
    30e6:	68 e4 52 00 00       	push   $0x52e4
    30eb:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    30f1:	e8 1a 09 00 00       	call   3a10 <printf>
    exit();
    30f6:	e8 c7 07 00 00       	call   38c2 <exit>

  // can one de-allocate?
  a = sbrk(0);
  c = sbrk(-4096);
  if(c == (char*)0xffffffff){
    printf(stdout, "sbrk could not deallocate\n");
    30fb:	83 ec 08             	sub    $0x8,%esp
    30fe:	68 79 4b 00 00       	push   $0x4b79
    3103:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    3109:	e8 02 09 00 00       	call   3a10 <printf>
    exit();
    310e:	e8 af 07 00 00       	call   38c2 <exit>
#define BIG (100*1024*1024)
  a = sbrk(0);
  amt = (BIG) - (uint)a;
  p = sbrk(amt);
  if (p != a) {
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    3113:	83 ec 08             	sub    $0x8,%esp
    3116:	68 a4 52 00 00       	push   $0x52a4
    311b:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    3121:	e8 ea 08 00 00       	call   3a10 <printf>
    exit();
    3126:	e8 97 07 00 00       	call   38c2 <exit>
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    exit();
  }
  if(pid == 0)
    exit();
    312b:	e8 92 07 00 00       	call   38c2 <exit>
    exit();
  }
  c = sbrk(1);
  c = sbrk(1);
  if(c != a + 1){
    printf(stdout, "sbrk test failed post-fork\n");
    3130:	83 ec 08             	sub    $0x8,%esp
    3133:	68 5d 4b 00 00       	push   $0x4b5d
    3138:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    313e:	e8 cd 08 00 00       	call   3a10 <printf>
    exit();
    3143:	e8 7a 07 00 00       	call   38c2 <exit>
    *b = 1;
    a = b + 1;
  }
  pid = fork();
  if(pid < 0){
    printf(stdout, "sbrk test fork failed\n");
    3148:	83 ec 08             	sub    $0x8,%esp
    314b:	68 46 4b 00 00       	push   $0x4b46
    3150:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    3156:	e8 b5 08 00 00       	call   3a10 <printf>
    exit();
    315b:	e8 62 07 00 00       	call   38c2 <exit>

00003160 <validateint>:
  printf(stdout, "sbrk test OK\n");
}

void
validateint(int *p)
{
    3160:	55                   	push   %ebp
    3161:	89 e5                	mov    %esp,%ebp
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    3163:	5d                   	pop    %ebp
    3164:	c3                   	ret    
    3165:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003170 <validatetest>:

void
validatetest(void)
{
    3170:	55                   	push   %ebp
    3171:	89 e5                	mov    %esp,%ebp
    3173:	56                   	push   %esi
    3174:	53                   	push   %ebx
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    3175:	31 db                	xor    %ebx,%ebx
validatetest(void)
{
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    3177:	83 ec 08             	sub    $0x8,%esp
    317a:	68 d6 4b 00 00       	push   $0x4bd6
    317f:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    3185:	e8 86 08 00 00       	call   3a10 <printf>
    318a:	83 c4 10             	add    $0x10,%esp
    318d:	8d 76 00             	lea    0x0(%esi),%esi
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
    3190:	e8 25 07 00 00       	call   38ba <fork>
    3195:	85 c0                	test   %eax,%eax
    3197:	89 c6                	mov    %eax,%esi
    3199:	74 63                	je     31fe <validatetest+0x8e>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    }
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

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    31be:	58                   	pop    %eax
    31bf:	5a                   	pop    %edx
    31c0:	53                   	push   %ebx
    31c1:	68 e5 4b 00 00       	push   $0x4be5
    31c6:	e8 57 07 00 00       	call   3922 <link>
    31cb:	83 c4 10             	add    $0x10,%esp
    31ce:	83 f8 ff             	cmp    $0xffffffff,%eax
    31d1:	75 30                	jne    3203 <validatetest+0x93>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    31d3:	81 c3 00 10 00 00    	add    $0x1000,%ebx
    31d9:	81 fb 00 40 11 00    	cmp    $0x114000,%ebx
    31df:	75 af                	jne    3190 <validatetest+0x20>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    31e1:	83 ec 08             	sub    $0x8,%esp
    31e4:	68 09 4c 00 00       	push   $0x4c09
    31e9:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    31ef:	e8 1c 08 00 00       	call   3a10 <printf>
}
    31f4:	83 c4 10             	add    $0x10,%esp
    31f7:	8d 65 f8             	lea    -0x8(%ebp),%esp
    31fa:	5b                   	pop    %ebx
    31fb:	5e                   	pop    %esi
    31fc:	5d                   	pop    %ebp
    31fd:	c3                   	ret    

  for(p = 0; p <= (uint)hi; p += 4096){
    if((pid = fork()) == 0){
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
      exit();
    31fe:	e8 bf 06 00 00       	call   38c2 <exit>
    kill(pid);
    wait();

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
      printf(stdout, "link should not succeed\n");
    3203:	83 ec 08             	sub    $0x8,%esp
    3206:	68 f0 4b 00 00       	push   $0x4bf0
    320b:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    3211:	e8 fa 07 00 00       	call   3a10 <printf>
      exit();
    3216:	e8 a7 06 00 00       	call   38c2 <exit>
    321b:	90                   	nop
    321c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003220 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    3220:	55                   	push   %ebp
    3221:	89 e5                	mov    %esp,%ebp
    3223:	83 ec 10             	sub    $0x10,%esp
  int i;

  printf(stdout, "bss test\n");
    3226:	68 16 4c 00 00       	push   $0x4c16
    322b:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    3231:	e8 da 07 00 00       	call   3a10 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
    3236:	83 c4 10             	add    $0x10,%esp
    3239:	80 3d 80 5e 00 00 00 	cmpb   $0x0,0x5e80
    3240:	75 35                	jne    3277 <bsstest+0x57>
    3242:	b8 81 5e 00 00       	mov    $0x5e81,%eax
    3247:	89 f6                	mov    %esi,%esi
    3249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3250:	80 38 00             	cmpb   $0x0,(%eax)
    3253:	75 22                	jne    3277 <bsstest+0x57>
    3255:	83 c0 01             	add    $0x1,%eax
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    3258:	3d 90 85 00 00       	cmp    $0x8590,%eax
    325d:	75 f1                	jne    3250 <bsstest+0x30>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    325f:	83 ec 08             	sub    $0x8,%esp
    3262:	68 31 4c 00 00       	push   $0x4c31
    3267:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    326d:	e8 9e 07 00 00       	call   3a10 <printf>
}
    3272:	83 c4 10             	add    $0x10,%esp
    3275:	c9                   	leave  
    3276:	c3                   	ret    
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
    3277:	83 ec 08             	sub    $0x8,%esp
    327a:	68 20 4c 00 00       	push   $0x4c20
    327f:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    3285:	e8 86 07 00 00       	call   3a10 <printf>
      exit();
    328a:	e8 33 06 00 00       	call   38c2 <exit>
    328f:	90                   	nop

00003290 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    3290:	55                   	push   %ebp
    3291:	89 e5                	mov    %esp,%ebp
    3293:	83 ec 14             	sub    $0x14,%esp
  int pid, fd;

  unlink("bigarg-ok");
    3296:	68 3e 4c 00 00       	push   $0x4c3e
    329b:	e8 72 06 00 00       	call   3912 <unlink>
  pid = fork();
    32a0:	e8 15 06 00 00       	call   38ba <fork>
  if(pid == 0){
    32a5:	83 c4 10             	add    $0x10,%esp
    32a8:	85 c0                	test   %eax,%eax
    32aa:	74 3f                	je     32eb <bigargtest+0x5b>
    exec("echo", args);
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    32ac:	0f 88 c2 00 00 00    	js     3374 <bigargtest+0xe4>
    printf(stdout, "bigargtest: fork failed\n");
    exit();
  }
  wait();
    32b2:	e8 13 06 00 00       	call   38ca <wait>
  fd = open("bigarg-ok", 0);
    32b7:	83 ec 08             	sub    $0x8,%esp
    32ba:	6a 00                	push   $0x0
    32bc:	68 3e 4c 00 00       	push   $0x4c3e
    32c1:	e8 3c 06 00 00       	call   3902 <open>
  if(fd < 0){
    32c6:	83 c4 10             	add    $0x10,%esp
    32c9:	85 c0                	test   %eax,%eax
    32cb:	0f 88 8c 00 00 00    	js     335d <bigargtest+0xcd>
    printf(stdout, "bigarg test failed!\n");
    exit();
  }
  close(fd);
    32d1:	83 ec 0c             	sub    $0xc,%esp
    32d4:	50                   	push   %eax
    32d5:	e8 10 06 00 00       	call   38ea <close>
  unlink("bigarg-ok");
    32da:	c7 04 24 3e 4c 00 00 	movl   $0x4c3e,(%esp)
    32e1:	e8 2c 06 00 00       	call   3912 <unlink>
}
    32e6:	83 c4 10             	add    $0x10,%esp
    32e9:	c9                   	leave  
    32ea:	c3                   	ret    
    32eb:	b8 e0 5d 00 00       	mov    $0x5de0,%eax
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    32f0:	c7 00 98 53 00 00    	movl   $0x5398,(%eax)
    32f6:	83 c0 04             	add    $0x4,%eax
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    32f9:	3d 5c 5e 00 00       	cmp    $0x5e5c,%eax
    32fe:	75 f0                	jne    32f0 <bigargtest+0x60>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    printf(stdout, "bigarg test\n");
    3300:	51                   	push   %ecx
    3301:	51                   	push   %ecx
    3302:	68 48 4c 00 00       	push   $0x4c48
    3307:	ff 35 c4 5d 00 00    	pushl  0x5dc4
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    330d:	c7 05 5c 5e 00 00 00 	movl   $0x0,0x5e5c
    3314:	00 00 00 
    printf(stdout, "bigarg test\n");
    3317:	e8 f4 06 00 00       	call   3a10 <printf>
    exec("echo", args);
    331c:	58                   	pop    %eax
    331d:	5a                   	pop    %edx
    331e:	68 e0 5d 00 00       	push   $0x5de0
    3323:	68 15 3e 00 00       	push   $0x3e15
    3328:	e8 cd 05 00 00       	call   38fa <exec>
    printf(stdout, "bigarg test ok\n");
    332d:	59                   	pop    %ecx
    332e:	58                   	pop    %eax
    332f:	68 55 4c 00 00       	push   $0x4c55
    3334:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    333a:	e8 d1 06 00 00       	call   3a10 <printf>
    fd = open("bigarg-ok", O_CREATE);
    333f:	58                   	pop    %eax
    3340:	5a                   	pop    %edx
    3341:	68 00 02 00 00       	push   $0x200
    3346:	68 3e 4c 00 00       	push   $0x4c3e
    334b:	e8 b2 05 00 00       	call   3902 <open>
    close(fd);
    3350:	89 04 24             	mov    %eax,(%esp)
    3353:	e8 92 05 00 00       	call   38ea <close>
    exit();
    3358:	e8 65 05 00 00       	call   38c2 <exit>
    exit();
  }
  wait();
  fd = open("bigarg-ok", 0);
  if(fd < 0){
    printf(stdout, "bigarg test failed!\n");
    335d:	50                   	push   %eax
    335e:	50                   	push   %eax
    335f:	68 7e 4c 00 00       	push   $0x4c7e
    3364:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    336a:	e8 a1 06 00 00       	call   3a10 <printf>
    exit();
    336f:	e8 4e 05 00 00       	call   38c2 <exit>
    printf(stdout, "bigarg test ok\n");
    fd = open("bigarg-ok", O_CREATE);
    close(fd);
    exit();
  } else if(pid < 0){
    printf(stdout, "bigargtest: fork failed\n");
    3374:	52                   	push   %edx
    3375:	52                   	push   %edx
    3376:	68 65 4c 00 00       	push   $0x4c65
    337b:	ff 35 c4 5d 00 00    	pushl  0x5dc4
    3381:	e8 8a 06 00 00       	call   3a10 <printf>
    exit();
    3386:	e8 37 05 00 00       	call   38c2 <exit>
    338b:	90                   	nop
    338c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003390 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3390:	55                   	push   %ebp
    3391:	89 e5                	mov    %esp,%ebp
    3393:	57                   	push   %edi
    3394:	56                   	push   %esi
    3395:	53                   	push   %ebx
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3396:	31 db                	xor    %ebx,%ebx

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3398:	83 ec 54             	sub    $0x54,%esp
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");
    339b:	68 93 4c 00 00       	push   $0x4c93
    33a0:	6a 01                	push   $0x1
    33a2:	e8 69 06 00 00       	call   3a10 <printf>
    33a7:	83 c4 10             	add    $0x10,%esp
    33aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    33b0:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    33b5:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    33b7:	89 d9                	mov    %ebx,%ecx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    33b9:	f7 eb                	imul   %ebx
    33bb:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    33be:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    33c0:	83 ec 04             	sub    $0x4,%esp

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    33c3:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    33c7:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    33cb:	c1 fa 06             	sar    $0x6,%edx
    33ce:	29 f2                	sub    %esi,%edx
    33d0:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    33d3:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    33d9:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    33dc:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    33e1:	29 d1                	sub    %edx,%ecx
    33e3:	f7 e9                	imul   %ecx
    33e5:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    33e8:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    33ed:	c1 fa 05             	sar    $0x5,%edx
    33f0:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    33f2:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    33f7:	83 c2 30             	add    $0x30,%edx
    33fa:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    33fd:	f7 eb                	imul   %ebx
    33ff:	c1 fa 05             	sar    $0x5,%edx
    3402:	29 f2                	sub    %esi,%edx
    3404:	6b d2 64             	imul   $0x64,%edx,%edx
    3407:	29 d7                	sub    %edx,%edi
    3409:	89 f8                	mov    %edi,%eax
    340b:	c1 ff 1f             	sar    $0x1f,%edi
    340e:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    3410:	89 d8                	mov    %ebx,%eax
  for(nfiles = 0; ; nfiles++){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    3412:	c1 fa 02             	sar    $0x2,%edx
    3415:	29 fa                	sub    %edi,%edx
    3417:	83 c2 30             	add    $0x30,%edx
    341a:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    341d:	f7 e9                	imul   %ecx
    341f:	89 d9                	mov    %ebx,%ecx
    3421:	c1 fa 02             	sar    $0x2,%edx
    3424:	29 f2                	sub    %esi,%edx
    3426:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3429:	01 c0                	add    %eax,%eax
    342b:	29 c1                	sub    %eax,%ecx
    342d:	89 c8                	mov    %ecx,%eax
    342f:	83 c0 30             	add    $0x30,%eax
    3432:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    3435:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3438:	50                   	push   %eax
    3439:	68 a0 4c 00 00       	push   $0x4ca0
    343e:	6a 01                	push   $0x1
    3440:	e8 cb 05 00 00       	call   3a10 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3445:	58                   	pop    %eax
    3446:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3449:	5a                   	pop    %edx
    344a:	68 02 02 00 00       	push   $0x202
    344f:	50                   	push   %eax
    3450:	e8 ad 04 00 00       	call   3902 <open>
    if(fd < 0){
    3455:	83 c4 10             	add    $0x10,%esp
    3458:	85 c0                	test   %eax,%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    345a:	89 c7                	mov    %eax,%edi
    if(fd < 0){
    345c:	78 50                	js     34ae <fsfull+0x11e>
    345e:	31 f6                	xor    %esi,%esi
    3460:	eb 08                	jmp    346a <fsfull+0xda>
    3462:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    3468:	01 c6                	add    %eax,%esi
      printf(1, "open %s failed\n", name);
      break;
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
    346a:	83 ec 04             	sub    $0x4,%esp
    346d:	68 00 02 00 00       	push   $0x200
    3472:	68 a0 85 00 00       	push   $0x85a0
    3477:	57                   	push   %edi
    3478:	e8 65 04 00 00       	call   38e2 <write>
      if(cc < 512)
    347d:	83 c4 10             	add    $0x10,%esp
    3480:	3d ff 01 00 00       	cmp    $0x1ff,%eax
    3485:	7f e1                	jg     3468 <fsfull+0xd8>
        break;
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3487:	83 ec 04             	sub    $0x4,%esp
    348a:	56                   	push   %esi
    348b:	68 bc 4c 00 00       	push   $0x4cbc
    3490:	6a 01                	push   $0x1
    3492:	e8 79 05 00 00       	call   3a10 <printf>
    close(fd);
    3497:	89 3c 24             	mov    %edi,(%esp)
    349a:	e8 4b 04 00 00       	call   38ea <close>
    if(total == 0)
    349f:	83 c4 10             	add    $0x10,%esp
    34a2:	85 f6                	test   %esi,%esi
    34a4:	74 22                	je     34c8 <fsfull+0x138>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    34a6:	83 c3 01             	add    $0x1,%ebx
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    34a9:	e9 02 ff ff ff       	jmp    33b0 <fsfull+0x20>
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    printf(1, "writing %s\n", name);
    int fd = open(name, O_CREATE|O_RDWR);
    if(fd < 0){
      printf(1, "open %s failed\n", name);
    34ae:	8d 45 a8             	lea    -0x58(%ebp),%eax
    34b1:	83 ec 04             	sub    $0x4,%esp
    34b4:	50                   	push   %eax
    34b5:	68 ac 4c 00 00       	push   $0x4cac
    34ba:	6a 01                	push   $0x1
    34bc:	e8 4f 05 00 00       	call   3a10 <printf>
      break;
    34c1:	83 c4 10             	add    $0x10,%esp
    34c4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34c8:	b8 d3 4d 62 10       	mov    $0x10624dd3,%eax
    34cd:	89 de                	mov    %ebx,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    34cf:	89 d9                	mov    %ebx,%ecx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34d1:	f7 eb                	imul   %ebx
    34d3:	c1 fe 1f             	sar    $0x1f,%esi
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    34d6:	89 df                	mov    %ebx,%edi
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    unlink(name);
    34d8:	83 ec 0c             	sub    $0xc,%esp
      break;
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    34db:	c6 45 a8 66          	movb   $0x66,-0x58(%ebp)
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    name[5] = '\0';
    34df:	c6 45 ad 00          	movb   $0x0,-0x53(%ebp)
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34e3:	c1 fa 06             	sar    $0x6,%edx
    34e6:	29 f2                	sub    %esi,%edx
    34e8:	8d 42 30             	lea    0x30(%edx),%eax
    name[2] = '0' + (nfiles % 1000) / 100;
    34eb:	69 d2 e8 03 00 00    	imul   $0x3e8,%edx,%edx
  }

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    34f1:	88 45 a9             	mov    %al,-0x57(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    34f4:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax
    34f9:	29 d1                	sub    %edx,%ecx
    34fb:	f7 e9                	imul   %ecx
    34fd:	c1 f9 1f             	sar    $0x1f,%ecx
    name[3] = '0' + (nfiles % 100) / 10;
    3500:	b8 1f 85 eb 51       	mov    $0x51eb851f,%eax

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    3505:	c1 fa 05             	sar    $0x5,%edx
    3508:	29 ca                	sub    %ecx,%edx
    name[3] = '0' + (nfiles % 100) / 10;
    350a:	b9 67 66 66 66       	mov    $0x66666667,%ecx

  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    350f:	83 c2 30             	add    $0x30,%edx
    3512:	88 55 aa             	mov    %dl,-0x56(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3515:	f7 eb                	imul   %ebx
    3517:	c1 fa 05             	sar    $0x5,%edx
    351a:	29 f2                	sub    %esi,%edx
    351c:	6b d2 64             	imul   $0x64,%edx,%edx
    351f:	29 d7                	sub    %edx,%edi
    3521:	89 f8                	mov    %edi,%eax
    3523:	c1 ff 1f             	sar    $0x1f,%edi
    3526:	f7 e9                	imul   %ecx
    name[4] = '0' + (nfiles % 10);
    3528:	89 d8                	mov    %ebx,%eax
  while(nfiles >= 0){
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    352a:	c1 fa 02             	sar    $0x2,%edx
    352d:	29 fa                	sub    %edi,%edx
    352f:	83 c2 30             	add    $0x30,%edx
    3532:	88 55 ab             	mov    %dl,-0x55(%ebp)
    name[4] = '0' + (nfiles % 10);
    3535:	f7 e9                	imul   %ecx
    3537:	89 d9                	mov    %ebx,%ecx
    name[5] = '\0';
    unlink(name);
    nfiles--;
    3539:	83 eb 01             	sub    $0x1,%ebx
    char name[64];
    name[0] = 'f';
    name[1] = '0' + nfiles / 1000;
    name[2] = '0' + (nfiles % 1000) / 100;
    name[3] = '0' + (nfiles % 100) / 10;
    name[4] = '0' + (nfiles % 10);
    353c:	c1 fa 02             	sar    $0x2,%edx
    353f:	29 f2                	sub    %esi,%edx
    3541:	8d 04 92             	lea    (%edx,%edx,4),%eax
    3544:	01 c0                	add    %eax,%eax
    3546:	29 c1                	sub    %eax,%ecx
    3548:	89 c8                	mov    %ecx,%eax
    354a:	83 c0 30             	add    $0x30,%eax
    354d:	88 45 ac             	mov    %al,-0x54(%ebp)
    name[5] = '\0';
    unlink(name);
    3550:	8d 45 a8             	lea    -0x58(%ebp),%eax
    3553:	50                   	push   %eax
    3554:	e8 b9 03 00 00       	call   3912 <unlink>
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    3559:	83 c4 10             	add    $0x10,%esp
    355c:	83 fb ff             	cmp    $0xffffffff,%ebx
    355f:	0f 85 63 ff ff ff    	jne    34c8 <fsfull+0x138>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3565:	83 ec 08             	sub    $0x8,%esp
    3568:	68 cc 4c 00 00       	push   $0x4ccc
    356d:	6a 01                	push   $0x1
    356f:	e8 9c 04 00 00       	call   3a10 <printf>
}
    3574:	83 c4 10             	add    $0x10,%esp
    3577:	8d 65 f4             	lea    -0xc(%ebp),%esp
    357a:	5b                   	pop    %ebx
    357b:	5e                   	pop    %esi
    357c:	5f                   	pop    %edi
    357d:	5d                   	pop    %ebp
    357e:	c3                   	ret    
    357f:	90                   	nop

00003580 <uio>:

void
uio()
{
    3580:	55                   	push   %ebp
    3581:	89 e5                	mov    %esp,%ebp
    3583:	83 ec 10             	sub    $0x10,%esp

  ushort port = 0;
  uchar val = 0;
  int pid;

  printf(1, "uio test\n");
    3586:	68 e2 4c 00 00       	push   $0x4ce2
    358b:	6a 01                	push   $0x1
    358d:	e8 7e 04 00 00       	call   3a10 <printf>
  pid = fork();
    3592:	e8 23 03 00 00       	call   38ba <fork>
  if(pid == 0){
    3597:	83 c4 10             	add    $0x10,%esp
    359a:	85 c0                	test   %eax,%eax
    359c:	74 1b                	je     35b9 <uio+0x39>
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    printf(1, "uio: uio succeeded; test FAILED\n");
    exit();
  } else if(pid < 0){
    359e:	78 3d                	js     35dd <uio+0x5d>
    printf (1, "fork failed\n");
    exit();
  }
  wait();
    35a0:	e8 25 03 00 00       	call   38ca <wait>
  printf(1, "uio test done\n");
    35a5:	83 ec 08             	sub    $0x8,%esp
    35a8:	68 ec 4c 00 00       	push   $0x4cec
    35ad:	6a 01                	push   $0x1
    35af:	e8 5c 04 00 00       	call   3a10 <printf>
}
    35b4:	83 c4 10             	add    $0x10,%esp
    35b7:	c9                   	leave  
    35b8:	c3                   	ret    
  pid = fork();
  if(pid == 0){
    port = RTC_ADDR;
    val = 0x09;  /* year */
    /* http://wiki.osdev.org/Inline_Assembly/Examples */
    asm volatile("outb %0,%1"::"a"(val), "d" (port));
    35b9:	ba 70 00 00 00       	mov    $0x70,%edx
    35be:	b8 09 00 00 00       	mov    $0x9,%eax
    35c3:	ee                   	out    %al,(%dx)
    port = RTC_DATA;
    asm volatile("inb %1,%0" : "=a" (val) : "d" (port));
    35c4:	ba 71 00 00 00       	mov    $0x71,%edx
    35c9:	ec                   	in     (%dx),%al
    printf(1, "uio: uio succeeded; test FAILED\n");
    35ca:	52                   	push   %edx
    35cb:	52                   	push   %edx
    35cc:	68 78 54 00 00       	push   $0x5478
    35d1:	6a 01                	push   $0x1
    35d3:	e8 38 04 00 00       	call   3a10 <printf>
    exit();
    35d8:	e8 e5 02 00 00       	call   38c2 <exit>
  } else if(pid < 0){
    printf (1, "fork failed\n");
    35dd:	50                   	push   %eax
    35de:	50                   	push   %eax
    35df:	68 71 4c 00 00       	push   $0x4c71
    35e4:	6a 01                	push   $0x1
    35e6:	e8 25 04 00 00       	call   3a10 <printf>
    exit();
    35eb:	e8 d2 02 00 00       	call   38c2 <exit>

000035f0 <argptest>:
  wait();
  printf(1, "uio test done\n");
}

void argptest()
{
    35f0:	55                   	push   %ebp
    35f1:	89 e5                	mov    %esp,%ebp
    35f3:	53                   	push   %ebx
    35f4:	83 ec 0c             	sub    $0xc,%esp
  int fd;
  fd = open("init", O_RDONLY);
    35f7:	6a 00                	push   $0x0
    35f9:	68 fb 4c 00 00       	push   $0x4cfb
    35fe:	e8 ff 02 00 00       	call   3902 <open>
  if (fd < 0) {
    3603:	83 c4 10             	add    $0x10,%esp
    3606:	85 c0                	test   %eax,%eax
    3608:	78 39                	js     3643 <argptest+0x53>
    printf(2, "open failed\n");
    exit();
  }
  read(fd, sbrk(0) - 1, -1);
    360a:	83 ec 0c             	sub    $0xc,%esp
    360d:	89 c3                	mov    %eax,%ebx
    360f:	6a 00                	push   $0x0
    3611:	e8 34 03 00 00       	call   394a <sbrk>
    3616:	83 c4 0c             	add    $0xc,%esp
    3619:	83 e8 01             	sub    $0x1,%eax
    361c:	6a ff                	push   $0xffffffff
    361e:	50                   	push   %eax
    361f:	53                   	push   %ebx
    3620:	e8 b5 02 00 00       	call   38da <read>
  close(fd);
    3625:	89 1c 24             	mov    %ebx,(%esp)
    3628:	e8 bd 02 00 00       	call   38ea <close>
  printf(1, "arg test passed\n");
    362d:	58                   	pop    %eax
    362e:	5a                   	pop    %edx
    362f:	68 0d 4d 00 00       	push   $0x4d0d
    3634:	6a 01                	push   $0x1
    3636:	e8 d5 03 00 00       	call   3a10 <printf>
}
    363b:	83 c4 10             	add    $0x10,%esp
    363e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    3641:	c9                   	leave  
    3642:	c3                   	ret    
void argptest()
{
  int fd;
  fd = open("init", O_RDONLY);
  if (fd < 0) {
    printf(2, "open failed\n");
    3643:	51                   	push   %ecx
    3644:	51                   	push   %ecx
    3645:	68 00 4d 00 00       	push   $0x4d00
    364a:	6a 02                	push   $0x2
    364c:	e8 bf 03 00 00       	call   3a10 <printf>
    exit();
    3651:	e8 6c 02 00 00       	call   38c2 <exit>
    3656:	8d 76 00             	lea    0x0(%esi),%esi
    3659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003660 <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    3660:	69 05 c0 5d 00 00 0d 	imul   $0x19660d,0x5dc0,%eax
    3667:	66 19 00 
}

unsigned long randstate = 1;
unsigned int
rand()
{
    366a:	55                   	push   %ebp
    366b:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
  return randstate;
}
    366d:	5d                   	pop    %ebp

unsigned long randstate = 1;
unsigned int
rand()
{
  randstate = randstate * 1664525 + 1013904223;
    366e:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3673:	a3 c0 5d 00 00       	mov    %eax,0x5dc0
  return randstate;
}
    3678:	c3                   	ret    
    3679:	66 90                	xchg   %ax,%ax
    367b:	66 90                	xchg   %ax,%ax
    367d:	66 90                	xchg   %ax,%ax
    367f:	90                   	nop

00003680 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
    3680:	55                   	push   %ebp
    3681:	89 e5                	mov    %esp,%ebp
    3683:	53                   	push   %ebx
    3684:	8b 45 08             	mov    0x8(%ebp),%eax
    3687:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
    368a:	89 c2                	mov    %eax,%edx
    368c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3690:	83 c1 01             	add    $0x1,%ecx
    3693:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
    3697:	83 c2 01             	add    $0x1,%edx
    369a:	84 db                	test   %bl,%bl
    369c:	88 5a ff             	mov    %bl,-0x1(%edx)
    369f:	75 ef                	jne    3690 <strcpy+0x10>
    ;
  return os;
}
    36a1:	5b                   	pop    %ebx
    36a2:	5d                   	pop    %ebp
    36a3:	c3                   	ret    
    36a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    36aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000036b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    36b0:	55                   	push   %ebp
    36b1:	89 e5                	mov    %esp,%ebp
    36b3:	56                   	push   %esi
    36b4:	53                   	push   %ebx
    36b5:	8b 55 08             	mov    0x8(%ebp),%edx
    36b8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
    36bb:	0f b6 02             	movzbl (%edx),%eax
    36be:	0f b6 19             	movzbl (%ecx),%ebx
    36c1:	84 c0                	test   %al,%al
    36c3:	75 1e                	jne    36e3 <strcmp+0x33>
    36c5:	eb 29                	jmp    36f0 <strcmp+0x40>
    36c7:	89 f6                	mov    %esi,%esi
    36c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
    36d0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    36d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
    36d6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    36d9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
    36dd:	84 c0                	test   %al,%al
    36df:	74 0f                	je     36f0 <strcmp+0x40>
    36e1:	89 f1                	mov    %esi,%ecx
    36e3:	38 d8                	cmp    %bl,%al
    36e5:	74 e9                	je     36d0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    36e7:	29 d8                	sub    %ebx,%eax
}
    36e9:	5b                   	pop    %ebx
    36ea:	5e                   	pop    %esi
    36eb:	5d                   	pop    %ebp
    36ec:	c3                   	ret    
    36ed:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    36f0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
    36f2:	29 d8                	sub    %ebx,%eax
}
    36f4:	5b                   	pop    %ebx
    36f5:	5e                   	pop    %esi
    36f6:	5d                   	pop    %ebp
    36f7:	c3                   	ret    
    36f8:	90                   	nop
    36f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00003700 <strlen>:

uint
strlen(const char *s)
{
    3700:	55                   	push   %ebp
    3701:	89 e5                	mov    %esp,%ebp
    3703:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
    3706:	80 39 00             	cmpb   $0x0,(%ecx)
    3709:	74 12                	je     371d <strlen+0x1d>
    370b:	31 d2                	xor    %edx,%edx
    370d:	8d 76 00             	lea    0x0(%esi),%esi
    3710:	83 c2 01             	add    $0x1,%edx
    3713:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
    3717:	89 d0                	mov    %edx,%eax
    3719:	75 f5                	jne    3710 <strlen+0x10>
    ;
  return n;
}
    371b:	5d                   	pop    %ebp
    371c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
    371d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
    371f:	5d                   	pop    %ebp
    3720:	c3                   	ret    
    3721:	eb 0d                	jmp    3730 <memset>
    3723:	90                   	nop
    3724:	90                   	nop
    3725:	90                   	nop
    3726:	90                   	nop
    3727:	90                   	nop
    3728:	90                   	nop
    3729:	90                   	nop
    372a:	90                   	nop
    372b:	90                   	nop
    372c:	90                   	nop
    372d:	90                   	nop
    372e:	90                   	nop
    372f:	90                   	nop

00003730 <memset>:

void*
memset(void *dst, int c, uint n)
{
    3730:	55                   	push   %ebp
    3731:	89 e5                	mov    %esp,%ebp
    3733:	57                   	push   %edi
    3734:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
    3737:	8b 4d 10             	mov    0x10(%ebp),%ecx
    373a:	8b 45 0c             	mov    0xc(%ebp),%eax
    373d:	89 d7                	mov    %edx,%edi
    373f:	fc                   	cld    
    3740:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
    3742:	89 d0                	mov    %edx,%eax
    3744:	5f                   	pop    %edi
    3745:	5d                   	pop    %ebp
    3746:	c3                   	ret    
    3747:	89 f6                	mov    %esi,%esi
    3749:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003750 <strchr>:

char*
strchr(const char *s, char c)
{
    3750:	55                   	push   %ebp
    3751:	89 e5                	mov    %esp,%ebp
    3753:	53                   	push   %ebx
    3754:	8b 45 08             	mov    0x8(%ebp),%eax
    3757:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
    375a:	0f b6 10             	movzbl (%eax),%edx
    375d:	84 d2                	test   %dl,%dl
    375f:	74 1d                	je     377e <strchr+0x2e>
    if(*s == c)
    3761:	38 d3                	cmp    %dl,%bl
    3763:	89 d9                	mov    %ebx,%ecx
    3765:	75 0d                	jne    3774 <strchr+0x24>
    3767:	eb 17                	jmp    3780 <strchr+0x30>
    3769:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    3770:	38 ca                	cmp    %cl,%dl
    3772:	74 0c                	je     3780 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3774:	83 c0 01             	add    $0x1,%eax
    3777:	0f b6 10             	movzbl (%eax),%edx
    377a:	84 d2                	test   %dl,%dl
    377c:	75 f2                	jne    3770 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
    377e:	31 c0                	xor    %eax,%eax
}
    3780:	5b                   	pop    %ebx
    3781:	5d                   	pop    %ebp
    3782:	c3                   	ret    
    3783:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    3789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003790 <gets>:

char*
gets(char *buf, int max)
{
    3790:	55                   	push   %ebp
    3791:	89 e5                	mov    %esp,%ebp
    3793:	57                   	push   %edi
    3794:	56                   	push   %esi
    3795:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3796:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
    3798:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
    379b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    379e:	eb 29                	jmp    37c9 <gets+0x39>
    cc = read(0, &c, 1);
    37a0:	83 ec 04             	sub    $0x4,%esp
    37a3:	6a 01                	push   $0x1
    37a5:	57                   	push   %edi
    37a6:	6a 00                	push   $0x0
    37a8:	e8 2d 01 00 00       	call   38da <read>
    if(cc < 1)
    37ad:	83 c4 10             	add    $0x10,%esp
    37b0:	85 c0                	test   %eax,%eax
    37b2:	7e 1d                	jle    37d1 <gets+0x41>
      break;
    buf[i++] = c;
    37b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
    37b8:	8b 55 08             	mov    0x8(%ebp),%edx
    37bb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
    37bd:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    37bf:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
    37c3:	74 1b                	je     37e0 <gets+0x50>
    37c5:	3c 0d                	cmp    $0xd,%al
    37c7:	74 17                	je     37e0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    37c9:	8d 5e 01             	lea    0x1(%esi),%ebx
    37cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
    37cf:	7c cf                	jl     37a0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    37d1:	8b 45 08             	mov    0x8(%ebp),%eax
    37d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    37d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    37db:	5b                   	pop    %ebx
    37dc:	5e                   	pop    %esi
    37dd:	5f                   	pop    %edi
    37de:	5d                   	pop    %ebp
    37df:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    37e0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    37e3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    37e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
    37e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
    37ec:	5b                   	pop    %ebx
    37ed:	5e                   	pop    %esi
    37ee:	5f                   	pop    %edi
    37ef:	5d                   	pop    %ebp
    37f0:	c3                   	ret    
    37f1:	eb 0d                	jmp    3800 <stat>
    37f3:	90                   	nop
    37f4:	90                   	nop
    37f5:	90                   	nop
    37f6:	90                   	nop
    37f7:	90                   	nop
    37f8:	90                   	nop
    37f9:	90                   	nop
    37fa:	90                   	nop
    37fb:	90                   	nop
    37fc:	90                   	nop
    37fd:	90                   	nop
    37fe:	90                   	nop
    37ff:	90                   	nop

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
    3827:	89 c6                	mov    %eax,%esi
  close(fd);
    3829:	89 1c 24             	mov    %ebx,(%esp)
    382c:	e8 b9 00 00 00       	call   38ea <close>
  return r;
    3831:	83 c4 10             	add    $0x10,%esp
    3834:	89 f0                	mov    %esi,%eax
}
    3836:	8d 65 f8             	lea    -0x8(%ebp),%esp
    3839:	5b                   	pop    %ebx
    383a:	5e                   	pop    %esi
    383b:	5d                   	pop    %ebp
    383c:	c3                   	ret    
    383d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
    3840:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3845:	eb ef                	jmp    3836 <stat+0x36>
    3847:	89 f6                	mov    %esi,%esi
    3849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00003850 <atoi>:
  return r;
}

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
    385f:	b8 00 00 00 00       	mov    $0x0,%eax
    3864:	77 1f                	ja     3885 <atoi+0x35>
    3866:	8d 76 00             	lea    0x0(%esi),%esi
    3869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
    3870:	8d 04 80             	lea    (%eax,%eax,4),%eax
    3873:	83 c1 01             	add    $0x1,%ecx
    3876:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    387a:	0f be 11             	movsbl (%ecx),%edx
    387d:	8d 5a d0             	lea    -0x30(%edx),%ebx
    3880:	80 fb 09             	cmp    $0x9,%bl
    3883:	76 eb                	jbe    3870 <atoi+0x20>
    n = n*10 + *s++ - '0';
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
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    38b2:	39 da                	cmp    %ebx,%edx
    38b4:	75 f2                	jne    38a8 <memmove+0x18>
    *dst++ = *src++;
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
    396a:	66 90                	xchg   %ax,%ax
    396c:	66 90                	xchg   %ax,%ax
    396e:	66 90                	xchg   %ax,%ax

00003970 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    3970:	55                   	push   %ebp
    3971:	89 e5                	mov    %esp,%ebp
    3973:	57                   	push   %edi
    3974:	56                   	push   %esi
    3975:	53                   	push   %ebx
    3976:	89 c6                	mov    %eax,%esi
    3978:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    397b:	8b 5d 08             	mov    0x8(%ebp),%ebx
    397e:	85 db                	test   %ebx,%ebx
    3980:	74 7e                	je     3a00 <printint+0x90>
    3982:	89 d0                	mov    %edx,%eax
    3984:	c1 e8 1f             	shr    $0x1f,%eax
    3987:	84 c0                	test   %al,%al
    3989:	74 75                	je     3a00 <printint+0x90>
    neg = 1;
    x = -xx;
    398b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    398d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
    3994:	f7 d8                	neg    %eax
    3996:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
    3999:	31 ff                	xor    %edi,%edi
    399b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    399e:	89 ce                	mov    %ecx,%esi
    39a0:	eb 08                	jmp    39aa <printint+0x3a>
    39a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
    39a8:	89 cf                	mov    %ecx,%edi
    39aa:	31 d2                	xor    %edx,%edx
    39ac:	8d 4f 01             	lea    0x1(%edi),%ecx
    39af:	f7 f6                	div    %esi
    39b1:	0f b6 92 d0 54 00 00 	movzbl 0x54d0(%edx),%edx
  }while((x /= base) != 0);
    39b8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    39ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    39bd:	75 e9                	jne    39a8 <printint+0x38>
  if(neg)
    39bf:	8b 45 c4             	mov    -0x3c(%ebp),%eax
    39c2:	8b 75 c0             	mov    -0x40(%ebp),%esi
    39c5:	85 c0                	test   %eax,%eax
    39c7:	74 08                	je     39d1 <printint+0x61>
    buf[i++] = '-';
    39c9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
    39ce:	8d 4f 02             	lea    0x2(%edi),%ecx
    39d1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
    39d5:	8d 76 00             	lea    0x0(%esi),%esi
    39d8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    39db:	83 ec 04             	sub    $0x4,%esp
    39de:	83 ef 01             	sub    $0x1,%edi
    39e1:	6a 01                	push   $0x1
    39e3:	53                   	push   %ebx
    39e4:	56                   	push   %esi
    39e5:	88 45 d7             	mov    %al,-0x29(%ebp)
    39e8:	e8 f5 fe ff ff       	call   38e2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    39ed:	83 c4 10             	add    $0x10,%esp
    39f0:	39 df                	cmp    %ebx,%edi
    39f2:	75 e4                	jne    39d8 <printint+0x68>
    putc(fd, buf[i]);
}
    39f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
    39f7:	5b                   	pop    %ebx
    39f8:	5e                   	pop    %esi
    39f9:	5f                   	pop    %edi
    39fa:	5d                   	pop    %ebp
    39fb:	c3                   	ret    
    39fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    3a00:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3a02:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    3a09:	eb 8b                	jmp    3996 <printint+0x26>
    3a0b:	90                   	nop
    3a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00003a10 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    3a10:	55                   	push   %ebp
    3a11:	89 e5                	mov    %esp,%ebp
    3a13:	57                   	push   %edi
    3a14:	56                   	push   %esi
    3a15:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a16:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    3a19:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a1c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    3a1f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a22:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3a25:	0f b6 1e             	movzbl (%esi),%ebx
    3a28:	83 c6 01             	add    $0x1,%esi
    3a2b:	84 db                	test   %bl,%bl
    3a2d:	0f 84 b0 00 00 00    	je     3ae3 <printf+0xd3>
    3a33:	31 d2                	xor    %edx,%edx
    3a35:	eb 39                	jmp    3a70 <printf+0x60>
    3a37:	89 f6                	mov    %esi,%esi
    3a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3a40:	83 f8 25             	cmp    $0x25,%eax
    3a43:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
    3a46:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    3a4b:	74 18                	je     3a65 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3a4d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    3a50:	83 ec 04             	sub    $0x4,%esp
    3a53:	88 5d e2             	mov    %bl,-0x1e(%ebp)
    3a56:	6a 01                	push   $0x1
    3a58:	50                   	push   %eax
    3a59:	57                   	push   %edi
    3a5a:	e8 83 fe ff ff       	call   38e2 <write>
    3a5f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
    3a62:	83 c4 10             	add    $0x10,%esp
    3a65:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3a68:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
    3a6c:	84 db                	test   %bl,%bl
    3a6e:	74 73                	je     3ae3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
    3a70:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    3a72:	0f be cb             	movsbl %bl,%ecx
    3a75:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
    3a78:	74 c6                	je     3a40 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    3a7a:	83 fa 25             	cmp    $0x25,%edx
    3a7d:	75 e6                	jne    3a65 <printf+0x55>
      if(c == 'd'){
    3a7f:	83 f8 64             	cmp    $0x64,%eax
    3a82:	0f 84 f8 00 00 00    	je     3b80 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    3a88:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
    3a8e:	83 f9 70             	cmp    $0x70,%ecx
    3a91:	74 5d                	je     3af0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    3a93:	83 f8 73             	cmp    $0x73,%eax
    3a96:	0f 84 84 00 00 00    	je     3b20 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3a9c:	83 f8 63             	cmp    $0x63,%eax
    3a9f:	0f 84 ea 00 00 00    	je     3b8f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    3aa5:	83 f8 25             	cmp    $0x25,%eax
    3aa8:	0f 84 c2 00 00 00    	je     3b70 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3aae:	8d 45 e7             	lea    -0x19(%ebp),%eax
    3ab1:	83 ec 04             	sub    $0x4,%esp
    3ab4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
    3ab8:	6a 01                	push   $0x1
    3aba:	50                   	push   %eax
    3abb:	57                   	push   %edi
    3abc:	e8 21 fe ff ff       	call   38e2 <write>
    3ac1:	83 c4 0c             	add    $0xc,%esp
    3ac4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    3ac7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
    3aca:	6a 01                	push   $0x1
    3acc:	50                   	push   %eax
    3acd:	57                   	push   %edi
    3ace:	83 c6 01             	add    $0x1,%esi
    3ad1:	e8 0c fe ff ff       	call   38e2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3ad6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3ada:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3add:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3adf:	84 db                	test   %bl,%bl
    3ae1:	75 8d                	jne    3a70 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3ae3:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3ae6:	5b                   	pop    %ebx
    3ae7:	5e                   	pop    %esi
    3ae8:	5f                   	pop    %edi
    3ae9:	5d                   	pop    %ebp
    3aea:	c3                   	ret    
    3aeb:	90                   	nop
    3aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    3af0:	83 ec 0c             	sub    $0xc,%esp
    3af3:	b9 10 00 00 00       	mov    $0x10,%ecx
    3af8:	6a 00                	push   $0x0
    3afa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    3afd:	89 f8                	mov    %edi,%eax
    3aff:	8b 13                	mov    (%ebx),%edx
    3b01:	e8 6a fe ff ff       	call   3970 <printint>
        ap++;
    3b06:	89 d8                	mov    %ebx,%eax
    3b08:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3b0b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
    3b0d:	83 c0 04             	add    $0x4,%eax
    3b10:	89 45 d0             	mov    %eax,-0x30(%ebp)
    3b13:	e9 4d ff ff ff       	jmp    3a65 <printf+0x55>
    3b18:	90                   	nop
    3b19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    3b20:	8b 45 d0             	mov    -0x30(%ebp),%eax
    3b23:	8b 18                	mov    (%eax),%ebx
        ap++;
    3b25:	83 c0 04             	add    $0x4,%eax
    3b28:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
    3b2b:	b8 c8 54 00 00       	mov    $0x54c8,%eax
    3b30:	85 db                	test   %ebx,%ebx
    3b32:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
    3b35:	0f b6 03             	movzbl (%ebx),%eax
    3b38:	84 c0                	test   %al,%al
    3b3a:	74 23                	je     3b5f <printf+0x14f>
    3b3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    3b40:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b43:	8d 45 e3             	lea    -0x1d(%ebp),%eax
    3b46:	83 ec 04             	sub    $0x4,%esp
    3b49:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    3b4b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b4e:	50                   	push   %eax
    3b4f:	57                   	push   %edi
    3b50:	e8 8d fd ff ff       	call   38e2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3b55:	0f b6 03             	movzbl (%ebx),%eax
    3b58:	83 c4 10             	add    $0x10,%esp
    3b5b:	84 c0                	test   %al,%al
    3b5d:	75 e1                	jne    3b40 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    3b5f:	31 d2                	xor    %edx,%edx
    3b61:	e9 ff fe ff ff       	jmp    3a65 <printf+0x55>
    3b66:	8d 76 00             	lea    0x0(%esi),%esi
    3b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b70:	83 ec 04             	sub    $0x4,%esp
    3b73:	88 5d e5             	mov    %bl,-0x1b(%ebp)
    3b76:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    3b79:	6a 01                	push   $0x1
    3b7b:	e9 4c ff ff ff       	jmp    3acc <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    3b80:	83 ec 0c             	sub    $0xc,%esp
    3b83:	b9 0a 00 00 00       	mov    $0xa,%ecx
    3b88:	6a 01                	push   $0x1
    3b8a:	e9 6b ff ff ff       	jmp    3afa <printf+0xea>
    3b8f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    3b92:	83 ec 04             	sub    $0x4,%esp
    3b95:	8b 03                	mov    (%ebx),%eax
    3b97:	6a 01                	push   $0x1
    3b99:	88 45 e4             	mov    %al,-0x1c(%ebp)
    3b9c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    3b9f:	50                   	push   %eax
    3ba0:	57                   	push   %edi
    3ba1:	e8 3c fd ff ff       	call   38e2 <write>
    3ba6:	e9 5b ff ff ff       	jmp    3b06 <printf+0xf6>
    3bab:	66 90                	xchg   %ax,%ax
    3bad:	66 90                	xchg   %ax,%ax
    3baf:	90                   	nop

00003bb0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3bb0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3bb1:	a1 60 5e 00 00       	mov    0x5e60,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    3bb6:	89 e5                	mov    %esp,%ebp
    3bb8:	57                   	push   %edi
    3bb9:	56                   	push   %esi
    3bba:	53                   	push   %ebx
    3bbb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3bbe:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3bc0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3bc3:	39 c8                	cmp    %ecx,%eax
    3bc5:	73 19                	jae    3be0 <free+0x30>
    3bc7:	89 f6                	mov    %esi,%esi
    3bc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    3bd0:	39 d1                	cmp    %edx,%ecx
    3bd2:	72 1c                	jb     3bf0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3bd4:	39 d0                	cmp    %edx,%eax
    3bd6:	73 18                	jae    3bf0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    3bd8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3bda:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3bdc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3bde:	72 f0                	jb     3bd0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3be0:	39 d0                	cmp    %edx,%eax
    3be2:	72 f4                	jb     3bd8 <free+0x28>
    3be4:	39 d1                	cmp    %edx,%ecx
    3be6:	73 f0                	jae    3bd8 <free+0x28>
    3be8:	90                   	nop
    3be9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    3bf0:	8b 73 fc             	mov    -0x4(%ebx),%esi
    3bf3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    3bf6:	39 d7                	cmp    %edx,%edi
    3bf8:	74 19                	je     3c13 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    3bfa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    3bfd:	8b 50 04             	mov    0x4(%eax),%edx
    3c00:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3c03:	39 f1                	cmp    %esi,%ecx
    3c05:	74 23                	je     3c2a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    3c07:	89 08                	mov    %ecx,(%eax)
  freep = p;
    3c09:	a3 60 5e 00 00       	mov    %eax,0x5e60
}
    3c0e:	5b                   	pop    %ebx
    3c0f:	5e                   	pop    %esi
    3c10:	5f                   	pop    %edi
    3c11:	5d                   	pop    %ebp
    3c12:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    3c13:	03 72 04             	add    0x4(%edx),%esi
    3c16:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    3c19:	8b 10                	mov    (%eax),%edx
    3c1b:	8b 12                	mov    (%edx),%edx
    3c1d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    3c20:	8b 50 04             	mov    0x4(%eax),%edx
    3c23:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    3c26:	39 f1                	cmp    %esi,%ecx
    3c28:	75 dd                	jne    3c07 <free+0x57>
    p->s.size += bp->s.size;
    3c2a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    3c2d:	a3 60 5e 00 00       	mov    %eax,0x5e60
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    3c32:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    3c35:	8b 53 f8             	mov    -0x8(%ebx),%edx
    3c38:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    3c3a:	5b                   	pop    %ebx
    3c3b:	5e                   	pop    %esi
    3c3c:	5f                   	pop    %edi
    3c3d:	5d                   	pop    %ebp
    3c3e:	c3                   	ret    
    3c3f:	90                   	nop

00003c40 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    3c40:	55                   	push   %ebp
    3c41:	89 e5                	mov    %esp,%ebp
    3c43:	57                   	push   %edi
    3c44:	56                   	push   %esi
    3c45:	53                   	push   %ebx
    3c46:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3c49:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    3c4c:	8b 15 60 5e 00 00    	mov    0x5e60,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    3c52:	8d 78 07             	lea    0x7(%eax),%edi
    3c55:	c1 ef 03             	shr    $0x3,%edi
    3c58:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    3c5b:	85 d2                	test   %edx,%edx
    3c5d:	0f 84 a3 00 00 00    	je     3d06 <malloc+0xc6>
    3c63:	8b 02                	mov    (%edx),%eax
    3c65:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    3c68:	39 cf                	cmp    %ecx,%edi
    3c6a:	76 74                	jbe    3ce0 <malloc+0xa0>
    3c6c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    3c72:	be 00 10 00 00       	mov    $0x1000,%esi
    3c77:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    3c7e:	0f 43 f7             	cmovae %edi,%esi
    3c81:	ba 00 80 00 00       	mov    $0x8000,%edx
    3c86:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    3c8c:	0f 46 da             	cmovbe %edx,%ebx
    3c8f:	eb 10                	jmp    3ca1 <malloc+0x61>
    3c91:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    3c98:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    3c9a:	8b 48 04             	mov    0x4(%eax),%ecx
    3c9d:	39 cf                	cmp    %ecx,%edi
    3c9f:	76 3f                	jbe    3ce0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    3ca1:	39 05 60 5e 00 00    	cmp    %eax,0x5e60
    3ca7:	89 c2                	mov    %eax,%edx
    3ca9:	75 ed                	jne    3c98 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    3cab:	83 ec 0c             	sub    $0xc,%esp
    3cae:	53                   	push   %ebx
    3caf:	e8 96 fc ff ff       	call   394a <sbrk>
  if(p == (char*)-1)
    3cb4:	83 c4 10             	add    $0x10,%esp
    3cb7:	83 f8 ff             	cmp    $0xffffffff,%eax
    3cba:	74 1c                	je     3cd8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    3cbc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    3cbf:	83 ec 0c             	sub    $0xc,%esp
    3cc2:	83 c0 08             	add    $0x8,%eax
    3cc5:	50                   	push   %eax
    3cc6:	e8 e5 fe ff ff       	call   3bb0 <free>
  return freep;
    3ccb:	8b 15 60 5e 00 00    	mov    0x5e60,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    3cd1:	83 c4 10             	add    $0x10,%esp
    3cd4:	85 d2                	test   %edx,%edx
    3cd6:	75 c0                	jne    3c98 <malloc+0x58>
        return 0;
    3cd8:	31 c0                	xor    %eax,%eax
    3cda:	eb 1c                	jmp    3cf8 <malloc+0xb8>
    3cdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    3ce0:	39 cf                	cmp    %ecx,%edi
    3ce2:	74 1c                	je     3d00 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    3ce4:	29 f9                	sub    %edi,%ecx
    3ce6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    3ce9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    3cec:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    3cef:	89 15 60 5e 00 00    	mov    %edx,0x5e60
      return (void*)(p + 1);
    3cf5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    3cf8:	8d 65 f4             	lea    -0xc(%ebp),%esp
    3cfb:	5b                   	pop    %ebx
    3cfc:	5e                   	pop    %esi
    3cfd:	5f                   	pop    %edi
    3cfe:	5d                   	pop    %ebp
    3cff:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    3d00:	8b 08                	mov    (%eax),%ecx
    3d02:	89 0a                	mov    %ecx,(%edx)
    3d04:	eb e9                	jmp    3cef <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    3d06:	c7 05 60 5e 00 00 64 	movl   $0x5e64,0x5e60
    3d0d:	5e 00 00 
    3d10:	c7 05 64 5e 00 00 64 	movl   $0x5e64,0x5e64
    3d17:	5e 00 00 
    base.s.size = 0;
    3d1a:	b8 64 5e 00 00       	mov    $0x5e64,%eax
    3d1f:	c7 05 68 5e 00 00 00 	movl   $0x0,0x5e68
    3d26:	00 00 00 
    3d29:	e9 3e ff ff ff       	jmp    3c6c <malloc+0x2c>
