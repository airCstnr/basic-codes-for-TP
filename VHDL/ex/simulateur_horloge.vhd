
-- architecture
    signal h : bit;
begin
    horloge : process -- déclaration de processus
    -- zone de déclaration du process us
    begin -- début de la zone de définition du processus
        h <= ‘0’, ‘1’ after 75 ns;
        wait for 100 ns;
    end process; -- fin du processus
-- fin architecture
