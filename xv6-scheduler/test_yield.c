#include "types.h"
#include "stat.h"
#include "user.h"

const int size = 100;

int
main(int argc, char *argv[]) {
	int pid;
	int index;
	printf(1, "----------------Before Yield-----------------\n");
	for(index = 0; index < 5; index++) {
		pid = fork();
		if(pid == 0) {
			break;
		}
	}
	if(pid > 0) {
		timer_hold();	
		timer_release();
	}

	if(pid < 0) {
		printf(1, "fork failed\n");
		return -1;
	}

	for(int i = 0; i < size; i++) {
		if(pid == 0) {
			printf(1, "%dChild[%d]\n", i, index);
		} else if(pid > 0) {
			printf(1, "%dParent\n", i);
		}
	}
	if(pid == 0) {
		return 0;
	} else if(pid > 0) {
		for(index = 0; index < 5; index++) {
			wait();
		}
		timer_hold();
		timer_release();
	}
	/*
	printf(1, "----------------After Yield--------------------\n");

	pid = fork();

	if(pid < 0) {
		printf(1, "fork failed\n");
		return -1;
	}

	for(int i = 0; i < size; i++) {
		if(pid == 0) {
			printf(1, "Child\n");
			scyield();
		} else if(pid > 0) {
			printf(1, "Parent\n");
			scyield();
		}
	}
	
	if(pid > 0) {
		wait();
	} else if(pid == 0) {
		return 0;
	}

	printf(1, "------------------After hold----------------------\n");

	pid = fork();

	if(pid < 0) {
		printf(1, "fork failed\n");
		return -1;
	}

	for(int i = 0; i < size; i++) {
		if(pid == 0) {
			timer_hold();
			printf(1, "Child\n");
			timer_release();
			scyield();
		} else if(pid > 0) {
			timer_hold();
			printf(1, "Parent\n");
			timer_release();
			scyield();
		}
	}
	if(pid > 0) {
		wait();
	}
	*/
}
