library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity logic_circuit_16bit_testbench is
end logic_circuit_16bit_testbench;

architecture Behavioral of logic_circuit_16bit_testbench is
    component logic_circuit_16bit 
    port (
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        sel : in STD_LOGIC_VECTOR (1 downto 0);
        output : out STD_LOGIC_VECTOR (15 downto 0)
    );
    end component;

    --inputs 
    signal A : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal B : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal sel : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');

    --outputs
    signal output : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');

    constant wait_time : time := 30ns;
begin
    uut: logic_circuit_16bit port map(
        A => A,
        B => B,
        sel => sel,
        output => output
    );

    stim_proc: process
    begin
        A <= x"3C3C";
        B <= x"F0F0";
        sel <= "00";
        wait for wait_time;

        sel <= "01";
        wait for wait_time;

        sel <= "10";
        wait for wait_time;

        sel <= "11";
        wait for wait_time;
    end process;
end Behavioral;
