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

begin
    sum <= ((A xor B) xor carryIn);
    carryOut <= ((carryIn and (A xor B)) or (A and B)); 
end Behavioral;
