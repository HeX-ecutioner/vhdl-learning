library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
end testbench;

architecture Behavioral of testbench is

    component RCA
        Port (
            A    : in  STD_LOGIC_VECTOR(3 downto 0);
            B    : in  STD_LOGIC_VECTOR(3 downto 0);
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC_VECTOR(3 downto 0);
            Cout : out STD_LOGIC
        );
    end component;

    signal A, B : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal Cin  : STD_LOGIC := '0';
    signal Sum  : STD_LOGIC_VECTOR(3 downto 0);
    signal Cout : STD_LOGIC;

begin

    UUT: RCA
        port map (
            A => A,
            B => B,
            Cin => Cin,
            Sum => Sum,
            Cout => Cout
        );

    stimulus: process
    begin

        A <= "0001"; B <= "0010"; Cin <= '0';
        wait for 10 ns;

        A <= "0101"; B <= "0011"; Cin <= '0';
        wait for 10 ns;

        A <= "1111"; B <= "0001"; Cin <= '0';
        wait for 10 ns;

        A <= "1010"; B <= "0101"; Cin <= '1';
        wait for 10 ns;

        wait;
    end process;

end Behavioral;