library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_circuit_16bit is
    Port (
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        sel : in STD_LOGIC_VECTOR (1 downto 0);
        output : out STD_LOGIC_VECTOR (15 downto 0)
    );
end logic_circuit_16bit;

architecture Behavioral of logic_circuit_16bit is
constant gate_delay: Time := 5ns; 

begin   
    output <= (A and B) after gate_delay when sel="00" else
    (A or B) after gate_delay when sel="01" else
    (A xor B) after gate_delay when sel="10" else
    (not A) after gate_delay when sel="11";
end Behavioral;
