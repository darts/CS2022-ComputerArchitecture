library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity mux2_8 is
    Port (  
            in0 : in  std_logic_vector(7 downto 0);
            in1 : in  std_logic_vector(7 downto 0);
            s: in std_logic;
            z : out std_logic_vector(7 downto 0));
end mux2_8;

architecture Behavioral of mux2_8 is
    constant gate_delay: Time:= 1 ns;
begin
    z <=    in0 after gate_delay when s = '0' else
            in1 after gate_delay when s = '1' else
            x"00" after gate_delay;
end Behavioral;
