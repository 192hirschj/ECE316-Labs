library ieee;
use ieee.std_logic_1164.all;
--top level code
entity Multiplier is
 port (Din : in STD_LOGIC_VECTOR(7 downto 0);
       Start, LoadA_LSB, LoadA_MSB, LoadB, clk, reset : in std_logic;
       done : out STD_LOGIC;
       result1, result2, result3, result4, result5, result6 : out std_logic_vector(6 downto 0);
       overflow : out STD_LOGIC);
end Multiplier;

Architecture struct of Multiplier is
Component controller
 port (Start, clk, Reset : in std_logic; 
       Load, Add, Shift4, Done : out std_logic);
end component;

Component Accum24bit
 Port ( Load, Add, Shift, Done, Cin, CLK : in  STD_LOGIC;
        A : in  STD_LOGIC_VECTOR (15 downto 0);
        Adder8_in : in  STD_LOGIC_VECTOR (7 downto 0);
        Adder8_out : out  STD_LOGIC_VECTOR (7 downto 0);
        Multiplier : out  STD_LOGIC_VECTOR (3 downto 0);
        data_out : out  STD_LOGIC_VECTOR (19 downto 0));
end component;

Component Adder8
 port (A,B : in STD_LOGIC_VECTOR(7 downto 0);
       Cin : in STD_LOGIC;
       S : out STD_LOGIC_VECTOR(7 downto 0);
       Cout : out STD_LOGIC);
end component;

Component SevenSegmentDisp
 port (A, B, C, D : in std_logic;
       Sa, Sb, Sc, Sd, Se, Sf, Sg : out std_logic);
end component;

component BCD
 port ( Din: in STD_LOGIC_VECTOR(19 downto 0);
        D0out, D1out, D2out, D3out, D4out, D5out: out STD_LOGIC_VECTOR(3 downto 0);
        overflow: out std_logic);
end component;

component MultArray4x4
 port (A, B : in STD_LOGIC_VECTOR(3 downto 0);
       P : out STD_LOGIC_VECTOR(7 downto 0));
end component;


--signals:
signal load : STD_LOGIC;
signal add : STD_LOGIC;
signal shift4 : STD_LOGIC;
signal Acc3to0 : STD_LOGIC_VECTOR(3 downto 0);
signal A : STD_LOGIC_VECTOR(15 downto 0);
signal B : STD_LOGIC_VECTOR(3 downto 0);
signal Mult4x4 : STD_LOGIC_VECTOR(7 downto 0);
signal AccToAdder : STD_LOGIC_VECTOR(7 downto 0);
signal AdderToAcc : STD_LOGIC_VECTOR(7 downto 0);
signal Adder_Cout : STD_LOGIC;
signal Acc_Output : STD_LOGIC_VECTOR(19 downto 0);
signal To_7_Seg1 : STD_LOGIC_VECTOR(3 downto 0);
signal To_7_Seg2 : STD_LOGIC_VECTOR(3 downto 0);
signal To_7_Seg3 : STD_LOGIC_VECTOR(3 downto 0);
signal To_7_Seg4 : STD_LOGIC_VECTOR(3 downto 0);
signal To_7_Seg5 : STD_LOGIC_VECTOR(3 downto 0);
signal To_7_Seg6 : STD_LOGIC_VECTOR(3 downto 0);
signal ctrl_done : STD_LOGIC;
       
begin 

process(clk, Din) 
begin

 if LoadA_LSB = '0' then
  A(7 downto 0) <= Din;
 end if;
 
 if LoadA_MSB = '0' then
  A(15 downto 8) <= Din;
 end if;

 if LoadB = '0' then
  B <= Din(3 downto 0);
 end if;

 if ctrl_done = '1' then
  done <= '1';
 else 
  done <= '0';
 end if;

end process;

--port mapping:

Accum24PortMap: Accum24bit port map(load, add, shift4, ctrl_done, Adder_Cout, clk, A, AdderToAcc, AccToAdder, Acc3to0, Acc_Output);
ContrPortMap: controller port map(Start, clk, reset, load, add, shift4, ctrl_done);
ArrayMultPortMap: MultArray4x4 port map(B, Acc3to0, Mult4x4);
Adder: Adder8 port map (Mult4x4, AccToAdder, '0', AdderToAcc, Adder_Cout);
BCDPortMap: BCD port map(Acc_Output, To_7_Seg6, To_7_Seg5, To_7_Seg4, To_7_Seg3, To_7_Seg2, To_7_Seg1, overflow);
SevenSeg6: SevenSegmentDisp port map (To_7_Seg6(3), To_7_Seg6(2), To_7_Seg6(1), To_7_Seg6(0), result6(0), result6(1), result6(2), result6(3), result6(4), result6(5), result6(6));
SevenSeg5: SevenSegmentDisp port map (To_7_Seg5(3), To_7_Seg5(2), To_7_Seg5(1), To_7_Seg5(0), result5(0), result5(1), result5(2), result5(3), result5(4), result5(5), result5(6));
SevenSeg4: SevenSegmentDisp port map (To_7_Seg4(3), To_7_Seg4(2), To_7_Seg4(1), To_7_Seg4(0), result4(0), result4(1), result4(2), result4(3), result4(4), result4(5), result4(6));
SevenSeg3: SevenSegmentDisp port map (To_7_Seg3(3), To_7_Seg3(2), To_7_Seg3(1), To_7_Seg3(0), result3(0), result3(1), result3(2), result3(3), result3(4), result3(5), result3(6));
SevenSeg2: SevenSegmentDisp port map (To_7_Seg2(3), To_7_Seg2(2), To_7_Seg2(1), To_7_Seg2(0), result2(0), result2(1), result2(2), result2(3), result2(4), result2(5), result2(6));
SevenSeg1: SevenSegmentDisp port map (To_7_Seg1(3), To_7_Seg1(2), To_7_Seg1(1), To_7_Seg1(0), result1(0), result1(1), result1(2), result1(3), result1(4), result1(5), result1(6));

end struct;
