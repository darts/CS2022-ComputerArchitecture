library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux8_1 is
    Port (  in0 : in std_logic;
            in1 : in std_logic;
            in2 : in std_logic;
            in3 : in std_logic;
            in4 : in std_logic;
            in5 : in std_logic;
            in6 : in std_logic;
            in7 : in std_logic;
            s: in std_logic_vector(2 downto 0);
            z : out std_logic);
end mux8_1;

architecture Behavioral of mux8_1 is
    constant gate_delay: Time:= 1 ns;
begin
    z <=    in0 after gate_delay when s = "000" else
            in1 after gate_delay when s = "001" else
            in2 after gate_delay when s = "010" else
            in3 after gate_delay when s = "011" else
            in4 after gate_delay when s = "100" else
            in5 after gate_delay when s = "101" else
            in6 after gate_delay when s = "110" else
            in7 after gate_delay when s = "111" else
            '0' after gate_delay;
end Behavioral;
