#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main (void)
{
	int retour_fork1;
  int retour_fork2;
	printf("PID \t PPID \t INSTRUCTION \t RETOUR-FORK\n");
	printf("%d \t %d \t print 1 \t \n", (int)getpid(), (int)getppid());
  retour_fork1 = fork();
  printf("%d \t %d \t print 2 \t %d \n", (int)getpid(), (int)getppid(), retour_fork1);
  retour_fork2 = fork();
  printf("%d \t %d \t print 3 \t %d \n", (int)getpid(), (int)getppid(), retour_fork2);
  return 0;
}
