
Auteur : *Raphaël Castanier*

# TP1 - Compte-Rendu

## Gestion d'une arborescence

1. `mkdir esisar`
2. `mkdir esisar/TP1 esisar/TP2 esisar/TP3`
3. `touch esisar/TP1/file1.txt`
4. `ls esisar/TP1`
5. `ls /home/raphael/esisar/TP1`
6. `vi file2.txt`
7. `cp file2.txt esisar/`
8. `mv esisar/TP1/* esisar/TP2`
9. `cp esisar/TP2/* esisar/TP3`
10. `rm -r esisar/TP3`

## Commande ls et caractères génériques

`cd /usr/bin`
1. `ls ????`
2. `ls ????*`
3. `ls *-*`
4. `ls ???-*`
5. `ls [abc]*`
6. `ls [^aeiou]*`
7. `ls [^c-v]*`

## Gestion des droits d'accès

1.  `rw-------`
    `./file3.sh`
    `-bash: ./file3.sh: Permission non accordée`
    `chmod u+x file3.sh`
    `./file3.sh`
    `Mon premier script!`
2.  `ls -ld ~`
    `rwxr-xr-x`
3.  `chmod 700 ~`
    Mon binôme ne peut pas affichier la liste des fichiers de mon `home`
    Il ne peut pas exécuter mon fichier `file3.sh`
4.  `chmod go+x ~`
5.  Mon binôme ne peut pas affichier la liste des fichiers de mon `home`,
    mais il peut exécuter mon fichier `file3.sh`
6.  `chmod 755 ~`
7.  `umask`
    `umask 006`
