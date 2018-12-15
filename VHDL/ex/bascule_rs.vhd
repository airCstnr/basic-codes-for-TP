
-- Bascule RS

entity memoire_rs is
    port (  s, r : in bit;
            q, qb : out bit);
end;

architecture processus of memoire_rs is
    constant tplh : time := 2 ns;
    constant tphl : time := 1 ns;
    signal qi : bit := ‘0’;
    signal qbi : bit := ‘1’;
begin

n1 : process
    variable qtmp : bit;
    begin
        wait on s, qi ;
        qtmp := s nor qi; -- la primitive nor
        if qtmp /= qbi then -- test du changement
            if qtmp = ‘0’ then
                qbi <= qtmp after tphl;
            else
                qbi <= qtmp after tplh;
            end if;
        end if;
    end process;

n2 : process
    variable qtmp : bit;
    begin
        wait on r, qbi ;
        qtmp := r nor qbi; -- la primitive nor
        if qtmp /= qi then -- test du changement?
            if qtmp = ‘0’ then
                qi <= qtmp after tphl;
            else
                qi <= qtmp after tplh;
            end if;
        end if;
    end process;

q <= qi;
qb <= qbi;

end architecture;
