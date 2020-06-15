#include "param.h"
#include "types.h"
#include "stat.h"
#include "user.h"
#include "fs.h"
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

#define BUFSIZE 1024

int getcmd(char *buf, int nbuf);
char *argv[10];
char *password = "1234";

int
main() 
{
	char buf[BUFSIZE];
	int fd;

	while((fd = open("console", O_RDWR)) >= 0) {
		if(fd >= 3) {
			close(fd);
			break;
		}
	}
	
	if(getadmin(password) == -1) {
		printf(1, "get admin failed\n");
		exit();
	}

	while(getcmd(buf, sizeof(buf)) >= 0) {
		// exit
		if(buf[0] == 'e' && buf[1] == 'x' && 
				buf[2] == 'i' && buf[3] == 't' && 
				(buf[4] == ' ' || buf[4] == '\n')) {
			break;
		} 
		// list
		else if(buf[0] == 'l' && buf[1] == 'i' && 
				buf[2] == 's' && buf[3] == 't' && 
				(buf[4] == ' ' || buf[4] == '\n')) {
			list_process();
		} 
		// kill
		else if(buf[0] == 'k' && buf[1] == 'i' && 
				buf[2] == 'l' && buf[3] == 'l' && 
				buf[4] == ' ') {
			int index = 5;
			int pid = 0;

			if(buf[index] == ' ' || buf[index] == '\n') {
				printf(1, "Usage: kill <integer_number>\n");
				continue;
			}

			while(48 <= buf[index] && buf[index] <= 57) {
				pid = pid * 10;
				pid += buf[index] - 48;
				index++;
			}
			if(buf[index] != ' ' && buf[index] != '\n') {
				printf(1, "Usage: kill <integer_number>\n");
				continue;
			}

			if(kill(pid) == -1) {
				printf(1, "failed to kill\n");
			} else {
				printf(1, "kill success\n");
			}
		} 
		// execute
		else if(buf[0] == 'e' && buf[1] == 'x' && 
				buf[2] == 'e' && buf[3] == 'c' && 
				buf[4] == 'u' && buf[5] == 't' && 
				buf[6] == 'e' && buf[7] == ' ') {
			int index = 8;
			int stacksize = 0;
			int pid;
			char path[BUFSIZE];
		
			int path_index = 0;
			while(buf[index] != ' ' && buf[index] != '\n') {
				if(index > 40) {
					buf[index] = '\n';
					break;
				}				
				path[path_index] = buf[index];
				path_index++;
				index++;
				path[path_index] = '\0';
			}
			argv[0] = path;
			argv[1] = 0;
			if(buf[index] == '\n') {
				printf(1, "Usage: execute <path> <stacksize>\n");
				continue;
			}
			index++;
			if(buf[index] == ' ' || buf[index] == '\n') {
				printf(1, "Usage: execute <path> <stacksize>\n");
				continue;
			}

			while(48 <= buf[index] && buf[index] <= 57) {
				stacksize *= 10;
				stacksize += buf[index] - 48;
				index++;
			}
			if(buf[index] != ' ' && buf[index] != '\n') {
				printf(1, "Usage: execute <path> <stacksize>\n");
				continue;
			}
			pid = fork();

			if(pid == 0) {
				pid = fork();
				if(pid == 0) {
					if(getadmin(password) == -1) {
						printf(1, "get admin failed\n");
						exit();
					}
					exec2(argv[0], argv, stacksize);
					printf(1, "failed to exec\n");
				} else if(pid < 0) {
					printf(1, "fork failed\n");
				}
				exit();
			} else if(pid > 0) {
				wait();
			} else {
				printf(1, "failed to fork\n");
			}
		} 
		// memlim
		else if(buf[0] == 'm' && buf[1] == 'e' && 
				buf[2] == 'm' && buf[3] == 'l' && 
				buf[4] == 'i' && buf[5] == 'm' &&
				buf[6] == ' ') {
			int index = 7;
			int memsize = 0;
			int pid = 0;

			if(buf[index] == ' ' || buf[index] == '\n') {
				printf(1, "Usage: memlim <pid> <limit>\n");
				continue;
			}
			while(48 <= buf[index] && buf[index] <= 57) {
				pid *= 10;
				pid += buf[index] - 48;
				index++;
			}
			if(buf[index] != ' ') {
				printf(1, "usage: memlim <pid> <limit>\n");
				continue;
			}
			index++;	
	
			if(buf[index] == ' ' || buf[index] == '\n') {
				printf(1, "Usage: memlim <pid> <limit>\n");
				continue;
			}
			while(48 <= buf[index] && buf[index] <= 57) {
				memsize *= 10;
				memsize += buf[index] - 48;
				index++;
			}
			if(buf[index] != ' ' && buf[index] != '\n') {
				printf(1, "usage: memlim <pid> <limit>\n");
				continue;
			}
			if(setmemorylimit(pid, memsize) == -1) {
				printf(1, "failed to set memory limit\n");
			} else {
				printf(1, "set memory limit success\n");
			}		
		} 
		// no input
		else if(buf[0] == '\n') {
		}
		// wrong input
		else {
			printf(1, "command not found\n");
		}
	}
	exit();
}


int
getcmd(char *buf, int nbuf)
{
	printf(2, "process manager>> ");
	memset(buf, 0, nbuf);
	gets(buf, nbuf);
	if(buf[0] == 0)
		return -1;
	return 0;
}
