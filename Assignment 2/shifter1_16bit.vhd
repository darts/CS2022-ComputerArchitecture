library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter1_16bit is
    Port( 
    inPut : in STD_LOGIC_VECTOR (15 downto 0);
    outPut : out STD_LOGIC_VECTOR (15 downto 0);
    sel : in STD_LOGIC_VECTOR (1 downto 0)
    );
end shifter1_16bit;

architecture Behavioral of shifter1_16bit is
--components 
    -- 3 bit mux for each slice
    component mux3_1bit
    port(
        sel : in STD_LOGIC_VECTOR (1 downto 0);
        in0 : in STD_LOGIC;
        in1 : in STD_LOGIC;
        in2 : in STD_LOGIC;
        outPut : out STD_LOGIC
    );
    end component; 
    
begin
    --port mapping
    --LSB
    mux0: mux3_1bit port map(
        sel => sel,
        in0 => inPut(1),
        in1 => inPut(0),
        in2 => '0',
        outPut => outPut(0)
    );
    mux1: mux3_1bit port map(
            sel => sel,
            in0 => inPut(2),
            in1 => inPut(1),
            in2 => inPut(0),
            outPut => outPut(1)
    );
    mux2: mux3_1bit port map(
            sel => sel,
            in0 => inPut(3),
            in1 => inPut(2),
            in2 => inPut(1),
            outPut => outPut(2)
    );
    mux3: mux3_1bit port map(
            sel => sel,
            in0 => inPut(4),
            in1 => inPut(3),
            in2 => inPut(2),
            outPut => outPut(3)
    );
    mux4: mux3_1bit port map(
            sel => sel,
            in0 => inPut(5),
            in1 => inPut(4),
            in2 => inPut(3),
            outPut => outPut(4)
    );
    mux5: mux3_1bit port map(
            sel => sel,
            in0 => inPut(6),
            in1 => inPut(5),
            in2 => inPut(4),
            outPut => outPut(5)
    );
    mux6: mux3_1bit port map(
            sel => sel,
            in0 => inPut(7),
            in1 => inPut(6),
            in2 => inPut(5),
            outPut => outPut(6)
    );
    mux7: mux3_1bit port map(
            sel => sel,
            in0 => inPut(8),
            in1 => inPut(7),
            in2 => inPut(6),
            outPut => outPut(7)
    );
    mux8: mux3_1bit port map(
            sel => sel,
            in0 => inPut(9),
            in1 => inPut(8),
            in2 => inPut(7),
            outPut => outPut(8)
    );
    mux9: mux3_1bit port map(
            sel => sel,
            in0 => inPut(10),
            in1 => inPut(9),
            in2 => inPut(8),
            outPut => outPut(9)
    );
    mux10: mux3_1bit port map(
            sel => sel,
            in0 => inPut(11),
            in1 => inPut(10),
            in2 => inPut(9),
            outPut => outPut(10)
            );
    mux11: mux3_1bit port map(
            sel => sel,
            in0 => inPut(12),
            in1 => inPut(11),
            in2 => inPut(10),
            outPut => outPut(11)
    );
    mux12: mux3_1bit port map(
            sel => sel,
            in0 => inPut(13),
            in1 => inPut(12),
            in2 => inPut(11),
            outPut => outPut(11)
    );
    mux13: mux3_1bit port map(
            sel => sel,
            in0 => inPut(14),
            in1 => inPut(13),
            in2 => inPut(12),
            outPut => outPut(13)
    );
    mux14: mux3_1bit port map(
        sel => sel,
        in0 => inPut(15),
        in1 => inPut(14),
        in2 => inPut(13),
        outPut => outPut(14)
    );
    --MSB
    mux15: mux3_1bit port map(
            sel => sel,
            in0 => '0',
            in1 => inPut(15),
            in2 => inPut(14),
            outPut => outPut(15)
    );
end Behavioral;
