library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_16bit is
    Port ( 
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        mode_select : in STD_LOGIC_VECTOR (3 downto 0);
        V : out STD_LOGIC;
        C : out STD_LOGIC;
        outPut : out STD_LOGIC_VECTOR (15 downto 0)
        );
end alu_16bit;

architecture Behavioral of alu_16bit is
constant gate_delay: Time := 5ns; 
    component arithmetic_circuit_16bit
    port (
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        mode_select : in STD_LOGIC_VECTOR (1 downto 0);
        carryIn : in STD_LOGIC;
        output : out STD_LOGIC_VECTOR (15 downto 0);
        carryOut : out STD_LOGIC;
        overFlow : out STD_LOGIC
    );
    end component;

    component logic_circuit_16bit 
    port (
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        sel : in STD_LOGIC_VECTOR (1 downto 0);
        output : out STD_LOGIC_VECTOR (15 downto 0)
    );
    end component;

    component mux2_16bit
    port (
        sel : in  STD_LOGIC_VECTOR (3 downto 3);
        in0 : in  STD_LOGIC_VECTOR (15 downto 0);
        in1 : in  STD_LOGIC_VECTOR (15 downto 0);
        z : out STD_LOGIC_VECTOR (15 downto 0)
    );
    end component;

    signal arithOut, logicOut : STD_LOGIC_VECTOR (15 downto 0);

begin
        arith : arithmetic_circuit_16bit port map(
            A => A,
            B => B,
            mode_select => mode_select(2 downto 1),
            carryIn => mode_select(0),
            overFlow => V,
            carryOut => C,
            outPut => arithOut
        );

        logic : logic_circuit_16bit port map(
            A => A,
            B => B,
            sel => mode_select(2 downto 1),
            output => logicOut
        );

        outSelect : mux2_16bit port map(
            sel => mode_select(3 downto 3),
            in0 => arithOut,
            in1 => logicOut,
            z => outPut
        );
end Behavioral;