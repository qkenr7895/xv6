#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "x86.h"
#include "traps.h"
#include "spinlock.h"

// Interrupt descriptor table (shared by all CPUs).
struct gatedesc idt[256];
extern uint vectors[];  // in vectors.S: array of 256 entry pointers
struct spinlock tickslock;
uint ticks;

// Project2. Scheduler
#ifdef MLFQ_SCHED
const int L0_TICKS = 4;
const int L1_TICKS = 8;
const int TICKS_LIMIT = 100;
uint L1_ticks_by;
enum procqueue queue_mode;

#elif FCFS_SCHED
int wakeup_ps = 0;
const int TICKS_LIMIT = 100;
#endif

void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);

  initlock(&tickslock, "time");
}

void
idtinit(void)
{
  lidt(idt, sizeof(idt));
}

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
		if(myproc()->killed)
      exit();
    myproc()->tf = tf;
    syscall();
    if(myproc()->killed)
      exit();
    return;
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
		if(cpuid() == 0){
      acquire(&tickslock);
      ticks++;
			
#ifdef MLFQ_SCHED
			if(queue_mode == L1) {
				L1_ticks_by++;
			}
			if(myproc()) {
				myproc()->ticks++;
			}
#elif FCFS_SCHED
			if(myproc()) {
				myproc()->ticks++;
			}
#endif
			wakeup(&ticks);
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
            cpuid(), tf->cs, tf->eip);
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(myproc() == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpuid(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
            "eip 0x%x addr 0x%x--kill proc\n",
            myproc()->pid, myproc()->name, tf->trapno,
            tf->err, cpuid(), tf->eip, rcr2());
    myproc()->killed = 1;
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
#ifdef MLFQ_SCHED

	// L1 priority boosting
	if(tf->trapno == T_IRQ0 + IRQ_TIMER && L1_ticks_by > TICKS_LIMIT && queue_mode == L1) {
		L1_ticks_by = 0;
		priority_boosting();
	}

	// L0 scheduling
	if(myproc() && myproc()->state == RUNNING && tf->trapno == T_IRQ0 + IRQ_TIMER
			&& myproc()->queue == L0 && myproc()->ticks > L0_TICKS && queue_mode == L0) {
		myproc()->ticks = 0;
		yield_L0();
	}

	// L1 Scheduling
	if(myproc() && myproc()->state == RUNNING && tf->trapno == T_IRQ0 + IRQ_TIMER
			&& myproc()->queue == L1 && myproc()->ticks > L1_TICKS && queue_mode == L1) {
		myproc()->ticks = 0;
		if(myproc()->priority < 10) {
			myproc()->priority++;
		}
		yield_L1();
	}
#elif FCFS_SCHED
	if(myproc() && myproc()->state == RUNNING &&
		tf->trapno == T_IRQ0+IRQ_TIMER && (myproc()->ticks > TICKS_LIMIT || wakeup_ps > 0)) {
		if(myproc()->ticks > TICKS_LIMIT) {
			kill(myproc()->pid);
		} else {
			wakeup_ps = 0;
			yield();
		}
	}
#endif

  // Check if the process has been killed since we yielded
  if(myproc() && myproc()->killed && (tf->cs&3) == DPL_USER)
    exit();
}
