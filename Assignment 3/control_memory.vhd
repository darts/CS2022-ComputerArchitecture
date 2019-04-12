library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_memory is
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
end control_memory;

architecture Behavioral of control_memory is
    type mem_array is array(0 to 255) of std_logic_vector(27 downto 0);
begin
    mem_process: process(car_in)
    variable data_mem: mem_array := (
    --M-0 
    x"C020304", --0 intermediate value in register 
    x"C020224", --1 ADI -> add the immediate operand 
    x"C02000C", --2 LDR -> load to register 
    x"C020001", --3 STR -> store in register 
    x"C020014", --4 INC -> increment the register's value by 1 
    x"C0200E4", --5 NOT -> complement 
    x"C020024", --6 ADD -> add values from source and destination 
    x"1228002", --7 B -> branch unconditionally 
    x"169A002", --8 BXX -> branch conditionally to area 
    x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
     
    --M-1 
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    
    --M-2
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    --M-3
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    --M-4
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    --M-5
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    --M-6
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    --M-7
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    --M-8
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    --M-9
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    --M-A
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    --M-B
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    --M-C
    x"c10c002", --IF
    x"0030000", --EXO
    x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    --M-D
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    --M-E
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    --M-F
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000",
    x"0000000", x"0000000", x"0000000", x"0000000");
    variable addr:integer range 0 to 255;
    variable control_out: std_logic_vector(27 downto 0);
    begin
    addr := conv_integer(car_in);
    control_out := data_mem(addr);
    na <= control_out(27 downto 20);
    ms <= control_out(19 downto 17);
    mc <= control_out(16);
    il <= control_out(15);
    pi <= control_out(14);
    pl <= control_out(13);
    td <= control_out(12);
    ta <= control_out(11);
    tb <= control_out(10);
    mb <= control_out(9);
    fs <= control_out(8 downto 4);
    md <= control_out(3);
    rw <= control_out(2);
    mm <= control_out(1);
    mw <= control_out(0);
    end process;
end Behavioral;
