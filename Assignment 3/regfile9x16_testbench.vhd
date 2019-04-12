LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY regfile9x16_testbench IS
END regfile9x16_testbench;
 
ARCHITECTURE behavior OF regfile9x16_testbench IS 
 
    COMPONENT regfile9_16
    Port (  
            clk : in STD_LOGIC;
            write_enable : in STD_LOGIC;
            MB_select : in STD_LOGIC_VECTOR (0 downto 0);
            MD_select : in STD_LOGIC_VECTOR (0 downto 0);
            MM_select : in STD_LOGIC_VECTOR (0 downto 0);
            SB : in STD_LOGIC_VECTOR (2 downto 0);
            des_reg : in STD_LOGIC_VECTOR (2 downto 0);
            src_a : in STD_LOGIC_VECTOR (2 downto 0);
            src_b : in STD_LOGIC_VECTOR (2 downto 0);
            mode_select : in STD_LOGIC_VECTOR (4 downto 0);
            data_in : in STD_LOGIC_VECTOR (15 downto 0);
            a_out : out STD_LOGIC_VECTOR (15 downto 0);
            data_out : out STD_LOGIC_VECTOR (15 downto 0);
            PC_in : in STD_LOGIC_VECTOR (15 downto 0);
            V : out STD_LOGIC;
            C : out STD_LOGIC;
            N : out STD_LOGIC;
            Z : out STD_LOGIC
            );
    END COMPONENT;
    

   --Inputs
    signal src0 : std_logic_vector(3 downto 0) := (others => '0');
    signal src1 : std_logic_vector(3 downto 0) := (others => '0');
    signal des : std_logic_vector(3 downto 0) := (others => '0');
    signal clk : std_logic;
    signal load : std_logic;
    signal data : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
    signal out0 : std_logic_vector(15 downto 0) := (others => '0');
    signal out1 : std_logic_vector(15 downto 0) := (others => '0');

    constant Clk_period : time := 10 ns;
BEGIN
    
    clock_process : process 
    begin
    clk <= '0';
    wait for Clk_period/2;
    clk <= '1';
    wait for Clk_period/2;
    end process;
 
	--uut
    uut: regfile9_16 PORT MAP (
        src0 => src0,
        src1 => src1,
        des => des,
        clk => clk,
        load => load,
        data => data,
        out0 => out0,
        out1 => out1
    );

    --stim proc
    stim_proc : process
    begin
        --load hex 0 to reg0
        des_reg <= "0000";
        write_enable <= '1';
        data_in <= x"0000";
        wait for clk_period*5;
        write_enable <= '0';
        
        --load hex 1 to reg1
        des_reg <= "0001";
        data_in <= x"0001";
        write_enable <= '1';
        wait for clk_period*5;
        
        --load hex 2 to reg2
        des_reg <= "0010";
        write_enable <= '1';
        data_in <= x"0002";
        wait for clk_period*5;
        
        --load hex 3 to reg3
        des_reg <= "0011";
        write_enable <= '1';
        data_in <= x"0003";
        wait for clk_period*5;
        
        --load hex 4 to reg4
        des_reg <= "0100";
        write_enable <= '1';
        data_in <= x"0004";
        wait for clk_period*5;
        
        --load hex 5 to reg5
        des_reg <= "0101";
        write_enable <= '1';
        data_in <= x"0005";
        wait for clk_period*5;
        
        --load hex 6 to reg6
        des_reg <= "0110";
        write_enable <= '1';
        data_in <= x"0006";
        wait for clk_period*5;
       
        --load hex 7 to reg7
        des_reg <= "0111";
        write_enable <= '1';
        data_in <= x"0007";
        wait for clk_period*5;

        --load hex 8 to reg8
        des_reg <= "1000";
        write_enable <= '1';
        data_in <= x"0008";
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

END;