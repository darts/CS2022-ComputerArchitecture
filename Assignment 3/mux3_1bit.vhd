library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux3_1bit is
    Port( 
    sel : in STD_LOGIC_VECTOR (1 downto 0);
    in0 : in STD_LOGIC;
    in1 : in STD_LOGIC;
    in2 : in STD_LOGIC;
    outPut : out STD_LOGIC
    );
end mux3_1bit;

architecture Behavioral of mux3_1bit is
constant gate_delay: Time := 1ns;

begin
    process(sel, in0, in1, in2)
        begin
        case sel is
            when "00" => outPut <= in0 after gate_delay;
            when "01" => outPut <= in1 after gate_delay;
            when "10" => outPut <= in2 after gate_delay;
            when others => outPut <= '0' after gate_delay;
        end case;
    end process;
end Behavioral;
