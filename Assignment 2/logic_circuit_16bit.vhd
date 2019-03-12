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

begin   
    output <= (A and B) when sel="00" else
    (A or B) when sel="01" else
    (A xor B) when sel="10" else
    (not A) when sel="11";
end Behavioral;
