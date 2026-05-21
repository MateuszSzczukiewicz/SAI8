library ieee;
use ieee.std_logic_1164.all;

entity tb_memory is
end entity;

architecture sim of tb_memory is
  signal clk  : std_logic := '0';
  signal we   : std_logic := '0';
  signal addr : std_logic_vector(15 downto 0) := (others => '0');
  signal din  : std_logic_vector(7 downto 0)  := (others => '0');
  signal dout : std_logic_vector(7 downto 0);
begin
  clk <= not clk after 5 ns;

  dut: entity work.memory
    port map (
      clk  => clk,
      we   => we,
      addr => addr,
      din  => din,
      dout => dout
    );

  process
  begin
    addr <= x"0010";
    din  <= x"AA";
    we   <= '1';
    wait until rising_edge(clk);

    we <= '0';
    wait until rising_edge(clk);
    wait for 1 ns;

    assert dout = x"AA"
      report "Expected 0xAA at address 0x0010"
      severity failure;

    wait;
  end process;
end architecture;
