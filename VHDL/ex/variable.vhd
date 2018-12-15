
entity var_sig is
    -- no I/O
end;

architecture exercice of var_sig is
    signal aa, aaa : integer := 3;
    signal bb, bbb : integer := 2;

begin
    p1: process
        variable a: integer := 7;
        variable b: integer := 6;
    begin
        wait for 10 ns;
        a := 1; --- a est égal à 1
        b := a + 8 ; --- b est égal à 9
        a := b - 2 ; --- a est égal à 7
        aa <= a; -- 7 dans pilote de aa
        bb <= b ; -- 9 dans pilote de bb
    end process;

    p2: process
    begin
        wait for 10 ns;
        aaa <= 1 ; -- 1 dans pilote de aaa
        bbb <= aaa + 8; -- 11 dans pilote de bbb
        aaa <= bbb - 2; -- 0 dans pilote de aaa
        -- Seule la dernière affectation compte!
    end process;
end;
