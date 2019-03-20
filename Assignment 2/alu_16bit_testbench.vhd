library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_16bit_testbench is
end alu_16bit_testbench;

architecture Behavioral of alu_16bit_testbench is
    component alu_16bit
    Port ( 
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        mode_select : in STD_LOGIC_VECTOR (3 downto 0);
        V : out STD_LOGIC;
        C : out STD_LOGIC;
        outPut : out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;

    --inputs
    signal A : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal B : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal mode_select : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    
    --outputs
    signal V : STD_LOGIC := '0';
    signal C : STD_LOGIC := '0';
    signal outPut : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    
    constant wait_time: Time := 50ns; 

begin

    uut: alu_16bit port map(
        A => A,
        B => B,
        mode_select => mode_select,
        V => V,
        C => C,
        outPut => outPut
    );
    stim_proc: process
    begin 
        --out = A
        A <= x"0001";
        B <= x"0005";
        mode_select <= "0000";
        wait for wait_time;
        
        --out = A + 1
        A <= x"0001";
        B <= x"0005";
        mode_select <= "0001";
        wait for wait_time;
       
        --out = A + B 
        A <= x"0001";
        B <= x"0005";
        mode_select <= "0010";
        wait for wait_time;
        
        --out = A + B + 1
        A <= x"0001";
        B <= x"0005";
        mode_select <= "0011";
        wait for wait_time;
        
        --out = A + !B
        A <= x"0001";
        B <= x"0005";
        mode_select <= "0100";
        wait for wait_time;
        
        --out = A + !B + 1
        A <= x"0001";
        B <= x"0005";
        mode_select <= "0101";
        wait for wait_time;
        
        --out = A - 1
        A <= x"0001";
        B <= x"0005";
        mode_select <= "0110";
        wait for wait_time;
       
        --out = A 
        A <= x"0001";
        B <= x"0005";
        mode_select <= "0111";
        wait for wait_time;
        
        --overflow check
        A <= x"7FFF";
        B <= x"0001";
        mode_select <= "0010";
        wait for wait_time;
        
        --carry check
        A <= x"FFFF";
        B <= x"0001";
        mode_select <= "0010";
        wait for wait_time;
        
        --LOGIC
        A <= x"3C3C";
        B <= x"F0F0";
        -- A AND B
        mode_select <= "1000";
        wait for wait_time;

        -- A OR B
        mode_select <= "1010";
        wait for wait_time;
        
        -- A XOR B
        mode_select <= "1100";
        wait for wait_time;
        
        -- NOT(A)
        mode_select <= "1110";
        wait for wait_time;
        
    end process;

end Behavioral;
