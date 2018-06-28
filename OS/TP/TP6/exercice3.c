
// OS308   : Système d'exploitation
// TP6     : Manipulation des signaux
// Auteurs : Raphaël Castanier, Joffrey Ruis Bernal
// Date    : 03/06/2018
// Compil. : gcc -o prog -Wall -Werror exercice3.c --std=c99
// Exercice 3 - Roulette russe

// see : https://stackoverflow.com/a/9994993
#define _POSIX_SOURCE        // pour éviter "error: implicit declaration of function ‘kill’"

#include <stdio.h>           // printf
#include <sys/types.h>       // pid_t, SIG_
#include <unistd.h>          // getpid, fork, getppid
#include <signal.h>          // signal, kill
#include <assert.h>          // assert
#include <string.h>          // strcpy, strlen
#include <stdlib.h>          // atoi, srand, rand
#include <time.h>            // time

#include "annexe.h"          // lire_valeur, ecrire_valeur (annexe donnée dans le sujet)

#define NB_FILS 6            // nombre de fils
#define FILENAME "barillet"  // nom du fichier barillet

int num_fils;                // numero du fils
pid_t fils[NB_FILS] = {0};   // tableau pour conserver les NB_FILS PID fils

// ---------- SIGNAUX ------------
// FILS :
//      SIGUSR1 = jouer (à la roulette)
//      SIGUSR2 = finir (et s'enfuir)
// PERE :
//      SIGUSR1 = ignorer
//      SIGUSR2 = liberer (les enfants)
//      SIGCHLD = liberer (les enfants)


// --------- jouer -----------
void jouer(int sig)
{
    int balle = lire_valeur(FILENAME);   // lecture du barillet
    printf("[%d] Fils %i : balle lue : %i\n", getpid(), num_fils, balle);
    if(balle==num_fils)                  // perte d'espoir
    {
        printf("[%d] Fils %i : Argl\n", getpid(), balle);
        kill(getppid(), SIGUSR2);        // signalement au père
        exit(EXIT_FAILURE);              // mort pour cause de décès
    }
    else
    {
        kill(getppid(), SIGUSR1); // retour de l'espoir et signalement au père (inutile mais demandé)
    }
}

// --------- liberer -----------
void liberer(int sig)
{
    printf("[%d] Pere : fini de jouer!\n", getpid());
    for (int i = 0; i < NB_FILS; i++)
    {
        kill(fils[i], SIGUSR2); // liberer les fils
    }
    exit(EXIT_SUCCESS); // fin heureuse
}

// --------- finir -----------
void finir(int sig)
{
    printf("[%d] Fils %i : je me rejouis et je m'enfuis\n", getpid(), num_fils);
    exit(EXIT_SUCCESS); // fin heureuse
}

// --------- main -----------
int main(void)
{
    printf("[%d] --- Exercice 3 ---\n", getpid());

    srand(time(NULL));                // initialisation de rand
    int valeur = rand()%NB_FILS+1;    // valeur aléatoire comprise entre 1 et NB_FILS
    ecrire_valeur(FILENAME, valeur);  // remplissage initial du barillet

    // comportements fils
    if(signal(SIGUSR1, jouer)==SIG_ERR) assert(0); // fonction appelée lors d'un appel du père (avec assertion)
    if(signal(SIGUSR2, finir)==SIG_ERR) assert(0); // fonction appelée lors d'un appel du père (avec assertion)

    pid_t f=1; // initialisation du retour de fork pour le père

    // création de NB_FILS fils
    for (int i = 0; i < NB_FILS; i++)
    {
        if(f==0) break;  // un fils ne doit pas lui-même avoir un fils
        f = fork();      // le père crée un autre fils
        fils[i] = f;     // sauvegarde du PID fils
        num_fils = i+1;  // sauvegarde du numero de fils
    }

    if (f != 0) // père
    {
        num_fils = 0;

        // comportements père
        if(signal(SIGUSR1, SIG_IGN)==SIG_ERR) assert(0);
        if(signal(SIGUSR2, SIG_IGN)==SIG_ERR) assert(0);
        if(signal(SIGCHLD, liberer)==SIG_ERR) assert(0);

        printf("[%d] Pere : Jouons ensemble!\n", getpid());
        for (int i = 0; i < NB_FILS; i++)
        {
            kill(fils[i], SIGUSR1);
            sleep(1);
        }
    }
    else // fils
    {
        // un fils s'endort en attendant d'être appelé par le père (jouer ou finir)
        while (1)
        {
            sleep(1);
        }
    }

    return 0;
}
