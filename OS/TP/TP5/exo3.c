/*
    OS308 - TP5
    
    Auteurs : Raphaël Castanier, Joffrey Rius Bernal
    
    EXERCICE 3 : 
        Ecrire un programme qui :
        1. Affiche son numéro (pid) via l'appel à getpid()
        2. Traite tous les signaux, sauf SIGUSR1 et SIGUSR2, par une fonction fonc qui se contente
            d'afficher le numéro du signal reçu.
        3. Traite le signal SIGUSR1 par une fonction fonc1 et le signal SIGUSR2 par fonc2 :
            (a) fonc1 affiche le numéro du signal reçu et la liste des utilisateurs de la machine (appel à la
                commande who par system("who"))
            (b) fonc2 affiche le numéro du signal reçu et l'espace disque utilisé sur la machine (appel à la
                commande df . par system("df ."))
    
    Commande de compilation : gcc -o prog exo3.c -Wall -Werror
*/

// Inclusions nécessaires à l'utilisation des fonctions
#include <stdio.h>          // printf
#include <signal.h>         // kill
#include <unistd.h>         // sleep
#include <stdlib.h>         // exit
#include <string.h>         // strsignal
#include <sys/wait.h>       // wait
#include <sys/types.h>      // pid_t

/*************** La fonction fonc **************/
void fonc (int NumSignal)
{
    printf("Signal recu : %d (%s)\n", NumSignal, strsignal(NumSignal));
}

/*************** La fonction fonc1 **************/
void fonc1 (int NumSignal)
{
    fonc(NumSignal); // appelle la fonction par défaut
    system("who");
}

/*************** La fonction fonc2 **************/
void fonc2 (int NumSignal)
{
    fonc(NumSignal); // appelle la fonction par défaut
    system("df .");
}


int main (void)
{
    // PID du programme pour lui envoyer un sigal SIGKILL
    printf("--- PID = %d\n", getpid());
    
    // on remplace toutes les fonctions que l'on peut par func
    int Nb_Sig;
    for(Nb_Sig = 1; Nb_Sig < NSIG ; Nb_Sig ++)
    {
        signal(Nb_Sig, fonc);
    }
    
    // on modifie spécialement SIGUSR1 et SIGUSR2
    signal(SIGUSR1, fonc1);
    signal(SIGUSR2, fonc2);
    
    while (1)
    {
        sleep(5); /* Attendre les signaux */
    } 

    return 0;
}



