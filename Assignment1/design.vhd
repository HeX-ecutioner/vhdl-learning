library IEEE;
use IEEE.std_logic_1164.all;

entity B_Gates is
port(
  A,B: in std_logic;
  Y_AND,Y_OR,Y_XOR: out std_logic);
end B_Gates;

architecture ARC_Gates of B_Gates is
begin
  process(a, b) is
  begin
    Y_AND <= a AND b;
    Y_OR <= a OR b;
    Y_XOR <= a XOR b;
  end process;
end ARC_Gates;
