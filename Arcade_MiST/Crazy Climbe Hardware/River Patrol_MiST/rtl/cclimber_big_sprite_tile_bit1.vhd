library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity cclimber_big_sprite_tile_bit1 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of cclimber_big_sprite_tile_bit1 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"03",X"0F",X"3F",X"7F",X"FF",X"00",X"3F",X"FF",X"FF",X"FE",X"FC",X"F8",X"F8",
		X"00",X"FF",X"9F",X"9F",X"3F",X"7F",X"7F",X"7F",X"00",X"FC",X"FC",X"FC",X"FC",X"FC",X"C0",X"C0",
		X"FF",X"7F",X"3F",X"0F",X"03",X"00",X"00",X"00",X"F8",X"F8",X"FC",X"FE",X"FF",X"FF",X"3F",X"00",
		X"7F",X"7F",X"7F",X"3F",X"9F",X"9F",X"FF",X"00",X"C0",X"C0",X"FC",X"FC",X"FC",X"FC",X"FC",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"1F",X"3F",X"3F",X"3F",X"3F",X"1F",X"0F",X"0F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FC",X"F8",X"F8",
		X"00",X"E0",X"FC",X"FF",X"07",X"1F",X"3F",X"3F",X"00",X"00",X"00",X"00",X"C0",X"F8",X"FE",X"FF",
		X"07",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"F8",X"F8",X"FC",X"FC",X"7E",X"1F",X"03",X"00",
		X"7F",X"7F",X"FF",X"7F",X"7F",X"7F",X"FF",X"FF",X"FE",X"FE",X"CC",X"80",X"80",X"80",X"C0",X"F0",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"7F",X"1F",X"03",X"00",X"00",X"00",X"00",X"00",X"F0",X"E0",X"E0",X"60",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"07",X"0F",X"0F",X"0F",X"00",X"00",X"00",X"00",X"80",X"F0",X"FE",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"0F",X"07",X"07",X"07",X"03",X"03",X"03",X"01",X"FF",X"FF",X"FF",X"FF",X"FF",X"FC",X"F8",X"F8",
		X"E0",X"F0",X"F8",X"FC",X"FE",X"03",X"07",X"3F",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",
		X"01",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"F8",X"F8",X"F9",X"79",X"39",X"1B",X"0F",X"07",
		X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FE",X"FC",X"E0",X"F0",X"F8",X"FC",X"FE",X"FC",X"38",X"10",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FC",X"FC",X"FE",X"7F",X"3E",X"1C",X"08",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"78",X"FC",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"E0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FC",X"F8",X"F8",
		X"F0",X"F8",X"F8",X"FC",X"FC",X"3E",X"0E",X"07",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"70",X"70",X"73",X"37",X"37",X"1F",X"1F",X"1F",
		X"23",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"80",X"80",X"C0",X"C0",X"C0",X"E0",X"E0",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"0F",X"0F",X"07",X"07",X"07",X"03",X"03",X"01",
		X"FF",X"E3",X"C1",X"C1",X"E0",X"E0",X"C0",X"00",X"E0",X"F0",X"F0",X"80",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"07",X"07",X"0F",X"0F",X"1F",X"1F",
		X"80",X"C0",X"E0",X"E0",X"F0",X"F0",X"F8",X"F8",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"3F",X"3F",X"7F",X"7F",X"7F",X"7C",X"78",X"70",
		X"FC",X"FC",X"FE",X"FE",X"FE",X"3E",X"1E",X"0E",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"70",X"47",X"4F",X"7F",X"7F",X"7F",X"7F",X"7F",
		X"0E",X"E2",X"F2",X"FE",X"FE",X"FE",X"FE",X"FE",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"7F",X"7F",X"7C",X"7C",X"7C",X"7C",X"00",X"00",
		X"FE",X"FE",X"3E",X"3E",X"3E",X"3E",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"07",X"07",X"0F",X"0F",X"1F",X"1F",
		X"80",X"C0",X"E0",X"E0",X"F0",X"F0",X"F8",X"F8",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",
		X"00",X"02",X"0C",X"08",X"08",X"10",X"20",X"23",X"3F",X"3F",X"7F",X"7F",X"7F",X"7C",X"F8",X"70",
		X"FC",X"FC",X"FF",X"FE",X"FE",X"3E",X"1E",X"0E",X"60",X"10",X"08",X"C8",X"44",X"42",X"42",X"30",
		X"04",X"08",X"10",X"10",X"10",X"20",X"18",X"07",X"70",X"47",X"4F",X"7F",X"7D",X"78",X"00",X"00",
		X"0E",X"E2",X"F2",X"FE",X"FE",X"7E",X"00",X"00",X"08",X"0C",X"04",X"04",X"04",X"08",X"10",X"70",
		X"10",X"10",X"0C",X"03",X"00",X"00",X"00",X"00",X"C3",X"3C",X"00",X"0A",X"F5",X"00",X"00",X"00",
		X"E3",X"1C",X"00",X"00",X"01",X"E2",X"00",X"00",X"80",X"00",X"10",X"20",X"C0",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"01",X"02",X"1E",X"20",X"00",X"00",X"01",X"00",X"E0",X"00",X"00",X"18",
		X"00",X"00",X"C1",X"20",X"00",X"78",X"04",X"02",X"00",X"00",X"C0",X"20",X"20",X"40",X"30",X"0C",
		X"20",X"00",X"05",X"04",X"08",X"08",X"08",X"10",X"20",X"C1",X"03",X"07",X"07",X"0F",X"0F",X"1F",
		X"01",X"81",X"C0",X"E2",X"E1",X"F0",X"F0",X"F8",X"04",X"E0",X"10",X"10",X"08",X"88",X"88",X"80",
		X"08",X"10",X"10",X"20",X"10",X"00",X"00",X"20",X"1F",X"3F",X"3F",X"7F",X"7F",X"3F",X"0C",X"00",
		X"F8",X"FC",X"FC",X"FE",X"FE",X"0E",X"00",X"00",X"40",X"20",X"40",X"00",X"0C",X"04",X"04",X"3C",
		X"12",X"11",X"10",X"18",X"04",X"02",X"01",X"00",X"00",X"00",X"C0",X"38",X"07",X"00",X"80",X"00",
		X"FE",X"30",X"00",X"23",X"C0",X"00",X"00",X"00",X"20",X"20",X"C0",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"03",X"07",X"0F",X"1E",X"00",X"00",X"3E",X"FF",X"FF",X"FF",X"9E",X"A6",
		X"00",X"00",X"30",X"CE",X"C1",X"F1",X"30",X"3E",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"20",
		X"1E",X"1C",X"38",X"30",X"33",X"27",X"07",X"0F",X"62",X"07",X"78",X"FD",X"FF",X"FF",X"FF",X"FE",
		X"C2",X"05",X"00",X"F0",X"D8",X"C6",X"C1",X"30",X"D0",X"D0",X"C8",X"08",X"00",X"E0",X"E0",X"D0",
		X"0F",X"0F",X"3C",X"3D",X"1F",X"1F",X"1F",X"1C",X"E1",X"D9",X"23",X"9E",X"11",X"8D",X"41",X"3F",
		X"08",X"48",X"2F",X"9B",X"51",X"10",X"98",X"7F",X"C8",X"E8",X"90",X"90",X"F0",X"F8",X"F4",X"F4",
		X"0C",X"0E",X"0D",X"04",X"02",X"00",X"00",X"00",X"12",X"49",X"21",X"99",X"47",X"20",X"3E",X"00",
		X"1F",X"0F",X"CE",X"FC",X"FD",X"FE",X"00",X"00",X"E4",X"CC",X"10",X"60",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"40",X"81",X"41",X"21",X"40",X"40",X"80",X"40",X"98",X"04",X"02",X"02",X"81",X"41",X"21",X"10",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"20",X"20",X"10",X"00",X"00",X"00",X"00",X"00",X"10",X"20",X"20",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"04",X"04",X"08",X"04",X"08",X"08",
		X"00",X"00",X"00",X"20",X"10",X"08",X"08",X"04",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"06",X"01",X"00",X"01",X"00",X"00",X"00",X"00",
		X"00",X"00",X"80",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"04",X"08",X"10",X"10",X"20",X"00",X"00",X"00",X"20",X"10",X"08",X"08",X"04",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"42",X"42",X"84",X"84",X"82",X"00",X"00",X"00",X"42",X"42",X"21",X"21",X"41",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"04",X"04",X"08",X"04",X"08",X"08",
		X"00",X"00",X"00",X"20",X"10",X"08",X"08",X"04",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"06",X"01",X"00",X"01",X"00",X"00",X"00",X"00",
		X"00",X"00",X"80",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"40",X"81",X"41",X"21",X"40",X"40",X"80",X"40",X"98",X"04",X"02",X"02",X"81",X"41",X"21",X"10",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"20",X"20",X"10",X"00",X"00",X"00",X"00",X"00",X"10",X"20",X"20",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"08",X"08",X"10",X"08",X"04",X"04",X"04",X"02",X"00",X"00",X"20",X"10",X"10",X"08",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"02",X"01",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"84",X"82",X"81",X"80",X"40",X"40",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"41",X"21",X"11",X"80",X"40",X"00",X"00",X"00",X"00",X"00",X"80",X"40",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"14",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"28",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"08",X"08",X"10",X"20",X"20",X"00",X"00",X"00",X"10",X"10",X"08",X"04",X"04",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"84",X"82",X"81",X"80",X"40",X"40",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"41",X"21",X"11",X"80",X"40",X"00",X"00",X"00",X"00",X"00",X"80",X"40",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"08",X"08",X"10",X"08",X"04",X"04",X"04",X"02",X"00",X"00",X"20",X"10",X"10",X"08",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"02",X"01",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
