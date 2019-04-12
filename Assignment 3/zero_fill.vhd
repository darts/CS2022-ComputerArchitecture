library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zero_fill is
    Port ( 
        SB : in  STD_LOGIC_VECTOR (2 downto 0);
	    constant_out : out STD_LOGIC_VECTOR (15 downto 0));
end zero_fill;

architecture Behavioral of zero_fill is

begin
constant_out(2 downto 0) <= SB;
constant_out(15 downto 3) <= "0000000000000";
end Behavioral;