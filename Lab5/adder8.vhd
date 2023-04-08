library ieee;
use ieee.std_logic_1164.all;

entity Adder8 is
	port (A,B : in std_logic_vector(7 downto 0);
		Cin : in std_logic;
		S : out std_logic_vector(7 downto 0);
		Cout : out std_logic);
end Adder8;

Architecture struct of Adder8 is 
Component Adder4
	port (A,B : in std_logic_vector(3 downto 0);
		Cin : in std_logic;
		S : out std_logic_vector(3 downto 0);
		Cout : out std_logic);
end component;

Signal C : STD_LOGIC;

begin
	B41: Adder4 port map(A(3 downto 0), B(3 downto 0), Cin, S(3 downto 0), C);
	B42: Adder4 port map(A(7 downto 4), B(7 downto 4), C, S(7 downto 4), Cout);
end struct;
