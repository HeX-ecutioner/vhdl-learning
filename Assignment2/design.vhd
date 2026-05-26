library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end Full_Adder;

architecture Behavioral of Full_Adder is
begin
    Sum  <= A XOR B XOR Cin;
    Cout <= (A AND B) OR (B AND Cin) OR (A AND Cin);
end Behavioral;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ripple_Carry_Adder is
    Port (
        A    : in  STD_LOGIC_VECTOR(3 downto 0);
        B    : in  STD_LOGIC_VECTOR(3 downto 0);
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC_VECTOR(3 downto 0);
        Cout : out STD_LOGIC
    );
end Ripple_Carry_Adder;

architecture Structural of Ripple_Carry_Adder is

    component Full_Adder
        Port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component;

    signal C : STD_LOGIC_VECTOR(4 downto 0);

begin

    C(0) <= Cin;

    FA0: Full_Adder port map(A(0), B(0), C(0), Sum(0), C(1));
    FA1: Full_Adder port map(A(1), B(1), C(1), Sum(1), C(2));
    FA2: Full_Adder port map(A(2), B(2), C(2), Sum(2), C(3));
    FA3: Full_Adder port map(A(3), B(3), C(3), Sum(3), C(4));

    Cout <= C(4);

end Structural;
