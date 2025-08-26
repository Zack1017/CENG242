library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity adder_6bit is
    generic(
            size : integer := 5
            );
    Port ( a : in STD_LOGIC_VECTOR (size downto 0);
           b : in STD_LOGIC_VECTOR (size downto 0);
           add_sub : in STD_LOGIC;
           r : out STD_LOGIC_VECTOR (size downto 0);
           carry_out : out STD_LOGIC;
           overflow : out STD_LOGIC);
end adder_6bit;

architecture Behavioral of adder_6bit is
signal result : unsigned ((size +1) downto 0);
signal b1,a1 : unsigned ((size +1) downto 0);
signal b2,a2 : unsigned (2 downto 0);
signal carry : unsigned (2 downto 0);
signal as,bs : unsigned (size downto 0);
signal mask : unsigned ((size -1) downto 0) := (others => '1');
begin
    
a1 <= '0' & unsigned(a((size-1) downto 0)) & add_sub;
    
b1 <= '0' & unsigned(b((size-1) downto 0)) & add_sub when add_sub = '0'
    else '0' & unsigned ((unsigned(b((size-1) downto 0)) xor mask))& add_sub;
    
result <= a1 + b1;

r <= carry(1) & STD_LOGIC_VECTOR (result(size downto 1));


a2 <= '0' & a(size) & result(size+1);
b2 <= '0' & b(size) & result(size+1) when add_sub = '0'
    else '0' & not(b(size)) & result(size+1);

carry <= a2 + b2;

carry_out <= carry(2);
overflow <= carry(2) xor result(size+1);

end Behavioral;
