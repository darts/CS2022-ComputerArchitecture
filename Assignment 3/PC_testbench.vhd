library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pc_testbench is
end pc_testbench;

architecture Behavioral of pc_testbench is
    COMPONENT pc
    Port(   
            pc_in: in std_logic_vector(15 downto 0);
            signal pl: in std_logic;
            signal pi: in std_logic;
            signal reset: in std_logic;
            pc_out: out std_logic_vector(15 downto 0)
            );
    END COMPONENT;
    

   --Inputs
    signal pc_in: std_logic_vector(15 downto 0) := (others => '0');
    signal pl: std_logic;
    signal pi: std_logic;
    signal reset: std_logic;

 	--Outputs
 	signal pc_out: std_logic_vector(15 downto 0) := (others => '0');
 
BEGIN
	-- uut
    uut: pc PORT MAP (
        pc_in => pc_in,
        pl => pl,
        pi => pi,
        reset => reset,
        pc_out => pc_out
    );

   stim_proc: process
   begin
    --init and reset
    pc_in <= x"0005";
    pl <= '0';
    pi <= '0';
    reset <= '1';
    wait for 10 ns;

    --update pc_in + temp_pc
    reset <= '0';
    pl <= '1';
    wait for 10 ns;

    --update by 1
    pl <= '0';
    pi <= '1';
    wait for 10 ns;

    --reset
    pi <= '0';
    reset <= '1';
    wait for 10 ns;
   end process;
end Behavioral;
