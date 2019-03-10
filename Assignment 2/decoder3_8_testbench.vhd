library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder3_8_testbench is
end decoder3_8_testbench;

Architecture Behavioral of decoder3_8_testbench is
    component decoder3_8
    port(
        sel : in STD_LOGIC_VECTOR (2 downto 0);
        out0 : out STD_LOGIC;
        out1 : out STD_LOGIC;
        out2 : out STD_LOGIC;
        out3 : out STD_LOGIC;
        out4 : out STD_LOGIC;
        out5 : out STD_LOGIC;
        out6 : out STD_LOGIC;
        out7 : out STD_LOGIC
        );
    end component;
    
    --input
    signal sel : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    
    --outputs
    signal out0 : STD_LOGIC;
    signal out1 : STD_LOGIC;
    signal out2 : STD_LOGIC;
    signal out3 : STD_LOGIC;
    signal out4 : STD_LOGIC;
    signal out5 : STD_LOGIC;
    signal out6 : STD_LOGIC;
    signal out7 : STD_LOGIC;
    
BEGIN
    --uut
    uut: decoder3_8 PORT MAP (
        sel => sel,
        out0 => out0,
        out1 => out1,
        out2 => out2,
        out3 => out3,
        out4 => out4,
        out5 => out5,
        out6 => out6,
        out7 => out7
        );
    
    stim_proc: process
    begin
        wait for 10ns;
            sel <= "000";
    
        wait for 10 ns;    
            sel <= "001";
    
        wait for 10 ns;    
            sel <= "010";
            
        wait for 10 ns;
            sel <="011";
            
        wait for 10 ns;    
            sel <= "100";
          
        wait for 10 ns;    
            sel <= "101";
            
        wait for 10 ns;    
            sel <= "110";
            
        wait for 10 ns;    
            sel <= "111";

    end process;

END Behavioral;
