Library ieee;
use ieee.std_logic_1164.all;

Entity Half_Adder is
port (X, Y : in STD_LOGIC;
      Cout, Sum : out STD_LOGIC);
End Half_Adder;

Architecture struct of Half_Adder is
begin
	Sum <= (X xor Y);
	Cout <= (X and Y);

End struct;
