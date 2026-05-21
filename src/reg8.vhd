library ieee;
  use ieee.std_logic_1164.all;

entity reg8 is
  port (
    clk   : in    std_logic;
    rst  : in    std_logic;
    we : in   std_logic;
    d_in : in   std_logic_vector(7 downto 0);
    d_out : out   std_logic_vector(7 downto 0)
  );
end entity reg8;

architecture rtl of reg8 is
  signal mem : std_logic_vector(7 downto 0);
begin
  process(clk)
  begin
    if rising_edge(clk) then
      if rst = '1' then
        mem <= (others => '0');
      elsif we = '1' then
        mem <= d_in;
      end if;
    end if;
  end process;

  d_out <= mem;
end architecture rtl;
