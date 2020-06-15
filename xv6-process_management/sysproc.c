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

int
sys_getadmin(void)
{
	const char *pwd = "1234";
	char *input_pwd;
	struct proc *p = myproc();

	if(argstr(0, &input_pwd) < 0)
		return -1;

	while(*pwd && *pwd == *input_pwd)
		pwd++, input_pwd++;
	if(((uchar)*pwd - (uchar)*input_pwd) != 0)
		return -1;

	if(!p)
		return -1;

	p->admin = 1;

	return 0;
}

int
sys_exec2(void)
{
	char *path, *argv[MAXARG];
	int i;
	int stacksize;
	uint uargv, uarg;
	struct proc *p = myproc();

	if(!p)
		return -1;

	if(p->admin == 0)
		return -1;

	if(argstr(0, &path) < 0 || argint(1, (int*)&uargv) < 0 || argint(2, &stacksize) < 0)
		return -1;
	if(stacksize < 1 || stacksize > 100)
		return -1;

	memset(argv, 0, sizeof(argv));
	for(i = 0;; i++) {
		if(i >= NELEM(argv))
			return -1;
		if(fetchint(uargv+4*i, (int*)&uarg) < 0)
			return -1;
		if(uarg == 0) {
			argv[i] = 0;
			break;
		}
		if(fetchstr(uarg, &argv[i]) < 0)
			return -1;
	}
	return exec2(path, argv, stacksize);
}

int
sys_setmemorylimit(void)
{
	int pid, limit;
	struct proc *p = myproc();

	if(p == 0)
		return -1;

	if(p->admin == 0) 
		return -1;

	if(argint(0, &pid) < 0 || argint(1, &limit) < 0)
		return -1;

	if(limit < 0)
		return -1;

	return setmemorylimit_proc(pid, limit);
}

char*
sys_getshmem(void)
{
	int pid;
	char *va;
	struct proc *p = myproc();

	if(!p)
		return 0;

	if(argint(0, &pid) < 0)
		return 0;

	va = getshmem_proc(pid);

	if(va == 0)
		return 0;

	/////////////////////////
	//
	//		set permission
	//
	//
	pde_t *pde;
	pde_t *pgtab;
	pde_t *pgdir;
	pte_t *pte;

	pgdir = p->pgdir;
	pde = &pgdir[PDX(va)];
	if(*pde & PTE_P) {
		pgtab = (pte_t*)P2V(PTE_ADDR(*pde));
	} else {
		//cprintf("error at getshmem\n");
		if((pgtab = (pte_t*)kalloc()) == 0) {
			return 0;	
		}
		memset(pgtab, 0, PGSIZE);
		*pde = V2P(pgtab) | PTE_P | PTE_W | PTE_U;
	}
	pte = &pgtab[PTX(va)];
	//*pte = *pte | PTE_P;
	*pte = *pte | PTE_U;
		
	if(pid != p->pid)
		*pte = *pte & ~PTE_W;
	//
	//
	/////////////////////////

	return va;
}

void
sys_list_process(void)
{
	list_process_proc();
}
