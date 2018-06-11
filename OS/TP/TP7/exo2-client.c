#include <stdio.h>
#include <stdlib.h>

const char *PIPE_PATH = "/tmp/fifo";

/**
 * Ce programme se connecte à un serveur via un pipe nommé
 * et lui envoie le message en premier argument.
 * Author : Ivan ROGER <ivan.bob.emile@gmail.com>
 * Date : 2018-10-11
 */
int main(int argc, char **argv) {

	FILE *tunnel = NULL;

	if (argc < 2) { // On a pas de message à envoyer.
		fprintf(stderr, "Argument manquant !\n");
		printf("Usage : %s <message>\n", argv[0]);
		exit(EXIT_FAILURE);
	}

	tunnel = fopen(PIPE_PATH, "w"); // Ouverture du pipe vers le serveur.
	if (tunnel == NULL) {
		fprintf(stderr, "Impossible d'ouvrir le pipe vers le serveur !\n");
		exit(EXIT_FAILURE);
	}

	fputs(argv[1], tunnel); // On envoie la chaine en premier argument.

	fclose(tunnel);

	printf("Message envoyé !\n");
	return (EXIT_SUCCESS); // Constante = 0
}
