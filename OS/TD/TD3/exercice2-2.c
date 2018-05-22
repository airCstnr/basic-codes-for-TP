// Auteurs : Raphaël Castanier
// Compilation :  gcc -o prog exercice2.c

// Déroute le signal SIGINT

#include <unistd.h>
#include <stdio.h>
#include <signal.h>

void deroutement(int sig)
{
    printf("Signal recu : %i\n", sig);
}

int main(void) {
    printf("-- PID %i --\n", getpid());

    signal(SIGINT, deroutement);

    while (1) {
        sleep(1);
    }
    return 0;
}
