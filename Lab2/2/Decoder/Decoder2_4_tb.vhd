LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY decoder2_4_tb IS
END decoder2_4_tb;
 
ARCHITECTURE behavior OF decoder2_4_tb IS 
 
 
    COMPONENT decoder2_4
    PORT(
         a : IN  std_logic_vector(1 downto 0);
         enable : IN  std_logic;
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(1 downto 0) := (others => '0');
   signal enable : std_logic := '0';

   --Outputs
   signal output : std_logic_vector(3 downto 0);
 
 
BEGIN
 
   uut: decoder2_4 PORT MAP (
          a => a,
          enable => enable,
          output => output
        );

   stim_proc: process
    
      begin		
      wait for 100 ns;	

               --no matter what the input is output always 0

		enable <= '0';
		
		a <= "00";
		wait for 100 ns;
		a <= "01";
		wait for 100 ns;
		a <= "10";
		wait for 100 ns;
		a <= "11";
		wait for 100 ns;
		
		
		enable <= '1';
		
                --output[0]
		a <= "00";
		wait for 100 ns;
                --output[1]
		a <= "01";
		wait for 100 ns;
                --output[2]
		a <= "10";
		wait for 100 ns;
                --output[3]
		a <= "11";
		wait for 100 ns;

      wait;
   end process;

END;
