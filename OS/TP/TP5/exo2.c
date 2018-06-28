/*
    OS308 - TP5
    
    Auteurs : Raphaël Castanier, Joffrey Rius Bernal
    
    EXERCICE 2 : 
        Ecrire un programme qui génère deux processus, père et fils. Le fils se met dans une boucle d'attente.
        Après 5 secondes, le père lui envoie le signal SIGINT pour l'arrêter. A la réception, le fils attend 2
        secondes et s'arrête. Le père attend la fin du fils avant de s'arrêter lui aussi.
    
    Commande de compilation : gcc -o prog exo2.c -Wall -Werror
*/


// Inclusions nécessaires à l'utilisation des fonctions
#include <stdio.h>          // printf
#include <signal.h>         // kill
#include <unistd.h>         // sleep
#include <stdlib.h>         // exit
#include <sys/wait.h>       // wait
#include <sys/types.h>      // pid_t


/* Fonction de fin du fils */
void finDuFils(int sig)
{
    if(sig==SIGINT)
    {
        printf("Fils : Je vais m'arreter dans 2 secondes.\n");
        sleep(2);
        exit(0);
    }
}

int main(void)
{
    // PID du programme pour lui envoyer un sigal SIGKILL
    printf("--- PID = %d\n", getpid());
    
    pid_t val= fork(); // création du fils
    
    switch(val)
    {
        case 0 : // fils
            signal(SIGINT, finDuFils); // modification du fils pour qu'il réagisse au signal de son père.
            printf("Fils : Je vais aller dormir\n");
            while(1)
            {
                sleep(1);
            }
            break;

        case -1 : // erreur
            printf("Erreur lors du fork\n");
            break;
            
        default : // père
            sleep(5);
            printf("Pere : J'envoie le signal d'interruption a mon fils.\n");
            kill(val, SIGINT); // envoi du signal d'interruption au fils
            printf("Pere : J'attends mon fils\n");
            wait(NULL); // attente du fils
            printf("Pere : Mon fils a terminé, je vais terminer aussi.\n");
    }
    return 0;
}