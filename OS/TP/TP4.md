
Auteur : Raphaël Castanier

# TP4 - Gestion des processus

## Exercice 1

Le pointeur d'état donné à `wait` par le père contient après le wait un mot de 2 octets contenant :
- la valeur de retour du fils passée à `exit`
- le numéro du signal qui a arrété le fils (ou 0)

## Exercice 2

Le programme fork :
- le père attend le fils et affiche le code de retour après son réveil
- le fils est replacé par le programme passé en paramètre à `execl` et renvoie son état.

Deux cas possibles :
- le programme s'est bien exécuté : c'est la valeur de retour du programme qui est renvoyée au père et le fils est terminé
- le programme ne s'est pas bien exécuté : le fils reprend la main, affiche un message d'erreur et renvoie au père le code 2.

## Exercice 3

Utilisateur réel : identifiant de l'appelant du programme
Utilisateur effectif : identifiant utilisé par le programme lorsqu'il change d'UID
