library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity prom_palette_ic41 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(7 downto 0);
	data : out std_logic_vector(3 downto 0)
);
end entity;

architecture prom of prom_palette_ic41 is
	type rom is array(0 to  255) of std_logic_vector(3 downto 0);
	signal rom_data: rom := (
		"0000","0000","0000","0000","0000","0000","0000","0000","0001","0011","0110","0010","0001","0100","0001","0100",
		"0111","0111","0011","0111","0011","0010","0010","0001","0101","0001","0101","0110","0101","0001","0100","0111",
		"0000","0000","0000","0000","0000","0000","0000","0000","0100","0100","0001","0111","0010","0100","0001","0000",
		"0010","0101","0111","0001","0001","0001","0101","0111","0110","0010","0010","0101","0111","0111","0111","0110",
		"0000","0000","0000","0000","0000","0000","0000","0000","0001","0011","0110","0010","0001","0100","0001","0100",
		"0111","0111","0011","0111","0011","0010","0010","0001","0101","0001","0101","0110","0101","0001","0100","0111",
		"0000","0000","0000","0000","0000","0000","0000","0000","0100","0100","0001","0111","0010","0100","0001","0011",
		"0010","0101","0111","0001","0001","0001","0101","0111","0110","0010","0010","0101","0111","0111","0111","0110",
		"1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111",
		"1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111",
		"1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111",
		"1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111",
		"1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111",
		"1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111",
		"1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111",
		"1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111","1111");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
