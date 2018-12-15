
-- Horloge clk

signal clk : bit :='0';
begin
    clk <= not(clk) after 5 ns;
end;
