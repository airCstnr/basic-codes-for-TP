#include <stdio.h>
#include <stdlib.h>
#include <unistd.h> // Pour unlink()
#include <signal.h> // Pour signal()
#include <sys/types.h> // Pour FILE*
#include <sys/stat.h> // Pour mkfifo()
#include <fcntl.h> // Pour open()

#define BUFFER_SIZE 256

# define UNUSED(x) (void)(x)

const char *PIPE_PATH = "/tmp/fifo";

// Handler de l'arrêt
void stop(int sig);

// Variable du fichier
FILE *tunnel = NULL;

/**
 * Ce programme sert de serveur. Il créé un pipe nommé et
 * écoute dessus. Dès qu'il reçoit un message il l'affiche.
 * Il se termine au signal SIGINT.
 * Author : Ivan ROGER <ivan.bob.emile@gmail.com>
 * Date : 2018-10-11
 */
int main(int argc, char **argv) {
	UNUSED(argc);
	UNUSED(argv);

	char buffer[BUFFER_SIZE] = {0}; // Buffer de lecture

	// Création pipe
	unlink(PIPE_PATH); // On le supprime si il existe
	if (mkfifo(PIPE_PATH, 0664) != 0) {
		fprintf(stderr, "Impossible de créer le pipe !\n");
		exit(EXIT_FAILURE);
	}

	// Ouverture en lecture seule, non bloquante
	int fd = open(PIPE_PATH, O_RDONLY | O_NONBLOCK);
	if (fd == -1) {
		fprintf(stderr, "Impossible d'ouvrir le pipe !\n");
		exit(EXIT_FAILURE);
	}

	// Conversion en FILE*
	tunnel = fdopen(fd, "r");
	if (tunnel == NULL) {
		fprintf(stderr, "Impossible d'ouvrir le pipe !\n");
		exit(EXIT_FAILURE);
	}

	// Définition de l'handler d'arrêt
	if (signal(SIGINT, stop) == SIG_ERR) {
		fprintf(stderr, "Erreur d'enregistrement du signal d'arrêt !\n");
		fclose(tunnel);
		exit(EXIT_FAILURE);
	}

	printf("Serveur prêt !\n");

	while (1) {
		// Lecture du message dans le pipe (bloquant)
		if (fgets(buffer, BUFFER_SIZE, tunnel) != NULL)
			printf(">>> %s\n", buffer);

		usleep(50000);
	}
}

// Fonction d'arrêt du programme
// On ferme les ressources et affiche un message puis on quitte.
void stop(int sig) {
	UNUSED(sig);

	printf(" Arrêt du serveur ...\n");

	if (tunnel != NULL) {
		fclose(tunnel); // Fermeture du pipe
	}

	if (unlink(PIPE_PATH) != 0) { // Suppression
		fprintf(stderr, "Impossible de supprimer le pipe !\n");
	}

	exit(EXIT_SUCCESS); // Arrêt
}
