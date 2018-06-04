
/* Auteur : Raphaël Castanier */

// compilation :  gcc exercice1.c -o prog -Wall -Werror --std=c99

// Exercice 1 : Tube ordinaire

#include <sys/types.h>  // pid_t
#include <unistd.h>     // pipe, fork, read, write
#include <string.h>     // strlen
#include <stdio.h>      // fprintf
#include <stdlib.h>     // exit

int main(int argc, char const *argv[]) {

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
        char* hello = "hello world"; // phrase simple
        write(writeDescriptor, hello, strlen(hello)); // ecriture dans le pipe
        //close(writeDescriptor); // fermeture par le père du descripteur d'ecriture
    }

    // fils : lit le pipe et l'affiche
    if (f==0)
    {
        close(writeDescriptor); // fermeture par le fils du descripteur d'ecriture
        char c;
        while(1) // lecture tant que le pipe contient du contenu
        {
            if(read(readDescriptor, &c, 1)==0) // lecture d'un caractère du pipe
                break;
            fprintf(stdout, "-%c-\n", c); // affichage du caractère
        }
        //close(readDescriptor); // fermeture par le fils du descripteur de lecture
    }

    return EXIT_SUCCESS;
}
