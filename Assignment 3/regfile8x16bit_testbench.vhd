library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regfile8x16bit_testbench is
end regfile8x16bit_testbench;

architecture Behavioral of regfile8x16bit_testbench is
    component regfile8x16bit 
    port (
        src_a : in STD_LOGIC_VECTOR (2 downto 0);
        src_b : in STD_LOGIC_VECTOR (2 downto 0);
        bus_a : out STD_LOGIC_VECTOR (15 downto 0);
        bus_b : out STD_LOGIC_VECTOR (15 downto 0);
        data_in : in STD_LOGIC_VECTOR (15 downto 0);
        des_reg : in STD_LOGIC_VECTOR (2 downto 0);
        write_enable : in STD_LOGIC;
        clk : in STD_LOGIC
        );
    end component;
    
    --inputs
    signal src_a : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal src_b : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal data_in : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal des_reg : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal write_enable : STD_LOGIC := '0';
    signal clk : STD_LOGIC := '0';
   
    --outputs
    signal bus_a : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal bus_b : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    
    --define clock
    constant clk_period : time := 20ns;
    constant clk_half : time := clk_period/2;
    
begin

    --uut
    uut: regfile8x16bit port map(
        src_a => src_a,
        src_b => src_b,
        bus_a => bus_a,
        bus_b => bus_b,
        data_in => data_in,
        des_reg => des_reg,
        write_enable => write_enable,
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
        des_reg <= "000";
        write_enable <= '1';
        data_in <= x"0000";
        wait for clk_period*5;
        write_enable <= '0';
        
        --load hex 1 to reg1
        des_reg <= "001";
        data_in <= x"0001";
        write_enable <= '1';
        wait for clk_period*5;
        
        --load hex 2 to reg2
        des_reg <= "010";
        write_enable <= '1';
        data_in <= x"0002";
        wait for clk_period*5;
        
        --load hex 3 to reg3
        des_reg <= "011";
        write_enable <= '1';
        data_in <= x"0003";
        wait for clk_period*5;
        
        --load hex 4 to reg4
        des_reg <= "100";
        write_enable <= '1';
        data_in <= x"0004";
        wait for clk_period*5;
        
        --load hex 5 to reg5
        des_reg <= "101";
        write_enable <= '1';
        data_in <= x"0005";
        wait for clk_period*5;
        
        --load hex 6 to reg6
        des_reg <= "110";
        write_enable <= '1';
        data_in <= x"0006";
        wait for clk_period*5;
       
        --load hex 7 to reg7
        des_reg <= "111";
        write_enable <= '1';
        data_in <= x"0007";
        wait for clk_period*5;
        
        --read from reg1 using busA
        write_enable <= '0';
        src_a <= "001";
        wait for clk_period*5;
        
        --read from reg2 using busB
        write_enable <= '0';
        src_b <= "010";
        wait for clk_period*5;
    end process;

end Behavioral;
