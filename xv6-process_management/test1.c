#include "param.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

#define STACKSIZE 4

char *argv1[] = {"test1_admin1"};
char *argv2[] = {"test1_admin2"};

//////////////////////////////////////////
//

char *password = "1234";		// Chnage Password!

//																		
//////////////////////////////////////////
int main() {
	int pid;

	// test1
	pid = fork();

	if(pid == 0) {
		printf(1, "test1. getadmin password test\n");
		printf(1, "In this test, we will see if getadmin() recognizes the password correctly\n");
		if(getadmin("##wrong_password@@") == 0) {
			printf(1, "error! The wrong password is recognized as the correct password\n");
			exit();
		}
		if(getadmin(password) == -1) {
			printf(1, "error! It cannot recognize the correct password\n");
			exit();
		}
		printf(1, "test1 passed!\n\n");
		exit();
	} else if(pid > 0) {
		wait();
	} else {
		printf(1, "fork failed\n");
		exit();
	}
	
	// test2
	pid = fork();
	
	if(pid == 0) {
		printf(1, "test2. getadmin admin mode test\n");
		printf(1, "In this test, we will see whether getadmin can call the functions that we specified\n");
		pid = getpid();
		printf(1, "test as user mode\n");
		if(setmemorylimit(pid, 500000) == 0) {
			printf(1, "error:setmemorylimit called!\n");
			exit();
		}
		exec2(argv1[0], argv1, 10);
		
		printf(1, "test as admin mode\n");
		if(getadmin(password) == -1) {
			printf(1, "get admin failed\n");
			exit();
		}

		if(setmemorylimit(pid, 500000) == -1) {
			printf(1, "error! failed to setmemorylimit\n");
			exit();
		}
		if(exec2(argv2[0], argv2, 10) == -1) {
			printf(1, "error! failed to exec2\n");
		}
		exit();
	} else if(pid > 0) {
		wait();
	} else {
		printf(1, "fork failed\n");
		exit();
	}

	// test3
	pid = fork();

	if(pid == 0) {
		printf(1, "test3. child process mode\n");
		printf(1, "In this test, check whether child processes have admin privileges or not\n");
		if(getadmin(password) == -1) {
			printf(1, "get admin failed\n");
			exit();
		}
		pid = fork();
		if(pid == 0) {
			pid = getpid();
			if(setmemorylimit(pid, 500000) == 0) {
				printf(1, "error:setmemorylimit called!!\n");
				exit();
			} 
			exec2(argv1[0], argv1, 10);
			exit();
		} else if(pid > 0) {
			wait();
		} else {
			printf(1, "fork failed\n");
		}
		printf(1, "test3 passed!\n\n");
		exit();
	} else if(pid > 0) {
		wait();
	} else {
		printf(1, "fork failed\n");
		exit();
	}

	printf(1, "All tests passed!\n");	
	exit();
}
