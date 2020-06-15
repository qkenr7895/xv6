#include "param.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

char *password = "1234";

void memory_test(void);

int main() {
	int pid;

	printf(1, "setmemorylimit test\n");

	pid = fork();

	if(pid == 0) {
		printf(1, "test1. 80000 bytes limit\n");
		if(getadmin(password) == -1) {
			printf(1, "getadmin failed\n");
			exit();
		}
		pid = getpid();
		if(setmemorylimit(pid, 1) != -1) {
			printf(1, "set memory limit under memory size\n");
			exit();
		}
		if(setmemorylimit(pid, -1) != -1) {
			printf(1, "set memory with negative number\n");
			exit();
		}
		if(setmemorylimit(pid, 80000) == -1) {
			printf(1, "something wrong\n");
			printf(1, "allocated size is greater than 80000 bytes\n");
			exit();
		}
		memory_test();
		printf(1, "passed!\n\n");
		exit();
	} else if(pid > 0) {
		wait();
	} else {
		printf(1, "fork failed\n");
		exit();
	}

	pid = fork();

	if(pid == 0) {
		printf(1, "test2. 200000 bytes limit\n");
		if(getadmin(password) == -1) {
			printf(1, "getadmin failed\n");
			exit();
		}
		pid = getpid();
		
		if(setmemorylimit(pid, 200000) == -1) {
			printf(1, "something wrong\n");
			printf(1, "allocated size is greater than 200000 bytes\n");
			exit();
		}
		memory_test();
		printf(1, "passed!\n\n");
		exit();
	} else if(pid > 0) {
		wait();
	} else {
		printf(1, "fork failed\n");
		exit();
	}

	pid = fork();

	if(pid == 0) {
		printf(1, "test3. new process' memory limit\n");
		pid = getpid();

		if(getadmin(password) == -1) {
			printf(1, "getadmin failed\n");
			exit();
		}
		if(setmemorylimit(pid, 80000) == -1) {
			printf(1, "set memory limit failed\n");
			exit();
		}
		pid = fork();
		if(pid == 0) {
			const int N = 4096;
			int count = 0;
			
			while(count < 30) {
				if(malloc(N) == 0) {
					printf(1, "malloc failed\n");	
					printf(1, "test 3 failed\n");
					exit();
				}
				count++;
				sleep(10);
			}
			printf(1, "passed!\n");
			exit();
		} else if(pid > 0) {
			wait();
		} else {
			printf(1, "fork failed\n");
		}
		exit();
	} else if(pid > 0) {
		wait();
	} else {
		printf(1, "fork failed\n");
		exit();
	}
	printf(1, "\nall tests passed!\n");
	exit();
}

void 
memory_test(void)
{
	const int N = 4096;
	int total = 0;
	while(1) {
		if(malloc(N) == 0) {
			printf(1, "Memory allocation failed/\n");
			break;
		}
		total += N;
		printf(1, "Memory allocated: %d bytes\n", total);
		sleep(50);
	}
}
