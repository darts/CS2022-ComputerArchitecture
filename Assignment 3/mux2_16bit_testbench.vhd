library ieee;
use ieee.std_logic_1164.all;

entity mux2_16bit_TestBench is
end mux2_16bit_TestBench;
 
 
Architecture behavior of mux2_16bit_TestBench is 
    component mux2_16bit
    port(
         sel : in  STD_LOGIC_VECTOR (0 downto 0);
         in0 : in  STD_LOGIC_VECTOR (15 downto 0);
         in1 : in  STD_LOGIC_VECTOR (15 downto 0);
         z : out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;
    
   --Inputs
   signal sel : STD_LOGIC_VECTOR(0 downto 0) := (others => '0');
   signal in0 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
   signal in1 : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

 	--Outputs
   signal z : STD_LOGIC_VECTOR(15 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux2_16bit PORT MAP (
          sel => sel,
          in0 => in0,
          in1 => in1,
          z => z
        );

   stim_proc: process
   begin		
        in0 <= "0000000011111111";
        in1 <= "1111111100000000";
		
      wait for 10 ns;	
        sel <= "0";

      wait for 10 ns;	
		sel <= "1";

      wait for 10 ns;	
		sel <= "1";

      wait for 10 ns;	
		sel <= "0";
	  
	  wait for 10 ns;	
        sel <= "1";
     
 --     wait;
   end process;

END;