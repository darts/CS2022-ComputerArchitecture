library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder is
    Port (
        A : in STD_LOGIC_VECTOR (15 downto 0);
        B : in STD_LOGIC_VECTOR (15 downto 0);
        carryIn : in STD_LOGIC;
        carryOut : out STD_LOGIC;
        overFlow : out STD_LOGIC;
        sum : out STD_LOGIC_VECTOR (15 downto 0)
     );
end ripple_adder;

architecture Behavioral of ripple_adder is
constant gate_delay: Time := 1ns; 

    component full_adder
        port ( 
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            carryIn: in STD_LOGIC;
            sum : out STD_LOGIC;
            carryOut : out STD_LOGIC
        );
    end component;
    
    --internal carry signals
    signal carry : STD_LOGIC_VECTOR(15 downto 0); 
begin
    --LSB
    adder0 : full_adder port map (
        A => A(0),
        B => B(0),
        carryIn => carryIn,
        carryOut => carry(0),
        sum => sum(0)
    );
    adder1 : full_adder port map (
        A => A(1),
        B => B(1),
        carryIn => carry(0),
        carryOut => carry(1),
        sum => sum(1)
    );
    adder2 : full_adder port map (
        A => A(2),
        B => B(2),
        carryIn => carry(1),
        carryOut => carry(2),
        sum => sum(2)
    );
    adder3 : full_adder port map (
        A => A(3),
        B => B(3),
        carryIn => carry(2),
        carryOut => carry(3),
        sum => sum(3)
    );
    adder4 : full_adder port map (
        A => A(4),
        B => B(4),
        carryIn => carry(3),
        carryOut => carry(4),
        sum => sum(4)
    );
    adder5 : full_adder port map (
        A => A(5),
        B => B(5),
        carryIn => carry(4),
        carryOut => carry(5),
        sum => sum(5)
    );
    adder6 : full_adder port map (
        A => A(6),
        B => B(6),
        carryIn => carry(5),
        carryOut => carry(6),
        sum => sum(6)
    );
    adder7 : full_adder port map (
        A => A(7),
        B => B(7),
        carryIn => carry(6),
        carryOut => carry(7),
        sum => sum(7)
    );
    adder8 : full_adder port map (
        A => A(8),
        B => B(8),
        carryIn => carry(7),
        carryOut => carry(8),
        sum => sum(8)
    );
    adder9 : full_adder port map (
        A => A(9),
        B => B(9),
        carryIn => carry(8),
        carryOut => carry(9),
        sum => sum(9)
    );
    adder10 : full_adder port map (
        A => A(10),
        B => B(10),
        carryIn => carry(9),
        carryOut => carry(10),
        sum => sum(10)
    );
    adder11 : full_adder port map (
        A => A(11),
        B => B(11),
        carryIn => carry(10),
        carryOut => carry(11),
        sum => sum(11)
    );
    adder12 : full_adder port map (
        A => A(12),
        B => B(12),
        carryIn => carry(11),
        carryOut => carry(12),
        sum => sum(12)
    );
    adder13 : full_adder port map (
        A => A(13),
        B => B(13),
        carryIn => carry(12),
        carryOut => carry(13),
        sum => sum(13)
    );
    adder14 : full_adder port map (
        A => A(14),
        B => B(14),
        carryIn => carry(13),
        carryOut => carry(14),
        sum => sum(14)
    );
    adder15 : full_adder port map (
        A => A(15),
        B => B(15),
        carryIn => carry(14),
        carryOut => carry(15),
        sum => sum(15)
    );

    overFlow <= (carry(14) xor carry(15)) after gate_delay;
    carryOut <= (carry(15)) after gate_delay;
end Behavioral;
