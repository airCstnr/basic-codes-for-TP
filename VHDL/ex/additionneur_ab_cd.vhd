
-- Additionneur
-- Sortie Z : A+B ou C+D ou 0

library IEEE;
use IEEE.std_logic_1164.all;

entity synth is
    port(   A, B, C, D : in integer;
            sel : in std_logic_vector(1 downto 0);
            Z : out integer);
end entity synth;

architecture behavioral of synth is
begin
    with sel select
    Z <=    A+B when "00",
            C+D when "10",
            0 when others;
end architecture behavioral;
