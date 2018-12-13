
library IEEE;

-- Issus de la norme IEEE 1164, ce paquetage permet de définir les types std_logic et std_logic_vector,
-- les opérateurs sur ces types, et des fonctions de conversion
-- (vers les types bit et bit_vector)
use IEEE.STD_LOGIC_1164.all;

-- Définit les types signed et unsigned : vecteurs signés et non signés (de std_logic) avec le poids fort à gauche
-- Permet d’utiliser les opérateurs arithmétiques (+, x) sur des vecteurs de bit
-- Fournit des fonctions de conversion entre entiers et vecteurs (to_integer, to_unsigned, to_signed)
use IEEE.NUMERIC_STD.all;

-- SYNTAXE :
-- type nom-type is definition-type;

-- EXEMPLES :
type octet is integer range 0 to 255; -- type entier
variable a : octet; -- déclaration d'une variable de type octet
a := 123; -- affectation d'une variable

-- Types énumérés
type bit is (‘0’, ‘1’);
type boolean is (false, true);

-- Types numériques :
-- range, to ou downto
type i is integer range 0 to 3;

-- Types composés :
type word is array (0 to 8) of bit;
constant mot1 : word :="000000000";
                        ^ mot1(0)

-- Déclaration d’un vecteur de bit de largeur 32 :
variable vecteur : bit_vector(31 downto 0);

type std_logic is (
    ‘ U ’, -- non initialisé
    ‘ X ’, -- inconnu
    ‘ 0 ’, ‘ 1 ’,
    ‘ Z ’, -- haute impédance
    ‘ W ’, -- faible inconnu
    ‘ L ’, -- faible 0
    ‘ H ’, -- faible 1
    ‘ - ’ -- quelconque
);


-- Exemple types :
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- zone de déclaration
signal a, b: std_logic_vector(3 downto 0);
signal sum: std_logic_vector(3 downto 0));

--zone de définition
sum <= std_logic_vector(unsigned(a) + unsigned(b)); -- signal
