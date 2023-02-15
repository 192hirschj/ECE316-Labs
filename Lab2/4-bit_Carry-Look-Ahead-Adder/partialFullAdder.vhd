library ieee;
use ieee.std_logic_1164.all;

entity partialFullAdder is
Port(A,B,Cin : in STD_LOGIC;
	S,P,G : out STD_LOGIC);
end partialFullAdder;

architecture behav of partialFullAdder is

begin
	S <= transport A xor B xor Cin after 5 ns; 
	P <= A or B;
	G <= A and B;
end behav;
