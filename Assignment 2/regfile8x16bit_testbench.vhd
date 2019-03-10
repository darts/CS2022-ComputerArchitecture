library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regfile8x16bit_testbench is
end regfile8x16bit_testbench;

architecture Behavioral of regfile8x16bit_testbench is
    component regfile8x16bit 
    port (
        src_s : in STD_LOGIC_VECTOR (2 downto 0);
        des_A : in STD_LOGIC_VECTOR (2 downto 0);
        data : in STD_LOGIC_VECTOR (15 downto 0);
        data_src : in STD_LOGIC_VECTOR (0 downto 0);
        clk : in STD_LOGIC
        );
    end component;
    
    --inputs
    signal src_s : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal des_A : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal data : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal data_src : STD_LOGIC_VECTOR (0 downto 0) := (others => '0');
    signal clk : STD_LOGIC := '0';
    
    --outputs
    --NONE
    
    --define clock
    constant clk_period : time := 10ns;
    constant clk_half : time := clk_period/2;
    
begin

    --uut
    uut: regfile8x16bit port map(
        src_s => src_s,
        des_A => des_A,
        data => data,
        data_src => data_src,
        clk => clk
        );
        
    --clock
    clk_process : process
    begin
        clk <= '0';
        wait for clk_half;
        clk <= '1';
        wait for clk_half;
    end process;
    
    --stim proc
    stim_proc : process
    begin
        --load hex 0 to reg0
        des_A <= "000";
        data_src <= "0";
        data <= x"00";
        wait for clk_period*5;
        
        --load hex 1 to reg1
        des_A <= "001";
        data_src <= "0";
        data <= x"01";
        wait for clk_period*5;
        
        --load hex 2 to reg2
        des_A <= "010";
        data_src <= "0";
        data <= x"02";
        wait for clk_period*5;
        
        --load hex 3 to reg3
        des_A <= "011";
        data_src <= "0";
        data <= x"03";
        wait for clk_period*5;
        
        --load hex 4 to reg4
        des_A <= "100";
        data_src <= "0";
        data <= x"04";
        wait for clk_period*5;
        
        --load hex 5 to reg5
        des_A <= "101";
        data_src <= "0";
        data <= x"05";
        wait for clk_period*5;
        
        --load hex 6 to reg6
        des_A <= "110";
        data_src <= "0";
        data <= x"06";
        wait for clk_period*5;
        
        --load hex 7 to reg7
        des_A <= "111";
        data_src <= "0";
        data <= x"07";
        wait for clk_period*5;
    end process;

end Behavioral;
