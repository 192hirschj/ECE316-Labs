--This ALU is the top level

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;


entity Improved_ALU is
	port (Din : in STD_LOGIC_VECTOR(9 downto 0); -- Includes Opr (Sharing inputs)
		LoadX, LoadY, Clk : in STD_LOGIC;
		Dout0, Dout1 : out STD_LOGIC_VECTOR(6 downto 0);
		Overflow, Negative: out STD_LOGIC);
end Improved_ALU;

Architecture struct of Improved_ALU is
	component Register8 is
		Port(clk : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           load : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	

	component addopr is
	   port (A, B : in  STD_LOGIC_VECTOR(7 downto 0);
		Opr : in STD_LOGIC_VECTOR(2 downto 0);
		Dout : out STD_LOGIC_VECTOR(7 downto 0);
		Overflow, Negative: out STD_LOGIC);
	end component;

	component BCD is
	   port ( Din: in STD_LOGIC_VECTOR(7 downto 0);
		  D0out, D1out: out STD_LOGIC_VECTOR(3 downto 0);
	          overflow: out std_logic);
	end component;
	
	Component SevenSegmentDisp is --Active Low
	   port (A, B, C, D : in std_logic;
      		 Sa, Sb, Sc, Sd, Se, Sf, Sg : out std_logic);
	end component;

  Signal Rx : STD_LOGIC_VECTOR(7 downto 0);
  Signal Ry : STD_LOGIC_VECTOR(7 downto 0);
  Signal Sum : STD_LOGIC_VECTOR(7 downto 0);	
  Signal Bx : STD_LOGIC_VECTOR(3 downto 0);
  Signal By: STD_LOGIC_VECTOR(3 downto 0);
  Signal OvF: STD_LOGIC;

begin
  RegX: Register8 port map(Clk, Din(7 downto 0), LoadX, Rx);
  RegY: Register8 port map(Clk, Din(7 downto 0), LoadY, Ry);
  Adder: addopr port map(Rx, Ry, Din(9 downto 7), Sum, Overflow, Negative);
  B_C_D: BCD port map(Sum, Bx, By, OvF);
  disp7x: SevenSegmentDisp port map(Bx(3), Bx(2), Bx(1), Bx(0), Dout0(0), Dout0(1), Dout0(2), Dout0(3), Dout0(4), Dout0(5), Dout0(6));
  disp7y: SevenSegmentDisp port map(By(3), By(2), By(1), By(0), Dout1(0), Dout1(1), Dout1(2), Dout1(3), Dout1(4), Dout1(5), Dout1(6));
  
end struct;
