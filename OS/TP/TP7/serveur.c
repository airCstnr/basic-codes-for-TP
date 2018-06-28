
// OS308   : Système d'exploitation
// TP7     : Communication par tube
// Auteur  : CASTANIER Raphaël, RIUS BERNAL Joffrey
// Date    : 11/06/2018
// Compil. : gcc serveur.c -o serveur -Wall -Werror -Wextra --std=c99
// Exercice 2 - Tube Client/Serveur

#include <stdio.h>     // fprintf
#include <stdlib.h>    // exit
#include <errno.h>     // errno
#include <unistd.h>    // unlink
#include <sys/types.h> // mkfifo
#include <sys/stat.h>  // mkfifo
#include <string.h>    // strerror

#define VAL_MAX 1024     // taille du buffer
#define PATH "/tmp/fifo" // nom du tube nommé (path)

int main (int argc, char const *argv[])
{
    // utilisation factice des arguments
    (void)argc;
    (void)argv;

    // suppression du tube s'il existe
    unlink(PATH);

    // création du tube nommé
    if (mkfifo(PATH, 0666) != 0) // droits d'accès : rw-rw-rw-
    {
        fprintf(stderr, "Impossible de creer le tube nommé\n");
        fprintf(stderr, "Erreur : %s\n", strerror(errno));
        exit(EXIT_FAILURE);
    }

    char buf[VAL_MAX]; // créatuon du buffer
    FILE *f = fopen(PATH, "r"); // ouverture du tube

    // lecture du tube
    while (1)
    {
        // si la lecture du tube change de contenu, afficher
        if (fgets(buf, VAL_MAX, f) != NULL)
        {
            printf("%s \n", buf);
        }
    }

    return (EXIT_SUCCESS);
}
