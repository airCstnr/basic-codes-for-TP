
/* Auteur : Raphaël Castanier */

// compilation :  gcc exercice1.c -o prog -Wall -Werror --std=c11

// Exercice 1 : Le processus ignore tous les signaux


#include <stdio.h>
#include <signal.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/types.h>

int main(void) {

    int Nb_Sig;
    for(Nb_Sig = 1; Nb_Sig < NSIG ; Nb_Sig ++)
    {
        // pour chaque signal du PCB, on remplace le signal par defaut
        // par la fonction SIG_IGN
        sighandler_t s = signal(Nb_Sig, SIG_IGN);
        if(s==SIG_ERR)
        {
            printf("Le signal %s (%i) ne peut pas etre modifie.\n", strsignal(Nb_Sig), Nb_Sig);
        }
    }

    while (1) {
        sleep(5);
    }
    return 0;
}
