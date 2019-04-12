LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux8_1_testbench IS
END mux8_1_testbench;
 
ARCHITECTURE behavior OF mux8_1_testbench IS 
    COMPONENT mux8_1
    Port (  in0, in1, in2, in3, in4, in5, in6, in7 : in std_logic;
            s: in std_logic_vector(2 downto 0);
            z : out std_logic);
    END COMPONENT;
    

   --Inputs
    signal s : std_logic_vector(2 downto 0) := (others => '0');
    signal in0 : std_logic;
    signal in1 : std_logic;
    signal in2 : std_logic;
    signal in3 : std_logic;
    signal in4 : std_logic;
    signal in5 : std_logic;
    signal in6 : std_logic;
    signal in7 : std_logic;

 	--Outputs
   signal z : std_logic;
 
BEGIN
 
	--uut
    uut: mux8_1 PORT MAP (
        s => s,
        in0 => in0,
        in1 => in1,
        in2 => in2,
        in3 => in3,
        in4 => in4,
        in5 => in5,
        in6 => in6,
        in7 => in7,
        z => z
    );

   stim_proc: process
   begin		
      in0 <= '1';
      in1 <= '0';
      in2 <= '0';
      in3 <= '0';
      in4 <= '0';
      in5 <= '0';
      in6 <= '0';
      in7 <= '0';    
      s <= "000";
      wait for 10 ns;

      in0 <= '0';
      in1 <= '1';
      in2 <= '0';
      in3 <= '0';
      in4 <= '0';
      in5 <= '0';
      in6 <= '0';
      in7 <= '0';    
      s <= "001";
      wait for 10 ns;	

      in0 <= '0';
      in1 <= '0';
      in2 <= '1';
      in3 <= '0';
      in4 <= '0';
      in5 <= '0';
      in6 <= '0';
      in7 <= '0';    
      s <= "010";
      wait for 10 ns;	

      in0 <= '0';
      in1 <= '0';
      in2 <= '0';
      in3 <= '1';
      in4 <= '0';
      in5 <= '0';
      in6 <= '0';
      in7 <= '0';    
      s <= "011";
     wait for 10 ns;	

      in0 <= '0';
      in1 <= '0';
      in2 <= '0';
      in3 <= '0';
      in4 <= '1';
      in5 <= '0';
      in6 <= '0';
      in7 <= '0';    
      s <= "100";
     wait for 10 ns;	

      in0 <= '0';
      in1 <= '0';
      in2 <= '0';
      in3 <= '0';
      in4 <= '0';
      in5 <= '1';
      in6 <= '0';
      in7 <= '0';    
      s <= "101";
     wait for 10 ns;	

      in0 <= '0';
      in1 <= '0';
      in2 <= '0';
      in3 <= '0';
      in4 <= '0';
      in5 <= '0';
      in6 <= '1';
      in7 <= '0';    
      s <= "110";
     wait for 10 ns;	

      in0 <= '0';
      in1 <= '0';
      in2 <= '0';
      in3 <= '0';
      in4 <= '0';
      in5 <= '0';
      in6 <= '0';
      in7 <= '1';    
      s <= "111";
     wait for 10 ns;
     
   end process;

END;