
-- Signal

-- un signal ne prend jamais une valeur directement après son affectation
-- Mais
-- uniquement lorsque l'exécution de tous les processus en cours est suspendue (D)


-- Pilote :
-- Liste de couples date-valeur (date comptée relativement à l’heure actuelle du simulateur)
-- Le pilote est un tableau associé à chaque signal dans la mémoire

-- Exemple :
S <= ‘0’, ‘1’ after 10 ns, ‘0’ after 25 ns;

-- Pilote de S
+-------+--------+
| Heure | Valeur |
+-------+--------+
| 0 (D) | ‘0’    |
| 10ns  | ‘1’    |
| 25ns  | ‘0’    |
+-------+--------+

-- Liste de sensibilite
proc1: process (a, b, c) -- liste
    begin
        x<=a and b and c;
    end process;
proc2: process
    begin
        x<=a and b and c;
        wait on a, b, c; -- wait on
    end process;
