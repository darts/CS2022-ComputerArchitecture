library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity E_PC is
    Port(   pc_in: in std_logic_vector(5 downto 0);
            pl: in std_logic;
            pi: in std_logic;
            reset: in std_logic;
            pc_out: out std_logic_vector(15 downto 0));
end E_PC;

architecture Behavioral of extended_pc is
    component pc
    Port(   
            signal pc_in: in std_logic_vector(15 downto 0);
            pl: in std_logic;
            pi: in std_logic;
            reset: in std_logic;
            signal pc_out: out std_logic_vector(15 downto 0)
            );
    end component;
    signal new_pc_in: std_logic_vector(15 downto 0);
begin
    new_pc_in <= (15 downto pc_in'length => '0') & pc_in when (pc_in(5) = '0') else (15 downto pc_in'length => '1') & pc_in;
    pc0: pc PORT MAP (
        pc_in => new_pc_in,
        pl => pl,
        pi => pi,
        reset => reset,
        pc_out => pc_out
    );
end Behavioral;
