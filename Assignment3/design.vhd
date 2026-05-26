library IEEE;
use IEEE.std_logic_1164.all;

entity rip is
port(
  	-- in case of multibit we use vector(upperlimit downto lower limit)
	a: in std_logic_vector(3 downto 0);
  	b: in std_logic_vector(3 downto 0);
  	c_in:in std_logic;
  	sum: out std_logic_vector(3 downto 0);
  	c_out: out std_logic);
end rip;

architecture Behavorial of rip is
	--as it a vector therefore we use signal
	--we use one bit more in case of c because we take all the carrys
	signal c:std_logic_vector(4 downto 0);
	signal p:std_logic_vector(3 downto 0);
	signal g:std_logic_vector(3 downto 0);
	
begin
	process(a, b,c_in,c,p,g) is
		variable i:integer;
  		begin
  			c(0)<=c_in;
  			for i in 0 to 3 loop
    			p(i)<=a(i) xor b(i);
    			g(i)<=a(i) and b(i);
    			sum(i)<= p(i) xor c(i);
    			c(i+1)<= g(i) or (c(i) and (p(i)));
    		end loop;
    		c_out<=c(4);
   	end process;
end Behavorial;