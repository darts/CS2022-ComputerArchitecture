library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shifter1_16bit_testbench is
end shifter1_16bit_testbench;

architecture Behavioral of shifter1_16bit_testbench is
    component shifter1_16bit
    Port( 
    inPut : in STD_LOGIC_VECTOR (15 downto 0);
    outPut : out STD_LOGIC_VECTOR (15 downto 0);
    sel : in STD_LOGIC_VECTOR (1 downto 0)
    );
    end component;
    
    --inputs 
    signal inPut : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal sel : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
    
    --output
    signal outPut : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    
    constant wait_time : time := 20ns;
begin
    uut: shifter1_16bit port map (
        inPut => inPut,
        outPut => outPut,
        sel => sel
    );
    
    stim_proc : process
    begin
    inPut <= x"00F0";
    sel <= "00";
    wait for wait_time;
    
    sel <= "01";
    wait for wait_time;
    
    sel <= "10";
    wait for wait_time;
    end process;

end Behavioral;
