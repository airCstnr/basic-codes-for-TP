// Auteurs : Raphaël Castanier
// Compilation :  gcc -o prog exercice2.c

// Ignore les signaux SIGINT et SIGQUIT

#include <unistd.h>
#include <stdio.h>
#include <signal.h>

int main(void) {
    printf("-- PID %i --\n", getpid());

    signal(SIGINT, SIG_IGN);
    signal(SIGQUIT, SIG_IGN);
    
    while (1) {
        sleep(1);
    }
    return 0;
}
