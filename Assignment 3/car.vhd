library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity car is
    Port (  
            car_in : in std_logic_vector(7 downto 0);
            s : in std_logic;
            reset :in std_logic; 
            clk : in std_logic;
            car_out : out std_logic_vector(7 downto 0));
end car;

architecture Behavioral of car is
begin
    process(clk)
    variable temp_car: std_logic_vector(7 downto 0);
begin
    if reset = '1' then
        temp_car := x"c0";
    else
        if(rising_edge(clk)) then
            if s = '1' then
                temp_car := car_in;
            else
                temp_car := temp_car + 1;
            end if;
        end if;
    end if;
    car_out <= temp_car;
end process;
end Behavioral;
