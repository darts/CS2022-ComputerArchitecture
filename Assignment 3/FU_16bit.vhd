library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FU_16bit is
    Port (
        mode_select : in STD_LOGIC_VECTOR (4 downto 0);
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        outPut : out STD_LOGIC_VECTOR (15 downto 0);
        V : out STD_LOGIC;
        C : out STD_LOGIC;
        N : out STD_LOGIC;
        Z : out STD_LOGIC
    );
end FU_16bit;

architecture Behavioral of FU_16bit is
    component alu_16bit
    port (
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        mode_select : in STD_LOGIC_VECTOR (3 downto 0);
        V : out STD_LOGIC;
        C : out STD_LOGIC;
        outPut : out STD_LOGIC_VECTOR (15 downto 0)
    );
    end component;

    component shifter1_16bit
    port (
        inPut : in STD_LOGIC_VECTOR (15 downto 0);
        outPut : out STD_LOGIC_VECTOR (15 downto 0);
        sel : in STD_LOGIC_VECTOR (1 downto 0)
    );
    end component;

    component mux2_16bit
    port (
        sel : in  STD_LOGIC_VECTOR (0 downto 0);
        in0 : in  STD_LOGIC_VECTOR (15 downto 0);
        in1 : in  STD_LOGIC_VECTOR (15 downto 0);
        z : out STD_LOGIC_VECTOR (15 downto 0)
    );
    end component;

    component zero_detect_16bit
    port (
        inPut : in STD_LOGIC_VECTOR (15 downto 0);
        outPut : out STD_LOGIC 
    );
    end component;

    signal aluOut, shiftOut : STD_LOGIC_VECTOR (15 downto 0);
    constant gate_delay: Time := 1ns; 

begin

    alu : alu_16bit port map(
        A => A,
        B => B,
        mode_select => mode_select(3 downto 0),
        V => V,
        C => C,
        outPut => aluOut
    );

    shift : shifter1_16bit port map(
        inPut => B,
        outPut => shiftOut,
        sel => mode_select(3 downto 2)
    );

    outSelect : mux2_16bit port map(
        sel => mode_select(4 downto 4),
        in0 => aluOut,
        in1 => shiftOut,
        z => outPut
    );

    zero : zero_detect_16bit port map(
        inPut => aluOut,
        outPut => Z
    );

    N <= '1' after gate_delay when aluOut(15)='1' else
        '0' after gate_delay;

end Behavioral;
