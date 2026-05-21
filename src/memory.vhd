library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is
  port (
    clk : in std_logic;
    we : in std_logic;
    addr : in std_logic_vector(15 downto 0);
    din : in std_logic_vector(7 downto 0);
    dout : out std_logic_vector(7 downto 0)
  );
end entity memory;

architecture rtl of memory is
  type mem_t is array (0 to 16383) of std_logic_vector(7 downto 0);
  signal mem : mem_t := (others => (others => '0'));
  signal q : std_logic_vector(7 downto 0);
begin
  process(clk)
    variable a : natural;
  begin
    if rising_edge(clk) then
      a := to_integer(unsigned(addr(13 downto 0)));

      if we = '1' then
        mem(a) <= din;
      end if;

      q <= mem(a);
    end if;
  end process;

  dout <= q;
end architecture;
