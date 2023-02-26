library ieee;
use ieee.std_logic_1164.all;

entity BCD is
	port ( Din: in STD_LOGIC_VECTOR(7 downto 0);
		D0out, D1out: out STD_LOGIC_VECTOR(3 downto 0);
		overflow: out std_logic);
end BCD;

Architecture struct of BCD is 
Component Add3 
	port ( x3, x2, x1, x0: in STD_LOGIC;
		p3, p2, p1, p0: out STD_LOGIC);
end component;

Signal B : STD_LOGIC;
Signal C : STD_LOGIC_VECTOR(2 downto 1);
Signal D : STD_LOGIC_VECTOR(3 downto 1);
Signal E : STD_LOGIC_VECTOR(4 downto 1);
Signal F : STD_LOGIC_VECTOR(5 downto 1);
Signal G : STD_LOGIC_VECTOR(5 downto 1);
Signal H : STD_LOGIC_VECTOR(4 downto 1);
Signal I : STD_LOGIC_VECTOR(2 downto 0);
Signal J : STD_LOGIC;

--port mapping will be calling Add3 seven times
begin
	A0: Add3 port map('0', Din(7), Din(6), Din(5), I(0), H(1), G(1), F(1)); --I(2)
	A1: Add3 port map(H(1), G(1), F(1), Din(4), H(2), G(2), F(2), E(1));
	A2: Add3 port map(G(2), F(2), E(1), Din(3), G(3), F(3), E(2), D(1));
	A3: Add3 port map('0', I(0), H(2), G(3), J, I(1), H(3), G(4));
	A4: Add3 port map(F(3), E(2), D(1), Din(2), F(4), E(3), D(2), C(1));
	A5: Add3 port map(I(1), H(3), G(4), F(4), overflow, D1out(3), D1out(2), D1out(1));
	A6: Add3 port map(E(3), D(2), C(1), Din(1), D1out(0), D0out(3), D0out(2), D0out(1));

D0out(0) <= Din(0);

end struct;

