// Auteurs : Raphaël Castanier
// Compilation :  gcc -o prog exercice1.c

#include <unistd.h>
#include <stdio.h>
#include <signal.h>

int main(void) {
    printf("-- PID %i --\n", getpid());
    int nb_sig;

    for (size_t i = 0; i < NSIG; i++) {
        if(signal(i, SIG_DFL)==SIG_ERR)
        {
            printf("Impossible de remplacer le signal %i\n", (int)i);
        }
    }
    while (1) {
        sleep(1);
    }
    return 0;
}
