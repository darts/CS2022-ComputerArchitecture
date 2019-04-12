library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arithmetic_circuit_16bit is
    Port (
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        mode_select : in STD_LOGIC_VECTOR (1 downto 0);
        carryIn : in STD_LOGIC;
        output : out STD_LOGIC_VECTOR (15 downto 0);
        carryOut : out STD_LOGIC;
        overFlow : out STD_LOGIC
     );
end arithmetic_circuit_16bit;

architecture Behavioral of arithmetic_circuit_16bit is
    component ripple_adder 
        port ( 
            A : in STD_LOGIC_VECTOR (15 downto 0);
            B : in STD_LOGIC_VECTOR (15 downto 0);
            carryIn : in STD_LOGIC;
            carryOut : out STD_LOGIC;
            overFlow : out STD_LOGIC;
            sum : out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;

    component input_logic_y
        port (
            B : in STD_LOGIC_VECTOR (15 downto 0);
            sel : in STD_LOGIC_VECTOR (1 downto 0);
            out_B : out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;
    
    signal logic_to_adder : STD_LOGIC_VECTOR (15 downto 0);
begin
    adder: ripple_adder port map(
        A => A,
        B => logic_to_adder,
        carryIn => carryIn,
        carryOut => carryOut,
        overFlow => overFlow,
        sum => output
    );
    logic: input_logic_y port map(
        B => B,
        sel => mode_select,
        out_B => logic_to_adder
    );
end Behavioral;