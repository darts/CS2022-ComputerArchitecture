library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder_testbench is
end ripple_adder_testbench;

architecture Behavioral of ripple_adder_testbench is
    component ripple_adder 
    port (
       A : in STD_LOGIC_VECTOR (15 downto 0);
       B : in STD_LOGIC_VECTOR (15 downto 0);
       carryIn : in STD_LOGIC;
       carryOut : out STD_LOGIC;
       overFlow : out STD_LOGIC;
       sum : out STD_LOGIC_VECTOR (15 downto 0)
    );
    end component;
    
    --inputs
    signal A : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal B : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal carryIn : STD_LOGIC := '0';
    
    --outputs
    signal carryOut : STD_LOGIC := '0';
    signal overFlow : STD_LOGIC := '0';
    signal sum : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    
    constant wait_time : time := 100ns;
begin
    uut: ripple_adder port map(
        A => A,
        B => B,
        carryIn => carryIn,
        carryOut => carryOut,
        sum => sum
    );
    
    stim_proc : process
        begin
            A <= x"0001";
            B <= x"0001";
            carryIn <= '0';
            wait for wait_time;
            
            A <= x"0001";
            B <= x"0001";
            carryIn <= '1';
            wait for wait_time;
            
            A <= x"0001";
            B <= x"0000";
            carryIn <= '1';
            wait for wait_time;
            
            A <= x"F000";
            B <= x"FFFF";
            carryIn <= '0';
            wait for wait_time;
        
        end process;

end Behavioral;
