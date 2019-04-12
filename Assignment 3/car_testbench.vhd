library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity car_testbench is
end car_testbench;

architecture Behavioral of car_testbench is
 
    COMPONENT car
    Port (  
            car_in : in std_logic_vector(7 downto 0);
            s : in std_logic;
            reset :in std_logic; 
            clk : in std_logic;
            car_out : out std_logic_vector(7 downto 0));
    END COMPONENT;
    

   --Inputs
    signal car_in : std_logic_vector(7 downto 0) := (others => '0');
    signal s : std_logic;
    signal reset : std_logic;
    signal clk: std_logic;

 	--Outputs
    signal car_out : std_logic_vector(7 downto 0) := (others => '0');
 
   constant Clk_period : time := 10 ns;
 
BEGIN
    clock_process : process 
    begin
    clk <= '0';
    wait for Clk_period/2;
    clk <= '1';
    wait for Clk_period/2;
    end process;
    
	-- uut
    uut: car PORT MAP (
        car_in => car_in,
        s => s,
        clk => clk,
        reset => reset,
        car_out => car_out
    );

   stim_proc: process
   begin
    car_in <= x"05";
    s <= '0';
    reset <= '1';
    wait for 10 ns;
    reset <= '0';
    s <= '1';
    wait for 10 ns;
    s <= '0';
    wait for 10 ns;
   end process;
end Behavioral;
