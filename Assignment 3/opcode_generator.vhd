library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity opcode_generator is
    Port(   
            signal ir : in std_logic_vector(15 downto 0);
            signal il : in std_logic;
            signal clk : in std_logic;
            signal opcode : out std_logic_vector(6 downto 0);
            signal dr : out std_logic_vector(2 downto 0);
            signal sa : out std_logic_vector(2 downto 0);
            signal sb : out std_logic_vector(2 downto 0)
            );
end opcode_generator;

architecture Behavioral of opcode_generator is
    component reg16
    Port (  d : in std_logic_vector(15 downto 0);
            load: in std_logic;
            Clk : in std_logic;
            q : out std_logic_vector(15 downto 0));
    end component;
    signal data_out: std_logic_vector(15 downto 0);
begin
    reg: reg16 PORT MAP (
        d => ir,
        load => il,
        Clk => clk,
        q => data_out
    );
    opcode <= data_out(15 downto 9);
    dr <= data_out(8 downto 6);
    sa <= data_out(5 downto 3);
    sb <= data_out(2 downto 0);
end Behavioral;
