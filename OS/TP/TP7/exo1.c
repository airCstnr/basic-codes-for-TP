#include <stdio.h>
#include <stdlib.h>
#include <unistd.h> // Pour fork()
#include <string.h> // Pour strlen()
#include <sys/types.h> // Pour pid_t
#include <sys/wait.h> // Pour waitpid()

#define BUFFER_SIZE 256

/**
 * Ce programme créé deux fils qui écrivent un message dans un pipe.
 * Le père écoute sur les deux pipes et affiche les messages reçus.
 * Author : Gaëtan CHOMLAFEL <gaetan.chomlafel@etu.esisar.grenoble-inp.fr>
 * Author : Ivan ROGER <ivan.bob.emile@gmail.com>
 * Date : 2018-10-11
 */
int main(void) {

	int p1[2], p2[2]; // Descripteurs des pipes

 	char buffer[BUFFER_SIZE] = {0};

	// Création des pipes
	if (pipe(p1) == -1) {
    fprintf(stderr, "Impossible de créer le premier pipe !\n");
    exit(EXIT_FAILURE);
  }

	if (pipe(p2) == -1) {
    fprintf(stderr, "Impossible de créer le second pipe !\n");
    exit(EXIT_FAILURE);
  }

	pid_t pid = fork(); // On créé le premier fils

	if(pid > 0 ) {
		// Père

		pid_t pid2 = fork(); /* On créé le deuxième fils */

		if (pid2 > 0) {
			// Père

			// Fermeture des descripteurs d'écriture
			close(p1[1]);
			close(p2[1]);

			// Attente des fils, écriture terminée
			waitpid(pid2, NULL, 0);
			waitpid(pid, NULL, 0);

			// Lecture et affichage du premier message (Fils 1)
			read(p1[0], buffer, BUFFER_SIZE); // Lecture dans le pipe
			printf("1) \"%s\"\n", buffer); // Affichage
 			close(p1[0]); // Fermeture du descripteur de lecture

			// Lecture et affichage du deuxième message (Fils 2)
			read(p2[0], buffer, BUFFER_SIZE); // Lecture dans le pipe
			printf("2) \"%s\"\n", buffer); // Affichage
			close(p2[0]); // Fermeture du descripteur de lecture

		} else if (pid2 == 0) {
			// Fils 2

			close(p2[0]); // Fermeture du descripteur de lecture

			write(p2[1], "Je suis le fils 2", strlen("Je suis le fils 2")+1); // Envoi du message

			close(p2[1]); // Fermeture du descripteur d'écriture

		} else {
      fprintf(stderr, "Impossible de créer le second fils !\n");
      exit(EXIT_FAILURE);
    }

	} else if (pid == 0) {
		// Fils 1

		close(p1[0]); // Fermeture du descripteur de lecture

		write(p1[1], "Je suis le fils 1", strlen("Je suis le fils 1")+1); // Envoi du message

		close(p1[1]); // Fermeture du descripteur d'écriture

	} else {
    fprintf(stderr, "Impossible de créer le premier fils !\n");
    exit(EXIT_FAILURE);
  }

  return (EXIT_SUCCESS);
}
