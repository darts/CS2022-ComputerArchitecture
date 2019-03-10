library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder3_8 is
    Port ( sel : in  STD_LOGIC_VECTOR (2 downto 0);
           out0 : out STD_LOGIC;
           out1 : out STD_LOGIC;
           out2 : out STD_LOGIC;
           out3 : out STD_LOGIC;
           out4 : out STD_LOGIC;
           out5 : out STD_LOGIC;
           out6 : out STD_LOGIC;
           out7 : out STD_LOGIC
     );
end decoder3_8;

architecture Behavioral of decoder3_8 is
constant gate_delay: Time := 5ns;

begin
   process ( sel)
		begin
			out0 <= ((not sel(0)) and (not sel(1)) and (not sel(2))) after gate_delay;
            out1 <= (sel(0) and (not sel(1)) and (not sel(2))) after gate_delay;
            out2 <= ((not sel(0)) and sel(1) and (not sel(2))) after gate_delay;
            out3 <= (sel(0) and sel(1) and (not sel(2))) after gate_delay;
            out4 <= ((not sel(0)) and (not sel(1)) and sel(2)) after gate_delay;
            out5 <= (sel(0) and (not sel(1)) and sel(2)) after gate_delay;
            out6 <= ((not sel(0)) and sel(1) and sel(2)) after gate_delay;
            out7 <= (sel(0) and sel(1) and sel(2)) after gate_delay;
	end process;
	
end Behavioral;