
// OS308   : Système d'exploitation
// TP7     : Communication par tube
// Auteur  : CASTANIER Raphaël, RIUS BERNAL Joffrey
// Date    : 11/06/2018
// Compil. : gcc client.c -o client -Wall -Werror -Wextra --std=c99
// Exercice 2 - Tube Client/Serveur

#include <stdio.h>   // fopen, fputs
#include <stdlib.h>  // exit

#define PATH "/tmp/fifo" // nom du tube nommé (path)
#define VAL_MAX 1024     // taille du buffer

int main (int argc, char const *argv[])
{
    // ouverture du tube
    FILE *f = fopen(PATH, "w");

    // gestion d'erreur
    if (f == NULL)
    {
        exit(EXIT_FAILURE);
    }
    else
    {
        // ecriture des arguements dans le tube
        for (int i=1; i<argc; i++)
        {
            if (fputs(argv[i], f) == EOF)
            {
                printf("Erreur d'ecriture\n");
                exit(EXIT_FAILURE);
            }
            fputs(" ", f); // ajout d'un espace entre chaque argument
        }
    }

    return (EXIT_SUCCESS);
}
