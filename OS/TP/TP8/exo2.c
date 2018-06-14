
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
#include <sys/shm.h>
#include <sys/wait.h>

pid_t parentPID;
int semid;
int shmid;
void *value = NULL;

void stopProgram(int s) {
	if (getpid() == parentPID) {
		wait(NULL); // On attend le fils
		
		printf("Fermeture sémaphore %d\n", semid);
		if (semctl(semid, 0, IPC_RMID) == -1) {
			fprintf(stderr, "Erreur de fermeture du sémaphore !\n");
			fprintf(stderr, "Erreur (%d): %s\n", errno, strerror(errno));
		}
		
		printf("Fermeture mémoire %d\n", shmid);
		if (shmdt(value) == -1) {
			fprintf(stderr, "Erreur de détachement de la mémoire !\n");
			fprintf(stderr, "Erreur (%d): %s\n", errno, strerror(errno));
		}
		if (shmctl(shmid, IPC_RMID, NULL) == -1) {
			fprintf(stderr, "Erreur de fermeture de la mémoire !\n");
			fprintf(stderr, "Erreur (%d): %s\n", errno, strerror(errno));
		}
	}
	
	exit(0);
	
}


void lockSem() {
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


void unlockSem() {
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
	key_t cle = IPC_PRIVATE;
	int arg = 1;
	
	/*
	if ((cle = ftok(argv[0], 0)) == -1) {
		printf("Erreur de ftok\n");
		exit(10);
	}//*/
	
	if ((semid = semget(cle, 1, IPC_CREAT|0666)) == -1) {
		fprintf(stderr, "Erreur de semget\n");
		fprintf(stderr, "Erreur (%d): %s\n", errno, strerror(errno));
		exit(EXIT_FAILURE);
	}
	printf("[%04d] Sémaphore %d de clé 0x%08x créé\n", getpid(), semid, cle);
	
	if (semctl(semid, 0, SETVAL, arg) == -1) {
		fprintf(stderr, "Erreur de semctl\n");
		fprintf(stderr, "Erreur (%d): %s\n", errno, strerror(errno));
		exit(EXIT_FAILURE);
	}
	
	return semid;
}

void *createShm(size_t size) 
{
	key_t cle = IPC_PRIVATE;
	
	/*
	if ((cle = ftok(argv[0], 0)) == -1) {
		printf("Erreur de ftok\n");
		exit(10);
	}//*/
	
	if ((shmid = shmget(cle, 1, IPC_CREAT|0666)) == -1) {
		fprintf(stderr, "Erreur de shmget\n");
		fprintf(stderr, "Erreur (%d): %s\n", errno, strerror(errno));
		exit(EXIT_FAILURE);
	}
	printf("[%04d] Mémoire %d de clé 0x%08x créée\n", getpid(), shmid, cle);
	
	if (*(int*)(value = shmat(shmid, NULL, 0)) == -1) {
		fprintf(stderr, "Erreur de shmat\n");
		fprintf(stderr, "Erreur (%d): %s\n", errno, strerror(errno));
		exit(EXIT_FAILURE);
	}
	
	return value;
}


int main(int argc, char *argv[]) 
{
	createSem();
	int *val = (int*) createShm(sizeof(int));
	int i;
	
	parentPID = getpid();
	pid_t p = fork(); 
	if (p == -1) {
		fprintf(stderr, "Erreur de fork\n");
		fprintf(stderr, "Erreur (%d): %s\n", errno, strerror(errno));
		exit(1);
	}
	
	signal(SIGALRM, stopProgram);
	alarm(1);
	
	while (1) {
	
		lockSem(semid);
		
		printf("[%04d] ", getpid());
		
		// SECTION CRITIQUE
		for (i=0 ; i<10; i++) {
			*val += 1;
			
			printf("%3i ", *val);
			fflush(stdout);
		}
		printf("\n");
		
		unlockSem(semid);
		
		usleep(50000);
	
	}
	
	return (0);
}
