LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY D_FF_tb IS
END D_FF_tb;
 
ARCHITECTURE behavior OF D_FF_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT D_FF
    PORT(
         input1 : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         output1 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input1 : std_logic := '1';
   signal clk : std_logic := '1';
   signal rst : std_logic := '0';

 	--Outputs
   signal output1 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: D_FF PORT MAP (
          input1 => input1,
          clk => clk,
          rst => rst,
          output1 => output1
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '1';
		wait for clk_period/2;
		clk <= '0';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;	

      wait for clk_period*10;
		
		rst <= '1';
     
                input1 <= '1';
		wait for 7 ns;
                input1 <= '1';
		wait for 7 ns;
		input1 <= '0';
		wait for 7 ns;
		input1 <= '1';
		wait for 7 ns;
		
		rst <= '0';
		

      wait;
   end process;

END;
