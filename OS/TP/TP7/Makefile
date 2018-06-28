
exo1 : exo1.c
	gcc exo1.c -o exo1 -Wall -Werror -Wextra --std=c99

exo1 : client serveur

client : client.c
	gcc client.c -o client -Wall -Werror -Wextra --std=c99

serveur : serveur.c
	gcc serveur.c -o serveur -Wall -Werror -Wextra --std=c99

clean :
	rm exo1 client serveur
