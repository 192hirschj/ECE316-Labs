library ieee;
use ieee.std_logic_1164.all;

Entity MultArray4x4 is
port (A, B : in STD_LOGIC_VECTOR(3 downto 0);
      P : out STD_LOGIC_VECTOR(7 downto 0));
End MultArray4x4;

Architecture behav of MultArray4x4 is
Component FullAdder
    port (X, Y, Cin : in STD_LOGIC;
          Cout, Sum : out STD_LOGIC);
End component;

Component Half_Adder
    port (X, Y : in STD_LOGIC;
          Cout, Sum : out STD_LOGIC);
End component;

--used names from 4x4 Array-Multiplier Diagram for signals
--L for load
Signal L00 : STD_LOGIC;
Signal L01 : STD_LOGIC;
Signal L02 : STD_LOGIC;
Signal L03 : STD_LOGIC;
Signal L04 : STD_LOGIC;
Signal L05 : STD_LOGIC;
Signal L06 : STD_LOGIC;
Signal L10 : STD_LOGIC;
Signal L11 : STD_LOGIC;
Signal L12 : STD_LOGIC;
Signal L13 : STD_LOGIC;
Signal L20 : STD_LOGIC;
Signal L21 : STD_LOGIC;
Signal L22 : STD_LOGIC;
Signal L23 : STD_LOGIC;
Signal C10 : STD_LOGIC;	
Signal C11 : STD_LOGIC;	
Signal C12 : STD_LOGIC; 
Signal C13 : STD_LOGIC;
Signal S11 : STD_LOGIC;	
Signal S12 : STD_LOGIC;	
Signal S13 : STD_LOGIC;
Signal C20 : STD_LOGIC;	
Signal C21 : STD_LOGIC;	
Signal C22 : STD_LOGIC; 
Signal C23 : STD_LOGIC;
Signal S21 : STD_LOGIC;	
Signal S22 : STD_LOGIC;	
Signal S23 : STD_LOGIC;
Signal C30 : STD_LOGIC;	
Signal C31 : STD_LOGIC;	
Signal C32 : STD_LOGIC;
Begin

    P(0) <= A(0) and B(0);
    L00 <= A(1) and B(0);		
    L01 <= A(0) and B(1);
    L02 <= A(2) and B(0);	 	
    L03 <= A(1) and B(1);
    L04 <= A(3) and B(0);		
    L05 <= A(2) and B(1);
    L06 <= A(3) and B(1);
    HA0 : Half_Adder port map (L00, L01, C10, P(1));
    FA0 : FullAdder port map (L02, L03, C10, C11, S11);
    FA1 : FullAdder port map (L04, L05, C11, C12, S12);
    HA1 : Half_Adder port map (L06, C12, C13, S13);
    L10 <= A(0) and B(2);		
    L11 <= A(1) and B(2);
    L12 <= A(2) and B(2); 	
    L13 <= A(3) and B(2);
    HA2 : Half_Adder port map (S11, L10, C20, P(2));
    FA2 : FullAdder port map (S12, L11,C20, C21, S21);
    FA3 : FullAdder port map (S13, L12,C21, C22, S22);
    FA4 : FullAdder port map (C13, L13,C22, C23, S23);
    L20 <= A(0) and B(3);		
    L21 <= A(1) and B(3);
    L22 <= A(2) and B(3); 		
    L23 <= A(3) and B(3);
    HA3 : Half_Adder port map (S21,L20, C30, P(3));
    FA5 : FullAdder port map (S22, L21, C30, C31, P(4));
    FA6 : FullAdder port map (S23, L22, C31, C32, P(5));
    FA7 : FullAdder port map (C23, L23, C32, P(7), P(6));


end behav;
