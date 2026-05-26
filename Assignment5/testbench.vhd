library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_UNSIGNED.all;

entity testbench is
end testbench;

architecture tb of testbench is

component fullAdder is

port(
  	mpcd,mplr:in std_logic_vector(7  downto 0);
  	result: out std_logic_vector(15  downto 0));

end component;

signal Mpcd,Mplr:std_logic_vector(7  downto 0);
signal Result: std_logic_vector(15 downto 0);
begin
	DUT: fullAdder port map (Mpcd,Mplr,Result);
	process
    begin
    	Mpcd <= "00100011";
        Mplr <= "01001100";
        wait for 10 ns;
    
    	Mpcd <= "00010011";
        Mplr <= "01000100";
        wait for 10 ns;
        
        wait;    
	end process;
end tb;
