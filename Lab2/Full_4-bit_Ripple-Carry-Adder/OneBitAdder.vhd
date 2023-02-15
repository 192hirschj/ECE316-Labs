library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port(X,Y,Cin : in STD_LOGIC;
		Cout, Sum : out STD_LOGIC);
end FullAdder;

Architecture behav of FullAdder is
	
	begin
		process(X,Y,Cin) 
		begin --uses delays of 5ns
			Sum <= transport X xor Y xor Cin after 5 ns;
			Cout <= transport (X and Y) or ((X xor Y) and Cin) after 5 ns;
		end process;
end behav;
