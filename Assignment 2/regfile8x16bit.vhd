library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regfile8x16bit is
    Port (
        src_a : in STD_LOGIC_VECTOR (2 downto 0);
        src_b : in STD_LOGIC_VECTOR (2 downto 0);
        des_A : in STD_LOGIC_VECTOR (2 downto 0);
        data : in STD_LOGIC_VECTOR (15 downto 0);
        data_src : in STD_LOGIC_VECTOR (0 downto 0);
        clk : in STD_LOGIC
        );
end regfile8x16bit;

architecture Behavioral of regfile8x16bit is
    --list components
    
    --register 16-bit
    component reg16
    port (
        loadEnable : in  STD_LOGIC;
        clk : in  STD_LOGIC;
        inD : in  STD_LOGIC_VECTOR (15 downto 0);
        outQ : out  STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;
    
    --mux 2 16-bit
    component mux2_16bit
    port (
        sel : in  STD_LOGIC_VECTOR (0 downto 0);
        in0 : in  STD_LOGIC_VECTOR (15 downto 0);
        in1 : in  STD_LOGIC_VECTOR (15 downto 0);
        z : out STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;
    
    --mux 8 16-bit
    component mux8_16bit
    port (
        sel : in  STD_LOGIC_VECTOR (2 downto 0);
        in0 : in  STD_LOGIC_VECTOR (15 downto 0);
        in1 : in  STD_LOGIC_VECTOR (15 downto 0);
        in2 : in  STD_LOGIC_VECTOR (15 downto 0);
        in3 : in  STD_LOGIC_VECTOR (15 downto 0);
        in4 : in  STD_LOGIC_VECTOR (15 downto 0);
        in5 : in  STD_LOGIC_VECTOR (15 downto 0);
        in6 : in  STD_LOGIC_VECTOR (15 downto 0);
        in7 : in  STD_LOGIC_VECTOR (15 downto 0);
        z : out  STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;
    
    --decoder 3 to 8
    component decoder3_8
    port ( 
        sel : in  STD_LOGIC_VECTOR (2 downto 0);
        out0 : out STD_LOGIC;
        out1 : out STD_LOGIC;
        out2 : out STD_LOGIC;
        out3 : out STD_LOGIC;
        out4 : out STD_LOGIC;
        out5 : out STD_LOGIC;
        out6 : out STD_LOGIC;
        out7 : out STD_LOGIC
        );
    end component;
    
    --signals
    --LoaD Register Enable (from decoder to register)
    signal ldrE_reg0, ldrE_reg1, ldrE_reg2, ldrE_reg3, ldrE_reg4, ldrE_reg5, ldrE_reg6, ldrE_reg7 : STD_LOGIC;
    --ReaD Register (from register to mux)
    signal rdr_reg0, rdr_reg1, rdr_reg2, rdr_reg3, rdr_reg4, rdr_reg5, rdr_reg6, rdr_reg7 : STD_LOGIC_VECTOR(15 downto 0);
    --Write RegisteR (from mux to register)
    signal wrr_regBus : STD_LOGIC_VECTOR(15 downto 0); 
    --TransfeR Register (from mux to mux)
    signal trr_0, trr_1 : STD_LOGIC_VECTOR(15 downto 0);
   
begin

    --Port Mapping
    
    --Registers:
    --R0
    reg0: reg16 port map(
        inD => wrr_regBus,
        outQ => rdr_reg0,
        loadEnable => ldrE_reg0,
        clk => clk
        );
    --R1
    reg1: reg16 port map(
        inD => wrr_regBus,
        outQ => rdr_reg1,
        loadEnable => ldrE_reg1,
        clk => clk
        );
    --R2
    reg2: reg16 port map(
        inD => wrr_regBus,
        outQ => rdr_reg2,
        loadEnable => ldrE_reg2,
        clk => clk
        );
    --R3
    reg3: reg16 port map(
        inD => wrr_regBus,
        outQ => rdr_reg3,
        loadEnable => ldrE_reg3,
        clk => clk
        );
    --R4
    reg4: reg16 port map(
        inD => wrr_regBus,
        outQ => rdr_reg4,
        loadEnable => ldrE_reg4,
        clk => clk
        );
    --R5
    reg5: reg16 port map(
        inD => wrr_regBus,
        outQ => rdr_reg5,
        loadEnable => ldrE_reg5,
        clk => clk
        );
    --R6
    reg6: reg16 port map(
        inD => wrr_regBus,
        outQ => rdr_reg6,
        loadEnable => ldrE_reg6,
        clk => clk
        );
    --R7
    reg7: reg16 port map(
        inD => wrr_regBus,
        outQ => rdr_reg7,
        loadEnable => ldrE_reg7,
        clk => clk
        );
        
    --Mux 2 16-bit (choosing internal or external input)
    mux_extOrIntInput2_16bit : mux2_16bit port map(
        sel => data_src,
        in0 => data,
        in1 => trr_0,
        z => wrr_regBus
        );
     
    --Mux 8 16-bit (choose which register to read)
    mux_data8_16bit_a : mux8_16bit port map(
        sel => src_a,
        in0 => rdr_reg0,
        in1 => rdr_reg1,
        in2 => rdr_reg2,
        in3 => rdr_reg3,
        in4 => rdr_reg4,
        in5 => rdr_reg5,
        in6 => rdr_reg6,
        in7 => rdr_reg7,
        z => trr_0
        );
        
     --Mux 8 16-bit (choose which register to read)
     mux_data8_16bit_b : mux8_16bit port map(
        sel => src_b,
        in0 => rdr_reg0,
        in1 => rdr_reg1,
        in2 => rdr_reg2,
        in3 => rdr_reg3,
        in4 => rdr_reg4,
        in5 => rdr_reg5,
        in6 => rdr_reg6,
        in7 => rdr_reg7,
        z => trr_1
        );
        
    --Decoder 3 to 8 (choose which register to write to)
    decoder_regSelect3_8 : decoder3_8 port map(
        sel => des_A,
        out0 => ldrE_reg0,
        out1 => ldrE_reg1,
        out2 => ldrE_reg2,
        out3 => ldrE_reg3,
        out4 => ldrE_reg4,
        out5 => ldrE_reg5,
        out6 => ldrE_reg6,
        out7 => ldrE_reg7
        );
     


end Behavioral;
