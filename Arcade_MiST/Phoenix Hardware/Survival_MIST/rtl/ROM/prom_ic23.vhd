library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity prom_ic23 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of prom_ic23 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FE",X"FC",X"F8",X"F0",X"E0",X"C0",X"80",
		X"FF",X"7F",X"3F",X"1F",X"0F",X"07",X"03",X"01",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"C0",X"E0",X"F0",X"F8",X"FC",X"FE",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"3F",X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"7F",X"3F",X"1F",X"0F",X"07",
		X"01",X"03",X"07",X"1F",X"3F",X"7F",X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FE",X"FC",X"F8",X"1F",X"3F",X"7F",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"80",X"C0",X"E1",X"FF",X"FF",X"FF",X"FF",X"FE",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"0F",X"07",X"03",X"01",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"80",X"C0",X"E0",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"F0",X"E0",X"E0",X"F0",X"F8",X"FC",X"FE",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FE",X"FC",X"F8",
		X"FF",X"FE",X"FC",X"F8",X"00",X"00",X"00",X"00",X"7F",X"3F",X"1F",X"0F",X"07",X"03",X"01",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"01",X"03",X"07",X"0F",X"1F",X"3F",X"7F",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FE",X"FC",X"F8",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"01",X"03",X"07",X"0F",X"1F",X"3F",X"7F",X"FF",X"FF",X"FE",X"FC",X"F8",X"F0",X"E0",X"C0",X"80",
		X"FF",X"7F",X"3F",X"1F",X"1F",X"3F",X"7F",X"FF",X"C0",X"E0",X"F0",X"F8",X"F0",X"E0",X"C0",X"80",
		X"00",X"00",X"00",X"24",X"00",X"00",X"00",X"00",X"00",X"00",X"10",X"00",X"04",X"00",X"00",X"00",
		X"00",X"00",X"08",X"00",X"00",X"08",X"00",X"00",X"00",X"00",X"00",X"04",X"00",X"10",X"00",X"00",
		X"00",X"00",X"00",X"00",X"24",X"00",X"00",X"00",X"00",X"00",X"00",X"20",X"00",X"08",X"00",X"00",
		X"00",X"00",X"10",X"00",X"00",X"10",X"00",X"00",X"00",X"00",X"08",X"00",X"20",X"00",X"00",X"00",
		X"E0",X"E0",X"C0",X"C0",X"80",X"00",X"00",X"00",X"1B",X"3F",X"7E",X"3F",X"1F",X"0E",X"04",X"00",
		X"F0",X"10",X"10",X"20",X"60",X"E0",X"E0",X"E0",X"B2",X"CC",X"C0",X"80",X"00",X"07",X"0F",X"1F",
		X"30",X"30",X"F0",X"E0",X"00",X"00",X"00",X"00",X"0C",X"0C",X"0F",X"07",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"60",X"70",X"30",X"30",X"00",X"00",X"00",X"00",X"06",X"0E",X"0C",X"0C",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"24",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"20",
		X"00",X"00",X"80",X"00",X"00",X"80",X"00",X"00",X"20",X"00",X"80",X"00",X"00",X"00",X"00",X"00",
		X"24",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"04",X"00",X"01",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"01",X"00",X"00",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"04",
		X"00",X"18",X"18",X"7E",X"7E",X"18",X"18",X"00",X"7E",X"BD",X"DB",X"E7",X"E7",X"DB",X"BD",X"7E",
		X"F9",X"B7",X"B1",X"B1",X"B1",X"B1",X"B7",X"F9",X"FF",X"E7",X"E7",X"81",X"81",X"E7",X"E7",X"FF",
		X"00",X"18",X"18",X"7E",X"7E",X"18",X"18",X"00",X"00",X"18",X"24",X"5A",X"5A",X"24",X"18",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"40",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"01",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"40",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"02",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"43",X"00",X"00",X"00",X"08",X"04",X"80",X"80",X"05",X"02",X"00",X"00",X"10",X"20",X"00",X"00",
		X"00",X"00",X"04",X"08",X"00",X"00",X"40",X"E0",X"01",X"01",X"20",X"10",X"00",X"02",X"05",X"C2",
		X"00",X"00",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",X"00",
		X"E3",X"40",X"00",X"00",X"08",X"04",X"80",X"80",X"07",X"02",X"00",X"00",X"10",X"20",X"00",X"00",
		X"00",X"00",X"04",X"08",X"00",X"00",X"40",X"E0",X"01",X"01",X"20",X"10",X"00",X"00",X"02",X"C7",
		X"00",X"20",X"20",X"C0",X"00",X"00",X"00",X"00",X"00",X"04",X"04",X"03",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"C0",X"20",X"20",X"00",X"00",X"00",X"00",X"00",X"03",X"04",X"04",X"00",
		X"4B",X"B0",X"40",X"40",X"80",X"00",X"80",X"80",X"12",X"0D",X"02",X"02",X"01",X"00",X"00",X"00",
		X"00",X"00",X"00",X"80",X"40",X"40",X"B0",X"48",X"01",X"01",X"00",X"01",X"02",X"02",X"0D",X"D2",
		X"C8",X"B0",X"40",X"40",X"80",X"00",X"00",X"00",X"13",X"0D",X"02",X"02",X"01",X"00",X"00",X"00",
		X"00",X"00",X"00",X"80",X"40",X"40",X"B0",X"C8",X"00",X"00",X"00",X"01",X"02",X"02",X"0D",X"13",
		X"D3",X"D0",X"A0",X"40",X"80",X"00",X"80",X"80",X"0B",X"0B",X"05",X"02",X"11",X"00",X"00",X"00",
		X"00",X"00",X"00",X"88",X"40",X"A0",X"D0",X"D0",X"01",X"01",X"00",X"11",X"02",X"05",X"0B",X"CB",
		X"CC",X"EC",X"78",X"30",X"00",X"00",X"00",X"00",X"33",X"37",X"1E",X"0C",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"30",X"78",X"EC",X"CC",X"00",X"00",X"00",X"00",X"0C",X"1E",X"37",X"33",
		X"83",X"30",X"48",X"48",X"30",X"04",X"80",X"80",X"01",X"0C",X"12",X"12",X"0C",X"20",X"00",X"00",
		X"00",X"00",X"04",X"30",X"48",X"48",X"30",X"80",X"01",X"01",X"20",X"0C",X"12",X"12",X"0C",X"C1",
		X"70",X"F0",X"F8",X"70",X"20",X"00",X"00",X"00",X"0E",X"0F",X"1F",X"0E",X"04",X"00",X"00",X"00",
		X"00",X"00",X"00",X"20",X"70",X"F8",X"F0",X"70",X"00",X"00",X"00",X"04",X"0E",X"1F",X"0F",X"0E",
		X"40",X"E0",X"64",X"02",X"00",X"20",X"10",X"00",X"02",X"07",X"26",X"40",X"00",X"04",X"08",X"00",
		X"00",X"10",X"20",X"00",X"02",X"64",X"E0",X"40",X"00",X"08",X"04",X"00",X"40",X"26",X"07",X"02",
		X"FE",X"F8",X"9C",X"F8",X"FC",X"AE",X"86",X"00",X"1F",X"3F",X"1F",X"1F",X"3F",X"75",X"61",X"00",
		X"00",X"86",X"AE",X"FC",X"F8",X"9C",X"F8",X"FE",X"00",X"61",X"75",X"3F",X"1F",X"1F",X"3F",X"1F",
		X"46",X"80",X"24",X"10",X"00",X"A4",X"80",X"00",X"02",X"49",X"24",X"0A",X"00",X"24",X"02",X"00",
		X"00",X"40",X"24",X"00",X"50",X"24",X"92",X"40",X"00",X"01",X"25",X"00",X"0A",X"24",X"09",X"62",
		X"FE",X"B8",X"BC",X"F8",X"FC",X"AE",X"86",X"00",X"1F",X"3F",X"1F",X"1F",X"3F",X"75",X"61",X"00",
		X"00",X"86",X"AE",X"FC",X"F8",X"BC",X"B8",X"FE",X"00",X"61",X"75",X"3F",X"1F",X"1F",X"3F",X"1F",
		X"FE",X"F8",X"CC",X"C8",X"FC",X"AC",X"84",X"00",X"1F",X"3F",X"1F",X"1F",X"3F",X"75",X"61",X"00",
		X"00",X"84",X"AC",X"FC",X"C8",X"CC",X"F8",X"FE",X"00",X"61",X"75",X"3F",X"1F",X"1F",X"3F",X"1F",
		X"FE",X"F8",X"9C",X"B8",X"FC",X"AC",X"04",X"00",X"3F",X"7F",X"3F",X"1F",X"3F",X"33",X"00",X"00",
		X"00",X"04",X"AC",X"FC",X"B8",X"9C",X"F8",X"FE",X"00",X"00",X"33",X"3F",X"1F",X"3F",X"7F",X"3F",
		X"FC",X"30",X"38",X"F0",X"F8",X"A0",X"00",X"00",X"1B",X"0F",X"1F",X"1F",X"0B",X"00",X"00",X"00",
		X"00",X"00",X"A0",X"F8",X"F0",X"38",X"30",X"FC",X"00",X"00",X"00",X"0B",X"1F",X"1F",X"0F",X"1B",
		X"FC",X"30",X"38",X"F0",X"F8",X"A0",X"00",X"00",X"19",X"0F",X"1F",X"0F",X"03",X"00",X"00",X"00",
		X"00",X"00",X"A0",X"F8",X"F0",X"38",X"30",X"FC",X"00",X"00",X"00",X"03",X"0F",X"1F",X"0F",X"19",
		X"FC",X"30",X"38",X"F0",X"F8",X"A0",X"00",X"00",X"1B",X"0F",X"1F",X"1F",X"0B",X"00",X"00",X"00",
		X"00",X"00",X"A0",X"F8",X"F0",X"38",X"30",X"FC",X"00",X"00",X"00",X"0B",X"1F",X"1F",X"0F",X"1B",
		X"E0",X"30",X"78",X"F0",X"E0",X"00",X"00",X"00",X"09",X"0F",X"0F",X"07",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"E0",X"F0",X"78",X"30",X"E0",X"00",X"00",X"00",X"00",X"07",X"0F",X"0F",X"09",
		X"60",X"30",X"70",X"20",X"00",X"00",X"00",X"00",X"09",X"07",X"04",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"20",X"70",X"30",X"60",X"00",X"00",X"00",X"00",X"00",X"04",X"07",X"09",
		X"00",X"80",X"20",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"20",X"80",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"00",X"00",
		X"00",X"80",X"20",X"00",X"00",X"00",X"10",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"20",X"80",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"00",X"00",
		X"00",X"80",X"20",X"00",X"00",X"00",X"10",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"20",X"80",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"00",X"00",
		X"00",X"80",X"20",X"02",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"20",X"80",X"00",X"00",X"00",X"00",X"00",X"02",X"00",X"00",X"00",
		X"00",X"80",X"40",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"00",
		X"00",X"00",X"00",X"00",X"00",X"40",X"80",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",X"00",
		X"46",X"00",X"00",X"00",X"00",X"80",X"80",X"00",X"02",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"00",X"01",X"01",X"00",X"00",X"00",X"00",X"62",
		X"44",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"01",X"00",X"00",X"10",X"00",X"00",X"00",
		X"00",X"00",X"00",X"08",X"00",X"00",X"80",X"40",X"00",X"00",X"00",X"00",X"04",X"00",X"01",X"02",
		X"00",X"00",X"00",X"00",X"20",X"00",X"00",X"00",X"00",X"08",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"08",X"00",X"01",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"E7",X"E7",X"E7",X"E7",X"E7",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FE",X"FC",X"FC",X"FE",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"79",X"E0",X"C3",X"90",X"C0",X"E4",X"02",X"01",X"08",X"02",X"E5",X"C0",X"80",X"C6",X"70",X"F8",
		X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"03",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"C0",X"80",X"40",X"20",X"10",X"08",X"05",X"03",X"07",
		X"30",X"30",X"F0",X"E0",X"00",X"00",X"00",X"00",X"0C",X"0C",X"0F",X"07",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"60",X"70",X"30",X"30",X"00",X"00",X"00",X"00",X"06",X"0E",X"0C",X"0C",
		X"00",X"02",X"54",X"2A",X"54",X"2A",X"40",X"00",X"80",X"66",X"7E",X"6C",X"36",X"7E",X"66",X"01",
		X"22",X"00",X"AA",X"11",X"11",X"AA",X"00",X"88",X"25",X"00",X"A4",X"18",X"25",X"00",X"A4",X"18",
		X"00",X"00",X"00",X"FF",X"FF",X"00",X"00",X"00",X"18",X"18",X"18",X"18",X"18",X"18",X"18",X"18",
		X"F8",X"F0",X"E0",X"C0",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"7E",X"00",X"00",X"00",
		X"0F",X"07",X"03",X"01",X"00",X"00",X"00",X"00",X"3F",X"3F",X"3F",X"3F",X"1F",X"1F",X"1F",X"0F",
		X"0F",X"1F",X"1F",X"1F",X"3F",X"3F",X"3F",X"3F",X"00",X"00",X"00",X"00",X"C0",X"E0",X"F0",X"F8",
		X"00",X"00",X"00",X"7E",X"FF",X"FF",X"FF",X"FF",X"00",X"00",X"00",X"00",X"01",X"03",X"07",X"0F",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"87",X"88",X"10",X"A0",X"E0",X"20",X"10",X"00",X"23",X"11",X"08",X"05",X"07",X"04",X"08",X"00",
		X"00",X"10",X"20",X"E0",X"A0",X"10",X"08",X"C4",X"00",X"08",X"04",X"07",X"05",X"08",X"11",X"E1",
		X"98",X"A0",X"C0",X"40",X"20",X"00",X"00",X"00",X"09",X"05",X"03",X"02",X"04",X"00",X"00",X"00",
		X"00",X"00",X"00",X"20",X"40",X"C0",X"A0",X"D0",X"00",X"00",X"00",X"04",X"02",X"03",X"04",X"1B",
		X"B0",X"C0",X"40",X"20",X"00",X"00",X"00",X"00",X"07",X"03",X"02",X"04",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"20",X"40",X"C0",X"E0",X"00",X"00",X"00",X"00",X"04",X"02",X"03",X"0E",
		X"E0",X"80",X"40",X"00",X"00",X"00",X"04",X"00",X"83",X"01",X"02",X"00",X"00",X"00",X"08",X"00",
		X"00",X"04",X"00",X"00",X"00",X"40",X"80",X"C1",X"00",X"10",X"00",X"00",X"00",X"02",X"01",X"07",
		X"7C",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",X"07",X"03",X"01",X"01",X"01",X"00",X"00",X"00",
		X"00",X"00",X"00",X"80",X"80",X"80",X"C0",X"E0",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"3D",
		X"F0",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"01",X"01",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"0F",
		X"AC",X"F8",X"00",X"00",X"00",X"00",X"00",X"00",X"2D",X"18",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"F8",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"18",
		X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"01");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
