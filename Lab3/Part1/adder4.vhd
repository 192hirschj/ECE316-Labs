library ieee;
use ieee.std_logic_1164.all;

--uses Ripple Carry Logic for the Addition

entity Adder4 is
	port (A,B : in STD_LOGIC_VECTOR(3 downto 0);
		Cin : in STD_LOGIC;
		S : out STD_LOGIC_VECTOR(3 downto 0);
		Cout : out STD_LOGIC);
end Adder4;

Architecture struct of Adder4 is 
Component FullAdder --uses the one bit adder here and we will "call it" 4x
	port(X,Y,Cin : in STD_LOGIC;
		Cout, Sum : out STD_LOGIC);
end component;

Signal C : STD_LOGIC_VECTOR(3 downto 1);

Begin --full adder is the name of the component for the 1 bit adder
	FA0: FullAdder port map(A(0), B(0), Cin, C(1), S(0)); 
	FA1: FullAdder port map(A(1), B(1), C(1), C(2), S(1));
	FA2: FullAdder port map(A(2), B(2), C(2), C(3), S(2));
	FA3: FullAdder port map(A(3), B(3), C(3), Cout, S(3));
end struct;
