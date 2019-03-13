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
    
    constant wait_time : time := 20ns;
begin
    uut:

end Behavioral;
