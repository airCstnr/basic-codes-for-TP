
Auteur : *Raphaël Castanier*

# TD1 - Réponses

## Exercice 1

1. `ls -li` (liste le contenu du dossier courant, en donnant toutes les informations sur le fichier et son numéro inoeud)
2.
    a. `cp fichier1 fichier2` : copie du fichier1 dans un nouveau fichier2
    b. `cd INFO` : erreur
    c. `ln fichier1 fichier3` : création d'un lien physique (fichier1 et fichier3 seront 2 noms différents pour le même inoeud)
    d. `ln -s fichier2 fichier4` : création d'un lien relatif vers le fichier2

## Exercice 2

1. Copie physique
    a. `cp file1 file2`
    b. `ls -il` : les deux fichiers sont différents
    c. Inconvénient : les deux fichiers sont distincts, les modifictions à l'un n'affectent pas l'autre
2. Lien physique
    a. `ln file1 file`
    b. `ls -il` : les deux fichiers ont le même inoeud
    c. Inconvénient : la suppression de l'un ne supprime pas l'autre, la modifiction de l'un affecte l'autre (ils sont toujours identiques, leurs droits sont les mêmes)
    d. Les droits seront les mêmes
3. Suppression lien physique
    a. `rm file1`
    b. `ls -il` : file1 est supprimé, file3 existe toujours
4. Lien symbolique
    a. `ln -s file2 fileS`
    b. `ls -il` : on a un nouveau fichier fileS qui renvoie vers le fichier2
    c. `rm file2` : le lien existe toujours, mais il sera mort
    d. Le lien est mort, le fichier n'existe plus
    e. `ln -s lienS2 file3` : on a un nouveau lien symbolique
    f. `rm lienS2` : aucun effet sur file3

## Exercice 3

1. `ls ???`
2. `ls e*.c`
3. `ls[^a]*`
