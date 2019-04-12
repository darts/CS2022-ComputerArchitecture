library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_8_testbench is
end mux2_8_testbench;

architecture Behavioral of mux2_8_testbench is

    COMPONENT mux2_8
    Port (  
            in0 : in  std_logic_vector(7 downto 0);
            in1 : in  std_logic_vector(7 downto 0);
            s: in std_logic;
            z : out std_logic_vector(7 downto 0));
    END COMPONENT;
    

   --Inputs
    signal s : std_logic;
    signal in0 : std_logic_vector(7 downto 0) := (others => '0');
    signal in1 : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal z : std_logic_vector(7 downto 0);

 
begin
 
	--uut
    uut: mux2_8 PORT MAP (
        s => s,
        in0 => in0,
        in1 => in1,
        z => z
    );

   stim_proc: process
   begin		
        in0 <= x"01";
		    in1 <= x"02";	
        s <= '0';
      wait for 10 ns;	
        s <= '1';
      wait for 10 ns;
   end process;
end Behavioral;
