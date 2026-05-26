library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench;

architecture tb of testbench is

-- DUT component
component rip is
port(
	a: in std_logic_vector(3 downto 0);
  	b: in std_logic_vector(3 downto 0);
  	c_in:in std_logic;
  	sum: out std_logic_vector(3 downto 0);
  	c_out: out std_logic);
end component;

signal a_s,b_s,sum_s: std_logic_vector(3 downto 0);
signal c_in_s,c_out_s:std_logic;

begin

-- Connect DUT
DUT: rip port map(a_s,b_s,c_in_s,sum_s,c_out_s);

process
	begin
		a_s<= "0110";
		b_s <= "0101";
		c_in_s <= '0';
		wait for 100 ns;

		a_s<= "0111";
		b_s <= "1011";
		c_in_s <= '1';
		wait for 100 ns;

		wait;
	end process;
end tb;