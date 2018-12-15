
-- Affcetation sequentielle simple
p1: process(a,b) -- Liste de sensibilité explicite
--          ^ ^
begin
    s <= a and b after 10 ns;
end process;

s <= a and b after 10 ns; -- Liste de sensibilité implicite
--   ^     ^

p2: process(etat)
begin
    if etat = "1001" then
        neuf <= ´1´ ;
    else
        neuf <= ´0´ ;
    end if;

    -- equivalent à
    neuf <= ‘1’ when etat = “1001” else ‘0’;

end process;

p3: process
begin
    wait on e0, e1, e2, e3, ad;
    case ad is
        when "00" => s <= e0 ;
        when "01" => s <= e1 ;
        when "10" => s <= e2 ;
        when others => s <= e3 ;
    end case;
end process;


-- Affectation concurrente sélective
-- Structure de type multiplexeurs
-- Pas de priorité
    signal e0, e1, e2, e3, s : bit;
    signal ad : bit_vector( 1 downto 0);
begin
    with ad select
    s <= e0 when "00",
         e1 when "01",
         e2 when "10",
         e3 when others; -- Obligatoire quand toutes les conditions n'ont pas été couvertes
         -- Toutes les valeurs doivent être listées (de manière exclusive)
end;
