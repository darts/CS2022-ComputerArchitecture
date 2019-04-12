LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY zero_fill_TestBench IS
END zero_fill_TestBench;
 
ARCHITECTURE behavior OF zero_fill_TestBench IS 
    COMPONENT zero_fill
    PORT(
         SB : IN  std_logic_vector(2 downto 0);
         constant_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal SB : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal constant_out : std_logic_vector(15 downto 0);
 
BEGIN
 
	--uut
   uut: zero_fill PORT MAP (
          SB => SB,
          constant_out => constant_out
        );

   
   stim_proc: process
   begin		
		--c = 5
		SB <= "101";
      wait for 100 ns;
		
		--c = 0
		SB <= "000";
      wait for 100 ns;
		
		--c = 2
		SB <= "010";
		wait;
      end process;

END;