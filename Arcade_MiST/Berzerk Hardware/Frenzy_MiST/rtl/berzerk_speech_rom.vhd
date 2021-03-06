library ieee;
use ieee.std_logic_1164.all,ieee.numeric_std.all;

entity berzerk_speech_rom is
port (
	clk  : in  std_logic;
	addr : in  std_logic_vector(11 downto 0);
	data : out std_logic_vector(7 downto 0)
);
end entity;

architecture prom of berzerk_speech_rom is
	type rom is array(0 to  4095) of std_logic_vector(7 downto 0);
	signal rom_data: rom := (
		X"03",X"A0",X"04",X"40",X"04",X"E0",X"05",X"E0",X"06",X"E0",X"07",X"80",X"08",X"40",X"08",X"C0",
		X"09",X"20",X"09",X"A0",X"0A",X"E0",X"0B",X"40",X"0B",X"80",X"0B",X"E0",X"0C",X"60",X"0C",X"A0",
		X"0D",X"80",X"0E",X"60",X"0F",X"80",X"10",X"80",X"10",X"C0",X"11",X"E0",X"12",X"C0",X"13",X"60",
		X"13",X"C0",X"14",X"C0",X"15",X"60",X"15",X"E0",X"16",X"00",X"17",X"1D",X"17",X"1D",X"1D",X"49",
		X"1D",X"6E",X"20",X"9F",X"22",X"1F",X"22",X"1F",X"17",X"1E",X"24",X"41",X"28",X"D9",X"29",X"59",
		X"29",X"78",X"2D",X"1F",X"2D",X"1F",X"2D",X"7F",X"2A",X"49",X"2A",X"78",X"22",X"9F",X"2D",X"1F",
		X"2D",X"1F",X"2F",X"1C",X"37",X"41",X"37",X"7C",X"2D",X"1F",X"3B",X"5B",X"2F",X"9C",X"22",X"1F",
		X"3C",X"51",X"3E",X"51",X"3E",X"6E",X"2D",X"9F",X"2F",X"1D",X"2F",X"1E",X"2F",X"1D",X"40",X"50",
		X"40",X"6E",X"2D",X"9F",X"22",X"1F",X"42",X"49",X"42",X"78",X"2D",X"9F",X"45",X"41",X"49",X"1C",
		X"49",X"9C",X"51",X"59",X"52",X"41",X"52",X"78",X"2D",X"9F",X"2D",X"1F",X"56",X"52",X"56",X"79",
		X"2D",X"1F",X"58",X"51",X"58",X"78",X"2D",X"1F",X"5A",X"51",X"5A",X"78",X"2D",X"9F",X"5C",X"1E",
		X"5C",X"1E",X"60",X"C1",X"64",X"41",X"68",X"D9",X"69",X"50",X"69",X"6E",X"2D",X"9F",X"5C",X"1E",
		X"5C",X"1E",X"6B",X"5A",X"6C",X"C1",X"70",X"41",X"74",X"D1",X"17",X"1D",X"17",X"1D",X"76",X"41",
		X"7A",X"41",X"7E",X"59",X"7E",X"7C",X"2D",X"9F",X"22",X"1F",X"22",X"1F",X"22",X"7E",X"7F",X"41",
		X"83",X"58",X"49",X"1D",X"49",X"9D",X"20",X"1F",X"17",X"1E",X"84",X"51",X"84",X"78",X"22",X"1F",
		X"22",X"7F",X"86",X"58",X"86",X"78",X"2D",X"9F",X"87",X"49",X"87",X"7C",X"2D",X"1F",X"2D",X"1F",
		X"2D",X"7E",X"8F",X"5B",X"8A",X"5A",X"8B",X"C1",X"96",X"51",X"98",X"D0",X"9A",X"58",X"49",X"1D",
		X"49",X"1D",X"49",X"7C",X"22",X"1F",X"17",X"1E",X"9B",X"49",X"9B",X"79",X"20",X"9F",X"2D",X"1F",
		X"9E",X"52",X"49",X"1D",X"49",X"1D",X"49",X"79",X"A0",X"41",X"A4",X"D9",X"A5",X"41",X"49",X"1D",
		X"49",X"1D",X"49",X"78",X"2D",X"9F",X"A9",X"49",X"A9",X"78",X"2D",X"9F",X"2D",X"1F",X"2D",X"1F",
		X"2F",X"1C",X"AC",X"58",X"AC",X"79",X"22",X"1F",X"22",X"7F",X"AD",X"C9",X"B0",X"1D",X"B0",X"1D",
		X"B6",X"49",X"B6",X"78",X"2D",X"9F",X"B9",X"41",X"B9",X"78",X"22",X"1F",X"17",X"9F",X"BD",X"C1",
		X"8F",X"41",X"8F",X"7C",X"20",X"1F",X"93",X"49",X"93",X"78",X"2D",X"9F",X"FF",X"FF",X"FF",X"FF",
		X"75",X"A3",X"28",X"C9",X"D7",X"59",X"D9",X"67",X"5D",X"69",X"75",X"D8",X"C7",X"97",X"5A",X"29",
		X"89",X"A5",X"A5",X"A6",X"26",X"97",X"5A",X"89",X"67",X"65",X"9D",X"96",X"69",X"89",X"A5",X"A2",
		X"67",X"5D",X"76",X"28",X"9E",X"22",X"98",X"CA",X"63",X"27",X"28",X"9A",X"65",X"A5",X"9A",X"66",
		X"63",X"28",X"9D",X"99",X"66",X"96",X"76",X"5A",X"27",X"59",X"D9",X"66",X"78",X"89",X"D6",X"75",
		X"96",X"98",X"9A",X"5D",X"8A",X"71",X"78",X"D8",X"CA",X"59",X"D9",X"69",X"98",X"99",X"D6",X"76",
		X"27",X"5D",X"8A",X"65",X"99",X"9D",X"6A",X"19",X"D8",X"D5",X"E6",X"5A",X"5D",X"69",X"75",X"99",
		X"67",X"62",X"77",X"1A",X"94",X"7A",X"98",X"7F",X"C0",X"FC",X"6D",X"0F",X"80",X"AE",X"61",X"AF",
		X"A8",X"26",X"2F",X"85",X"46",X"F0",X"3D",X"7F",X"1A",X"A7",X"85",X"D6",X"B4",X"64",X"3F",X"6F",
		X"67",X"66",X"62",X"A5",X"A5",X"26",X"2B",X"9F",X"A6",X"62",X"66",X"65",X"98",X"69",X"7A",X"9E",
		X"99",X"72",X"63",X"69",X"99",X"99",X"99",X"97",X"72",X"5A",X"66",X"59",X"99",X"98",X"A6",X"65",
		X"E2",X"97",X"66",X"5D",X"99",X"69",X"99",X"99",X"8A",X"66",X"59",X"99",X"9D",X"75",X"99",X"98",
		X"8D",X"72",X"66",X"76",X"27",X"5D",X"97",X"5C",X"9D",X"75",X"99",X"E2",X"62",X"73",X"65",X"A2",
		X"8A",X"27",X"29",X"89",X"9A",X"5D",X"66",X"6A",X"25",X"9D",X"99",X"62",X"79",X"99",X"66",X"99",
		X"98",X"A6",X"26",X"5D",X"67",X"86",X"B5",X"3F",X"D4",X"F4",X"2F",X"03",X"E5",X"67",X"B1",X"2F",
		X"99",X"79",X"A5",X"1F",X"42",X"A7",X"B5",X"3F",X"2A",X"8A",X"5A",X"96",X"42",X"F4",X"3C",X"EF",
		X"78",X"2D",X"6F",X"43",X"82",X"E0",X"2F",X"3F",X"1E",X"2B",X"57",X"82",X"E0",X"E4",X"2F",X"6F",
		X"2A",X"67",X"59",X"89",X"E1",X"95",X"6E",X"6B",X"9A",X"65",X"99",X"99",X"98",X"59",X"AA",X"9E",
		X"99",X"97",X"62",X"98",X"98",X"69",X"AA",X"9E",X"99",X"98",X"99",X"99",X"96",X"29",X"AA",X"9E",
		X"98",X"9E",X"59",X"8A",X"81",X"F8",X"78",X"2F",X"99",X"99",X"96",X"57",X"95",X"A9",X"E8",X"6E",
		X"66",X"6A",X"65",X"6A",X"94",X"5E",X"A1",X"7F",X"D0",X"B8",X"AD",X"0F",X"D0",X"69",X"A8",X"7F",
		X"D0",X"B8",X"6E",X"0B",X"C0",X"A7",X"94",X"BF",X"D1",X"D5",X"F5",X"2F",X"52",X"82",X"F4",X"3F",
		X"E0",X"5A",X"B4",X"2F",X"81",X"E0",X"BC",X"2F",X"A5",X"1F",X"D4",X"2F",X"81",X"C5",X"F8",X"3F",
		X"8A",X"63",X"66",X"87",X"63",X"5A",X"59",X"CA",X"5A",X"5A",X"29",X"69",X"8A",X"29",X"5E",X"29",
		X"68",X"A5",X"A5",X"A6",X"66",X"66",X"66",X"66",X"62",X"66",X"63",X"67",X"26",X"69",X"96",X"89",
		X"96",X"99",X"73",X"5A",X"63",X"5C",X"CC",X"CA",X"62",X"96",X"73",X"32",X"8C",X"D6",X"98",X"A6",
		X"29",X"8A",X"32",X"8C",X"A5",X"A5",X"CA",X"5C",X"A3",X"35",X"A2",X"8C",X"D6",X"76",X"27",X"5C",
		X"89",X"D6",X"75",X"A5",X"CC",X"A3",X"27",X"32",X"98",X"A6",X"28",X"CA",X"5A",X"35",X"9C",X"CD",
		X"73",X"35",X"A6",X"29",X"8A",X"65",X"CD",X"73",X"26",X"96",X"98",X"9D",X"89",X"D8",X"A3",X"27",
		X"8A",X"35",X"A5",X"A5",X"9C",X"D7",X"35",X"CD",X"69",X"67",X"62",X"97",X"32",X"97",X"5C",X"CA",
		X"33",X"5D",X"72",X"8C",X"9D",X"73",X"5A",X"35",X"A5",X"CC",X"D7",X"33",X"35",X"D6",X"8D",X"69",
		X"96",X"69",X"73",X"5C",X"D8",X"A5",X"CC",X"CC",X"A3",X"5A",X"33",X"32",X"8C",X"D8",X"9C",X"CD",
		X"73",X"59",X"D7",X"32",X"8C",X"CC",X"A5",X"9C",X"CA",X"33",X"33",X"28",X"CA",X"5C",X"D7",X"35",
		X"86",X"A9",X"57",X"98",X"56",X"7A",X"87",X"BE",X"A0",X"6E",X"8B",X"90",X"6A",X"62",X"71",X"BF",
		X"A0",X"3F",X"5B",X"90",X"6A",X"95",X"99",X"AF",X"61",X"AA",X"69",X"E0",X"2F",X"43",X"96",X"BE",
		X"88",X"9E",X"2B",X"80",X"A9",X"6A",X"81",X"FF",X"1F",X"55",X"AB",X"90",X"6A",X"5A",X"85",X"BF",
		X"2A",X"D4",X"7A",X"26",X"55",X"7B",X"80",X"FF",X"96",X"A5",X"95",X"79",X"D5",X"3F",X"80",X"BF",
		X"76",X"62",X"36",X"29",X"99",X"A9",X"66",X"3A",X"99",X"66",X"59",X"9D",X"99",X"A6",X"66",X"76",
		X"99",X"A1",X"A8",X"6A",X"47",X"D1",X"F5",X"2F",X"66",X"6A",X"95",X"6A",X"52",X"72",X"F4",X"3F",
		X"5A",X"95",X"E6",X"7A",X"02",X"F0",X"68",X"BF",X"98",X"D4",X"BC",X"6D",X"0B",X"C0",X"79",X"FF",
		X"D4",X"95",X"FD",X"5D",X"0F",X"C0",X"A8",X"BF",X"C1",X"F0",X"BC",X"1F",X"47",X"D0",X"79",X"BF",
		X"A1",X"69",X"9E",X"1A",X"86",X"D4",X"3D",X"6F",X"A1",X"9C",X"7A",X"57",X"56",X"E0",X"79",X"6F",
		X"C5",X"A7",X"80",X"FD",X"0B",X"92",X"F4",X"3F",X"99",X"96",X"66",X"29",X"5A",X"A5",X"A8",X"6F",
		X"98",X"A5",X"98",X"5E",X"67",X"A1",X"A9",X"7A",X"95",X"E1",X"78",X"67",X"99",X"E1",X"A9",X"9E",
		X"6A",X"1A",X"87",X"56",X"D1",X"F4",X"AD",X"1F",X"76",X"1E",X"1A",X"63",X"5A",X"95",X"F5",X"2F",
		X"C2",X"F4",X"2E",X"07",X"96",X"86",X"F4",X"3F",X"5B",X"81",X"FC",X"0F",X"47",X"93",X"F4",X"3F",
		X"86",X"96",X"B8",X"0F",X"C0",X"B8",X"7C",X"2F",X"C0",X"FD",X"65",X"3F",X"03",X"A0",X"F8",X"3F",
		X"96",X"B0",X"2F",X"02",X"E6",X"1A",X"E8",X"2F",X"D4",X"F4",X"2F",X"03",X"D5",X"D9",X"F8",X"2F",
		X"97",X"94",X"BC",X"0B",X"D0",X"F4",X"BC",X"2B",X"C4",X"F8",X"3D",X"0F",X"C0",X"B8",X"A8",X"3F",
		X"C4",X"BD",X"1A",X"17",X"D0",X"FC",X"3C",X"2F",X"A4",X"AD",X"1B",X"47",X"C1",X"F8",X"78",X"2F",
		X"89",X"D9",X"57",X"96",X"A0",X"F8",X"6D",X"2F",X"66",X"66",X"57",X"96",X"95",X"F8",X"69",X"3F",
		X"97",X"5A",X"5D",X"75",X"D8",X"D7",X"5C",X"A3",X"35",X"CA",X"33",X"28",X"CA",X"35",X"CA",X"33",
		X"5A",X"28",X"9C",X"A5",X"D6",X"97",X"32",X"8D",X"72",X"8A",X"35",X"D6",X"96",X"8A",X"28",X"A5",
		X"72",X"97",X"5C",X"A3",X"32",X"8C",X"A5",X"A2",X"8C",X"A3",X"28",X"A2",X"8D",X"73",X"35",X"CA",
		X"5A",X"29",X"75",X"A2",X"97",X"28",X"CD",X"73",X"28",X"A3",X"33",X"5D",X"75",X"A5",X"D7",X"5C",
		X"69",X"68",X"CC",X"A3",X"35",X"D6",X"96",X"8A",X"35",X"CA",X"27",X"28",X"D6",X"97",X"5C",X"CA",
		X"29",X"75",X"D7",X"33",X"5C",X"CA",X"28",X"CA",X"33",X"28",X"D7",X"5C",X"A5",X"D7",X"5D",X"73",
		X"8D",X"75",X"CA",X"32",X"8A",X"5D",X"75",X"D6",X"97",X"5A",X"29",X"73",X"28",X"A2",X"8A",X"5A",
		X"28",X"D7",X"33",X"5A",X"5D",X"75",X"D6",X"8A",X"5D",X"68",X"A2",X"8A",X"5D",X"73",X"35",X"D7",
		X"65",X"5F",X"9E",X"81",X"95",X"F4",X"6A",X"7E",X"95",X"AA",X"9A",X"50",X"F5",X"74",X"3F",X"7F",
		X"9A",X"9E",X"54",X"56",X"A9",X"A5",X"2B",X"7B",X"66",X"99",X"86",X"62",X"A8",X"A5",X"6A",X"AA",
		X"99",X"5E",X"57",X"56",X"A8",X"A9",X"2B",X"1F",X"75",X"F4",X"3F",X"0D",X"43",X"F4",X"79",X"7F",
		X"3A",X"1F",X"12",X"F0",X"0B",X"D7",X"90",X"FF",X"67",X"E0",X"3E",X"55",X"61",X"7F",X"80",X"BF",
		X"5F",X"85",X"66",X"89",X"91",X"EF",X"50",X"BF",X"99",X"99",X"98",X"67",X"95",X"6B",X"94",X"7F",
		X"A1",X"79",X"5A",X"5A",X"86",X"D4",X"F9",X"2B",X"69",X"5E",X"57",X"66",X"86",X"D4",X"BC",X"2B",
		X"69",X"5A",X"96",X"67",X"56",X"D4",X"BC",X"2B",X"69",X"5A",X"95",X"DA",X"56",X"D4",X"BC",X"2B",
		X"69",X"99",X"76",X"56",X"98",X"9A",X"A1",X"AF",X"D0",X"F8",X"7D",X"0B",X"C0",X"7A",X"E0",X"7F",
		X"C1",X"B5",X"B5",X"2F",X"40",X"B8",X"7D",X"2F",X"2B",X"12",X"F0",X"3F",X"05",X"DA",X"C4",X"BE",
		X"A5",X"96",X"66",X"1E",X"85",X"E9",X"A8",X"2F",X"E4",X"78",X"6C",X"0B",X"D0",X"BC",X"79",X"2F",
		X"D4",X"B8",X"3D",X"0B",X"C0",X"F8",X"A8",X"3F",X"B4",X"7D",X"0F",X"0A",X"C0",X"FC",X"79",X"2F",
		X"8C",X"CD",X"75",X"A3",X"5C",X"D7",X"28",X"CD",X"73",X"5C",X"CA",X"33",X"28",X"D7",X"28",X"CC",
		X"A3",X"32",X"8C",X"A3",X"33",X"28",X"CC",X"CD",X"73",X"35",X"CC",X"A3",X"33",X"28",X"C9",X"A3",
		X"8C",X"CD",X"73",X"5C",X"A3",X"35",X"CC",X"CA",X"27",X"5C",X"D7",X"32",X"75",X"A3",X"28",X"CC",
		X"CD",X"73",X"32",X"8A",X"26",X"8C",X"A3",X"5C",X"A3",X"5C",X"A5",X"CD",X"8D",X"73",X"28",X"D7",
		X"99",X"A2",X"76",X"16",X"57",X"A5",X"A9",X"AF",X"88",X"99",X"FD",X"46",X"07",X"E0",X"7E",X"6F",
		X"66",X"17",X"FC",X"18",X"47",X"E4",X"7D",X"7F",X"91",X"A7",X"BD",X"18",X"4E",X"D0",X"BC",X"6F",
		X"89",X"86",X"F9",X"1E",X"07",X"D0",X"A9",X"FF",X"85",X"D7",X"BC",X"28",X"0F",X"C0",X"B9",X"7F",
		X"86",X"57",X"F9",X"28",X"0F",X"D0",X"AC",X"7F",X"66",X"5A",X"AA",X"55",X"5A",X"94",X"5E",X"FE",
		X"A1",X"6D",X"4A",X"D0",X"F8",X"78",X"AD",X"1F",X"75",X"7D",X"0B",X"C0",X"F8",X"79",X"7D",X"1F",
		X"66",X"A4",X"7E",X"03",X"F0",X"3D",X"B8",X"2F",X"38",X"5B",X"A8",X"0B",X"D0",X"7E",X"78",X"3F",
		X"35",X"7E",X"07",X"97",X"C0",X"BA",X"A0",X"BF",X"38",X"69",X"69",X"8A",X"57",X"E0",X"BC",X"2B",
		X"75",X"69",X"69",X"8A",X"57",X"E0",X"BC",X"2B",X"75",X"69",X"69",X"8A",X"57",X"E0",X"BC",X"2B",
		X"66",X"29",X"69",X"8A",X"57",X"E0",X"BC",X"2B",X"65",X"AA",X"12",X"B9",X"81",X"F8",X"78",X"7F",
		X"6A",X"61",X"9D",X"85",X"E8",X"89",X"F5",X"2F",X"79",X"66",X"3A",X"07",X"D1",X"E2",X"B4",X"3F",
		X"A0",X"F8",X"3D",X"0F",X"C0",X"B8",X"A8",X"2F",X"A4",X"AD",X"1F",X"0A",X"C0",X"F8",X"A8",X"2F",
		X"76",X"29",X"5A",X"99",X"56",X"B5",X"68",X"7F",X"A1",X"AA",X"19",X"5A",X"94",X"AA",X"78",X"6F",
		X"B0",X"6A",X"79",X"0B",X"C0",X"BC",X"3D",X"2F",X"2B",X"51",X"FC",X"0B",X"C0",X"F4",X"B8",X"2F",
		X"2E",X"0E",X"D0",X"F4",X"7D",X"0F",X"E0",X"3F",X"C4",X"AF",X"02",X"F0",X"78",X"1F",X"D4",X"7F",
		X"56",X"F5",X"27",X"95",X"A4",X"2F",X"C0",X"BF",X"1F",X"95",X"67",X"67",X"80",X"7F",X"90",X"BF",
		X"3D",X"55",X"E7",X"66",X"50",X"BF",X"41",X"BF",X"77",X"26",X"66",X"66",X"21",X"EA",X"51",X"FE",
		X"66",X"66",X"66",X"59",X"99",X"9D",X"DE",X"76",X"65",X"D9",X"99",X"89",X"99",X"A6",X"A7",X"76",
		X"96",X"66",X"69",X"66",X"59",X"99",X"E9",X"DE",X"5E",X"66",X"75",X"5D",X"89",X"E1",X"7A",X"6F",
		X"2A",X"67",X"83",X"B8",X"03",X"F0",X"B8",X"3F",X"A8",X"1B",X"D4",X"3F",X"03",X"D2",X"F4",X"3F",
		X"3D",X"0F",X"C1",X"E1",X"E9",X"0B",X"F0",X"3F",X"A5",X"2F",X"47",X"55",X"F8",X"0F",X"E0",X"3F",
		X"92",X"B8",X"5A",X"95",X"A4",X"2F",X"D0",X"BF",X"67",X"95",X"9E",X"62",X"55",X"7B",X"80",X"FF",
		X"69",X"99",X"99",X"99",X"85",X"AD",X"55",X"EF",X"76",X"66",X"66",X"66",X"55",X"EA",X"15",X"BE",
		X"96",X"75",X"99",X"79",X"5A",X"C1",X"F8",X"2F",X"2E",X"03",X"F4",X"2E",X"1B",X"53",X"F0",X"3F",
		X"5B",X"81",X"A9",X"6D",X"0B",X"D2",X"B5",X"3F",X"8A",X"56",X"A5",X"5E",X"27",X"A1",X"7A",X"3B",
		X"66",X"61",X"E8",X"6A",X"57",X"D1",X"B8",X"2F",X"71",X"A6",X"29",X"8E",X"57",X"D4",X"B8",X"2F",
		X"B0",X"39",X"AE",X"06",X"1E",X"D5",X"76",X"7F",X"66",X"AC",X"0B",X"9A",X"02",X"F0",X"B8",X"3F",
		X"66",X"62",X"67",X"67",X"56",X"E1",X"A8",X"2F",X"65",X"99",X"9A",X"66",X"67",X"A1",X"78",X"6F",
		X"A5",X"1E",X"8B",X"D0",X"92",X"F8",X"35",X"BF",X"74",X"7E",X"2A",X"06",X"AA",X"60",X"2F",X"7F",
		X"1E",X"5F",X"0F",X"43",X"E1",X"E0",X"2F",X"7F",X"A0",X"7C",X"7F",X"03",X"82",X"F0",X"3E",X"3F",
		X"83",X"F0",X"F4",X"2F",X"02",X"B8",X"68",X"6F",X"8A",X"C0",X"FC",X"0B",X"57",X"C2",X"F4",X"3F",
		X"86",X"B4",X"2F",X"43",X"E0",X"B8",X"7C",X"2B",X"56",X"A5",X"7A",X"27",X"5A",X"A1",X"7A",X"1E",
		X"66",X"A9",X"55",X"99",X"A9",X"55",X"AA",X"EE",X"2A",X"9D",X"56",X"95",X"A9",X"46",X"B6",X"BE",
		X"27",X"7A",X"55",X"96",X"7D",X"41",X"F7",X"BE",X"61",X"7F",X"1A",X"81",X"AD",X"45",X"A6",X"BF",
		X"66",X"39",X"6B",X"A0",X"1D",X"5B",X"C0",X"FF",X"A5",X"6A",X"86",X"65",X"9D",X"1B",X"D0",X"BF",
		X"66",X"A1",X"79",X"59",X"9D",X"4F",X"E0",X"7F",X"66",X"95",X"9D",X"86",X"A6",X"5A",X"B4",X"6F",
		X"66",X"62",X"68",X"6A",X"5A",X"A1",X"B8",X"2F",X"62",X"6A",X"55",X"DD",X"8A",X"67",X"A5",X"3F",
		X"96",X"66",X"76",X"59",X"D9",X"95",X"67",X"AE",X"C1",X"E1",X"BD",X"49",X"D7",X"94",X"3E",X"7F",
		X"D4",X"78",X"7F",X"07",X"92",X"B0",X"2E",X"6F",X"D4",X"75",X"AF",X"07",X"85",X"F0",X"2E",X"6F",
		X"6A",X"62",X"75",X"66",X"66",X"62",X"B4",X"3F",X"D0",X"FC",X"65",X"2F",X"02",X"E0",X"F8",X"3F",
		X"96",X"76",X"27",X"56",X"A5",X"A1",X"B8",X"2F",X"86",X"E4",X"3F",X"03",X"E0",X"B5",X"7D",X"2B",
		X"79",X"61",X"AD",X"0B",X"D0",X"BC",X"3C",X"2F",X"66",X"5A",X"62",X"69",X"99",X"A9",X"98",X"6F",
		X"66",X"59",X"99",X"9A",X"5A",X"A5",X"A9",X"6A",X"65",X"99",X"99",X"9A",X"66",X"99",X"A9",X"6A",
		X"96",X"69",X"65",X"9D",X"98",X"9E",X"95",X"EE",X"86",X"B8",X"0B",X"86",X"A5",X"3B",X"C0",X"BF",
		X"7C",X"1B",X"43",X"F4",X"1F",X"C2",X"E0",X"AF",X"7A",X"07",X"99",X"95",X"6B",X"95",X"A5",X"AF",
		X"79",X"66",X"15",X"F8",X"0F",X"C7",X"D0",X"BF",X"96",X"66",X"75",X"6A",X"85",X"AA",X"94",X"7F",
		X"D4",X"AE",X"42",X"A5",X"B4",X"2F",X"C4",X"3F",X"86",X"E8",X"47",X"95",X"F4",X"2F",X"C0",X"BF",
		X"8A",X"E0",X"69",X"66",X"94",X"7F",X"80",X"BF",X"6A",X"95",X"5A",X"62",X"95",X"6F",X"90",X"BF",
		X"66",X"62",X"66",X"66",X"76",X"76",X"69",X"DD",X"66",X"59",X"99",X"99",X"DD",X"96",X"79",X"DD",
		X"89",X"9D",X"85",X"9D",X"D9",X"99",X"9D",X"EA",X"99",X"99",X"D9",X"55",X"A9",X"9A",X"22",X"AE",
		X"82",X"F5",X"F4",X"1E",X"0B",X"91",X"B9",X"6F",X"72",X"B8",X"2C",X"0F",X"57",X"84",X"7F",X"2F",
		X"A6",X"65",X"69",X"5A",X"86",X"71",X"7E",X"3B",X"98",X"99",X"67",X"27",X"65",X"A6",X"2E",X"6A",
		X"99",X"A6",X"1A",X"17",X"98",X"A5",X"6E",X"6B",X"95",X"6B",X"9E",X"03",X"D1",X"F0",X"3E",X"7F",
		X"A4",X"3E",X"2F",X"02",X"87",X"B4",X"2E",X"2F",X"A4",X"3D",X"6F",X"46",X"52",X"F4",X"3A",X"3F",
		X"D4",X"E0",X"BE",X"1E",X"02",X"F0",X"69",X"AF",X"66",X"98",X"7A",X"66",X"47",X"A5",X"65",X"BF",
		X"65",X"9D",X"66",X"5A",X"96",X"A5",X"B8",X"6B",X"65",X"A6",X"27",X"1A",X"86",X"E1",X"B8",X"2F",
		X"A4",X"7D",X"47",X"8E",X"82",X"F5",X"78",X"3F",X"95",X"A5",X"7F",X"0A",X"02",X"FC",X"0E",X"AF",
		X"95",X"86",X"F9",X"55",X"56",X"F0",X"3E",X"6F",X"17",X"A3",X"F4",X"19",X"6A",X"A0",X"7D",X"7F",
		X"6A",X"99",X"C5",X"89",X"96",X"90",X"FD",X"AF",X"A6",X"58",X"99",X"9C",X"85",X"99",X"EE",X"7E",
		X"99",X"99",X"99",X"66",X"85",X"A8",X"E8",X"6F",X"A2",X"67",X"62",X"1E",X"81",X"F5",X"78",X"6F",
		X"76",X"59",X"99",X"9A",X"1A",X"C1",X"F8",X"2F",X"C2",X"B4",X"79",X"69",X"4F",X"82",X"F4",X"2F",
		X"A1",X"E8",X"2E",X"0B",X"47",X"C2",X"F4",X"2F",X"C4",X"BC",X"0F",X"83",X"D1",X"F0",X"BC",X"1F",
		X"B4",X"3E",X"0A",X"D0",X"F5",X"78",X"7D",X"1F",X"A4",X"AD",X"2A",X"1E",X"4A",X"D0",X"F5",X"2F",
		X"96",X"75",X"6A",X"1A",X"95",X"E2",X"A8",X"2F",X"A4",X"AD",X"0F",X"82",X"D6",X"A0",X"F8",X"2F",
		X"78",X"2E",X"0E",X"8A",X"57",X"D0",X"FC",X"2B",X"75",X"6A",X"57",X"67",X"56",X"D4",X"F8",X"3B",
		X"6A",X"55",X"E8",X"6A",X"55",X"6B",X"84",X"AF",X"99",X"96",X"76",X"18",X"9D",X"9E",X"85",X"FE",
		X"9A",X"9D",X"56",X"11",X"FA",X"19",X"A9",X"7F",X"1F",X"87",X"D0",X"A8",X"6A",X"80",X"AE",X"AF",
		X"57",X"E5",X"B0",X"2D",X"67",X"90",X"7E",X"AF",X"69",X"95",X"FC",X"0E",X"0B",X"C0",X"E6",X"BF",
		X"1B",X"D1",X"E4",X"BC",X"03",X"F4",X"7C",X"3F",X"C6",X"92",X"F0",X"2F",X"02",X"E1",X"F0",X"7F",
		X"99",X"A1",X"79",X"59",X"9D",X"87",X"B5",X"3F",X"98",X"9D",X"5A",X"62",X"69",X"99",X"B8",X"2F",
		X"57",X"A5",X"66",X"2A",X"96",X"99",X"A7",X"66",X"59",X"D9",X"66",X"66",X"A6",X"66",X"77",X"66",
		X"26",X"A5",X"69",X"5A",X"A6",X"66",X"6A",X"66",X"27",X"6A",X"62",X"19",X"E6",X"61",X"6A",X"AB",
		X"79",X"0B",X"DA",X"90",X"E9",X"A4",X"2A",X"BF",X"75",X"5E",X"5B",X"D0",X"E1",X"F0",X"2A",X"BF",
		X"79",X"1E",X"1F",X"C1",X"C2",X"F0",X"2E",X"7F",X"27",X"99",X"8A",X"A1",X"86",X"A5",X"66",X"7F",
		X"66",X"62",X"66",X"69",X"87",X"D5",X"B8",X"2F",X"27",X"98",X"5E",X"D9",X"07",X"E1",X"E1",X"BF",
		X"5E",X"84",X"7F",X"8A",X"41",X"F5",X"68",X"AF",X"E4",X"61",X"7E",X"9D",X"07",X"E0",X"7A",X"3F",
		X"E1",X"18",X"BE",X"1A",X"06",X"E0",X"A8",X"AF",X"9A",X"80",X"BE",X"79",X"07",X"A1",X"69",X"AF",
		X"9A",X"59",X"98",X"96",X"76",X"56",X"F4",X"3F",X"79",X"4B",X"D0",X"F4",X"AD",X"0B",X"E0",X"3F",
		X"3E",X"12",X"B4",X"2E",X"0B",X"83",X"F4",X"3F",X"8A",X"82",X"F0",X"3F",X"03",X"B4",X"AC",X"2F",
		X"D0",X"BC",X"2D",X"4B",X"C0",X"B8",X"A8",X"3F",X"29",X"8D",X"67",X"99",X"8A",X"A0",X"B8",X"2F",
		X"2A",X"25",X"9A",X"98",X"67",X"A1",X"E9",X"2F",X"66",X"62",X"66",X"67",X"66",X"79",X"99",X"9E",
		X"98",X"A6",X"26",X"97",X"35",X"CD",X"89",X"D8",X"A2",X"8D",X"73",X"28",X"D7",X"35",X"A6",X"28",
		X"9C",X"D7",X"29",X"73",X"29",X"73",X"28",X"CD",X"8C",X"9D",X"68",X"A3",X"32",X"98",X"A3",X"5C",
		X"73",X"59",X"9D",X"8A",X"86",X"69",X"66",X"98",X"9D",X"8A",X"35",X"D7",X"63",X"28",X"CA",X"65",
		X"A3",X"62",X"75",X"A3",X"29",X"68",X"A5",X"D7",X"35",X"CA",X"32",X"8A",X"29",X"8A",X"65",X"CA",
		X"69",X"8C",X"9A",X"5C",X"A3",X"63",X"5A",X"5D",X"73",X"5C",X"D7",X"32",X"8A",X"35",X"9A",X"29",
		X"8A",X"35",X"C9",X"A3",X"32",X"8A",X"36",X"28",X"D7",X"32",X"8C",X"A3",X"5C",X"D7",X"35",X"D7",
		X"66",X"77",X"59",X"66",X"72",X"61",X"7A",X"AE",X"C1",X"A9",X"EA",X"43",X"E0",X"B0",X"3E",X"3F",
		X"C5",X"D4",X"BE",X"1C",X"46",X"F4",X"2E",X"2F",X"D0",X"F9",X"A4",X"3F",X"02",X"E4",X"B8",X"3F",
		X"C4",X"F8",X"2B",X"42",X"F0",X"A5",X"F5",X"2F",X"99",X"67",X"17",X"98",X"9D",X"D5",X"F5",X"2F",
		X"66",X"66",X"56",X"99",X"D9",X"A5",X"A7",X"7A",X"5D",X"97",X"56",X"99",X"E5",X"A6",X"69",X"DD",
		X"67",X"99",X"85",X"96",X"A6",X"68",X"7A",X"3B",X"89",X"8A",X"A2",X"85",X"E5",X"A4",X"7A",X"7F",
		X"98",X"5E",X"8E",X"C0",X"F4",X"B4",X"2E",X"7F",X"C0",X"FC",X"68",X"2F",X"03",X"E0",X"B8",X"3F",
		X"75",X"A9",X"3D",X"0F",X"57",X"83",X"F4",X"3F",X"A1",X"A5",X"B4",X"7D",X"1F",X"42",X"F4",X"2F",
		X"A8",X"2E",X"1A",X"0E",X"D0",X"7F",X"43",X"F0",X"9E",X"4A",X"E0",X"1F",X"81",X"F4",X"EC",X"2F",
		X"3F",X"06",X"A8",X"0B",X"82",X"A5",X"F8",X"2F",X"9D",X"D8",X"2E",X"07",X"93",X"C3",X"F4",X"3F",
		X"2E",X"47",X"D0",X"B8",X"2D",X"6D",X"1F",X"C2",X"2E",X"0A",X"D0",X"EC",X"2A",X"2B",X"0B",X"C3",
		X"99",X"D1",X"F4",X"6D",X"2D",X"3E",X"0B",X"D0",X"3D",X"0F",X"82",X"B0",X"B4",X"F0",X"F8",X"3D",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",
		X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF",X"FF");
begin
process(clk)
begin
	if rising_edge(clk) then
		data <= rom_data(to_integer(unsigned(addr)));
	end if;
end process;
end architecture;
