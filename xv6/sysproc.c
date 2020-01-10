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
	uint sz;

  if(argint(0, &n) < 0)
    return -1;
	
	addr = myproc()->sz;
	myproc()->sz = addr+n;

	if(n < 0) {
		if((sz = deallocuvm(myproc()->pgdir, addr, addr + n)) == 0) 
			return -1;
	}
	
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

int
sys_date(void)
{
	struct rtcdate *r;

	if(argptr(0, (void*)&r, sizeof(*r)) < 0) {
		return -1;
	}
	cmostime(r);
	return 0;
}

// xv6 cpu alarm
// if ticks > 0, every n ticks alarm process
// if ticks == -1, turn off alarm
int
sys_alarm(void)
{
  int ticks;
  void (*handler)();

  if(argint(0, &ticks) < 0)
    return -1;
  if(argptr(1, (char**)&handler, 1) < 0)
    return -1;
  
  if(ticks < -1 || ticks == 0) return -1;
  if(handler == 0) return -1;
  
  if(ticks == -1) {
    myproc()->alarmstate = 0;
  } else {
    myproc()->alarmticks = ticks;
    myproc()->alarmhandler = (uint)handler;
    myproc()->alarmstate = 1;
  }
  
  return 0;
}
