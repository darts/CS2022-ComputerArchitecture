library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8_16bit is
    Port ( sel : in  STD_LOGIC_VECTOR (2 downto 0);
           in0 : in  STD_LOGIC_VECTOR (15 downto 0);
           in1 : in  STD_LOGIC_VECTOR (15 downto 0);
           in2 : in  STD_LOGIC_VECTOR (15 downto 0);
           in3 : in  STD_LOGIC_VECTOR (15 downto 0);
           in4 : in  STD_LOGIC_VECTOR (15 downto 0);
           in5 : in  STD_LOGIC_VECTOR (15 downto 0);
           in6 : in  STD_LOGIC_VECTOR (15 downto 0);
           in7 : in  STD_LOGIC_VECTOR (15 downto 0);
           z : out  STD_LOGIC_VECTOR (15 downto 0));
end mux8_16bit;

architecture Behavioral of mux8_16bit is
constant gate_delay: Time := 5ns;

begin

   process ( sel,in0,in1,in2,in3,in4,in5,in6,in7)
		begin
		case sel is
			when "000" => z <= in0 after gate_delay;
			when "001" => z <= in1 after gate_delay;
			when "010" => z <= in2 after gate_delay;
			when "011" => z <= in3 after gate_delay;
			when "100" => z <= in4 after gate_delay;
			when "101" => z <= in5 after gate_delay;
			when "110" => z <= in6 after gate_delay;
			when "111" => z <= in7 after gate_delay;
			when others => z <= "0000000000000000" after gate_delay;
		end case;
	end process;
	
end Behavioral;