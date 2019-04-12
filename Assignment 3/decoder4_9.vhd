library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder4_9 is
    Port (  
            a : in std_logic_vector(3 downto 0);
            out0 : out STD_LOGIC;
            out1 : out STD_LOGIC;
            out2 : out STD_LOGIC;
            out3 : out STD_LOGIC;
            out4 : out STD_LOGIC;
            out5 : out STD_LOGIC;
            out6 : out STD_LOGIC;
            out7 : out STD_LOGIC;
            out8 : out STD_LOGIC
            );
end decoder4_9;

architecture Behavioral of decoder4_9 is
begin
    out0 <= '1' when a = x"0" else '0';
    out1 <= '1' when a = x"1" else '0';
    out2 <= '1' when a = x"2" else '0';
    out3 <= '1' when a = x"3" else '0';
    out4 <= '1' when a = x"4" else '0';
    out5 <= '1' when a = x"5" else '0';
    out6 <= '1' when a = x"6" else '0';
    out7 <= '1' when a = x"7" else '0';
    out8 <= '1' when a = x"8" else '0';
end Behavioral;