
// OS308   : Système d'exploitation
// TP6     : Manipulation des signaux
// Auteurs : Raphaël Castanier, Joffrey Ruis Bernal
// Date    : 31/05/2018
// Compil. : gcc -o prog -Wall -Werror exercice1.c --std=c99
// Exercice 1 - Synchronisation père/fils par des signaux

#include <stdio.h>
#include <signal.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <sys/types.h>

int var; // variable globale pour chacun des process (p�re et fils)

// fonction callback pour SIGUSR1 qui ajoute 2 � la variable qui compte
void doubleIncr(int NumSignal)
{
	var +=2;
	printf("%i\n", var);
}


int main (void)
{
	printf("--- PID = %d\n", getpid());

	signal(SIGUSR1, doubleIncr); // changement du signal SIGUSR1

	pid_t val= fork();

	if(val==-1) // erreur
	{
		printf(" Erreur de creation du fils \n");
	}

	if(val==0) // fils
	{
		var = 0; // initialisation � 0 pour afficher 2 au premier print
		while(var < 100 )
		{
			kill(getppid(), SIGUSR1); // demande au p�re d'incr�menter sa var
			kill(val, SIGCONT);  // demande au fils de reprendre
			kill(getpid(), SIGSTOP); // se bloque
		}
	}

	if(val!=0) // p�re
	{
		var = -1; // initialisation � -1 pour afficher 1 au premier print
		while(var < 100 )
		{
			kill(val, SIGUSR1); // demande au fils d'incr�menter sa var
			kill(val, SIGCONT); // demande au fils de reprendre
			kill(getpid(), SIGSTOP); // se bloque
		}
	}



	return 0;
}
