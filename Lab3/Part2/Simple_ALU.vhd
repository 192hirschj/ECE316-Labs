--Simple ALU is in charge of the different arithmetic operations
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;

entity addopr is
	port (A, B : in  STD_LOGIC_VECTOR(7 downto 0);
		Opr : in STD_LOGIC_VECTOR(2 downto 0);
		Dout : out STD_LOGIC_VECTOR(7 downto 0);
		Overflow, Negative: out STD_LOGIC);
end addopr;

Architecture struct of addopr is
begin
Process(Opr, A, B)
variable temp :  STD_LOGIC_VECTOR(7 downto 0);
 begin

  temp := "00000000";

   if (Opr = "000") then
    temp := A + 0;

   elsif (Opr = "001") then
    temp := A + 1;

   elsif (Opr = "010") then
    temp := A - 1;

   elsif (Opr = "011") then
    temp := -A;

   elsif (Opr = "100") then
    temp := -B;

   elsif (Opr = "101") then
    temp := A + B;

   elsif (Opr = "110") then
    temp := A - B;

   elsif (Opr = "111") then
    temp := B - A;

   end if;

   if(temp > 99 or temp < (-99)) then
    Overflow <= '1';
    else Overflow <= '0';
   end if;

  if(temp < 0) then
    Negative <= '0';
    temp := STD_LOGIC_VECTOR(0-signed(temp)); 
    else Negative <= '1';
  end if;

  Dout <= temp;
 
end Process;  

end struct;
