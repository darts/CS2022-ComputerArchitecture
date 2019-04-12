library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity extended_pc_testbench is
end extended_pc_testbench;

architecture Behavioral of extended_pc_testbench is
 
    COMPONENT extended_pc
    Port(   pc_in: in std_logic_vector(5 downto 0);
            pl, pi, reset: in std_logic;
            pc_out: out std_logic_vector(15 downto 0)
            );
    END COMPONENT;
    

   --Inputs
    signal pc_in: std_logic_vector(5 downto 0) := (others => '0');
    signal pl: std_logic;
    signal pi: std_logic;
    signal reset: std_logic;

 	--Outputs
     signal pc_out: std_logic_vector(15 downto 0) := (others => '0');
     
BEGIN
	--uut
    uut: extended_pc PORT MAP (
        pc_in => pc_in,
        pl => pl,
        pi => pi,
        reset => reset,
        pc_out => pc_out
    );

   stim_proc: process
   begin
    --reset
    pc_in <= "000010";
    pl <= '0';
    pi <= '0';
    reset <= '1';
    wait for 10 ns;

    --update with alt
    reset <= '0';
    pl <= '1';
    wait for 10 ns;

    --increment
    pl <= '0';
    pi <= '1';
    wait for 10 ns;

    --reset
    pi <= '0';
    reset <= '1';
    wait for 10 ns;

    --reset
    pc_in <= "100010";
    pl <= '0';
    pi <= '0';
    reset <= '1';
    wait for 10 ns;

    --update with alt
    reset <= '0';
    pl <= '1';
    wait for 10 ns;

    --increment
    pl <= '0';
    pi <= '1';
    wait for 10 ns;

    --reset
    pi <= '0';
    reset <= '1';
    wait for 10 ns;
   end process;
end Behavioral;
