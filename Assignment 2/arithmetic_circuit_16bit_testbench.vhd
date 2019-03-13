library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arithmetic_circuit_16bit_testbench is
end arithmetic_circuit_16bit_testbench;

architecture Behavioral of arithmetic_circuit_16bit_testbench is
    component arithmetic_circuit_16bit
    port(
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        mode_select : in STD_LOGIC_VECTOR (1 downto 0);
        carryIn : in STD_LOGIC;
        output : out STD_LOGIC_VECTOR (15 downto 0);
        carryOut : out STD_LOGIC;
        overFlow : out STD_LOGIC
    );
    end component;

    --inputs 
    signal A : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
begin


end Behavioral;
