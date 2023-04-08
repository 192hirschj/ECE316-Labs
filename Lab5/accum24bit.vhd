library ieee;
use ieee.std_logic_1164.all;

entity Accum24bit is
    Port ( Load, Add, Shift, Done, Cin, CLK : in  STD_LOGIC;
	   A : in  STD_LOGIC_VECTOR (15 downto 0);
           Adder8_in : in  STD_LOGIC_VECTOR (7 downto 0);
           Adder8_out : out  STD_LOGIC_VECTOR (7 downto 0);
	   Multiplier : out  STD_LOGIC_VECTOR (3 downto 0);
	   data_out : out  STD_LOGIC_VECTOR (19 downto 0)
);
end Accum24bit;


architecture behav of Accum24bit is
 signal IRsignal : STD_LOGIC_VECTOR (23 downto 0) := "000000000000000000000000";
begin
  process(Load, Add, Shift ,A, CLK) 
  variable IR : STD_LOGIC_VECTOR (23 downto 0);
begin
if clk'event and clk = '1' then
   if (Load = '1' and Add = '0' and Shift = '0' and Done = '0') then 
    IRsignal <= "00000000"&A;
    IR := "00000000"&A;
    Multiplier <= IR(3 downto 0);
    Adder8_out <= IR(23 downto 16);

   elsif (Load = '0' and Add = '1' and Shift = '0' and Done = '0') then 
    IRsignal <= Adder8_in & IRsignal(15 downto 0);

   elsif (Load = '0' and Add = '0' and Shift = '1' and Done = '0') then 
   IR :=  "000" & Cin & IRsignal(23 downto 4);
   Multiplier <= IR(3 downto 0);
   Adder8_out <= IR(23 downto 16);
   IRsignal <= IR;
   
   else
    null;

   end if;

end if;

  end process;
data_out <= IRsignal(19 downto 0);

end behav;
