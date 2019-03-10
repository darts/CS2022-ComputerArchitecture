
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8_16bit_testbench is
end mux8_16bit_testbench;

architecture Behavioral of mux8_16bit_testbench is
    component mux8_16bit
    port(
        sel : in  STD_LOGIC_VECTOR (2 downto 0);
        in0 : in  STD_LOGIC_VECTOR (15 downto 0);
        in1 : in  STD_LOGIC_VECTOR (15 downto 0);
        in2 : in  STD_LOGIC_VECTOR (15 downto 0);
        in3 : in  STD_LOGIC_VECTOR (15 downto 0);
        in4 : in  STD_LOGIC_VECTOR (15 downto 0);
        in5 : in  STD_LOGIC_VECTOR (15 downto 0);
        in6 : in  STD_LOGIC_VECTOR (15 downto 0);
        in7 : in  STD_LOGIC_VECTOR (15 downto 0);
        z : out  STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;
    
    --inputs
    signal sel : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal in0 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal in1 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal in2 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal in3 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal in4 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal in5 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal in6 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal in7 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    
    --output
    signal z : STD_LOGIC_VECTOR(15 downto 0);
    
begin

    --uut
    uut: mux8_16bit PORT MAP (
        sel => sel,
        in0 => in0,
        in1 => in1,
        in2 => in2,
        in3 => in3,
        in4 => in4,
        in5 => in5,
        in6 => in6,
        in7 => in7,
        z => z
        );
        
        
   stim_proc: process
   begin		
        in0 <= "1100000000000000";
        in1 <= "0011000000000000";
        in2 <= "0000110000000000";
        in3 <= "0000001100000000";
        in4 <= "0000000011000000";
        in5 <= "0000000000110000";
        in6 <= "0000000000001100";
        in7 <= "0000000000000011";
		
      wait for 10 ns;	
        sel <= "000";

      wait for 10 ns;	
		sel <= "001";

      wait for 10 ns;	
		sel <= "010";

      wait for 10 ns;	
		sel <= "011";
	  
	  wait for 10 ns;	
        sel <= "100";
     
      wait for 10 ns;	
		sel <= "101";

      wait for 10 ns;	
		sel <= "110";
	  
	  wait for 10 ns;	
        sel <= "111";
   end process;

end Behavioral;
