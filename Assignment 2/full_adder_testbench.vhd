library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_testbench is
end full_adder_testbench;

architecture Behavioral of full_adder_testbench is
    component full_adder
    Port(
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        carryIn: in STD_LOGIC;
        sum : out STD_LOGIC;
        carryOut : out STD_LOGIC
    );   
    end component;
    
    --inputs
    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';
    signal carryIn : STD_LOGIC := '0';
    
    --outputs
    signal sum : STD_LOGIC := '0';
    signal carryOut : STD_LOGIC := '0';
    
    constant wait_time : time := 20ns;
begin
    
    uut: full_adder port map (
        A => A,
        B => B,
        carryIn => carryIn,
        sum => sum,
        carryOut => carryOut
    );
    
    stim_proc: process
        begin 
        A <= '1';
        B <= '0';
        carryIn <= '0';
        wait for wait_time;
        
        A <= '0';
        B <= '0';
        carryIn <= '0';
        wait for wait_time; 
        
        A <= '0';
        B <= '0';
        carryIn <= '1';
        wait for wait_time;   
        
        A <= '1';
        B <= '1';
        carryIn <= '0';
        wait for wait_time;
        
        A <= '1';
        B <= '1';
        carryIn <= '1';
        wait for wait_time;    
    end process;

end Behavioral;
