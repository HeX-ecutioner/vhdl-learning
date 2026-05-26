library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_UNSIGNED.all;

entity fullAdder is

port(
  	mpcd,mplr:in std_logic_vector(7 downto 0);
  	result: out std_logic_vector(15 downto 0));
end fullAdder;

architecture temp of fullAdder is

begin
	process(mpcd,mplr)
  	variable nbr, br: std_logic_vector(7 downto 0);
  	variable acqr: std_logic_vector(15 downto 0);
    variable qn1: std_logic;
	variable i: integer;
	begin
      	acqr(15 downto 8) := (others=>'0');
      	acqr(7 downto 0) := mplr;
        br:=mpcd;
        nbr:=(not mpcd)+'1';
        qn1:='0';

		for i in 7 downto 0 loop
        	if(acqr(0)='0' and qn1='1') then
              	acqr(15 downto 8):=acqr(15 downto 8) + br;
            elsif(acqr(0)='1' and qn1='0') then
      			acqr(15 downto 8):=acqr(15 downto 8) + nbr;
            end if;
            qn1:=acqr(0);
  			acqr(14 downto 0):=acqr(15 downto 1);
         end loop;
         result<=acqr;
	end process;
end temp;
