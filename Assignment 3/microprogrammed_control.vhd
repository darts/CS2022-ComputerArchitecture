library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity microprogrammed_control is
    Port(   
            signal data_in: in std_logic_vector(15 downto 0);
            signal flags: in std_logic_vector(3 downto 0);
            signal reset: in std_logic;
            signal clk: in std_logic;
            signal pc_out: out std_logic_vector(15 downto 0);
            signal dr: out std_logic_vector(2 downto 0);
            signal sa: out std_logic_vector(2 downto 0);
            signal sb: out std_logic_vector(2 downto 0);
            signal td: out std_logic;
            signal ta: out std_logic;
            signal tb: out std_logic;
            signal mb: out std_logic;
            signal md: out std_logic;
            signal rw: out std_logic;
            signal mm: out std_logic;
            signal mw: out std_logic;
            signal fs: out std_logic_vector(4 downto 0)
            );
end microprogrammed_control;

architecture Behavioral of microprogrammed_control is
    component control_memory
    Port (  
            car_in : in std_logic_vector(7 downto 0);
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
            na : out std_logic_vector(7 downto 0)
            );
    end component;

    component car
    Port (  
            car_in : in std_logic_vector(7 downto 0);
            s: in std_logic;
            reset : in std_logic; 
            clk : in std_logic;
            car_out : out std_logic_vector(7 downto 0)
            );
    end component;

    component mux2_8bit
    Port (  
            in0 : in  std_logic_vector(7 downto 0);
            in1 : in  std_logic_vector(7 downto 0);
            s: in std_logic;
            z : out std_logic_vector(7 downto 0)
            );
    end component;

    component opcode_generator
    Port(   
            ir: in std_logic_vector(15 downto 0);
            il: in std_logic;
            clk: in std_logic;
            opcode: out std_logic_vector(6 downto 0);
            dr, sa, sb: out std_logic_vector(2 downto 0)
            );
    end component;

    component mux8_1
    Port (  in0, in1, in2, in3, in4, in5, in6, in7 : in std_logic;
            s: in std_logic_vector(2 downto 0);
            z : out std_logic);
    end component;

    component E_PC
    Port(   signal pc_in: in std_logic_vector(5 downto 0);
            signal pl, pi, reset: in std_logic;
            signal pc_out: out std_logic_vector(15 downto 0));
    end component;

    --signals
    signal car_out, na, opcode_mux_out, opcode_mux_in: std_logic_vector(7 downto 0);
    signal opcode: std_logic_vector(6 downto 0);
    signal pc_in: std_logic_vector(5 downto 0);
    signal ms, tmp_dr, tmp_sb: std_logic_vector(2 downto 0);
    signal mc, il, pi, pl, flag_mux_out, notc, notz: std_logic;
begin
    control: control_memory PORT MAP (
        car_in => car_out,
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
    car0: car PORT MAP (
        car_in => opcode_mux_out,
        s => flag_mux_out,
        clk => clk,
        reset => reset,
        car_out => car_out
    );
    opcode_mux_in <= (7 downto opcode'length => '0') & opcode;
    mux2: mux2_8 PORT MAP (
        in0 => na,
        in1 => opcode_mux_in,
        s => mc,
        z => opcode_mux_out
    );
    opcode0: opcode_generator PORT MAP (
        ir => data_in,
        il => il,
        clk => clk,
        opcode => opcode,
        dr => tmp_dr,
        sa => sa,
        sb => tmp_sb
    );
    notc <= not flags(1);
    notz <= not flags(0);
    mux8: mux8_1 PORT MAP (
        in0 => '0',
        in1 => '1',
        in2 => flags(1),
        in3 => flags(3),
        in4 => flags(0),
        in5 => flags(2),
        in6 => notc,
        in7 => notz,
        s => ms,
        z => flag_mux_out
    );
    dr <= tmp_dr;
    sb <= tmp_sb;
    pc_in(5 downto 3) <= tmp_dr;
    pc_in(2 downto 0) <= tmp_sb;
    pc: extended_pc PORT MAP (
        pc_in => pc_in,
        pl => pl,
        pi => pi,
        reset => reset,
        pc_out => pc_out
    );
end Behavioral;
