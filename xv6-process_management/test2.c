#include "param.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

char *argv[] = {"p2_stack_test"};
char *password = "1234";

int main() {
	int pid;

	printf(1, "exec2 test\n");
	printf(1, "stack size : 1\n");
	printf(1, "recursion depth goes to 3\n");

	pid = fork();
	
	if(pid == 0) {
		if(getadmin(password) == -1) {
			printf(1, "getadmin failed\n");
			exit();
		}
		exec2(argv[0], argv, 1);
		printf(1, "failed to exec\n");
		exit();
	} else if (pid > 0) {
		wait();
	} else {
		printf(1, "fork failed\n");
	}

	printf(1, "\n\n");
	printf(1, "stack size : 5\n");
	printf(1, "recursion depth goes to 19\n");
	pid = fork();
	
	if(pid == 0) {
		if(getadmin(password) == -1) {
			printf(1, "getadmin failed\n");
			exit();
		}
		exec2(argv[0], argv, 5);
		printf(1, "failed to exec\n");
		exit();
	} else if (pid > 0) {
		wait();
	} else {
		printf(1, "fork failed\n");
	}

	printf(1, "\n\n");
	printf(1, "stack size : 10\n");
	printf(1, "recursion depth goes to 39\n");
	pid = fork();
	
	if(pid == 0) {
		if(getadmin(password) == -1) {
			printf(1, "getadmin failed\n");
			exit();
		}
		exec2(argv[0], argv, 10);
		printf(1, "failed to exec\n");
		exit();
	} else if (pid > 0) {
		wait();
	} else {
		printf(1, "fork failed\n");
	}
	exit();
}
