
// TP4
// Comparer deux chaines de caractères

// ------------------------------
// écrire les fonctions suivantes
// ------------------------------

// myStrlen
// myStrcpy
// afficherEnHexa
// afficherEnDecimal
// mettreEnMajuscules
// mettreEnMinuscules
// echangerMinMaj
// retournerMot
// rechercherCaractereG : recherche un caractère dans le mot depuis le début
// rechercherCaractereD : recherche un caractère dans le mot depuis la fin
// estPalindrome
// compareChaine

// ------------------------------

// Tester les fonctions écrites

// --------------------------------

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <stdbool.h>
#include <string.h>

// myStrlen
size_t myStrlen(char* str)
{
    size_t len = 0;
    while (str[len] != '\0')
    {
        len++;
    }
    return len;
}

// myStrcpy
void myStrcpy(char* src, char* dst)
{
    // copie le contenu de src dans dst
    // on considère que l'espace nécessaire est disponible
    for (size_t i = 0; i < myStrlen(src); i++)
    {
        dst[i] = src[i];
    }
    dst[myStrlen(src)] = '\0';
}

// afficherEnHexa
void afficherEnHexa(char* str)
{
    for (size_t i = 0; i < myStrlen(str); i++)
    {
        printf("%#x ", str[i]);
    }
    printf("\n");
}

// afficherEnDecimal
void afficherEnDecimal(char* str)
{
    for (size_t i = 0; i < myStrlen(str); i++)
    {
        printf("%d ", str[i]);
    }
    printf("\n");
}

// mettreEnMajuscules
void mettreEnMajuscules(char* str)
{
    for (size_t i = 0; i < myStrlen(str); i++)
    {
        if ((str[i] <= 'z') && (str[i] >= 'a')) // si le caractère est en minuscule
        {
            str[i] = str[i] - 'a' + 'A'; // passage en majuscule
        }
    }
}

// mettreEnMinuscules
void mettreEnMinuscules(char* str)
{
    for (size_t i = 0; i < myStrlen(str); i++)
    {
        if ((str[i] >= 'A') && (str[i] <= 'Z')) // si le caractère est en majuscule
        {
            str[i] = str[i] + 'a' - 'A'; // passage en minuscule
        }
    }
}

// echangerMinMaj
void echangerMinMaj(char* str)
{
    for (size_t i = 0; i < myStrlen(str); i++)
    {
        if ((str[i] >= 'A') && (str[i] <= 'Z')) // si le caractère est en majuscule
        {
            str[i] = str[i] + 'a' - 'A'; // passage en minuscule
        }
        else if ((str[i] <= 'z') && (str[i] >= 'a')) // si le caractère est en minuscule
        {
            str[i] = str[i] - 'a' + 'A'; // passage en majuscule
        }
    }
}

// retournerMot
void retournerMot(char* str)
{
    size_t len = myStrlen(str);
    char tmp;
    for (size_t i = 0; i < len/2; i++)
    {
        tmp = str[i];
        str[i] = str[len-i-1];
        str[len-i-1] = tmp;
    }
}

// rechercherCaractereG : recherche un caractère dans le mot depuis le début
size_t rechercherCaractereG(char* str, char rech)
{
    // renvoie le rang du premier caractère trouvé
    char tmp;
    size_t i = 0;
    do {
        tmp = str[i];
        i++;
    } while (tmp != '\0' && tmp != rech);
    return i;
}

// rechercherCaractereD : recherche un caractère dans le mot depuis la fin
size_t rechercherCaractereD(char* str, char rech)
{
    // renvoie le rang du premier caractère trouvé en partant de la fin
    char tmp;
    size_t i = myStrlen(str);
    do {
        i--;
        tmp = str[i];
    } while (tmp != '\0' && tmp != rech);
    return i+1;
}

// estPalindrome
bool estPalindrome(char* str)
{
    size_t len = myStrlen(str);
    for (size_t i = 0; i < len/2; i++) {
        if (str[i] != str[len-i-1]) {
            return false;
        }
    }
    return true;
}

int main(int argc, char const *argv[])
{
    printf("--- Programme de test des fonctions du TP4 ---\n");

    char* test_str = "toto"; // constante
    char s[50]; // variable
    myStrcpy(test_str,s);

    printf("longueur = %d\n", (int) myStrlen(test_str));
    afficherEnHexa( test_str );
    afficherEnDecimal( test_str );


    mettreEnMajuscules( s );

    assert( strcmp(s, "TOTO") == 0 );

    mettreEnMinuscules( s );

    printf("%s\n", s);

    char* test_ech_constant = "TotO";
    char test_ech[30];
    myStrcpy(test_ech_constant, test_ech);


    printf("%s\n", test_ech);

    echangerMinMaj( test_ech );

    printf("%s\n", test_ech);

    retournerMot( test_ech );

    printf("%s\n", test_ech);

    int rang = (int)rechercherCaractereG(test_ech, 'T');

    printf("T est la %ième lettre.\n", rang);

    rang = (int)rechercherCaractereD(test_ech, 't');

    printf("t est la %ième lettre.\n", rang);

    assert(estPalindrome("TooT"));
    assert(!estPalindrome("ToTo"));

    return 0;
}
