library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity opcode_generator_testbench is
end opcode_generator_testbench;

architecture Behavioral of opcode_generator_testbench is

    COMPONENT opcode_generator
    Port(   
            signal ir : in std_logic_vector(15 downto 0);
            signal il : in std_logic;
            signal clk : in std_logic;
            signal opcode : out std_logic_vector(6 downto 0);
            signal dr : out std_logic_vector(2 downto 0);
            signal sa : out std_logic_vector(2 downto 0);
            signal sb : out std_logic_vector(2 downto 0)
            );
    END COMPONENT;
    

   --Inputs
    signal ir: std_logic_vector(15 downto 0);
    signal il: std_logic;
    signal clk: std_logic;

 	--Outputs
 	signal opcode: std_logic_vector(6 downto 0);
 	signal dr: std_logic_vector(2 downto 0);
 	signal sa: std_logic_vector(2 downto 0);
    signal sb: std_logic_vector(2 downto 0);
     
   constant Clk_period : time := 10 ns;
 
BEGIN
    --the clock
    clock_process : process 
    begin
    clk <= '0';
    wait for Clk_period/2;
    clk <= '1';
    wait for Clk_period/2;
    end process;

	--uut
    uut: opcode_generator PORT MAP (
        ir => ir,
        il => il,
        clk => clk,
        opcode => opcode,
        dr => dr,
        sa => sa,
        sb => sb
    );

   stim_proc: process
   begin
    ir <= "1010101010101010";
    il <= '1';
    wait for Clk_period*2;

    ir <= "0101010101010101";
    il <= '1';
    wait for Clk_period*2;

    ir <= "1111111111111111";
    il <= '0';
    wait for Clk_period*2;

    ir <= "0000000101010111";
    il <= '1';
    wait for Clk_period*2;
   end process;
end Behavioral;
