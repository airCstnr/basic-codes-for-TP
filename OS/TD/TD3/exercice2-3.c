// Auteurs : Raphaël Castanier
// Compilation :  gcc -o prog exercice2.c

// Déroute le signal SIGINT et compte le nombre d'appels à ce signal

#include <unistd.h>
#include <stdio.h>
#include <signal.h>
#include <stdlib.h>

int nb = 0;

void deroutement(int sig)
{
    // compter le nombre de signaux recus
    // affihe le message "Signal recu n fois"
    // le 5e signal termine le processus
    nb++;
    printf("Signal recu %i fois\n", nb);
    if(nb==5)
    {
        exit(0);
    }
}

int main(void) {
    printf("-- PID %i --\n", getpid());

    signal(SIGINT, deroutement);

    while (1) {
        sleep(1);
    }
    return 0;
}
