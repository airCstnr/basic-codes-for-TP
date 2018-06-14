
#define _GNU_SOURCE

#include <stdlib.h>
#include <stdio.h>
#include <signal.h>
#include <unistd.h>
#include <errno.h>
#include <string.h>
#include <time.h>

#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/sem.h>


void stopProgram(int s) {
	
	exit(0);	
	
}


void lockSem(int semid) {
	// Structure d'action sur le sémaphore
	struct sembuf action[1];
	
	// On bloque notre sémaphore
	action[0].sem_num = 0;
	action[0].sem_op = -1;
	//action[0].sem_flg = IPC_NOWAIT;
	if (semop(semid, action, 1) != -1) {
		//printf("[%04d] Lock\n", getpid());
	} else {
		fprintf(stderr, "LOCK : Erreur de semop !\n");
		fprintf(stderr, "Erreur (%d): %s\n", errno, strerror(errno));
		exit(EXIT_FAILURE);
	}
}


void unlockSem(int semid) {
	// Structure d'action sur le sémaphore
	struct sembuf action[1];
	
	// On libère le sémaphore
	action[0].sem_num = 0;
	action[0].sem_op = 1;
	action[0].sem_flg = 0;
	//printf("[%04d] Unlock\n", getpid());
	if (semop(semid, action, 1) == -1) {
		fprintf(stderr, "UNLOCK : Erreur de semop !\n");
		fprintf(stderr, "Erreur (%d): %s\n", errno, strerror(errno));
		exit(EXIT_FAILURE);
	}
}



int createSem() 
{
	key_t cle;
	int semid;
	int arg = 1;
	
	/*
	if ((cle = ftok(argv[0], 0)) == -1) {
		printf("Erreur de ftok\n");
		exit(10);
	}//*/
	
	if ((semid = semget(IPC_PRIVATE, 1, IPC_CREAT|0666)) == -1) {
		printf("Erreur de semget\n");
		exit(11);
	}
	printf("[%04d] Sémaphore %d de clé 0x%08x créé\n", getpid(), semid, cle);
	
	if (semctl(semid, 0, SETVAL, arg) == -1) {
		printf("Erreur de semctl\n");
		exit(11);
	}
	
	return semid;
}


int main(int argc, char *argv[]) 
{
	int semid = createSem();
	int i;
	char first = 'A';
	
	pid_t p = fork(); 
	if (p == -1) {
		printf("erreur fork()\n");
		exit(1);
	}
	if (p > 0) {
		first = '0';
	}
	
	signal(SIGALRM, stopProgram);
	alarm(1);
	
	while (1) {
	
		lockSem(semid);
		
		printf("[%04d] ", getpid());
		
		// SECTION CRITIQUE
		for (i=0 ; i<10; i++) {
			printf("%c ", first+i);
			fflush(stdout);
		}
		printf("\n");
		
		unlockSem(semid);
		
		usleep(50000);
	
	}
	
	return (0);
}
