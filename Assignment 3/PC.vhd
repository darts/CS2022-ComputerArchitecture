library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pc is
    Port(   
            signal pc_in: in std_logic_vector(15 downto 0);
            signal pl: in std_logic;
            signal pi: in std_logic;
            signal reset: in std_logic;
            signal pc_out: out std_logic_vector(15 downto 0)
            );
end pc;

architecture Behavioral of pc is
begin
    process(reset, pi, pl)
    variable temp_pc: std_logic_vector(15 downto 0);
begin
    if reset = '1' then
        temp_pc := x"0000";
    elsif pl = '1' then
        temp_pc := pc_in + temp_pc;
    elsif pi = '1' then
        temp_pc := temp_pc + 1;
    end if;
    pc_out <= temp_pc;
end process;
end Behavioral;
