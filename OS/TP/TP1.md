
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

1.  `./file3.sh`
    `-bash: ./file3.sh: Permission non accordée`
    `chmod u+x file3.sh`
    `./file3.sh`
    `Mon premier script!`
