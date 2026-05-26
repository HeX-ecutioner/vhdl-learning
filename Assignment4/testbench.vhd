library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture Behavioral of testbench is
    -- Component Declaration
    component Carry_Save_Adder
        Port(
            X    : in  STD_LOGIC_VECTOR(3 downto 0);
            Y    : in  STD_LOGIC_VECTOR(3 downto 0);
            Z    : in  STD_LOGIC_VECTOR(3 downto 0);
            Sum  : out STD_LOGIC_VECTOR(4 downto 0);
            Cout : out STD_LOGIC
        );
    end component;
    -- Signals
    signal X    : STD_LOGIC_VECTOR(3 downto 0);
    signal Y    : STD_LOGIC_VECTOR(3 downto 0);
    signal Z    : STD_LOGIC_VECTOR(3 downto 0);

    signal Sum  : STD_LOGIC_VECTOR(4 downto 0);
    signal Cout : STD_LOGIC;

begin
    -- DUT Instantiation
    DUT : Carry_Save_Adder
    port map(
        X    => X,
        Y    => Y,
        Z    => Z,
        Sum  => Sum,
        Cout => Cout);
    -- Stimulus Process
    stimulus : process
    begin
        -- Test Case 1 : 3 + 5 + 1 = 9
        X <= "0011";
        Y <= "0101";
        Z <= "0001";
        wait for 100 ns;

        wait;
    end process;

end Behavioral;
