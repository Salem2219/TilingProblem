library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ram is
port(clk, wr1, wr2, wr3 : in std_logic;
i, m, n : in std_logic_vector(3 downto 0);
y : out std_logic_vector(7 downto 0));
end ram;
architecture rtl of ram is
type ram_type is array (0 to 15) of
std_logic_vector(7 downto 0);
signal program: ram_type := (
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000",
    "00000000"

);
signal iminus1, iminusm : std_logic_vector(3 downto 0);
signal count1, count2, add : std_logic_vector(7 downto 0);

component adder is
    port (a, b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component minus1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component sub is
    port (a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
begin
count1 <= program(conv_integer(unsigned(iminus1)));
count2 <= program(conv_integer(unsigned(iminusm)));
u1 : adder port map (count1, count2, add);
u2 : sub port map (i, m, iminusm);
u3 : minus1 port map (i, iminus1);
process(clk)
begin
if (rising_edge(clk)) then
if (wr1 = '1') then
program(conv_integer(unsigned(i))) <= add;
elsif (wr2 = '1') then
program(conv_integer(unsigned(i))) <= "00000001";
elsif(wr3 = '1') then
program(conv_integer(unsigned(i))) <= "00000010";
end if;
end if;
end process;
y <= program(conv_integer(unsigned(n)));
end rtl;