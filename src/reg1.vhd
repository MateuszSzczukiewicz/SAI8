library ieee;
use ieee.std_logic_1164.all;

entity reg1 is
  port (
    clk   : in    std_logic;
    rst  : in    std_logic;
    we : in   std_logic;
    din : in   std_logic;
    dout : out   std_logic
  );
end entity reg1;

architecture rtl of reg1 is
  signal mem : std_logic;
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        mem <= '0';
      elsif we = '1' then
        mem <= din;
      end if;
    end if;
  end process;

  dout <= mem;
end architecture rtl;
