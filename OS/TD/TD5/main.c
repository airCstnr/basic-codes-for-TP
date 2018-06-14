
#define _GNU_SOURCE

#include<stdlib.h>
#include<stdio.h>
#include<signal.h>

#include<sys/types.h>
#include<sys/ipc.h>
#include<sys/sem.h>


// definition du sembuf
struct sembuf buf;

void stopProgram(int s) {

    exit(0);

}


void lockSem(int semid) {
    // prise du semaphore

    buf.sem_num =  0;
    buf.sem_op  = -1;
    buf.sem_flg =  0;

    semop(semid, &buf, 1);
}


void unlockSem(int semid) {
    // relachement du semaphore

    buf.sem_num =  0;
    buf.sem_op  =  1;
    buf.sem_flg =  0;

    semop(semid, &buf, 1);
}



int createSem()
{
    key_t cle;
    int semid;
    int arg = 1;

    /*if ((cle = ftok(argv[0], 0)) == -1) {
        printf("Erreur de ftok\n");
        exit(10);
    }//*/

    if ((semid = semget(IPC_PRIVATE, 1, IPC_CREAT|0666)) == -1) {
        printf("Erreur de semget\n");
        exit(11);
    }
    printf("Sémaphore %d de cle %x cree \n", semid, cle);

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
    if (p) {
        first = '0';
    }

    signal(SIGALRM, stopProgram);
    alarm(1);

    while (1) {



        lockSem(semid);

        // SECTION CRITIQUE
        for (i=0 ; i<10; i++) {
            printf("%c ", first+i);
            fflush(stdout);
        }
        printf("\n");


        unlockSem(semid);

    }



    return (0);
}
