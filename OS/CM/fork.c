
/* Auteur : Raphaël Castanier */

// compilation :  gcc fork.c -o prog

#include <stdio.h>     // pour les printf
#include <unistd.h>    // pour le fork
#include <stdlib.h>    // pour le exit
#include <sys/types.h> // pour le type pid_t
#include <sys/wait.h>  // pour le wait

/* Fonction principale qui va se dupliquer en un père et un fils */
int main()
{
	printf("Je suis le processus, avant le fork.\n");

	pid_t p = fork(); // séoaration du processus en un père et un fils

	if( p == -1) // gestion du cas d'erreur
	{
		printf("Erreur de fork!\n");
		return -1;
	}
	else if( p == 0 ) // processus fils
	{
		printf("Je suis le fils!\n");
        exit(0);
	}
	else // processus père, attend que le fils ait fini pour afficher son PID
	{
        int* status;
        wait(status);
		printf("Je suis le père et le PID fils était %d !\n", p);
	}

	return 0;
}
