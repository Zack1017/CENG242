library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder_2x4_testbench is
end decoder_2x4_testbench;

architecture Behavioral of decoder_2x4_testbench is
    signal i0,i1,en : std_logic :='0' ;
    signal o0,o1,o2,o3: std_logic;
begin
uut: entity work.decoder_2x4(Behavioral)
    port map( 
        en => en, 
        a1 => i1, 
        a0 => i0, 
        y0 => o0, 
        y1 => o1, 
        y2 => o2, 
        y3 => o3
        );
    i0 <= not i0 after 10ns;
    i1 <= not i1 after 20ns;
    en <= not en after 40ns;

end Behavioral;
