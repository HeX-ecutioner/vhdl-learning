library IEEE;
use IEEE.std_logic_1164.all;
 
entity testbench is
-- empty
end testbench; 

architecture tb of testbench is

-- DUT component
component B_Gates is
port(
  a,b: in std_logic;
  Y_AND,Y_OR,Y_XOR: out std_logic);
end component;

signal a_in, b_in, Y_AND_out, Y_OR_out, Y_XOR_out: std_logic;

begin

  -- Connect DUT
  DUT: B_Gates  port map(a_in, b_in, Y_AND_out, Y_OR_out, Y_XOR_out);

  process
  begin
    a_in <= '0';
    b_in <= '0';
    wait for 1 ns;
    assert(Y_AND_out&Y_OR_out&Y_XOR_out="000") report "Fail 0/0" severity error;
  
    a_in <= '0';
    b_in <= '1';
    wait for 1 ns;
    assert(Y_AND_out&Y_OR_out&Y_XOR_out="011") report "Fail 0/1" severity error;

    a_in <= '1';
    b_in <= '0';
    wait for 1 ns;
    assert(Y_AND_out&Y_OR_out&Y_XOR_out="011") report "Fail 1/0" severity error;

    a_in <= '1';
    b_in <= '1';
    wait for 1 ns;
    assert(Y_AND_out&Y_OR_out&Y_XOR_out="110") report "Fail 1/1" severity error;
    
    -- Clear inputs
    a_in <= '0';
    b_in <= '0';

    assert false report "Test done." severity note;
    wait;
  end process;
end tb;
