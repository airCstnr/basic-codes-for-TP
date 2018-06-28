#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main (void){ 
  int valeur;
  printf("printf-0 Avant fork : ici processus numero %d\n", (int)getpid());
  valeur = fork();	
  printf("printf-1 Valeur retournee par la fonction fork: %d\n", (int)valeur);
  printf("printf-2 Je suis le processus numero %d\n", (int)getpid());
  return 0;
}
