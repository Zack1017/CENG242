library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity generic_shifter is
    generic ( shift_bits: integer := 3);
    Port ( din   : in  STD_LOGIC_VECTOR (2**shift_bits-1 downto 0);
           dout  : out STD_LOGIC_VECTOR (2**shift_bits-1 downto 0);
           shamt : in  STD_LOGIC_VECTOR (shift_bits-1 downto 0);
           func  : in  STD_LOGIC_VECTOR (1 downto 0);
           co    : out STD_LOGIC
           );
end generic_shifter;

architecture Behavioral of generic_shifter is
type shift_amt is array (shift_bits -1 downto 0) of STD_LOGIC_VECTOR(2**shift_bits-1 downto 0);
type shift_type is array (shift_bits -1 downto 0) of STD_LOGIC_VECTOR(1 downto 0);
signal sign_right_L0,sign_right_L1,sign_right_L2,sign_left_L0,sign_left_L1,sign_left_L2: STD_LOGIC_VECTOR(2**shift_bits-1 downto 0); 
signal shift : shift_amt;
signal carry : STD_LOGIC;

begin 

with shamt(0) & func select 
    shift(0) <= din(2**shift_bits-1) & din(2**shift_bits -1 downto 1) when "111",
    '0' & din(2**shift_bits -1 downto 1) when "110",
    din(2**shift_bits - 2 downto 0) & '0' when "101",
    din when others;
    
get_shift: for i in 1 to shift_bits -1 generate
    with shamt(i) & func select
        shift(i) <= (2**i-1 downto 0 => shift(i - 1)(2** shift_bits - 1)) & shift(i - 1)(2 ** shift_bits -1 downto 2** i)when "111",
                    (2**i-1 downto 0 => '0') & shift(i-1)(2**shift_bits -1 downto 2**i) when "110",
                    shift(i-1)((2**shift_bits -1)-(2**i) downto 0) & (2**i-1 downto 0 => '0') when "101",
                    shift(i-1) when others;
                             
        carry <= shift(i)(2**shift_bits -1) when func = "110" else 
            din(i) when func = "111" else
            '0';
            
end generate get_shift;

dout <= shift(shift_bits-1);

co <= carry(shift_bits-1);

end Behavioral;
--Right Arithmatic
--level(0) <= din & '0';
--sign <= (others => din(7));
--with shamt(0) select
--    level(1) <= level(0) when '0',
--    sign(1) & level(0)(2**shift_bits downto 1) when others;
    
--with shamt(1) select
--    level(2) <= level(1) when '0',
--    sign((2**shift_bits -1) downto (2**shift_bits -2)) & level(1)(2**shift_bits downto 2) when others;
    
--with shamt(2) select
--    level(3) <= level(2) when '0',
--    sign((2**shift_bits -1) downto (2**shift_bits -4)) & level(2)(2**shift_bits downto 4) when others;
    
--dout <= level(3)((2**shift_bits) downto 1);
--co <=level(3)(0);     

--Right
--level(0) <= din & '0';
--with shamt(0) select
--    level(1) <= level(0) when '0',
--    '0' & level(0)(2**shift_bits downto 1) when others;

--with shamt(1) select
--    level(2) <= level(1) when '0',
--    "00" & level(1)(2**shift_bits downto 2) when others;

--with shamt(2) select
--    level(3) <= level(2) when '0',
--    "0000" & level(2)(2**shift_bits downto 4) when others;
    
--dout <= level(3)(2**shift_bits downto 1);
--co <= level(3)(0);

--Left
--level(0) <= din & '0';
--with shamt(0) select
--    level(1) <= level(0) when '0',
--    level(0)(2**shift_bits- 1 downto 0) & '0' when others;

--with shamt(1) select
--    level(2) <= level(1) when '0',
--    level(1)(2**shift_bits - 2 downto 0) & "00" when others;

--with shamt(2) select
--    level(3) <= level(2) when '0',
--    level(2)(2**shift_bits -4 downto 0) & "0000" when others;
    
--dout <= level(3)(2**shift_bits downto 1);
--co <= level(3)(0);






--architecture Basic of generic_shifter is
--    signal s0,s1,s2 : STD_LOGIC_VECTOR (7 downto 0);
--    signal key      : STD_LOGIC_VECTOR (2 downto 0);
--    signal sb       : STD_LOGIC;
--begin
--   with func select key <= 
--        "001" when "01",
--        "010" when "10",
--        "100" when "11",
--        "000" when others;

--    sb <= din(7);
--    s0 <= '0' & din(7 downto 1) when  (shamt(0) = '1' and key(1) = '1') 
--    else din(6 downto 0) & '0'  when  (shamt(0) = '1' and key(0) = '1')
--    else sb & din(7 downto 1)   when  (shamt(0) = '1' and key(2) = '1')
--    else din;
    
--    s1 <= "00" & s0(7 downto 2)   when  (shamt(1) = '1' and key(1) = '1')
--    else s0(5 downto 0) & "00"    when  (shamt(1) = '1' and key(0) = '1')
--    else sb & sb & s0(7 downto 2) when  (shamt(1) = '1' and key(2) = '1')
--    else s0;
    
--    dout <= "0000" & s1(7 downto 4)          when  (shamt(2) = '1' and key(1) = '1')
--    else s1(3 downto 0) & "0000"             when  (shamt(2) = '1' and key(0) = '1')
--    else sb & sb & sb & sb & s1(7 downto 4)  when  (shamt(2) = '1' and key(2) = '1')
--    else s1;


--end Basic;
