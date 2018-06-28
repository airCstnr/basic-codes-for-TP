/*
    OS308 - TP5
    
    Auteurs : Raphaël Castanier, Joffrey Rius Bernal
    
    EXERCICE 1 : Ecrire un programme qui ignore TOUS les signaux.
    
    Commande de compilation : gcc -o prog exo1.c -Wall -Werror
*/

// Inclusions nécessaires à l'utilisation des fonctions
#include <stdio.h>          // printf
#include <signal.h>         // signal
#include <string.h>         // strsignal
#include <unistd.h>         // sleep

typedef void (*sighandler_t)(int);

int main(void)
{
    // PID du programme pour lui envoyer un sigal SIGKILL
    printf("--- PID = %d\n", getpid());
    
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
    
    /* Attendre des signaux */
    while(1)
    {
        sleep(5);
    }
    return 0;
}