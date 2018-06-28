
Auteurs : Raphaël Castanier et Joffrey Rius Bernal

# Compte Rendu TP2

## TP2 - Analyse d'un fichier de log


### Question 1

Enoncé : le nombre de lignes de ce fichier de log
Commande : `cat chat.log | wc -l`
Explication :
- `cat` affiche le fichier
- `wc` compte le nombre de lignes

Résultat : 355


### Question 2

Enoncé : le nombre de messages échangés (MESSAGE_SENT)
Commande : `grep MESSAGE_SENT chat.log | wc -l`
Explication :
- `grep` sélectionne les messages envoyés
- `wc` les compte

Résultat : 340


### Question 3

Enoncé : le nombre de message de chaque type
Commande : `cut --delimiter=' ' -f 3 chat.log | sort | uniq -c`
Explication :
- `cut` sélectionne le type de chaque message
- `sort` les trie
- `uniq` les compte

Résultat :

    1 LOGIN_FAIL
    7 LOGIN_SUCCESS
    7 LOGOUT
    340 MESSAGE_SENT


### Question 4

Enoncé : le nombre de message de chaque type, avec affichage par nombre de messages
décroissant
Commande : `cut -d ' ' -f 3 chat.log | sort | uniq -c | sort -nr`
Explication :
- idem que pour la question 3
- `sort` les trie par ordre décroissant

Résultat :

    340 MESSAGE_SENT
    7 LOGOUT
    7 LOGIN_SUCCESS
    1 LOGIN_FAIL


### Question 5

Enoncé : qui écoute le plus les autres
Commande : `grep MESSAGE_SENT chat.log | cut -d ' ' -f 8 | sort | uniq -c | sort -nr | head -n 1 | cut -d ' ' -f 7`
Explication :
- `grep` sélectionne les messages envoyés
- `cut` sélectionne les pseudo destinataires des messages
- `sort` les trie
- `uniq` les compte
- `sort` les retrie par ordre décroissant
- `head` garde uniqument la première ligne
- `cut` sélectionne de nouveau le pseudo

Résultat : gibbs


### Question 6

Enoncé : le hit parade des trois plus gros bavards, avec les lignes précédées de 1,2 et 3
Commande : `grep MESSAGE_SENT chat.log | cut -d ' ' -f 6 | sort | uniq -c | sort -nr | head -n 3 | cut -d ' ' -f 7 | nl`
Explication :
- `grep` sélectionne les messages envoyés
- `cut` sélectionne les pseudo expéditeurs des messages
- `sort` les trie
- `uniq` les compte
- `sort` les retrie par ordre décroissant
- `head` garde uniqument les 3 premières lignes
- `cut` sélectionne de nouveau le pseudo
- `nl` affiche le classement

Résultat :

    1  dinozzo
    2  david
    3  gibbs


### Question 7

Enoncé : la minute durant laquelle il y a eu le plus de message échangés
Commande : `grep MESSAGE_SENT chat.log | cut -d ' ' -f 2 | uniq -c | sort -n | tail -n 1 | cut -d ' ' -f 7`
Explication :
- `grep` sélectionne les messages envoyés
- `cut` sélectionne l'heure d'envoi
- `uniq` les compte (ils sont déja triés par ordre chronologique)
- `sort` les trie
- `tail` garde uniqument la dernière ligne
- `cut` sélectionne l'heure d'envoi

Résultat : 15:02


### Question 8

Enoncé : qui se parle le plus à lui-même
Commande : `grep MESSAGE_SENT chat.log | cut -d ' ' -f 6,8 | sort | uniq -c | sort -nr | tr -d '\r' | awk '($3==$2) {print $2}' | head -n 1`
Explication :
- `grep` sélectionne les messages envoyés
- `cut` sélectionne les pseudos
- `sort` les trie (pour éviter les erreurs de compatage de doublons)
- `uniq` les compte
- `sort` les trie par ordre décroissant
- `tr` supprime le retour charriot superflu
- `awk` sélectionne les pseudos qui se parlent à eux mêmes
- `head` conserve uniqument le premier

Résultat : sciuto


### Question 9

Enoncé : qui a le plus grand score nombre de messages envoyés + nombre de messages reçus

#### Version 1

Commande : `grep MESSAGE_SENT chat.log | cut -d ' ' -f 6,8 | tr ' ' '\n' | tr -d '\r' | sort | uniq -c | sort -nr | head -n 1 | cut -d ' ' -f 6`
Explication :
- `grep` sélectionne les messages envoyés
- `cut` sélectionne les pseudos
- `tr` remplace l'espace entre les 2 pseudos par un retour à la ligne
- `tr` supprime le retour charriot superflu
- `sort` les trie
- `uniq` les compte
- `sort` les retrie par ordre décroissant
- `head` conserve uniqument le premier
- `cut` sélectionne de nouveau le pseudo

Résultat : gibbs


#### Version 2

Commande : `grep MESSAGE_SENT chat.log | cut -d ' ' -f 6,8 | tr -d '\r' | awk '{print $1; if($1!=$2){print $2}}'| sort | uniq -c | sort -nr | head -n 1 | cut -d ' ' -f 7`
Explication :
- `grep` sélectionne les messages envoyés
- `cut` sélectionne les pseudos
- `tr` supprime le retour charriot superflu
- `awk` affiche le premier pseudo et le deuxième uniquement si il est différent du premier
- `sort` les trie
- `uniq` les compte
- `sort` les retrie par ordre décroissant
- `head` conserve uniqument le premier
- `cut` sélectionne de nouveau le pseudo

Résultat : gibbs

### Question 10

Enoncé : Transformer les lignes MESSAGE_SENT pour obtenir des messages de la forme particulière
Commande : `sed -E "s/from (\w+) to (\w+)/\1 --> \2/" chat.log | sed -E "s/(\w+) --> \1/\1 se parle à lui-même/" > chat2.log`
Explication :
- `sed` remplace le `from _pseudo_ to _pseudo_` par `_pseudo_ --> _pseudo_`
- `sed` remplace le `-->` par `se parle à lui même`

Résultat : voir `chat2.log`
