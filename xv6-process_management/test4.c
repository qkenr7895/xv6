#include "param.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

#define KEY1 123456789
#define KEY2 987654321
#define TIME_INTERVAL 100	// If error occured, change this up to 500

void fork_stress();
void exit_test();

int ppid;
char *argv[10];
char *password = "1234";

int main() {
	int pid;
	int getshmem_pid;
	int *va;

	printf(1, "test1. basic read & write test\n");
	fork_stress();

	ppid = getpid();
	pid = fork();

	if(pid == 0) {
		getshmem_pid = getpid();
		pid = fork();
		if(pid == 0) {
			sleep(TIME_INTERVAL);			
			va = (int*)getshmem(getshmem_pid);
			sleep(TIME_INTERVAL * 2);
			if(*va != KEY1) {
				printf(1, "error! shared memory not changed!\n");
				exit_test();
			}
			printf(1, "passed1\n");
			sleep(TIME_INTERVAL * 8);
			if(*va != KEY2) {
				printf(1, "error! shared memory not changed!\n");
				exit_test();
			}			
			printf(1, "passed2\n");
			exit();
		} else if(pid > 0) {
			va = (int*)getshmem(getshmem_pid);
			*va = KEY1;
			printf(1, "change va to %d...", *va);
			sleep(TIME_INTERVAL * 5);
			*va = KEY2;
			printf(1, "change va to %d...", *va);
			wait();
			exit();
		} else {
			printf(1, "fork failed\n");
			exit_test();
		}
	} else if(pid > 0) {
		wait();
		printf(1, "test1 passed!\n\n");
	} else {
		printf(1, "fork failed\n");
		exit_test();		
	}
	
	printf(1, "test2. non owner process writable test\n");
	fork_stress();
	
	pid = fork();

	if(pid == 0) {
		getshmem_pid = getpid();
		pid = fork();	
		if(pid == 0) {
			sleep(TIME_INTERVAL);
			va = (int*)getshmem(getshmem_pid);
			printf(1, "trap may occur\n");
			sleep(TIME_INTERVAL);
			*va = 22;
			printf(1, "error! va was written by non owner process!%d\n", *va);
			exit_test();
		} else if(pid > 0) {
			wait();
		} else {
			printf(1, "fork failed\n");
			exit_test();
		}	
		exit();
	} else if(pid > 0) {
		wait();
		printf(1, "test2 passed\n\n");
	} else {
		printf(1, "fork failed\n");
		exit_test();		
	}
	
	printf(1, "test3. access non existed shared memory test\n");
	fork_stress();
	
	pid = fork();

	if(pid == 0) {
		int flag = 0;
		getshmem_pid = getpid();
	
		for(int i = 0; i < 2; i++) {
			pid = fork();
			if(pid == 0) {
				flag = i;
				break;
			}
		}
		if(pid == 0 && flag == 1) {
			// C
			va = (int*)getshmem(getpid());
			*va = KEY1;
			printf(1, "%d", (*va)%2);
			sleep(TIME_INTERVAL*4);
			exit();
		} else if(pid == 0 && flag == 0) {
			// B
			sleep(TIME_INTERVAL*2);
			va = (int*)getshmem(getshmem_pid);
			getshmem_pid = *va;
			va = (int*)getshmem(getshmem_pid);
			if(*va != KEY1) {
				printf(1, "error! process C shared memory not changed\n");
				exit_test();
			};
			printf(1, "\ntrap may occur\n");
			sleep(TIME_INTERVAL*6);
			printf(1, "%d", *va);		
			printf(1, "error! can access dead process' shared memory\n");
			exit_test();
			exit();
		} else if(pid > 0) {
			va = (int*)getshmem(getpid());
			*va = pid;
			printf(1, "%d", (*va)%2);
			wait();
			wait();
		} else {
			printf(1, "fork failed\n");
			exit_test();
		}	
		exit();
	} else if(pid > 0) {
		wait();
		printf(1, "test3 passed\n\n");
	} else {
		printf(1, "fork failed\n");
		exit_test();		
	}

	printf(1, "test4. test compatibility of exec2 with shared memory\n");
	fork_stress();
	
	pid = fork();

	if(pid == 0) {
		ppid = getpid();
		pid = fork();
		if(pid == 0) {
			pid = fork();
			if(pid == 0) {
				char buf[12];
				int index=0;
				while(ppid != 0) {
					buf[index] = (ppid % 10) + 48;
					ppid /= 10;
					index++;
				}
				buf[index] = '\0';
				int a = 0, b = index - 1;
				while(a <= b) {
					char temp = buf[a];
					buf[a] = buf[b];
					buf[b] = temp;
					a++;
					b--;
				}
				argv[0] = "test4_exec";
				argv[1] = buf;
				argv[2] = 0;
				
				if(getadmin(password) == -1) {
					printf(1, "getadmin failed\n");
					exit_test();
				}
				
				exec2(argv[0], argv, 5);
				printf(1, "failed to exec2\n");
				exit_test();
			} else if(pid > 0) {
				wait();
			} else {
				printf(1, "fork failed\n");
				exit_test();
			}
			exit();
		} else if(pid > 0) {
			va = (int*)getshmem(getpid());
			*va = KEY1;
			printf(1, "change va to %d...", KEY1);
			sleep(TIME_INTERVAL*5);
			*va = KEY2;
			printf(1, "change va to %d...", KEY2);
			wait();
		} else {
			printf(1, "fork failed\n");
			exit_test();
		}
		exit();
	} else if(pid > 0) {
		wait();	
		printf(1, "test4 passed\n\n");
	} else {
		printf(1, "fork failed\n");
		exit_test();		
	}

	ppid = getpid();
	va = (int*)getshmem(getpid());
	*va = KEY2;
	printf(1, "%d\n", (*va) % 2);
	printf(1, "test5. stress test\n");
	for(int i = 0; i < 20000; i++) {
		if(i % 200 == 0)
			printf(1, "=");
	}
	printf(1, "\n");
	for(int i = 1; i <= 20000; i++) {
		if(i % 2000 == 0 && i != 0) printf(1, "*"); 
		else if(i % 200 == 0) printf(1, ".");

		fork_stress();
		pid = fork();
		if(pid == 0) {
			va = (int*)getshmem(ppid);
			if(*va != KEY2) {
				printf(1, "failed to read shared memory\n");
				exit_test();
			}
			exit();
		} else if(pid > 0) {
			wait();
		} else {
			printf(1, "failed to fork\n");
			exit_test();
		}
	}
	printf(1, "\ntest5 passed\n\n");

	exit();
}

void fork_stress() {
	const int MAX = 11;
	int pid;

	for(int i = 0; i < MAX; i++) {
		pid = fork();
		if(pid == 0) {
			break;
		}
	}
	if(pid == 0) {
		exit();
	} else if(pid > 0) {
		for(int i = 0; i < MAX; i++) {
			wait();
		}
	} else {
		printf(1, "fork failed\n");
		exit_test();
	}
}

void exit_test() {
	kill(ppid);
	exit();	
};
