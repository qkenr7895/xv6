#include "types.h"
#include "stat.h"
#include "user.h"

int alarm_valid = 0;

void alarm1() {
  alarm_valid = 1;

  printf(1, "alarm!\n");
}

void alarm2() {
  alarm_valid = 1;

  printf(1, "alarm!\n");
  for(int i = 0; i < 25 * 20000000; i++) {
    if((i % 500000) == 0) {
      printf(1, ".");
    }
  }
  printf(1, "alarm end!\n");
}

void alarm3() {
  alarm_valid = 1;

  printf(1, "alarm!\n");
  asm ("mov $3, %eax");
  asm ("mov $111807, %edx");
  asm ("mov $0x44f, %ecx");
  printf(1, "alarm end!\n");
}
  
int foo1(int a, int b, int c) {
  for(int i = 0; i < 100; i++) {
    a += b + c;
  }
  return a;
}

int foo2(int a, int b, int c) {
  int d = b;
  
  for(int i = 0; i < 20; i++) {
    b += c;
  }
  for(int i = 0; i < 5; i++) {
    a += b;
  }
  for(int i = 0; i < 95; i++) {
    a += d;
  }
  return a;
}

int
main(int argc, char *argv[])
{
  
  // alarm test 1 : basic
  printf(1, "alarmtest1\n");

  alarm(5, alarm1);

  for(int i = 0; i < 25 * 5000000; i++) {
    if((i % 250000) == 0)
      write(2, ".", 1);
  }

  if(alarm_valid == 0) {
    printf(1, "error : alarm doesn't work\n");
    exit();
  }
  
  printf(1, "\nalarmtest1 OK\n");
  alarm_valid = 0;
  alarm(-1, alarm1);

  // alarm test 2 : check if it is reenterant or not 
  printf(1, "\nalarmtest2\n");

  alarm(5, alarm2);

  for(int i = 0; i < 25 * 5000000; i++) {
    if((i % 250000) == 0)
      write(2, ".", 1);
  }

  if(alarm_valid == 0) {
    printf(1, "error : alarm doesn't work\n");
    exit();
  }

  printf(1, "\nalarmtest2 OK\n");
  alarm_valid = 0;
  alarm(-1, alarm2);

  // alarm test 3 : check caller saved registers
  printf(1, "\nalarmtest3\n");

  alarm(5, alarm3);

  int result = 0;

  for(int j = 0; j < 1000; j++) {
    for(int i = 0; i < 25 * 5000; i++) {
      int a = foo1(i, 1 + 2 * i, i - 5);
      int b = foo2(i, 1 + 2 * i, i - 5);

      if(a != b) {
        printf(1, "error : caller saved changed\n");
        exit();
      } else if(j > 1000 || i > 125000 || j < 0 || i < 0) {
        printf(1, "error : caller saved changed\n");
        exit();
      } else {
        result += a + b;
      }
    }
  }
    
  printf(1, "result : %d\n", result);

  if(alarm_valid == 0) {
    printf(1, "error : alarm doesn't work\n");
    exit();
  }

  printf(1, "\nalarmtest3 OK\n");
  alarm_valid = 0;
  alarm(-1, alarm3);

  exit();
}

