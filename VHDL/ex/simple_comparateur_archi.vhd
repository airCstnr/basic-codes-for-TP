
-- Exemple d'archetectures
-- 2 architectures d'un même composant

architecture simple of comparateur is
    -- zone de déclaration (ici commentaire uniquement)
begin
    -- zone de définition
    egal <= ’1’ when a = b else ’0’; -- exemple d'architecture
end simple ;

architecture complexe of comparateur is
begin
    egal <= ’1’ after 10 ns when a = b else ’0’ after 5 ns;
    -- L’instruction after n’est pas synthétisable
end complexe ;
