library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity prom_ic24 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of prom_ic24 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"F8",X"F8",X"F8",X"F8",X"F0",X"E0",X"C0",X"80",
		X"F8",X"7C",X"3E",X"1F",X"0F",X"07",X"03",X"01",X"F8",X"F8",X"F8",X"F8",X"F8",X"F8",X"F8",X"F8",
		X"00",X"00",X"00",X"80",X"C0",X"E0",X"F0",X"F8",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"FF",X"F8",X"F8",X"F8",X"7F",X"3F",X"1F",X"0F",X"07",
		X"00",X"00",X"00",X"03",X"0F",X"1F",X"3F",X"FF",X"00",X"00",X"00",X"F8",X"F8",X"F8",X"F8",X"F8",
		X"F8",X"F8",X"F8",X"F8",X"F8",X"F8",X"F8",X"F8",X"00",X"00",X"00",X"F8",X"F8",X"F8",X"F8",X"F8",
		X"F8",X"F8",X"F8",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FE",X"FC",X"F8",X"F8",X"F8",X"F8",X"F8",
		X"00",X"00",X"00",X"01",X"03",X"87",X"CF",X"FF",X"00",X"00",X"00",X"FC",X"FE",X"FF",X"FF",X"FF",
		X"0F",X"07",X"03",X"01",X"00",X"00",X"00",X"00",X"7F",X"3F",X"1F",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"F8",X"C0",X"E0",X"F0",X"F8",X"FC",X"FE",X"FF",X"FF",
		X"F0",X"E0",X"C0",X"80",X"00",X"00",X"00",X"80",X"1F",X"3F",X"7F",X"FF",X"FF",X"FE",X"FC",X"F8",
		X"F8",X"F8",X"F8",X"F8",X"00",X"00",X"00",X"00",X"7F",X"3F",X"1F",X"0F",X"07",X"03",X"01",X"00",
		X"1F",X"3F",X"7F",X"FF",X"FF",X"FE",X"FF",X"FF",X"00",X"00",X"00",X"00",X"01",X"03",X"07",X"0F",
		X"00",X"00",X"00",X"F8",X"F8",X"F8",X"F8",X"F8",X"3F",X"7E",X"FC",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"00",X"00",X"00",X"01",X"03",X"07",X"0F",X"1F",X"3F",X"7E",X"FC",X"F8",X"F0",X"E0",X"C0",X"80",
		X"FC",X"7E",X"3F",X"1F",X"1F",X"0F",X"0F",X"1F",X"00",X"00",X"00",X"80",X"C0",X"E0",X"C0",X"80",
		X"24",X"24",X"24",X"24",X"00",X"00",X"00",X"00",X"04",X"08",X"11",X"02",X"04",X"00",X"00",X"00",
		X"00",X"00",X"0F",X"00",X"00",X"0F",X"00",X"00",X"00",X"00",X"00",X"04",X"02",X"11",X"08",X"04",
		X"00",X"00",X"00",X"00",X"24",X"24",X"24",X"24",X"00",X"00",X"00",X"20",X"40",X"88",X"10",X"20",
		X"00",X"00",X"F0",X"00",X"00",X"F0",X"00",X"00",X"20",X"10",X"88",X"40",X"20",X"00",X"00",X"00",
		X"10",X"90",X"E0",X"C0",X"80",X"00",X"00",X"00",X"3F",X"4F",X"87",X"43",X"21",X"11",X"0A",X"04",
		X"00",X"28",X"24",X"52",X"89",X"07",X"08",X"10",X"00",X"00",X"00",X"00",X"03",X"04",X"0C",X"1E",
		X"36",X"36",X"F6",X"EE",X"1C",X"F8",X"F0",X"00",X"6C",X"6C",X"6F",X"77",X"38",X"1F",X"0F",X"00",
		X"00",X"F0",X"F8",X"1C",X"6E",X"76",X"36",X"36",X"00",X"0F",X"1F",X"38",X"76",X"6E",X"6C",X"6C",
		X"00",X"00",X"00",X"00",X"24",X"24",X"24",X"24",X"00",X"00",X"00",X"20",X"40",X"88",X"10",X"20",
		X"00",X"00",X"F0",X"00",X"00",X"F0",X"00",X"00",X"20",X"10",X"88",X"40",X"20",X"00",X"00",X"00",
		X"24",X"24",X"24",X"24",X"00",X"00",X"00",X"00",X"04",X"08",X"11",X"02",X"04",X"00",X"00",X"00",
		X"00",X"00",X"0F",X"00",X"00",X"0F",X"00",X"00",X"00",X"00",X"00",X"04",X"02",X"11",X"08",X"04",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"81",X"42",X"24",X"18",X"18",X"24",X"42",X"81",
		X"00",X"78",X"7C",X"6C",X"6C",X"7C",X"78",X"00",X"00",X"18",X"18",X"7E",X"7E",X"18",X"18",X"00",
		X"FF",X"E7",X"E7",X"81",X"81",X"E7",X"E7",X"FF",X"3C",X"66",X"DB",X"BD",X"BD",X"DB",X"66",X"3C",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"C0",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",
		X"03",X"00",X"00",X"00",X"08",X"04",X"80",X"80",X"01",X"00",X"00",X"00",X"10",X"20",X"00",X"00",
		X"00",X"00",X"04",X"08",X"00",X"00",X"00",X"80",X"01",X"01",X"20",X"10",X"00",X"00",X"00",X"C0",
		X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",
		X"03",X"00",X"00",X"00",X"08",X"04",X"80",X"80",X"00",X"00",X"00",X"00",X"10",X"20",X"00",X"00",
		X"00",X"00",X"04",X"08",X"00",X"00",X"00",X"00",X"01",X"01",X"20",X"10",X"00",X"00",X"00",X"C0",
		X"60",X"C0",X"80",X"80",X"00",X"00",X"00",X"00",X"07",X"03",X"01",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"E0",X"00",X"00",X"00",X"00",X"01",X"01",X"02",X"07",
		X"10",X"20",X"00",X"00",X"08",X"04",X"00",X"00",X"08",X"04",X"00",X"00",X"10",X"20",X"00",X"00",
		X"00",X"00",X"04",X"08",X"00",X"00",X"20",X"10",X"00",X"00",X"20",X"10",X"00",X"00",X"04",X"08",
		X"80",X"C0",X"C0",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"03",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"C0",X"C0",X"80",X"00",X"00",X"00",X"00",X"00",X"03",X"03",X"01",
		X"23",X"00",X"80",X"00",X"08",X"04",X"80",X"80",X"08",X"00",X"01",X"01",X"10",X"20",X"00",X"00",
		X"00",X"00",X"04",X"08",X"80",X"00",X"00",X"30",X"01",X"01",X"20",X"10",X"01",X"01",X"00",X"CC",
		X"F0",X"80",X"80",X"80",X"00",X"00",X"00",X"00",X"0F",X"01",X"00",X"01",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"80",X"80",X"80",X"D0",X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"07",
		X"A3",X"20",X"40",X"80",X"08",X"04",X"80",X"80",X"05",X"04",X"02",X"01",X"00",X"20",X"00",X"00",
		X"00",X"00",X"04",X"00",X"80",X"40",X"20",X"A0",X"01",X"01",X"20",X"00",X"01",X"02",X"04",X"C5",
		X"34",X"94",X"48",X"30",X"00",X"00",X"00",X"00",X"2C",X"29",X"12",X"0C",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"30",X"48",X"94",X"34",X"00",X"00",X"00",X"00",X"0C",X"12",X"29",X"2C",
		X"80",X"30",X"78",X"78",X"30",X"04",X"00",X"00",X"01",X"0C",X"1E",X"1E",X"0C",X"20",X"00",X"00",
		X"00",X"00",X"04",X"30",X"78",X"78",X"30",X"80",X"00",X"00",X"20",X"0C",X"1E",X"1E",X"0C",X"01",
		X"10",X"10",X"88",X"40",X"28",X"00",X"00",X"00",X"08",X"08",X"11",X"02",X"14",X"00",X"00",X"00",
		X"00",X"00",X"00",X"28",X"40",X"88",X"10",X"10",X"00",X"00",X"00",X"14",X"02",X"11",X"08",X"08",
		X"C3",X"E0",X"40",X"00",X"08",X"04",X"80",X"80",X"03",X"07",X"02",X"00",X"10",X"20",X"00",X"00",
		X"00",X"00",X"04",X"08",X"00",X"40",X"E0",X"C0",X"01",X"01",X"20",X"10",X"00",X"02",X"07",X"C3",
		X"FE",X"88",X"EC",X"88",X"FC",X"AE",X"87",X"03",X"19",X"38",X"1D",X"1E",X"3F",X"75",X"E1",X"C0",
		X"03",X"87",X"AE",X"FC",X"88",X"EC",X"88",X"FE",X"C0",X"E1",X"75",X"3F",X"1E",X"1D",X"38",X"19",
		X"45",X"90",X"00",X"52",X"08",X"84",X"10",X"80",X"02",X"49",X"00",X"4A",X"10",X"20",X"0A",X"00",
		X"00",X"50",X"04",X"08",X"52",X"00",X"92",X"40",X"01",X"08",X"21",X"10",X"4A",X"00",X"09",X"A2",
		X"FE",X"98",X"DC",X"88",X"FC",X"AE",X"87",X"03",X"1D",X"38",X"1D",X"1B",X"3F",X"75",X"E1",X"C0",
		X"03",X"87",X"AE",X"FC",X"88",X"DC",X"98",X"FE",X"C0",X"E1",X"75",X"3F",X"1B",X"1D",X"38",X"1D",
		X"FE",X"C8",X"AC",X"88",X"FC",X"AC",X"8C",X"38",X"1D",X"38",X"1D",X"1B",X"3F",X"75",X"E1",X"C0",
		X"38",X"8C",X"AC",X"FC",X"88",X"AC",X"C8",X"FE",X"C0",X"E1",X"75",X"3F",X"1B",X"1D",X"38",X"1D",
		X"FE",X"88",X"AC",X"D8",X"FC",X"AC",X"0C",X"38",X"3D",X"78",X"3D",X"1B",X"BF",X"F3",X"00",X"00",
		X"38",X"0C",X"AC",X"FC",X"D8",X"AC",X"88",X"FE",X"00",X"00",X"F3",X"BF",X"1B",X"3D",X"78",X"3D",
		X"FC",X"40",X"58",X"90",X"F8",X"B0",X"70",X"40",X"19",X"08",X"5B",X"3F",X"0B",X"00",X"00",X"00",
		X"40",X"70",X"B0",X"F8",X"90",X"58",X"40",X"FC",X"00",X"00",X"00",X"0B",X"3F",X"5B",X"08",X"19",
		X"FC",X"00",X"58",X"90",X"F8",X"B8",X"04",X"02",X"19",X"08",X"1B",X"0F",X"13",X"20",X"40",X"00",
		X"02",X"04",X"B8",X"F8",X"90",X"58",X"00",X"FC",X"00",X"40",X"20",X"13",X"0F",X"1B",X"08",X"19",
		X"FC",X"40",X"58",X"90",X"F8",X"B0",X"70",X"40",X"19",X"08",X"5B",X"3F",X"0B",X"00",X"00",X"00",
		X"40",X"70",X"B0",X"F8",X"90",X"58",X"40",X"FC",X"00",X"00",X"00",X"0B",X"3F",X"5B",X"08",X"19",
		X"E0",X"50",X"98",X"B0",X"E0",X"60",X"C0",X"00",X"09",X"28",X"1B",X"07",X"00",X"00",X"00",X"00",
		X"00",X"C0",X"60",X"E0",X"B0",X"98",X"50",X"E0",X"00",X"00",X"00",X"00",X"07",X"1B",X"28",X"09",
		X"60",X"D0",X"10",X"60",X"80",X"00",X"00",X"00",X"09",X"08",X"10",X"01",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"80",X"60",X"10",X"D0",X"60",X"00",X"00",X"00",X"00",X"01",X"10",X"08",X"09",
		X"C0",X"40",X"60",X"40",X"80",X"00",X"00",X"00",X"09",X"0F",X"10",X"01",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"80",X"40",X"60",X"40",X"C0",X"00",X"00",X"00",X"00",X"01",X"10",X"0F",X"09",
		X"C0",X"40",X"60",X"40",X"20",X"10",X"00",X"00",X"09",X"0F",X"10",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"80",X"40",X"60",X"40",X"C0",X"00",X"00",X"00",X"00",X"01",X"10",X"0F",X"09",
		X"C0",X"40",X"60",X"40",X"20",X"10",X"00",X"00",X"09",X"0F",X"10",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"80",X"40",X"60",X"40",X"C0",X"00",X"00",X"00",X"00",X"01",X"10",X"0F",X"09",
		X"C0",X"40",X"60",X"40",X"24",X"18",X"00",X"00",X"09",X"0F",X"10",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"80",X"40",X"60",X"40",X"C0",X"00",X"00",X"00",X"00",X"01",X"10",X"0F",X"09",
		X"C0",X"40",X"40",X"80",X"80",X"00",X"00",X"00",X"05",X"0F",X"00",X"00",X"00",X"01",X"00",X"00",
		X"00",X"00",X"00",X"00",X"80",X"40",X"40",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"0F",X"05",
		X"A0",X"40",X"00",X"10",X"08",X"00",X"00",X"00",X"05",X"02",X"00",X"08",X"10",X"00",X"00",X"00",
		X"00",X"00",X"00",X"08",X"10",X"00",X"40",X"A0",X"00",X"00",X"00",X"10",X"08",X"00",X"02",X"05",
		X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",
		X"10",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"04",X"00",X"00",X"00",X"02",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"08",X"00",X"00",X"00",X"00",X"04",X"00",X"02",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"18",X"18",X"18",X"18",X"18",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"FF",X"FF",X"18",X"18",X"18",X"18",X"18",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",
		X"80",X"00",X"00",X"06",X"00",X"10",X"F0",X"E8",X"C4",X"E0",X"12",X"00",X"56",X"00",X"80",X"01",
		X"8A",X"44",X"28",X"10",X"A8",X"47",X"86",X"04",X"0F",X"07",X"02",X"01",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"80",X"C0",X"E0",X"D0",X"00",X"00",X"00",X"00",X"03",X"03",X"0F",X"0F",
		X"06",X"06",X"06",X"0E",X"1C",X"F8",X"F0",X"00",X"60",X"60",X"60",X"70",X"38",X"1F",X"0F",X"00",
		X"00",X"F0",X"F8",X"1C",X"0E",X"06",X"06",X"06",X"00",X"0F",X"1F",X"38",X"70",X"60",X"60",X"60",
		X"00",X"42",X"7E",X"7E",X"7E",X"7E",X"42",X"00",X"81",X"00",X"04",X"52",X"4A",X"20",X"00",X"81",
		X"2A",X"00",X"00",X"11",X"00",X"AA",X"00",X"20",X"04",X"00",X"85",X"10",X"84",X"00",X"84",X"10",
		X"00",X"00",X"00",X"55",X"AA",X"00",X"00",X"00",X"08",X"10",X"08",X"10",X"08",X"10",X"08",X"10",
		X"07",X"0E",X"1C",X"38",X"F0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"81",X"FF",X"7E",X"00",
		X"30",X"18",X"0C",X"06",X"03",X"01",X"00",X"00",X"C0",X"C0",X"C0",X"C0",X"60",X"60",X"60",X"30",
		X"30",X"60",X"60",X"60",X"C0",X"C0",X"C0",X"C0",X"00",X"00",X"C0",X"F0",X"38",X"1C",X"0E",X"07",
		X"00",X"7E",X"FF",X"81",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"06",X"0C",X"18",X"30",
		X"03",X"03",X"03",X"06",X"06",X"1C",X"F8",X"E0",X"E0",X"F8",X"1C",X"06",X"06",X"03",X"03",X"03",
		X"F8",X"F0",X"E0",X"40",X"00",X"00",X"00",X"00",X"1F",X"0F",X"07",X"02",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"40",X"E0",X"F0",X"F8",X"00",X"00",X"00",X"00",X"02",X"07",X"0F",X"1F",
		X"E0",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"07",X"03",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"E0",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"07",
		X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",
		X"80",X"00",X"00",X"00",X"00",X"08",X"00",X"00",X"41",X"00",X"00",X"00",X"00",X"04",X"08",X"00",
		X"00",X"04",X"08",X"00",X"00",X"00",X"00",X"82",X"00",X"00",X"08",X"00",X"00",X"00",X"00",X"01",
		X"C0",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"C0",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",
		X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",
		X"F8",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"18",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"40",X"80",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"01",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"80",X"40",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"02");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
