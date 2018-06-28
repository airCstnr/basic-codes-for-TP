
// OS308   : Système d'exploitation
// TP7     : Communication par tube
// Auteur  : CASTANIER Raphaël, RIUS BERNAL Joffrey
// Date    : 07/06/2018
// Compil. : gcc exo1.c -o prog -Wall -Werror -Wextra --std=c99
// Exercice 1 - Tube ordinaire


#include <sys/types.h>  // pid_t
#include <unistd.h>     // pipe, fork, read, write
#include <string.h>     // strlen
#include <stdio.h>      // fprintf, getc
#include <stdlib.h>     // exit

#define VAL_MAX 1024    // taille du buffer

int main (void)
{
    // creation du pipe
    int p1[2];
    int p2[2];
    if (pipe(p1) == -1) goto error;
    if (pipe(p2) == -1) goto error;

    // descripteurs
    int readDescriptor1  = p1[0];
    int writeDescriptor1 = p1[1];
    int readDescriptor2  = p2[0];
    int writeDescriptor2 = p2[1];

    // fork
    pid_t fils1 = fork();
    if (fils1 == -1) goto error;

    // Fils1
    if (fils1 == 0)
    {
        // fermeture des descripteurs inutilisés
        close(readDescriptor1); 
        close(readDescriptor2); 
        close(writeDescriptor2);

        char* message1 = "Je suis le premier fils";
        write(writeDescriptor1, message1, strlen(message1)+1); // +1 pour le caractère de fin de chaine

        close(writeDescriptor1);  // fermeture par le fils du descripteur d'ecriture
    }

    // Pere
    if (fils1 != 0) 
    {
        // fork
        pid_t fils2 = fork();
        if (fils2 == -1) goto error;

        // Fils2
        if (fils2 == 0) 
        {
            // fermeture des descripteurs inutilisés
            close(readDescriptor2); 
            close(readDescriptor1); 
            close(writeDescriptor1);

            char* message2 = "Je suis le deuxieme fils";
            write(writeDescriptor2, message2, strlen(message2)+1); // +1 pour le caractère de fin de chaine

            close(writeDescriptor2);  // fermeture par le fils du descripteur d'ecriture
        }

        // Pere
        else 
        {
            // fermeture des descripteurs inutilisés
            close(writeDescriptor1);
            close(writeDescriptor2);

            // buffers
            char contenu1[VAL_MAX];
            char contenu2[VAL_MAX];

            // lecture de tubes et gestion d'erreur
            if (read(readDescriptor1, contenu1, VAL_MAX) == 0) goto error;
            if (read(readDescriptor2, contenu2, VAL_MAX) == 0) goto error;

            // affichage du contenu lu
            printf("%s\n", contenu1);
            printf("%s\n", contenu2);

            // fermeture des descripteurs de lecture
            close(readDescriptor1);
            close(readDescriptor2);
        }
    }

    return EXIT_SUCCESS;

    // gestion de la fermeture des tubes en cas d'erreur
    error:
        close(writeDescriptor1);
        close(writeDescriptor2);
        close(readDescriptor1);
        close(readDescriptor2);
        exit(EXIT_FAILURE);
}