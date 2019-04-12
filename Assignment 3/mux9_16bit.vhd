library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux9_16 is
    Port (  
            in0: in std_logic_vector(15 downto 0);
            in1: in std_logic_vector(15 downto 0);
            in2: in std_logic_vector(15 downto 0);
            in3: in std_logic_vector(15 downto 0);
            in4: in std_logic_vector(15 downto 0);
            in5: in std_logic_vector(15 downto 0);
            in6: in std_logic_vector(15 downto 0);
            in7: in std_logic_vector(15 downto 0);
            in8: in std_logic_vector(15 downto 0);
            s: in std_logic_vector(3 downto 0);
            z : out std_logic_vector(15 downto 0));
end mux9_16;

architecture Behavioral of mux9_16 is
        constant gate_delay: Time:= 1 ns;
begin
    z <=    in0 after gate_delay when s = x"0" else
            in1 after gate_delay when s = x"1" else
            in2 after gate_delay when s = x"2" else
            in3 after gate_delay when s = x"3" else
            in4 after gate_delay when s = x"4" else
            in5 after gate_delay when s = x"5" else
            in6 after gate_delay when s = x"6" else
            in7 after gate_delay when s = x"7" else
            in8 after gate_delay when s = x"8" else
            x"0000" after gate_delay;
end Behavioral;