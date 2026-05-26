library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity multiplier_2bit is
Port (
    A : in STD_LOGIC_VECTOR(1 downto 0);
    B : in STD_LOGIC_VECTOR(1 downto 0);
    P : out STD_LOGIC_VECTOR(3 downto 0)
);
end multiplier_2bit;

architecture Behavioral of multiplier_2bit is

signal p0, p1, p2, p3 : STD_LOGIC;
signal c1 : STD_LOGIC;

begin

p0 <= A(0) AND B(0);

p1 <= (A(1) AND B(0)) XOR (A(0) AND B(1));

c1 <= (A(1) AND B(0)) AND (A(0) AND B(1));

p2 <= (A(1) AND B(1)) XOR c1;

p3 <= (A(1) AND B(1)) AND c1;

P(0) <= p0;
P(1) <= p1;
P(2) <= p2;
P(3) <= p3;

end Behavioral;
