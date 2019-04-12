library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2_16bit is
    Port ( sel : in  STD_LOGIC_VECTOR (0 downto 0);
           in0 : in  STD_LOGIC_VECTOR (15 downto 0);
           in1 : in  STD_LOGIC_VECTOR (15 downto 0);
           z : out STD_LOGIC_VECTOR (15 downto 0)
          );
end mux2_16bit;

architecture Behavioral of mux2_16bit is
constant gate_delay: Time := 1ns;

begin
   process (sel,in0,in1)
		begin
		case sel is
			when "0" => z <= in0 after gate_delay;
			when "1" => z <= in1 after gate_delay;
		    when others => z <= "0000000000000000" after gate_delay; 
		end case;
	end process;
	
end Behavioral;