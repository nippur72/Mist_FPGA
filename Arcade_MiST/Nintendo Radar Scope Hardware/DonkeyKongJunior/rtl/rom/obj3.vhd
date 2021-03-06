library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity obj3 is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(10 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of obj3 is
	type rom is array(0 to  2047) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"07",X"00",X"00",X"18",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"07",X"08",X"00",X"00",X"18",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"1C",X"1E",X"14",X"00",X"0C",X"00",X"00",X"00",X"08",X"1E",X"2F",X"7F",X"7F",X"DD",X"B8",
		X"00",X"00",X"00",X"00",X"00",X"01",X"01",X"02",X"01",X"00",X"00",X"00",X"07",X"05",X"0C",X"0C",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"1F",X"07",X"35",X"1B",X"3B",X"67",X"77",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"1F",X"07",X"35",X"1A",X"3E",X"66",X"70",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"07",X"35",X"1B",X"3B",X"67",X"77",X"67",X"3B",X"1B",X"35",X"07",X"F0",X"D6",
		X"00",X"00",X"00",X"07",X"35",X"1B",X"3B",X"67",X"77",X"67",X"3B",X"1B",X"35",X"07",X"30",X"39",
		X"00",X"00",X"04",X"1C",X"3D",X"3F",X"FF",X"FF",X"FF",X"3E",X"1E",X"1E",X"1C",X"08",X"00",X"00",
		X"00",X"00",X"04",X"1C",X"3C",X"3F",X"3F",X"3E",X"3E",X"3F",X"1E",X"1E",X"1C",X"08",X"00",X"00",
		X"00",X"00",X"00",X"02",X"0E",X"1E",X"1F",X"FF",X"FF",X"FF",X"1F",X"0F",X"0F",X"0E",X"04",X"00",
		X"00",X"00",X"00",X"02",X"0E",X"1E",X"1F",X"1F",X"1F",X"1F",X"1F",X"0F",X"0F",X"0E",X"04",X"00",
		X"00",X"03",X"07",X"06",X"07",X"02",X"00",X"02",X"00",X"00",X"0C",X"0F",X"07",X"03",X"17",X"3F",
		X"00",X"00",X"00",X"38",X"7C",X"7C",X"38",X"10",X"00",X"00",X"00",X"00",X"00",X"30",X"3E",X"07",
		X"00",X"00",X"00",X"00",X"80",X"80",X"C0",X"C0",X"60",X"E0",X"C0",X"C0",X"47",X"1F",X"09",X"3C",
		X"00",X"0C",X"00",X"03",X"10",X"09",X"01",X"00",X"01",X"09",X"10",X"03",X"00",X"0C",X"00",X"00",
		X"04",X"07",X"07",X"07",X"02",X"01",X"06",X"09",X"0F",X"06",X"00",X"00",X"12",X"12",X"10",X"00",
		X"00",X"01",X"03",X"07",X"05",X"03",X"0C",X"12",X"1E",X"0C",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"01",X"05",X"0B",X"1B",X"1F",X"3F",X"5F",X"3C",X"1D",X"09",X"02",X"04",X"00",X"00",
		X"00",X"00",X"5B",X"DF",X"C7",X"D7",X"FF",X"6B",X"52",X"58",X"18",X"08",X"C1",X"22",X"14",X"08",
		X"00",X"00",X"00",X"5A",X"DE",X"C7",X"D6",X"FE",X"6A",X"52",X"58",X"18",X"08",X"00",X"00",X"00",
		X"00",X"00",X"00",X"5A",X"DE",X"C6",X"D7",X"FF",X"6A",X"52",X"58",X"18",X"08",X"01",X"03",X"07",
		X"00",X"00",X"00",X"2C",X"6F",X"63",X"6B",X"7F",X"35",X"29",X"2C",X"0C",X"04",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"2D",X"6F",X"63",X"6B",X"7F",X"35",X"29",X"2C",X"0C",X"04",X"01",X"03",
		X"00",X"00",X"00",X"18",X"0C",X"0C",X"05",X"03",X"06",X"0F",X"1F",X"1B",X"01",X"01",X"00",X"00",
		X"00",X"0C",X"0E",X"07",X"07",X"03",X"03",X"01",X"01",X"01",X"00",X"00",X"00",X"01",X"03",X"00",
		X"00",X"00",X"00",X"10",X"30",X"30",X"18",X"00",X"0B",X"13",X"31",X"30",X"10",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"01",X"15",X"15",X"55",X"55",X"3D",X"15",X"01",X"00",X"00",X"00",X"00",
		X"03",X"07",X"02",X"07",X"04",X"46",X"E3",X"D2",X"42",X"07",X"07",X"07",X"07",X"03",X"02",X"00",
		X"03",X"06",X"02",X"20",X"5C",X"F7",X"D2",X"FA",X"FA",X"D2",X"F7",X"5C",X"A0",X"02",X"06",X"03",
		X"03",X"07",X"00",X"04",X"0F",X"1F",X"1F",X"0D",X"07",X"0D",X"1F",X"1F",X"0F",X"04",X"00",X"07",
		X"03",X"07",X"00",X"04",X"0F",X"1F",X"1F",X"0D",X"07",X"0D",X"1F",X"1F",X"0F",X"05",X"00",X"07",
		X"80",X"00",X"80",X"00",X"80",X"7A",X"BB",X"77",X"8F",X"77",X"BB",X"7A",X"80",X"00",X"80",X"00",
		X"AB",X"79",X"BA",X"76",X"B4",X"48",X"00",X"00",X"00",X"00",X"00",X"40",X"20",X"10",X"0F",X"00",
		X"00",X"00",X"01",X"06",X"08",X"10",X"20",X"00",X"00",X"00",X"48",X"B4",X"76",X"BA",X"79",X"AB",
		X"18",X"24",X"40",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"48",X"B4",X"76",X"BA",X"79",X"AB",
		X"00",X"01",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"0F",X"07",X"07",X"03",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"38",X"3C",X"7C",X"7C",X"FC",X"FD",X"FF",X"FC",X"78",X"20",X"00",
		X"06",X"00",X"08",X"1E",X"3F",X"3F",X"3F",X"3F",X"1F",X"1F",X"0F",X"06",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"03",X"07",X"07",X"07",X"03",X"01",X"01",
		X"00",X"00",X"00",X"00",X"C0",X"F8",X"FE",X"FF",X"FF",X"FF",X"FF",X"EE",X"FF",X"FC",X"F0",X"00",
		X"FF",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C1",X"C2",X"C4",X"C8",X"F0",X"70",X"3F",X"1F",
		X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",X"C0",
		X"1F",X"3F",X"70",X"F0",X"C9",X"D0",X"D1",X"C8",X"C4",X"C1",X"C0",X"C1",X"C0",X"C0",X"C0",X"FF",
		X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",
		X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",
		X"00",X"00",X"01",X"01",X"03",X"03",X"03",X"07",X"07",X"07",X"0F",X"0F",X"0F",X"0F",X"0C",X"08",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"20",X"10",X"08",X"00",X"00",X"00",X"00",X"04",X"18",X"00",X"00",X"00",X"00",X"02",X"00",X"00",
		X"68",X"50",X"60",X"50",X"C0",X"80",X"80",X"80",X"80",X"00",X"00",X"00",X"80",X"60",X"C8",X"F4",
		X"FE",X"FF",X"FF",X"F1",X"E0",X"C0",X"60",X"31",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"FC",X"FC",X"FE",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"7F",X"1F",X"0E",X"00",X"00",
		X"00",X"1C",X"3E",X"7F",X"FF",X"FF",X"FF",X"FE",X"FE",X"FE",X"FF",X"FF",X"FE",X"FE",X"FE",X"FE",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"10",X"08",X"04",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"02",X"00",
		X"00",X"04",X"00",X"02",X"00",X"48",X"7F",X"7F",X"7F",X"48",X"00",X"02",X"00",X"04",X"00",X"00",
		X"00",X"00",X"0C",X"0F",X"0F",X"07",X"03",X"00",X"00",X"05",X"14",X"10",X"11",X"01",X"03",X"01",
		X"00",X"00",X"0C",X"0F",X"0F",X"07",X"03",X"00",X"00",X"02",X"00",X"00",X"02",X"03",X"06",X"02",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"02",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"02",X"01",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"04",X"00",X"10",X"01",X"03",X"02",X"1F",X"02",X"03",X"41",X"00",X"00",X"04",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"01",X"02",X"03",X"02",X"09",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"03",X"44",X"08",X"11",X"23",X"26",X"27",X"27",X"26",X"23",X"11",X"08",X"04",X"03",X"08",
		X"00",X"10",X"00",X"00",X"01",X"03",X"06",X"07",X"07",X"06",X"03",X"01",X"00",X"10",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"07",X"0F",X"0F",X"0E",X"0F",X"0F",X"0F",X"0F",X"0E",X"0F",X"0F",X"0F",X"0E",X"0F",X"0F",X"07",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"5F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"FF",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"03",X"03",X"01",X"00",X"00",X"00",
		X"80",X"F7",X"F7",X"F4",X"F4",X"F7",X"F4",X"F4",X"F7",X"F4",X"F5",X"F4",X"F7",X"FF",X"F7",X"80",
		X"00",X"00",X"00",X"07",X"0F",X"0F",X"1C",X"1B",X"1B",X"1C",X"0F",X"0F",X"07",X"00",X"00",X"00",
		X"00",X"00",X"00",X"02",X"01",X"02",X"0A",X"08",X"05",X"00",X"05",X"05",X"02",X"00",X"01",X"00",
		X"00",X"00",X"00",X"00",X"0E",X"1F",X"3B",X"33",X"33",X"39",X"18",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"05",X"01",X"06",X"00",X"03",X"02",X"02",X"02",X"03",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"05",X"01",X"06",X"00",X"01",X"01",X"01",X"01",X"00",
		X"07",X"0F",X"18",X"30",X"20",X"47",X"1E",X"FE",X"FE",X"1E",X"47",X"20",X"30",X"18",X"0F",X"07",
		X"00",X"00",X"01",X"03",X"0F",X"1C",X"30",X"26",X"26",X"30",X"1C",X"0F",X"03",X"01",X"00",X"00",
		X"00",X"00",X"00",X"00",X"01",X"01",X"03",X"02",X"02",X"03",X"01",X"01",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"40",X"40",X"42",X"02",X"06",X"07",X"4F",X"4F",
		X"4F",X"4F",X"4F",X"4F",X"4F",X"FF",X"DF",X"4F",X"43",X"41",X"40",X"40",X"40",X"40",X"00",X"00",
		X"00",X"C0",X"C0",X"C1",X"83",X"83",X"81",X"80",X"80",X"80",X"80",X"80",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"30",X"30",X"30",X"30",X"34",X"34",X"36",X"36",X"37",X"37",X"36",X"37",X"37",
		X"37",X"37",X"37",X"6F",X"CF",X"9E",X"3F",X"7F",X"FC",X"F8",X"F0",X"E0",X"C0",X"80",X"80",X"80",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"80",X"80",X"80",X"80",X"80",X"C0",X"40",X"40",X"00",X"02",X"02",X"06",X"07",X"0F",X"0F",
		X"0F",X"0F",X"0F",X"0F",X"0F",X"9F",X"FF",X"0F",X"03",X"01",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"40",X"40",X"40",X"00",X"00",X"1F",X"1E",X"0E",X"04",X"04",X"00",X"00",X"00",
		X"40",X"80",X"89",X"01",X"10",X"18",X"4E",X"01",X"00",X"07",X"1C",X"38",X"31",X"00",X"88",X"80",
		X"01",X"00",X"00",X"00",X"00",X"04",X"00",X"00",X"00",X"00",X"00",X"00",X"22",X"10",X"00",X"00",
		X"00",X"00",X"3F",X"40",X"40",X"40",X"4C",X"53",X"53",X"4C",X"40",X"40",X"40",X"3F",X"00",X"00",
		X"00",X"00",X"03",X"04",X"08",X"10",X"10",X"10",X"10",X"10",X"10",X"08",X"04",X"03",X"00",X"00",
		X"00",X"00",X"00",X"00",X"01",X"02",X"04",X"04",X"04",X"04",X"02",X"01",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"01",X"02",X"02",X"01",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"10",X"00",X"00",X"00",X"00",X"00",X"60",X"00",X"00",X"00",X"00",X"00",X"10",X"00",
		X"18",X"0C",X"27",X"6F",X"7F",X"7D",X"5D",X"3D",X"0E",X"0E",X"0C",X"00",X"00",X"00",X"00",X"00",
		X"18",X"0E",X"27",X"6F",X"7E",X"7D",X"7D",X"5D",X"3D",X"0D",X"0E",X"0C",X"00",X"00",X"00",X"00",
		X"0C",X"0C",X"07",X"13",X"37",X"3F",X"3C",X"2C",X"1E",X"06",X"07",X"06",X"00",X"00",X"00",X"00",
		X"58",X"19",X"3B",X"36",X"1F",X"03",X"00",X"00",X"00",X"00",X"C0",X"00",X"A0",X"F0",X"E0",X"00",
		X"34",X"3C",X"3E",X"1B",X"01",X"07",X"06",X"00",X"00",X"00",X"60",X"00",X"A0",X"F0",X"00",X"00",
		X"67",X"3B",X"1B",X"35",X"07",X"1F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"66",X"3E",X"1A",X"35",X"07",X"1F",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"78",X"F0",X"F0",X"D0",X"80",X"00",X"00",X"00",X"00",X"20",X"70",X"78",X"7E",X"3E",X"1C",
		X"B5",X"E7",X"07",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"29",X"39",X"01",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"30",X"38",X"28",X"58",X"70",X"00",X"00",X"00",X"07",X"7C",X"F8",X"F8",X"D8",X"74",
		X"04",X"7C",X"58",X"78",X"0C",X"07",X"00",X"00",X"E0",X"B0",X"50",X"F0",X"60",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"00",X"02",X"03",X"03",X"07",X"03",X"00",
		X"3E",X"2C",X"3C",X"1D",X"0F",X"67",X"B0",X"D8",X"58",X"F0",X"20",X"00",X"00",X"00",X"00",X"00",
		X"2F",X"7C",X"7C",X"6C",X"75",X"6F",X"17",X"01",X"00",X"04",X"0E",X"0C",X"0C",X"00",X"00",X"00",
		X"5E",X"76",X"36",X"56",X"7E",X"3C",X"09",X"5F",X"C7",X"E0",X"40",X"80",X"80",X"80",X"80",X"00",
		X"00",X"00",X"00",X"01",X"03",X"07",X"07",X"0F",X"0F",X"0F",X"0F",X"07",X"00",X"00",X"00",X"00",
		X"01",X"03",X"03",X"07",X"01",X"00",X"00",X"00",X"00",X"00",X"07",X"0C",X"78",X"59",X"75",X"05",
		X"05",X"FD",X"D9",X"F8",X"FC",X"77",X"00",X"00",X"00",X"00",X"00",X"0E",X"0B",X"05",X"0F",X"06",
		X"00",X"00",X"30",X"38",X"28",X"58",X"70",X"00",X"00",X"00",X"07",X"7C",X"F8",X"F8",X"D8",X"74",
		X"07",X"08",X"08",X"08",X"07",X"00",X"07",X"08",X"08",X"08",X"07",X"00",X"00",X"0F",X"04",X"00",
		X"07",X"08",X"08",X"07",X"00",X"07",X"08",X"08",X"07",X"00",X"06",X"09",X"08",X"08",X"04",X"00",
		X"07",X"08",X"08",X"07",X"00",X"07",X"08",X"08",X"07",X"00",X"08",X"0D",X"0B",X"09",X"08",X"00",
		X"07",X"08",X"08",X"08",X"07",X"00",X"07",X"08",X"08",X"08",X"07",X"00",X"0F",X"04",X"02",X"01",
		X"07",X"08",X"08",X"07",X"00",X"07",X"08",X"08",X"07",X"00",X"06",X"09",X"09",X"09",X"06",X"00",
		X"07",X"08",X"07",X"00",X"07",X"08",X"07",X"00",X"06",X"09",X"08",X"04",X"00",X"0F",X"04",X"00",
		X"07",X"08",X"07",X"00",X"07",X"08",X"07",X"00",X"04",X"09",X"09",X"07",X"00",X"0F",X"04",X"00");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
