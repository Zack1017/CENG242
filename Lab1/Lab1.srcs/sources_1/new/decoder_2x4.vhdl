library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_2x4 is
    Port ( a0 : in STD_LOGIC;
           a1 : in STD_LOGIC;
           y0 : out STD_LOGIC;
           y1 : out STD_LOGIC;
           y2 : out STD_LOGIC;
           y3 : out STD_LOGIC;
           en : in STD_LOGIC);
end decoder_2x4;

architecture Behavioral of decoder_2x4 is

begin
y0 <= en and (not a1) and (not a0);
y1 <= en and (not a1) and a0;
y2 <= en and a1 and (not a0);
y3 <= en and a1 and a0; 

end Behavioral;
