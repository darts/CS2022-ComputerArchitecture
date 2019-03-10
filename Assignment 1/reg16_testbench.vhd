library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity reg16_testbench is
end reg16_testbench;

Architecture Behavioral of reg16_testbench is
    component reg16
    port(
        loadEnable : in STD_LOGIC;
        clk : in STD_LOGIC;
        inD : in STD_LOGIC_VECTOR (15 downto 0);
        outQ : out STD_LOGIC_VECTOR (15 downto 0)
        );
     end component;
     
     --Inputs
     signal loadEnable : STD_LOGIC := '0';
     signal clk : STD_LOGIC := '0';
     signal inD : STD_LOGIC_VECTOR (15 downto 0) :=  (others =>'0');
     
     --Output
     signal outQ : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
     
     --Define clock
     constant clk_period : time := 10ns;
     constant clk_half : time := clk_period/2;
     
begin

    --Unit Under Test
    uut: reg16 PORT MAP (
        loadEnable => loadEnable,
        clk => clk,
        inD => inD,
        outQ => outQ
        );
        
    --clk process
    clk_process: process
    begin
        clk <= '0';
        wait for clk_half;
        clk <= '1';
        wait for clk_half;
    end process;
    
    --stim process
    stim_proc: process
    begin
        inD <= "0000000011111111";
        loadEnable <= '0';
        
        wait for clk_period*2;
            loadEnable <= '1';
            
        wait for clk_period*2;
            loadEnable <= '0';
            inD <= "1111111100000000";
            
        wait for clk_period*2;
            loadEnable <= '1';
            
        wait for clk_period*2;
            loadEnable <= '0';
     end process;
end Behavioral;
