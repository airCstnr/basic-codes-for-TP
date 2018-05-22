/*
Auteur : Raphaël Castanier
Commande de compilation : gcc -o prog td2.c -std=c11 -Wall -Werror

TD2 - Gestion des processus

Exercice 1 :
Ecrire un programme C qui permet à un processus de créer 2 processus fils. Les processus fils
effectuent le traitement suivant :
- affichage d’un message indiquant qu’ils sont les fils et précisant leur PID,
- temporisation avec la fonction unsigned int sleep(unsigned int seconds)
de la bibliothèque unistd.h, puis fin.
Le processus père effectue le traitement suivant :
- affichage d’un message indiquant qu’il est le père et précisant son PID,
- attente de la terminaison du premier fils crée,
- affichage d’un message indiquant le réveil du père après la terminaison de son fils,
puis fin.

Exercice 4 :
Ecrire un programme C qui permet à un processus de créer dix processus fils. Chaque
processus fils affiche le double de la valeur de son PID à l’écran et se termine.
*/

#include <stdio.h>      // printf
#include <stdlib.h>     // exit
#include <unistd.h>     // getpid, sleep
#include <sys/wait.h>   // wait
#include <sys/types.h>  // pid_t

void traitementFils()
{
    printf("Je suis le fils. PID : %i\n", getpid());
    sleep(4);
}

void exercice1()
{
    // premier fork
    pid_t p1 = fork();
    if (p1 == -1) { exit(EXIT_FAILURE); }

    // si c'est le père, refaire un fork
    if (p1 != 0) {
        pid_t p2 = fork();
        if (p2 == -1) { exit(EXIT_FAILURE); }

        // si c'est le père, afficher un message, attendre le premier fils, indiquer le réveil et finir
        if (p2 != 0) {
            printf("Je suis le père. PID : %i\n", getpid());
            p1 = wait(&p1);
            printf("Mon fils %i a terminé.\n", p1);
        }
        else {
            traitementFils();
        }
    }
    else {
        traitementFils();
    }
    exit(EXIT_SUCCESS);
}

void exercice4()
{
    pid_t p = 1;
    int i;
    for (i = 0; i < 10; i++) {
        // il n'y a que le père qui puisse créer des fils
        if(p!=0) {
            p = fork(); // le père fork
        }
        else {
            break; // un fils sort fissa de la boucle
            /* Note : Cette méthode n'est peu-être pas un bon exemple pour la jeunesse,
             car on ne doit pas (de manière générale) faire de break dans une boucle.
             Ici, chaque fils doit sortir de la boucle, car il ne doit s'exécuter qu'une fois.
             Cela permet une économie de 9!-1 passages dans la boucle. */
        }
    }

    // seuls les fils doivent afficher ce message
    if (p == 0) {
        printf("Fils %i\tPID : %i\t2*PID : %i\n", i, getpid(), 2*getpid());
    }

    exit(EXIT_SUCCESS);
}

int main(int argc, char const *argv[])
{
    // exercice1();
    exercice4();
    return 0;
}
