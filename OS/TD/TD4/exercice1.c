
// OS308   : Système d'exploitation
// TD4     : Communication par tubes
// Auteur  : Raphaël Castanier
// Date    : 04/06/2018
// Compil. :  gcc exercice1.c -o prog -Wall -Werror --std=c99
// Exercice 1 - Tube ordinaire

#include <sys/types.h>  // pid_t
#include <unistd.h>     // pipe, fork, read, write
#include <string.h>     // strlen
#include <stdio.h>      // fprintf, getc
#include <stdlib.h>     // exit

int main() {

    // creation du pipe
    int p[2]; // entrée et sortie du pipe
    if(pipe(p)==-1) exit(EXIT_FAILURE); // creation du pipe et gestion d'erreur

    // entrée et sortie
    int readDescriptor = p[0];
    int writeDescriptor = p[1];

    // fork
    pid_t f = fork();

    if(f==-1)
    {
        close(writeDescriptor); // fermeture par le père du descripteur d'ecriture
        close(readDescriptor); // fermeture par le père du descripteur de lecture
        exit(EXIT_FAILURE); // gestion d'erreur lors du fork
    }

    // père : lit le clavier et place les caractères lus dans le pipe
    if (f!=0)
    {
        close(readDescriptor); // fermeture par le père du descripteur de lecture
        char contenu;
        while(1)
        {
            contenu = getc(stdin); // lecture de caractère depuis l'entrée standard
            write(writeDescriptor, &contenu, 1); // ecriture dans le pipe
        }
        close(writeDescriptor); // fermeture par le père du descripteur d'ecriture
    }

    // fils : lit le pipe et l'affiche
    if (f==0)
    {
        close(writeDescriptor); // fermeture par le fils du descripteur d'ecriture
        char c;
        while(1) // lecture tant que le pipe contient du contenu
        {
            if(read(readDescriptor, &c, 1)<1)   // lecture d'un caractère du pipe
                break;                          // sortie si plus rien à lire
            if(c!='\n')                         // eviter le retour à la ligne
                fprintf(stdout, "-%c-\n", c);   // affichage du caractère
        }
        close(readDescriptor); // fermeture par le fils du descripteur de lecture
    }

    return EXIT_SUCCESS;
}
