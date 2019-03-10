library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg16 is
    Port ( 
        loadEnable : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        inD : in  STD_LOGIC_VECTOR (15 downto 0);
        outQ : out  STD_LOGIC_VECTOR (15 downto 0)
        );
end reg16;

architecture Behavioral of reg16 is
constant gate_delay: Time := 5ns; 

begin
process(clk)
begin
if (rising_edge(clk)) then
	if loadEnable='1' then
		outQ <= inD after gate_delay;
	end if;
end if;
end process;
end Behavioral;