library ieee;
use ieee.std_logic_1164.all;

-- 8-bits 4-to-1 Mux
-- 2 select bits used

entity mux_4to1_8bit is
	port(sel: in std_logic_vector(1 downto 0);
		A: in std_logic_vector(7 downto 0);
		B: in std_logic_vector(7 downto 0);
		C: in std_logic_vector(7 downto 0);
		D: in std_logic_vector(7 downto 0);
		Outp: out std_logic_vector(7 downto 0));
end mux_4to1_8bit;

architecture behav of mux_4to1_8bit is
	begin
		Outp <= A when SEL = "00" else
			B when SEL = "01" else
			C when SEL = "10" else
			D when SEL = "11" else
			"ZZZZZZZZ";
end behav;
