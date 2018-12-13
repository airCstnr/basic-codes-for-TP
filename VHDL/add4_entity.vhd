
-- Exercice : Écrire l'entité d'un additionneur add4 de deux mots a et b sur 4 bits en entrée, avec une retenue entrante ci, et deux sorties sum sur 4 bits et la retenue co.


entity add4 is
    port(
        a, b : in bit_vector(3 downto 0);
        ci   : in bit;
        sum  : out bit_vector(3 downto 0);
        co   : out bit);
end comparateur;
