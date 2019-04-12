library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity memory_testbench is
end memory_testbench;

architecture Behavioral of memory_testbench is
 
    COMPONENT memory
    Port (  
            data_in : in std_logic_vector(15 downto 0);
            address_in : in std_logic_vector(15 downto 0);
            mw : in std_logic;
            mr : in std_logic;
            data_out : out std_logic_vector(15 downto 0));
    END COMPONENT;
    

   --Inputs
    signal data_in : std_logic_vector(15 downto 0) := (others => '0');
    signal address_in : std_logic_vector(15 downto 0) := (others => '0');
    signal mw : std_logic;
    signal mr : std_logic;

 	--Outputs
    signal data_out : std_logic_vector(15 downto 0) := (others => '0');

begin
    --uut
    uut: memory PORT MAP (
        data_in => data_in,
        address_in => address_in,
        mw => mw,
        mr => mr,
        data_out => data_out
    );
    
    stim_proc: process
   begin
    data_in <= x"0001";
    address_in <= x"0000";
    mw <= '0';
    mr <= '1';
    wait for 50 ns;

    data_in <= x"0010";
    address_in <= x"0002";
    wait for 50 ns;

    data_in <= x"0100";
    address_in <= x"0004";
    wait for 50 ns;

    data_in <= x"1000";
    address_in <= x"0006";
    wait for 50 ns;

   end process;
end Behavioral;
