library ieee;
use ieee.std_logic_1164.all;

--uses Ripple Carry Logic for the Addition

entity Adder8 is
	port (A,B : in STD_LOGIC_VECTOR(7 downto 0);
		Cin : in STD_LOGIC;
		S : out STD_LOGIC_VECTOR(7 downto 0);
		Cout : out STD_LOGIC);
end Adder8;

Architecture struct of Adder8 is 
Component Adder4 --uses the one bit adder here and we will "call it" 4x
	port (A,B : in STD_LOGIC_VECTOR(3 downto 0);
		Cin : in STD_LOGIC;
		S : out STD_LOGIC_VECTOR(3 downto 0);
		Cout : out STD_LOGIC);
end component;

Signal C : STD_LOGIC;

begin
	B41: Adder4 port map(A(3 downto 0), B(3 downto 0), Cin, S(3 downto 0), C);
	B42: Adder4 port map(A(7 downto 4), B(7 downto 4), C, S(7 downto 4), Cout);
end struct;
