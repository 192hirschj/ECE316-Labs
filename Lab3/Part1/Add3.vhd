--similar skeleton to one bit adder
--used for the BCD converter
library ieee;
use ieee.std_logic_1164.all;

entity Add3 is
	port ( x3, x2, x1, x0: in STD_LOGIC;
		p3, p2, p1, p0: out STD_LOGIC);
end Add3;

architecture behav of Add3 is
	begin
		process(x3, x2, x1, x0)
		begin --equations from our k-mapping using add3 truth table
			p3 <= (x3) or (x2 and x0) or (x2 and x1);
			p2 <= (x3 and x0) or (x2 and (not x1) and (not x0));
			p1 <= (x1 and x0) or (x3 and (not x0)) or ((not x2) and x1);
			p0 <= (x0 and (not x2) and (not x3)) or ((not x0) and x1 and x2) or ((not x0) and x3);
		end process;
end behav;
