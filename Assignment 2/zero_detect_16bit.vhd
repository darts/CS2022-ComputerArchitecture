library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zero_detect_16bit is
    Port ( 
        inPut : in STD_LOGIC_VECTOR (15 downto 0);
        outPut : out STD_LOGIC 
        );
end zero_detect_16bit;

architecture Behavioral of zero_detect_16bit is
constant gate_delay: Time := 1ns;

begin
   process (inPut)
		begin
		case inPut is
			when x"0000" => outPut <= '1' after gate_delay;
		    when others => outPut <= '0' after gate_delay; 
		end case;
	end process;
	
end Behavioral;