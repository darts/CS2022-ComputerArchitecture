library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity input_logic_y_testbench is
end input_logic_y_testbench;

architecture Behavioral of input_logic_y_testbench is
    component input_logic_y
    port (
        B : in STD_LOGIC_VECTOR (15 downto 0);
        sel : in STD_LOGIC_VECTOR (1 downto 0);
        out_B : out STD_LOGIC_VECTOR (15 downto 0)
     );
    end component;

    --inputs 
    signal B : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal sel : STD_LOGIC_VECTOR (1 downto 0) := (others => '0');

    --output
    signal out_B : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');

    constant wait_time : time := 30ns;
begin
    uut: input_logic_y port map(
        B => B,
        sel => sel,
        out_B => out_B
    );

    stim_proc: process
        begin

            B <= x"0F0F";
            sel <= "00";
            wait for wait_time;

            sel <= "01";
            wait for wait_time;

            sel <= "10";
            wait for wait_time;

            sel <= "11";
            wait for wait_time;

    end process;

end Behavioral;
