library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity microprogrammed_control_testbench is
end microprogrammed_control_testbench;

architecture Behavioral of microprogrammed_control_testbench is
 
    COMPONENT microprogrammed_control
    Port(   signal data_in: in std_logic_vector(15 downto 0);
            signal flags: in std_logic_vector(3 downto 0);
            signal reset, clk: in std_logic;
            signal pc_out: out std_logic_vector(15 downto 0);
            signal dr, sa, sb: out std_logic_vector(2 downto 0);
            signal td, ta, tb, mb, md, rw, mm, mw: out std_logic;
            signal fs: out std_logic_vector(4 downto 0)
            );
    END COMPONENT;
    

   --Inputs
    signal data_in : std_logic_vector(15 downto 0) := (others => '0');
    signal flags : std_logic_vector(3 downto 0) := (others => '0');
    signal clk: std_logic;
    signal reset: std_logic;

 	--Outputs
 	signal pc_out : std_logic_vector(15 downto 0);
    signal dr : std_logic_vector(2 downto 0);
    signal sa : std_logic_vector(2 downto 0);
    signal sb : std_logic_vector(2 downto 0);
    signal fs : std_logic_vector(4 downto 0);
    signal td : std_logic;
    signal ta : std_logic;
    signal tb : std_logic;
    signal mb : std_logic;
    signal md : std_logic;
    signal rw : std_logic;
    signal mm : std_logic;
    signal mw : std_logic;
    
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
    uut: microprogrammed_control PORT MAP (
        data_in => data_in,
        flags => flags,
        pc_out => pc_out,
        reset => reset,
        clk => clk,
        dr => dr,
        sa => sa,
        sb => sb,
        fs => fs,
        td => td,
        ta => ta,
        tb => tb,
        mb => mb,
        md => md,
        rw => rw,
        mm => mm,
        mw => mw
    );

   stim_proc: process
   begin
    reset <= '1';
    data_in <= x"0001";
    flags <= "0000";
    wait for 10 ns;
    reset <= '0';
    wait;
   end process;
end Behavioral;
