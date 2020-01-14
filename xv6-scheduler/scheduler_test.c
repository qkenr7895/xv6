#include "types.h"
#include "stat.h"
#include "user.h"

int 
main(int argc, char *argv[]) {
	printf(1, "Before Sleeping\n");

	sleep(1);

	printf(1, "After Sleeping\n");

}
