Library ieee;
use ieee.std_logic_1164.all;

Entity FullAdder is
port (X, Y, Cin : in STD_LOGIC;
      Cout, Sum : out STD_LOGIC);
End FullAdder;

Architecture behav of FullAdder is
begin
	Sum <= (X xor Y xor Cin);
	Cout <= ((X and Y) or ((X xor Y) and Cin));
End behav;
