library ieee;
use ieee.std_logic_1164.all;

--overall top level

entity ALU is
	port (Din : in STD_LOGIC_VECTOR(7 downto 0);
		LoadX, LoadY, Clk : in STD_LOGIC;
		Opr : in STD_LOGIC_VECTOR(1 downto 0);
		Dout0, Dout1 : out STD_LOGIC_VECTOR(3 downto 0);
		Overflow: out STD_LOGIC);
end ALU;

--make an instance for all of the components (architecture for each)
Architecture struct of ALU is
	component Register8 is
		Port(Inp : in std_logic_vector(7 downto 0);
			Load, Clk : in std_logic;
			Outp: out std_logic_vector(7 downto 0));
	end component;
	
	component mux_4to1_8bit is
		port(sel: in std_logic_vector(1 downto 0);
			A: in std_logic_vector(7 downto 0);
			B: in std_logic_vector(7 downto 0);
			C: in std_logic_vector(7 downto 0);
			D: in std_logic_vector(7 downto 0);
			Outp: out std_logic_vector(7 downto 0));
	end component;

	component Adder8 is
		port (A,B : in STD_LOGIC_VECTOR(7 downto 0);
			Cin : in STD_LOGIC;
			S : out STD_LOGIC_VECTOR(7 downto 0);
			Cout : out STD_LOGIC);
	end component;

	component BCD is
		port ( Din: in STD_LOGIC_VECTOR(7 downto 0);
			D0out, D1out: out STD_LOGIC_VECTOR(3 downto 0);
			overflow: out std_logic);
	end component;

-- Port mapping
  Signal Rx : STD_LOGIC_VECTOR(7 downto 0);
  Signal Ry : STD_LOGIC_VECTOR(7 downto 0);
  Signal Mx : STD_LOGIC_VECTOR(7 downto 0);
  Signal Sum : STD_LOGIC_VECTOR(7 downto 0);
  Signal Cout : STD_LOGIC;

begin
  RegX: Register8 port map(Din, LoadX, Clk, Rx);
  RegY: Register8 port map(Din, LoadY, Clk, Ry);
  Mux: mux_4to1_8bit port map(Opr, "00000000", "00000001", "11111111", Ry, Mx);
  Adder: Adder8 port map(Rx, Mx, '0', Sum, Cout);
  B_C_D: BCD port map(Sum, Dout0, Dout1, Overflow);
  
end struct;
