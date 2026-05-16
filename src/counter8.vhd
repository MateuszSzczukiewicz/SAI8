library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity counter8 is
  port (
    clk   : in    std_logic;
    rst  : in    std_logic;
    value : out std_logic_vector(7 downto 0)
  );
end entity counter8;

architecture rtl of counter8 is
  signal cnt : unsigned(7 downto 0);
begin

process(clk)
begin
  if rising_edge(clk) then
    if rst = '1' then
      cnt <= (others => '0');
    else
      cnt <= cnt + 1;
    end if;
  end if;
end process;

value <= std_logic_vector(cnt);

end architecture rtl;
