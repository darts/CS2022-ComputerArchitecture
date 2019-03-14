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
    signal B : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal mode_select : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
    signal carryIn : STD_LOGIC := '0';

    --output
    signal output : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal carryOut : STD_LOGIC := '0';
    signal overFlow : STD_LOGIC := '0';

    constant wait_time : time := 50ns;
begin
    uut: arithmetic_circuit_16bit port map(
        A => A,
        B => B,
        mode_select => mode_select,
        carryIn => carryIn,
        output => output,
        carryOut => carryOut,
        overFlow => overFlow
    );

    stim_proc: process
    begin
        --out = A
        A <= x"0001";
        B <= x"0005";
        carryIn <= '0';
        mode_select <= "00";
        wait for wait_time;
        
        --out = A + 1
        A <= x"0001";
        B <= x"0005";
        carryIn <= '1';
        mode_select <= "00";
        wait for wait_time;
       
        --out = A + B 
        A <= x"0001";
        B <= x"0005";
        carryIn <= '0';
        mode_select <= "01";
        wait for wait_time;
        
        --out = A + B + 1
        A <= x"0001";
        B <= x"0005";
        carryIn <= '1';
        mode_select <= "01";
        wait for wait_time;
        
        --out = A + !B
        A <= x"0001";
        B <= x"0005";
        carryIn <= '0';
        mode_select <= "10";
        wait for wait_time;
        
        --out = A + !B + 1
        A <= x"0001";
        B <= x"0005";
        carryIn <= '1';
        mode_select <= "10";
        wait for wait_time;
        
        --out = A - 1
        A <= x"0001";
        B <= x"0005";
        carryIn <= '0';
        mode_select <= "11";
        wait for wait_time;
        
        
    end process;

end Behavioral;
