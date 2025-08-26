
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity eq2 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           eq : out STD_LOGIC);
end eq2;

architecture Behavioral of eq2 is
    signal x1, x2, x3, x4 :std_logic;
begin
    x1 <= (not A(0) ) and (not A(1) ) and (not B(0) ) and (not B(1));
    x2 <= (not A(1)) and A(0) and (not B(1)) and B(0);
    x3 <= A(1) and A(0) and B(1) and B(0);
    x4 <= A(1) and (not A(0)) and B(1) and (not B(0));
    eq <= x1 or x2 or x3 or x4;
    

end Behavioral;
