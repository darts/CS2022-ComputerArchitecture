library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_memory_testbench is
end control_memory_testbench;

architecture Behavioral of control_memory_testbench is
    component control_memory
    Port (  car_in : in std_logic_vector(7 downto 0);
            mc : out std_logic;
            il : out std_logic;
            pi : out std_logic;
            pl : out std_logic;
            td : out std_logic;
            ta : out std_logic;
            tb : out std_logic;
            mb : out std_logic;
            md : out std_logic;
            rw : out std_logic;
            mm : out std_logic;
            mw : out std_logic;
            fs : out std_logic_vector(4 downto 0);
            ms : out std_logic_vector(2 downto 0);
            na : out std_logic_vector(7 downto 0));
    end component;
    
    --Inputs
    signal car_in : std_logic_vector(7 downto 0) := (others => '0');
    
     --Outputs
    signal mc : std_logic;
    signal il : std_logic;
    signal pi : std_logic;
    signal pl : std_logic;
    signal td : std_logic;
    signal ta : std_logic;
    signal tb : std_logic;
    signal mb : std_logic;
    signal md : std_logic;
    signal rw : std_logic;
    signal mm : std_logic;
    signal mw : std_logic;
    signal fs : std_logic_vector(4 downto 0) := (others => '0');
    signal ms : std_logic_vector(2 downto 0) := (others => '0');
    signal na : std_logic_vector(7 downto 0) := (others => '0');
begin
    --uut
    uut: control_memory PORT MAP (
        car_in => car_in,
        mc => mc,
        il => il,
        pi => pi,
        pl => pl,
        td => td,
        ta => ta,
        tb => tb,
        mb => mb,
        md => md,
        rw => rw,
        mm => mm,
        mw => mw,
        fs => fs,
        ms => ms,
        na => na
    );
    
    stim_proc: process
   begin
    --test 0
    car_in <= "00000000";
    wait for 10 ns;

    --test 1
    car_in <= "00000001";
    wait for 10 ns;

    --test 2
    car_in <= "00000010";
    wait for 10 ns;

    --test 3
    car_in <= "00000011";
    wait for 10 ns;

    --test 4
    car_in <= "00000100";
    wait for 10 ns;

    --test 5
    car_in <= "00000101";
    wait for 10 ns;

    --test 6
    car_in <= "00000110";
    wait for 10 ns;

    --test 7
    car_in <= "00000111";
    wait for 10 ns;

    --test 8
    car_in <= "00001000";
    wait for 10 ns;

    --test 9
    car_in <= "00001001";
    wait for 10 ns;

   end process;
end Behavioral;
