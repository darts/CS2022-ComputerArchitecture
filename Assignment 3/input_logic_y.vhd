library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity input_logic_y is
    Port (
        B : in STD_LOGIC_VECTOR (15 downto 0);
        sel : in STD_LOGIC_VECTOR (1 downto 0);
        out_B : out STD_LOGIC_VECTOR (15 downto 0)
     );
end input_logic_y;

architecture Behavioral of input_logic_y is
constant gate_delay: Time := 1ns; 

begin
     out_B <= "0000000000000000" after gate_delay when sel="00" else
     B after gate_delay when sel="01" else
     (not B) after gate_delay when sel="10" else
     "1111111111111111" after gate_delay when sel="11";
end Behavioral;
