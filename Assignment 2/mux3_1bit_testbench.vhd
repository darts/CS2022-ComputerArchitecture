library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux3_1bit_testbench is
end mux3_1bit_testbench;
    
architecture Behavioral of mux3_1bit_testbench is
    component mux3_1bit
    port (
            sel : in STD_LOGIC_VECTOR (1 downto 0);
            in0 : in STD_LOGIC;
            in1 : in STD_LOGIC;
            in2 : in STD_LOGIC;
            outPut : out STD_LOGIC
    );
    end component;
    
    --inputs
    signal sel : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');
    signal in0 : STD_LOGIC := '0';
    signal in1 : STD_LOGIC := '0';
    signal in2 : STD_LOGIC := '0';
    
    --outputs
    signal outPut : STD_LOGIC := '0';
    
    constant wait_time : time := 20ns;
begin
    uut: mux3_1bit port map(
        sel => sel,
        in0 => in0,
        in1 => in1,
        in2 => in2,
        outPut => outPut
    );
    
 stim_proc : process
   begin
    in0 <= '1';
    in1 <= '0';
    in2 <= '0';
    wait for wait_time;
    
    sel <= "00";
    wait for wait_time;

    sel <= "01";
    wait for wait_time;
    
    in2 <= '1';
    sel <= "10";
    wait for wait_time;
    
  end process;

end Behavioral;
