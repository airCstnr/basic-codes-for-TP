// Auteurs : Raphaël Castanier
// Compilation :  gcc -o prog exercice2.c

// Appels à SIGUSR

#include <unistd.h>
#include <stdio.h>
#include <signal.h>
#include <stdlib.h>
#include <sys/wait.h>


int main(void) {
    printf("-- PID %i --\n", getpid());

    // créer un processus fils
    pid_t p = fork();

    if(p != 0) // père
    {
        printf("Père %i\n", getpid());
        // vérifier l'existence du fils
        if(kill(p, 0)!=0)
        {
            printf("Le fils n'existe pas!\n");
            exit(1);
        }

        // envoyer le signal SIGUSR1 à son fils
        kill(p, SIGUSR1);

        // attendre le fils et récupérer son statut
        int ret;
        wait(&ret);
        printf("Le fils a fini avec le code %i\n", WEXITSTATUS(ret));
    }
    else if(p == 0) // fils
    {
        printf("Fils %i\n", getpid());
        while (1)
        {
            sleep(1);
        }
    }
    else
    {
        printf("ERROR\n");
        exit(1);
    }
    return 0;
}
