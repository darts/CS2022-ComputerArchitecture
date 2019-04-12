library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity regfile9x16bit is
    Port (
        src_a : in STD_LOGIC_VECTOR (3 downto 0);
        src_b : in STD_LOGIC_VECTOR (3 downto 0);
        bus_a : out STD_LOGIC_VECTOR (15 downto 0);
        bus_b : out STD_LOGIC_VECTOR (15 downto 0);
        data_in : in STD_LOGIC_VECTOR (15 downto 0);
        des_reg : in STD_LOGIC_VECTOR (3 downto 0);
        write_enable : in STD_LOGIC;
        clk : in STD_LOGIC
        );
end regfile9x16bit;

architecture Behavioral of regfile8x16bit is
constant gate_delay: Time := 1ns; 

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
    
    --mux 9 16-bit
    component mux9_16bit
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
        in8 : in  STD_LOGIC_VECTOR (15 downto 0);
        z : out  STD_LOGIC_VECTOR (15 downto 0)
        );
    end component;
    
    --decoder 3 to 9
    component decoder4_9
    port ( 
        sel : in  STD_LOGIC_VECTOR (3 downto 0);
        out0 : out STD_LOGIC;
        out1 : out STD_LOGIC;
        out2 : out STD_LOGIC;
        out3 : out STD_LOGIC;
        out4 : out STD_LOGIC;
        out5 : out STD_LOGIC;
        out6 : out STD_LOGIC;
        out7 : out STD_LOGIC;
        out8 : out STD_LOGIC
        );
    end component;
    
    --signals
    --LoaD Register Enable (from decoder to AND)
    signal ldrE_reg0, ldrE_reg1, ldrE_reg2, ldrE_reg3, ldrE_reg4, ldrE_reg5, ldrE_reg6, ldrE_reg7, ldrE_reg8 : STD_LOGIC;
    --ReaD Register (from register to mux)
    signal rdr_reg0, rdr_reg1, rdr_reg2, rdr_reg3, rdr_reg4, rdr_reg5, rdr_reg6, rdr_reg7, rdr_reg8 : STD_LOGIC_VECTOR(15 downto 0);
    --Write RegisteR (from AND to register)
    signal wrr_reg0, wrr_reg1, wrr_reg2, wrr_reg3, wrr_reg4, wrr_reg5, wrr_reg6, wrr_reg7, wrr_reg8 : STD_LOGIC;
   
begin

    --Port Mapping
    
    --Registers:
    --R0
    reg0: reg16 port map(
        inD => data_in,
        outQ => rdr_reg0,
        loadEnable => wrr_reg0,
        clk => clk
        );
    --R1
    reg1: reg16 port map(
        inD => data_in,
        outQ => rdr_reg1,
        loadEnable => wrr_reg1,
        clk => clk
        );
    --R2
    reg2: reg16 port map(
        inD => data_in,
        outQ => rdr_reg2,
        loadEnable => wrr_reg2,
        clk => clk
        );
    --R3
    reg3: reg16 port map(
        inD => data_in,
        outQ => rdr_reg3,
        loadEnable => wrr_reg3,
        clk => clk
        );
    --R4
    reg4: reg16 port map(
        inD => data_in,
        outQ => rdr_reg4,
        loadEnable => wrr_reg4,
        clk => clk
        );
    --R5
    reg5: reg16 port map(
        inD => data_in,
        outQ => rdr_reg5,
        loadEnable => wrr_reg5,
        clk => clk
        );
    --R6
    reg6: reg16 port map(
        inD => data_in,
        outQ => rdr_reg6,
        loadEnable => wrr_reg6,
        clk => clk
        );
    --R7
    reg7: reg16 port map(
        inD => data_in,
        outQ => rdr_reg7,
        loadEnable => wrr_reg7,
        clk => clk
        );
     --R8
     reg8: reg16 port map(
        inD => data_in,
        outQ => rdr_reg8,
        loadEnable => wrr_reg8,
        clk => clk
        );
    --Mux 9 16-bit (choose which register to read)
    mux_data9_16bit_a : mux9_16bit port map(
        sel => src_a,
        in0 => rdr_reg0,
        in1 => rdr_reg1,
        in2 => rdr_reg2,
        in3 => rdr_reg3,
        in4 => rdr_reg4,
        in5 => rdr_reg5,
        in6 => rdr_reg6,
        in7 => rdr_reg7,
        in8 => rdr_reg8,
        z => bus_a
        );
        
     --Mux 9 16-bit (choose which register to read)
     mux_data9_16bit_b : mux9_16bit port map(
        sel => src_b,
        in0 => rdr_reg0,
        in1 => rdr_reg1,
        in2 => rdr_reg2,
        in3 => rdr_reg3,
        in4 => rdr_reg4,
        in5 => rdr_reg5,
        in6 => rdr_reg6,
        in7 => rdr_reg7,
        in8 => rdr_reg8,
        z => bus_b
        );
        
    --Decoder 4 to 9 (choose which register to write to)
    decoder_regSelect4_9 : decoder4_9 port map(
        sel => des_reg,
        out0 => ldrE_reg0,
        out1 => ldrE_reg1,
        out2 => ldrE_reg2,
        out3 => ldrE_reg3,
        out4 => ldrE_reg4,
        out5 => ldrE_reg5,
        out6 => ldrE_reg6,
        out7 => ldrE_reg7,
        out8 => ldrE_reg8
        );
     
    wrr_reg0 <= (ldrE_reg0 and write_enable) after gate_delay;
    wrr_reg1 <= (ldrE_reg1 and write_enable) after gate_delay;
    wrr_reg2 <= (ldrE_reg2 and write_enable) after gate_delay;
    wrr_reg3 <= (ldrE_reg3 and write_enable) after gate_delay;
    wrr_reg4 <= (ldrE_reg4 and write_enable) after gate_delay;
    wrr_reg5 <= (ldrE_reg5 and write_enable) after gate_delay;
    wrr_reg6 <= (ldrE_reg6 and write_enable) after gate_delay;
    wrr_reg7 <= (ldrE_reg7 and write_enable) after gate_delay;
    wrr_reg8 <= (ldrE_reg8 and write_enable) after gate_delay;
end Behavioral;