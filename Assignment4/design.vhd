library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port(
        A,B,Cin : in STD_LOGIC;
        Sum,Cout : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is
begin
    Sum <= A xor B xor Cin;
    Cout <= (A and B) or (B and Cin) or (A and Cin);
end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Carry_Save_Adder is
    Port(
        X    : in  STD_LOGIC_VECTOR(3 downto 0);
        Y    : in  STD_LOGIC_VECTOR(3 downto 0);
        Z    : in  STD_LOGIC_VECTOR(3 downto 0);
        Sum  : out STD_LOGIC_VECTOR(4 downto 0);
        Cout : out STD_LOGIC);
end Carry_Save_Adder;

architecture Structural of Carry_Save_Adder is
    -- Full Adder Component
    component Full_Adder
        Port(
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC;
            Cout : out STD_LOGIC);
    end component;
    -- Internal Signals
    signal Partial_Sum  : STD_LOGIC_VECTOR (3 downto 0);
    signal Partial_Carry : STD_LOGIC_VECTOR(3 downto 0);
    signal Ripple_Carry  : STD_LOGIC_VECTOR(2 downto 0);

begin
    -- FIRST STAGE : Carry Save Addition
    GEN_STAGE1 : for i in 0 to 3 generate
        FA_STAGE1 : Full_Adder
        port map(
            A    => X(i),
            B    => Y(i),
            Cin  => Z(i),
            Sum  => Partial_Sum(i),
            Cout => Partial_Carry(i));
    end generate;
    -- SECOND STAGE : Ripple Carry Addition
    -- Least Significant Bit
    Sum(0) <= Partial_Sum(0);
    -- Ripple Carry Full Adders
    GEN_STAGE2 : for i in 1 to 3 generate
        FIRST_FA : if i = 1 generate
            FA_RIPPLE_FIRST : Full_Adder
            port map(
                A    => Partial_Sum(i),
                B    => Partial_Carry(i-1),
                Cin  => '0',
                Sum  => Sum(i),
                Cout => Ripple_Carry(i-1));
        end generate;

        REMAINING_FA : if i > 1 generate
            FA_RIPPLE_NEXT : Full_Adder
            port map(
                A    => Partial_Sum(i),
                B    => Partial_Carry(i-1),
                Cin  => Ripple_Carry(i-2),
                Sum  => Sum(i),
                Cout => Ripple_Carry(i-1));
        end generate;

    end generate;
    -- Most Significant Bit

    FA_MSB : Full_Adder
    port map(
        A    => '0',
        B    => Partial_Carry(3),
        Cin  => Ripple_Carry(2),
        Sum  => Sum(4),
        Cout => Cout);

end Structural;
