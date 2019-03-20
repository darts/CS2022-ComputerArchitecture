library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity datapath_16bit_testbench is
end datapath_16bit_testbench;

architecture Behavioral of datapath_16bit_testbench is
    component datapath_16bit
    port(
        clk : in STD_LOGIC;
        write_enable : in STD_LOGIC;
        MB_select : in STD_LOGIC_VECTOR (0 downto 0);
        MD_select : in STD_LOGIC_VECTOR (0 downto 0);
        des_reg : in STD_LOGIC_VECTOR (2 downto 0);
        src_a : in STD_LOGIC_VECTOR (2 downto 0);
        src_b : in STD_LOGIC_VECTOR (2 downto 0);
        const_in : in STD_LOGIC_VECTOR (15 downto 0);
        mode_select : in STD_LOGIC_VECTOR (4 downto 0);
        data_in : in STD_LOGIC_VECTOR (15 downto 0);
        a_out : out STD_LOGIC_VECTOR (15 downto 0);
        data_out : out STD_LOGIC_VECTOR (15 downto 0);
        V : out STD_LOGIC;
        C : out STD_LOGIC;
        N : out STD_LOGIC;
        Z : out STD_LOGIC
    );
    end component;
    
    --inputs
    signal clk : STD_LOGIC := '0';
    signal write_enable : STD_LOGIC := '0';
    signal MB_select : STD_LOGIC_VECTOR (0 downto 0) := (others => '0');
    signal MD_select : STD_LOGIC_VECTOR (0 downto 0) := (others => '0');
    signal des_reg : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal src_a : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal src_b : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal const_in : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal mode_select : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
    signal data_in : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    
    --outputs
    signal a_out : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal data_out : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal V : STD_LOGIC := '0';
    signal C : STD_LOGIC := '0';
    signal N : STD_LOGIC := '0';
    signal Z : STD_LOGIC := '0';
    
    --define clock
    constant clk_period : time := 100ns;
    constant clk_half : time := clk_period/2;
    
begin
    uut: datapath_16bit port map(
        clk => clk,
        write_enable => write_enable,
        MB_select => MB_select,
        MD_select => MD_select,
        des_reg => des_reg,
        src_a => src_a,
        src_b => src_b,
        const_in => const_in,
        mode_select => mode_select,
        data_in => data_in,
        a_out => a_out,
        data_out => data_out,
        V => V,
        C => C,
        N => N,
        Z => Z
    );
    
    --clock
    clk_process : process
    begin
        clk <= '0';
        wait for clk_half;
        clk <= '1';
        wait for clk_half;
    end process;

    --tests
    stim_proc : process
    begin 
        --test registers
        --load hex 0 to reg0
        des_reg <= "000";
        write_enable <= '1';
        data_in <= x"0000";
        MD_select <= "1";
        wait for clk_period;
        
        --load hex 1 to reg1
        des_reg <= "001";
        data_in <= x"0001";
        write_enable <= '1';
        MD_select <= "1";
        wait for clk_period;
        
        --load hex 2 to reg2
        des_reg <= "010";
        write_enable <= '1';
        data_in <= x"0002";
        MD_select <= "1";
        wait for clk_period;
        
        --load hex 3 to reg3
        des_reg <= "011";
        write_enable <= '1';
        data_in <= x"0003";
        MD_select <= "1";
        wait for clk_period;
        
        --load hex 4 to reg4
        des_reg <= "100";
        write_enable <= '1';
        data_in <= x"0004";
        MD_select <= "1";
        wait for clk_period;
        
        --load hex 5 to reg5
        des_reg <= "101";
        write_enable <= '1';
        data_in <= x"0005";
        MD_select <= "1";
        wait for clk_period;
        
        --load hex 6 to reg6
        des_reg <= "110";
        write_enable <= '1';
        data_in <= x"0006";
        MD_select <= "1";
        wait for clk_period;
       
        --load hex 7 to reg7
        des_reg <= "111";
        write_enable <= '1';
        data_in <= x"0007";
        MD_select <= "1";
        wait for clk_period;
        
        --reg2 = reg1
        src_a <= "001";
        mode_select <= "00000";
        des_reg <= "010";
        write_enable <= '1';
        MD_select <= "0";
        wait for clk_period;
        
        --reg2 = reg1 + 1
        src_a <= "001";
        mode_select <= "00001";
        des_reg <= "010";
        write_enable <= '1';
        MD_select <= "0";
        wait for clk_period;
       
        --reg2 = reg1 + reg5 
        src_a <= "001";
        src_b <= "101";
        MB_select <= "0";
        mode_select <= "00010";
        des_reg <= "010";
        write_enable <= '1';
        MD_select <= "0";
        wait for clk_period;
        
        --reg2 = reg1 + reg5 + 1
        src_a <= "001";
        src_b <= "101";
        MB_select <= "0";
        mode_select <= "00011";
        des_reg <= "010";
        write_enable <= '1';
        MD_select <= "0";
        wait for clk_period;
        
        --reg6 = reg1 + !reg5
        src_a <= "001";
        src_b <= "101";
        MB_select <= "0";
        mode_select <= "00100";
        des_reg <= "110";
        write_enable <= '1';
        MD_select <= "0";
        wait for clk_period;
        
        --reg6 = reg1 + !reg5 + 1
        src_a <= "001";
        src_b <= "101";
        MB_select <= "0";
        mode_select <= "00101";
        des_reg <= "110";
        write_enable <= '1';
        MD_select <= "0";
        wait for clk_period;
        
        --reg6 = reg1 - 1
        src_a <= "001";
        src_b <= "101";
        MB_select <= "0";
        mode_select <= "00110";
        des_reg <= "110";
        write_enable <= '1';
        MD_select <= "0";
        wait for clk_period;
       
        --reg6 = reg1 
        src_a <= "001";
        src_b <= "101";
        MB_select <= "0";
        mode_select <= "00111";
        des_reg <= "110";
        write_enable <= '1';
        MD_select <= "0";
        wait for clk_period;
       
        --overflow and negative check
            --load hex 7FFF to reg3
            des_reg <= "011";
            write_enable <= '1';
            data_in <= x"7FFF";
            MD_select <= "1";
            wait for clk_period;
            
            --load hex 0001 to reg4
            des_reg <= "100";
            write_enable <= '1';
            data_in <= x"0001";
            MD_select <= "1";
            wait for clk_period;
            
            --reg3 + reg4 
            src_a <= "011";
            src_b <= "100";
            MB_select <= "0";
            mode_select <= "00010";
            des_reg <= "101";
            write_enable <= '0';
            MD_select <= "0";
            wait for clk_period;
            
        --carry & zero check
            --load hex FFFF to reg3
            des_reg <= "011";
            write_enable <= '1';
            data_in <= x"FFFF";
            MD_select <= "1";
            wait for clk_period;
            
            --hex 0001 already in reg4
            
            --reg3 + reg4 
            src_a <= "011";
            src_b <= "100";
            MB_select <= "0";
            mode_select <= "00010";
            des_reg <= "101";
            write_enable <= '0';
            MD_select <= "0";
            wait for clk_period;
        
        --LOGIC
        --load hex 3C3C to reg3
        des_reg <= "011";
        write_enable <= '1';
        data_in <= x"3C3C";
        MD_select <= "1";
        wait for clk_period;
        
        --load hex F0F0 to reg4
        des_reg <= "100";
        write_enable <= '1';
        data_in <= x"F0F0";
        MD_select <= "1";
        wait for clk_period;
        
        --reg1 = reg3 AND reg4 
        src_a <= "011";
        src_b <= "100";
        MB_select <= "0";
        mode_select <= "01000";
        des_reg <= "001";
        write_enable <= '1';
        MD_select <= "0";
        wait for clk_period;

        --reg1 = reg3 OR reg4 
        src_a <= "011";
        src_b <= "100";
        MB_select <= "0";
        mode_select <= "01010";
        des_reg <= "001";
        write_enable <= '1';
        MD_select <= "0";
        wait for clk_period;
            
        --reg1 = reg3 XOR reg4 
        src_a <= "011";
        src_b <= "100";
        MB_select <= "0";
        mode_select <= "01100";
        des_reg <= "001";
        write_enable <= '1';
        MD_select <= "0";
        wait for clk_period;
        
        --reg1 = reg3 OR reg4 
        src_a <= "011";
        src_b <= "100";
        MB_select <= "0";
        mode_select <= "01010";
        des_reg <= "001";
        write_enable <= '1';
        MD_select <= "0";
        wait for clk_period;
        
        --reg1 = NOT(reg3)
        src_a <= "011";
        src_b <= "100";
        MB_select <= "0";
        mode_select <= "01110";
        des_reg <= "001";
        write_enable <= '1';
        MD_select <= "0";
        wait for clk_period;
        
        --SHIFTING
        --load hex 00F0 to reg4
        des_reg <= "100";
        write_enable <= '1';
        data_in <= x"00F0";
        MD_select <= "1";
        wait for clk_period;
        
        --reg1 = reg4
        src_a <= "011";
        src_b <= "100";
        MB_select <= "0";
        mode_select <= "10000";
        des_reg <= "001";
        write_enable <= '1';
        MD_select <= "0";
        wait for clk_period;
    
        --reg1 = sr(reg4)
        src_a <= "011";
        src_b <= "100";
        MB_select <= "0";
        mode_select <= "10100";
        des_reg <= "001";
        write_enable <= '1';
        MD_select <= "0";
        wait for clk_period;
        
        --reg1 = sl(reg4)
        src_a <= "011";
        src_b <= "100";
        MB_select <= "0";
        mode_select <= "11000";
        des_reg <= "001";
        write_enable <= '1';
        MD_select <= "0";
        wait for clk_period;
        
    end process;
end Behavioral;
