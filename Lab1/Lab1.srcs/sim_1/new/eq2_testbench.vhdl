
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eq2_testbench is
end eq2_testbench;

architecture Behavioral of eq2_testbench is
    signal x,y : std_logic_vector (1 downto 0) := "00";
    signal eq : std_logic;
begin

uut: entity work.eq2(Behavioral)
    port map( A => x, B => y, eq => eq);
    
    x(0) <= not x(0) after 10ns;
    x(1) <= not x(1) after 20ns;
    y(0) <= not y(0) after 40ns;
    y(1) <= not y(1) after 80ns;

end Behavioral;
