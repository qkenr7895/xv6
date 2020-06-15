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
#define TIME_INTERVAL 100

int main(int argc, char *argv[]) {
	int getshmem_pid = atoi(argv[1]);
	int *va = (int*)getshmem(getshmem_pid);

	if(*va != KEY1) {
		printf(1, "error! failed to read shared memory\n");
		exit();
	}
	printf(1, "passed1\n");
	sleep(TIME_INTERVAL * 10);
	if(*va != KEY2) {
		printf(1, "error! failed to read shared memory\n");
	}
	printf(1, "passed2\n");
	exit();
}

