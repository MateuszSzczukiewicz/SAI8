library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pc8 is
  port (
    clk   : in    std_logic;
    rst  : in    std_logic;
    value : out std_logic_vector(15 downto 0);
    load : in std_logic;
    load_addr : in std_logic_vector(15 downto 0)
  );
end entity pc8;

architecture rtl of pc8 is
  signal pc : unsigned(15 downto 0);
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        pc <= (others => '0');
      elsif load = '1' then
        pc <= unsigned(load_addr);
      else
        pc <= pc + 1;
      end if;
    end if;
  end process;

  value <= std_logic_vector(pc);
end architecture rtl;
