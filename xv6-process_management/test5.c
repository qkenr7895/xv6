#include "param.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

int main() {
	int pid;
	int *va;

	pid = fork();

	if(pid == 0) {
		// pid 4
		sleep(300);
		va = (int*)getshmem(3);

		printf(1, "child\n"); 
		printf(1, "va addr : %x\n", va); 
		printf(1, "va value : %d\n", *va); 
		printf(1, "trap may occur\n");
		*va = 333444;
		printf(1, "change va : %d\n", *va); 
		printf(1, "this should not be shown\n");
		exit();
	} else {
		// pid 3
		va = (int*)getshmem(3);
		printf(1, "parent\n"); 
		printf(1, "va addr : %x\n", va); 
		printf(1, "va value : %d\n\n", *va); 
		*va = 111222;
		printf(1, "changed va : %d\n", *va);
		wait();
	}

	printf(1, "\n=================================\n");
	for(int i = 0; i < 2; i++) {
		pid = fork();
		if(pid == 0)
			break;
	}

	pid = getpid();

	if(pid == 3) {
		list_process();
		wait();
		wait();
	} else if(pid == 5) {
		sleep(10);
		va = (int*)getshmem(6);
		sleep(100);
		printf(1, "pid 5\n"); 
		printf(1, "va addr : %x\n", va); 
		printf(1, "va value : %d\n\n", *va); 
		sleep(200);	
		printf(1, "pid 5\n"); 
		printf(1, "read changed\n");
		printf(1, "va addr : %x\n", va); 
		printf(1, "va value : %d\n\n", *va); 
		
		printf(1, "trap may occur\n");
		*va = 123123;
		printf(1, "va : %d\n", *va);
		exit();
	} else if(pid == 6) {
		sleep(50);
		va = (int*)getshmem(6);
		printf(1, "pid 6\n"); 
		printf(1, "va addr : %x\n", va); 
		printf(1, "va value : %d\n\n", *va); 
		sleep(150);
		printf(1, "pid 6\n"); 
		printf(1, "change va\n");
		*va = 123456789;
		printf(1, "va addr : %x\n", va); 
		printf(1, "va value : %d\n\n", *va); 
		sleep(250);
		exit();
	} else {
		printf(1, "error occur\n");
		exit();
	}
	printf(1, "\n=================================\n");
	pid = fork();
	if(pid == 0) {
		// pid 7
		return 0;
	} else {
		wait();
	}
	printf(1, "\n=================================\n");
	for(int i = 0; i < 2; i++) {
		pid = fork();
		if(pid == 0) {
			break;
		} else if(pid < 0) {
			printf(1, "fork failed\n");
		}
	}
	pid = getpid();
	
	if(pid == 3) {
		wait();
		wait();
	} else if(pid == 8) {
		va = (int*)getshmem(8);
		*va = 321654987;
		printf(1, "pid %d\n", pid); 
		printf(1, "va addr : %x\n", va); 
		printf(1, "va value : %d\n\n", *va); 
		sleep(200);
		exit();
	} else if(pid == 9) {
		sleep(100);
		va = (int*)getshmem(8);
		printf(1, "pid %d\n", pid); 
		printf(1, "va addr : %x\n", va); 
		printf(1, "va value : %d\n\n", *va); 
		sleep(400);
		printf(1, "pid %d\n", pid);
		printf(1, "trap may occur\n");
		printf(1, "try to read va : %d\n", *va);	
		exit();
	}

	exit();
}
