library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FU_16bit_testbench is
end FU_16bit_testbench;

Architecture Behavioral of FU_16bit_testbench is
    component FU_16bit
    port(
        mode_select : in STD_LOGIC_VECTOR (4 downto 0);
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        outPut : out STD_LOGIC_VECTOR (15 downto 0);
        V : out STD_LOGIC;
        C : out STD_LOGIC;
        N : out STD_LOGIC;
        Z : out STD_LOGIC
        );
    end component;
    
    --input
    signal mode_select : STD_LOGIC_VECTOR (4 downto 0) := (others => '0');
    signal A : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal B : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    
    --outputs
    signal outPut : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal V : STD_LOGIC := '0';
    signal C : STD_LOGIC := '0';
    signal N : STD_LOGIC := '0';
    signal Z : STD_LOGIC := '0';
    
    constant wait_time: Time := 50ns; 

    
begin
    --uut
    uut: FU_16bit PORT MAP (
        mode_select => mode_select,
        A => A,
        B => B, 
        outPut => outPut,
        V => V,
        C => C,
        N => N,
        Z => Z
        );
    
    stim_proc: process
    begin
        --out = A
        A <= x"0001";
        B <= x"0005";
        mode_select <= "00000";
        wait for wait_time;
        
        --out = A + 1
        A <= x"0001";
        B <= x"0005";
        mode_select <= "00001";
        wait for wait_time;
       
        --out = A + B 
        A <= x"0001";
        B <= x"0005";
        mode_select <= "00010";
        wait for wait_time;
        
        --out = A + B + 1
        A <= x"0001";
        B <= x"0005";
        mode_select <= "00011";
        wait for wait_time;
        
        --out = A + !B
        A <= x"0001";
        B <= x"0005";
        mode_select <= "00100";
        wait for wait_time;
        
        --out = A + !B + 1
        A <= x"0001";
        B <= x"0005";
        mode_select <= "00101";
        wait for wait_time;
        
        --out = A - 1
        A <= x"0001";
        B <= x"0005";
        mode_select <= "00110";
        wait for wait_time;
       
        --out = A 
        A <= x"0001";
        B <= x"0005";
        mode_select <= "00111";
        wait for wait_time;
        
        --overflow check
        A <= x"7FFF";
        B <= x"0001";
        mode_select <= "00010";
        wait for wait_time;
        
        --carry check
        A <= x"FFFF";
        B <= x"0001";
        mode_select <= "00010";
        wait for wait_time;
        
        --LOGIC
        A <= x"3C3C";
        B <= x"F0F0";
        -- A AND B
        mode_select <= "01000";
        wait for wait_time;

        -- A OR B
        mode_select <= "01010";
        wait for wait_time;
        
        -- A XOR B
        mode_select <= "01100";
        wait for wait_time;
        
        -- NOT(A)
        mode_select <= "01110";
        wait for wait_time;
        
        --SHIFTING
        B <= x"00F0";
        
        mode_select <= "10000";
        wait for wait_time;
    
        mode_select <= "10100";
        wait for wait_time;
    
        mode_select <= "11000";
        wait for wait_time;
    end process;
end Behavioral;
