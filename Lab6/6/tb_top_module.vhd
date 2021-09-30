LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY tb_top_module IS
END tb_top_module;
 
ARCHITECTURE behavior OF tb_top_module IS 
  
    COMPONENT top_module
    PORT(
         Parallel_in : IN  std_logic_vector(3 downto 0);
         LR : IN  std_logic_vector(1 downto 0);
         Load : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         number : OUT  std_logic_vector(3 downto 0);
         output : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Parallel_in : std_logic_vector(3 downto 0) := (others => '0');
   signal LR : std_logic_vector(1 downto 0) := (others => '0');
   signal Load : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal number : std_logic_vector(3 downto 0);
   signal output : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1 ms ;
	constant clk_period2 : time := 1000 ms ;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Top_module PORT MAP (
          Parallel_in => Parallel_in,
          LR => LR,
          Load => Load,
          clk => clk,
          rst => rst,
          number => number,
          output => output
        );

   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   stim_proc: process
   begin		
             Parallel_in <= "1011";
		Load <= '1';
		
		 wait for clk_period2;

		Load <= '0';
		 
		
		 wait for clk_period2;
		 
		 LR <= "10";
		 wait for clk_period2;
		 
		 LR <= "01";
		 wait for clk_period2;
		 
		 Load <= '0';
		
			wait for clk_period2;
			 
		 LR <= "11";

      wait;
   end process;

END;
