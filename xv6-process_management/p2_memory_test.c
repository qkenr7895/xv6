#include "types.h"
#include "stat.h"
#include "user.h"

#define N 4096
#define LIMIT 50000

int main(int argc, char *argv[])
{
  int total = 0;
  int pid = getpid();

	if(getadmin("1234") == -1) {
		printf(1, "get admin failed\n");
		exit();
	}

	if(setmemorylimit(pid, LIMIT) == -1){
		printf(1, "memory set failed\n");	
		exit();
	}  
  printf(1, "Memory test: pid is %d\n", pid);
  for (;;)
  {
    if (malloc(N) == 0)
    {
      printf(1, "Memory allocation failed.\n");
      exit();
    }
    total += N;
    printf(1, "Memory allocated: %d bytes\n", total);
    sleep(100);
  }
  exit();
  return 0;
}

