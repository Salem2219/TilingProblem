library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port (clk, rst, wr1, wr2, wr3, sel, ld : in std_logic;
    n, m : in std_logic_vector(3 downto 0);
    x1, x2, x3 : out std_logic;
    y : out std_logic_vector(7 downto 0));
end dp;

architecture rtl of dp is
component compgr is
    port (
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic);
end component;
component complt is
    port (
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic);
end component;
component plus1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component mux4 is
    port (s : in std_logic;
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component reg4 is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(3 downto 0);
reg_out: out std_logic_vector(3 downto 0));
end component;
component ram is
port(clk, wr1, wr2, wr3 : in std_logic;
i, m, n : in std_logic_vector(3 downto 0);
y : out std_logic_vector(7 downto 0));
end component;
signal iplus1, i_in, i : std_logic_vector(3 downto 0);
begin
    i_op : plus1 port map (i, iplus1);
    i_mux : mux4 port map (sel, "0001", iplus1, i_in);
    i_reg : reg4 port map (clk, rst, ld, i_in, i);
    count_ram : ram port map (clk, wr1, wr2, wr3, i, m, n, y);
    im_compgr : compgr port map (i, m, x1);
    in_compgr : compgr port map (i, n, x3);
    im_complt : complt port map (i, m, x2);
end rtl;