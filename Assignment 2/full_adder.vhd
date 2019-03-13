library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port(
        A : in STD_LOGIC;
        B : in STD_LOGIC;
        carryIn: in STD_LOGIC;
        sum : out STD_LOGIC;
        carryOut : out STD_LOGIC
    );   
end full_adder;

architecture Behavioral of full_adder is
signal s1,s2,s3 : STD_LOGIC;
constant gate_delay: Time := 5ns; 

begin
    s1 <= (A xor B) after gate_delay;
    sum <= (s1 xor carryIn) after gate_delay;
    s2 <= (carryIn and s1) after gate_delay;
    s3 <= (A and B) after gate_delay;
    carryOut <= (s2 or s3) after gate_delay;
end Behavioral;
