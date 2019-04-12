library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zero_detect_16bit_testbench is
end zero_detect_16bit_testbench;

architecture Behavioral of zero_detect_16bit_testbench is
    component zero_detect_16bit
    port(
        inPut : in STD_LOGIC_VECTOR (15 downto 0);
        outPut : out STD_LOGIC 
        );
    end component;
    
    --input
    signal inPut : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    
    --output
    signal outPut : STD_LOGIC := '0';
    
    constant wait_time : time := 50ns;

begin
    uut: zero_detect_16bit port map(
        inPut => inPut,
        outPut => outPut
    );
    
    stim_proc: process
    begin
        inPut <= x"0000";
        wait for wait_time;
        
        inPut <= x"0100";
        wait for wait_time;
        
        inPut <=  x"0001";
        wait for wait_time;
    end process;


end Behavioral;
