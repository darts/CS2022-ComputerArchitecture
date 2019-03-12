ibrary IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arithmetic_circuit_16bit is
    Port (
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        carryIn : in STD_LOGIC;
        output : out STD_LOGIC_VECTOR (15 downto 0);
        carryOut : out STD_LOGIC;
        overFlow : out STD_LOGIC
     );
end arithmetic_circuit_16bit;

architecture Behavioral of arithmetic_circuit_16bit is
    component ripple_adder 
        port ( 
            A : in  STD_LOGIC_VECTOR (15 downto 0);
            B : in  STD_LOGIC_VECTOR (15 downto 0);
            Cin : in  STD_LOGIC;
            Cout : out  STD_LOGIC;
            Vout : out  STD_LOGIC;
            S : out  STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;

    component input_logic_y
        port (
            B : in STD_LOGIC_VECTOR (15 downto 0);
            sel : in STD_LOGIC_VECTOR (1 downto 0);
            out_B : out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;
    
begin
   
end Behavioral;