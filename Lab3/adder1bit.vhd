library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port(X,Y,Cin : in STD_LOGIC;
		Cout, Sum : out STD_LOGIC);
end FullAdder;

Architecture behav of FullAdder is
	
	begin
		process(X,Y,Cin) 
		begin
			Sum <= X xor Y xor Cin;
			Cout <=(X and Y) or ((X xor Y) and Cin);
		end process;
end behav;
