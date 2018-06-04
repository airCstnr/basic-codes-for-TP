
// OS308   : Système d'exploitation
// TP6     : Manipulation des signaux
// Auteurs : Raphaël Castanier, Joffrey Ruis Bernal
// Date    : 03/06/2018

// Fonctions annexes, données avec le sujet

#define TAILLE_MAX 20

int lire_valeur(const char *path)
{
    FILE* fichier = NULL;
    char chaine[TAILLE_MAX] = ""; // Chaîne vide de taille TAILLE_MAX
    int valeur = -1;
    fichier = fopen(path, "r");
    if (fichier != NULL)
    {
        fgets(chaine, TAILLE_MAX, fichier); // On lit au maximum TAILLE_MAX
        // caractères du fichier,
        // on stocke le tout dans "chaine"
        valeur = atoi(chaine);
        fclose(fichier);
    }
    return valeur;
}

void ecrire_valeur(const char *path, int valeur)
{
    FILE* fichier = NULL;
    fichier = fopen(path, "w");
    if (fichier != NULL)
    {
        // On écrit dans le fichier
        fprintf(fichier, "%d", valeur);
        fclose(fichier);
    }
}
