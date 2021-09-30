library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ripple_counter is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Count : out  STD_LOGIC_VECTOR (3 downto 0));
end Ripple_counter;

architecture Behavioral of Ripple_counter is
	component T_FF is 
		Port ( T_input : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           T_output : out  STD_LOGIC);
	end component T_FF;
	signal out1 : STD_LOGIC_VECTOR (3 downto 0);
        signal mid0 :STD_LOGIC;
        signal mid1 :STD_LOGIC;
        signal mid2 :STD_lOGIC;
        
begin
	count0: T_FF port map (T_input => '1', clk => clk, rst => rst, T_output => out1(0));
        mid0 <= not out1(0);
	count1: T_FF port map (T_input => '1', clk => mid0, rst => rst, T_output => out1(1));
        mid1 <= not out1(1);
	count2: T_FF port map (T_input => '1', clk => mid1, rst => rst, T_output => out1(2));
        mid2 <= not out1(2);
	count3: T_FF port map (T_input => '1', clk => mid2, rst => rst, T_output => out1(3));
	Count <= out1;
end Behavioral;


