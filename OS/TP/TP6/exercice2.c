
// OS308   : Système d'exploitation
// TP6     : Manipulation des signaux
// Auteurs : Raphaël Castanier, Joffrey Ruis Bernal
// Date    : 31/05/2018
// Compil. : gcc -o prog -Wall -Werror exercice2.c --std=c99
// Exercice 2 - Horloge

#include <signal.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <stdio.h>

#define NB_SEC 59
#define NB_MIN 59
#define NB_HOU 23

// -------------------------
// compteurs
int compt_H=0;
int compt_M=0;
int compt_S=0;

// -------------------------
// callback de secondes
void sec_handler(int sig)
{
	if(compt_S < NB_SEC)
	{
		compt_S++;
	}
	else if(compt_S==NB_SEC)
	{
		kill(getppid(),SIGALRM); // on envoie sigalarm au parent
		compt_S=0; // on remet � z�ro le compteur de secondes
	}
	printf("\r\033[6C%02d", compt_S);
	fflush(stdout);
	alarm(1);
}

// -------------------------
// callback de minutes
void min_handler(int sig)
{
	if(compt_M < NB_MIN)
	{
		compt_M++;
	}
	else if(compt_M == NB_MIN)
	{
		kill(getppid(),SIGALRM); // on envoie sigalarm au parent
		compt_M=0; // on remet � z�ro le compteur de secondes
	}
	printf("\r\033[3C%02d", compt_M);
	fflush(stdout);
}

// -------------------------
// callback de heures
void hou_handler(int sig)
{
	if(compt_H < NB_HOU)
	{
		compt_H++;
	}
	else if(compt_H==NB_HOU)
	{
		compt_H=0; // on remet � z�ro le compteur de secondes
	}
	printf("\r%02d", compt_H);
	fflush(stdout);
}


// -------------------------
int main (void)
{
	//printf("[%d] Main\n", getpid());
	printf("[%d] La belle horloge!\n", getpid());

	pid_t min = fork(); // cr�ation d'un processus fils qui sera minutes + secondes

	if(min==-1)
	{
		printf(" Erreur de creation du fils \n");
	}

	if(min !=  0) // comportement des heures
	{
		//printf("[%d] Heures\n", getpid());
		signal(SIGALRM, hou_handler);
	}

	if(min == 0) //on rentre dans le fils des heures
	{
		//printf("[%d] Minutes + Secondes\n", getpid());
		pid_t sec = fork(); // cr�ation d'un processus fils qui sera secondes

		if(sec == -1)
		{
			printf(" Erreur de creation du fils \n");
		}

		if(sec !=  0) // comportement des minutes
		{
			//printf("[%d] Minutes\n", getpid());
			signal(SIGALRM, min_handler);
		}

		if(sec == 0) // comportement des secondes
		{
			//printf("[%d] Secondes\n", getpid());
			printf("00:00:00"); // initialisation de l'horloge
			fflush(stdout);
			signal(SIGALRM, sec_handler);
			alarm(1);
		}
	}

	// chacun des processus se met en attente
	while(1)
	{
		// ne fait rien
	}

}
