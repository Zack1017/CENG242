library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder_6bit_testbench is
end adder_6bit_testbench;

architecture Behavioral of adder_6bit_testbench is
constant size: integer := 7;
signal a : std_logic_vector (size downto 0) := "00000001";
signal b : std_logic_vector (size downto 0) := "00000001";
signal carry : std_logic;
signal overflow : std_logic;
signal addsub : std_logic := '0';
signal result : std_logic_vector (size downto 0);
begin

uut: entity work.adder_6bit(Behavioral)
    generic map (size =>size)
	port map(a => a, b => b, carry_out => carry, r => result, add_sub => addsub, overflow => overflow);
    

end Behavioral;
