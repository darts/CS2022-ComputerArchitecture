library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity datapath_16bit is
    Port ( 
        clk : in STD_LOGIC;
        write_enable : in STD_LOGIC;
        MB_select : in STD_LOGIC_VECTOR (0 downto 0);
        MD_select : in STD_LOGIC_VECTOR (0 downto 0);
        MM_select : in STD_LOGIC_VECTOR (0 downto 0);
        SB : in STD_LOGIC_VECTOR (2 downto 0);
        des_reg : in STD_LOGIC_VECTOR (2 downto 0);
        src_a : in STD_LOGIC_VECTOR (2 downto 0);
        src_b : in STD_LOGIC_VECTOR (2 downto 0);
        mode_select : in STD_LOGIC_VECTOR (4 downto 0);
        data_in : in STD_LOGIC_VECTOR (15 downto 0);
        a_out : out STD_LOGIC_VECTOR (15 downto 0);
        data_out : out STD_LOGIC_VECTOR (15 downto 0);
        PC_in : in STD_LOGIC_VECTOR (15 downto 0);
        V : out STD_LOGIC;
        C : out STD_LOGIC;
        N : out STD_LOGIC;
        Z : out STD_LOGIC
    );
end datapath_16bit;

architecture Behavioral of datapath_16bit is
    component FU_16bit 
    port(
        mode_select : in STD_LOGIC_VECTOR (4 downto 0);
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        outPut : out STD_LOGIC_VECTOR (15 downto 0);
        V : out STD_LOGIC;
        C : out STD_LOGIC;
        N : out STD_LOGIC;
        Z : out STD_LOGIC
    );
    end component;
    
    component regfile9x16bit
    port(
        src_a : in STD_LOGIC_VECTOR (3 downto 0);
        src_b : in STD_LOGIC_VECTOR (3 downto 0);
        bus_a : out STD_LOGIC_VECTOR (15 downto 0);
        bus_b : out STD_LOGIC_VECTOR (15 downto 0);
        data_in : in STD_LOGIC_VECTOR (15 downto 0);
        des_reg : in STD_LOGIC_VECTOR (3 downto 0);
        write_enable : in STD_LOGIC;
        clk : in STD_LOGIC
    );
    end component;
    
    component mux2_16bit
    port(
        sel : in  STD_LOGIC_VECTOR (0 downto 0);
        in0 : in  STD_LOGIC_VECTOR (15 downto 0);
        in1 : in  STD_LOGIC_VECTOR (15 downto 0);
        z : out STD_LOGIC_VECTOR (15 downto 0)
    );
    end component;
    
    component zero_fill
    port ( 
            SB : in  STD_LOGIC_VECTOR (2 downto 0);
            constant_out : out STD_LOGIC_VECTOR (15 downto 0)
    );
    end component;
    
    --from regfile to mux and FU
    signal busA, busB_rSide, busB_FU_Side : STD_LOGIC_VECTOR (15 downto 0);
    --from FU to mux and regfile
    signal busOut_muxSide, busOut_regSide :STD_LOGIC_VECTOR (15 downto 0);
    --from zero to mux
    signal zeroConst : STD_LOGIC_VECTOR (15 downto 0);
    
begin
    FU : FU_16bit port map(
        mode_select => mode_select,
        A => busA,
        B => busB_FU_Side,
        outPut => busOut_muxSide,
        V => V,
        C => C,
        N => N,
        Z => Z
    );
    
    regfile : regfile9x16bit port map(
        src_a => src_a,
        src_b => src_b,
        bus_a => busA,
        bus_b => busB_rSide,
        data_in => busOut_regSide,
        des_reg => des_reg,
        write_enable => write_enable,
        clk => clk    
    );
    
    muxB : mux2_16bit port map(
        in1 => zeroConst,
        in0 => busB_rSide,
        sel => MB_select,
        z => busB_FU_Side
    );
    
    muxD : mux2_16bit port map(
        in1 => data_in,
        in0 => busOut_muxSide,
        sel => MD_select,
        z => busOut_regSide
    );

    muxMM : mux2_16bit port map(
        in0 => busA,
        in1 => PC_in,
        sel => MM_select,
        z => a_out
    );
    
    zer_fill : zero_fill port map(
        SB => SB,
        constant_out => zeroConst
    );
    
    data_out <= busB_FU_Side;

end Behavioral;