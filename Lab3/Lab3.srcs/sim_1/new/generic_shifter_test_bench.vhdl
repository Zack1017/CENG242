library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity generic_shifter_test_bench is
--  Port ( );
end generic_shifter_test_bench;

architecture Behavioral of generic_shifter_test_bench is
    signal I0 : std_logic_vector (7 downto 0) := "10000000";
    signal Out0 : std_logic_vector (7 downto 0);
    signal amt : std_logic_vector (2 downto 0) := "001";
    signal fun : STD_LOGIC_VECTOR( 1 downto 0) := "01";
    signal carry : STD_LOGIC;
begin
uut: entity work.generic_shifter(Behavioral)
	port map(din => I0, dout => Out0, shamt => amt, func => fun, co => carry);


end Behavioral;
