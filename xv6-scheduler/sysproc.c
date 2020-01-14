#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  exit();
  return 0;  // not reached
}

int
sys_wait(void)
{
  return wait();
}

int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return myproc()->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = myproc()->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;

  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(myproc()->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;

  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}
void
sys_print_table(void)
{
#ifdef MLFQ_SCHED	
	print_table();
#elif FCFS_SCHED
#endif
}

void
sys_yield(void)
{
#ifdef MLFQ_SCHED	
	if(myproc()) {
		myproc()->ticks = 0;
	}
#elif FCFS_SCHED
#endif
	yield();
}

int
sys_getlev(void) {
#ifdef MLFQ_SCHED
	return getlev();
#elif FCFS_SCHED
	return 0;
#endif
}


void
sys_setpriority(int pid, int priority) {
#ifdef MLFQ_SCHED
	argint(0, &pid);
	argint(1, &priority);
	setpriority(pid, priority);
#elif FCFS_SCHED
#endif
}

void
sys_monopolize(int password) {
#ifdef MLFQ_SCHED
	argint(0, &password);
	
	monopolize(password);
#elif FCFS_SCHED
#endif
}


