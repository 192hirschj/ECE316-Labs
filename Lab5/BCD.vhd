library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity BCD is
	port ( Din: in STD_LOGIC_VECTOR(19 downto 0);
		D0out, D1out, D2out, D3out, D4out, D5out: out STD_LOGIC_VECTOR(3 downto 0);
		overflow: out std_logic);
end BCD;

Architecture struct of BCD is 
begin
Process(Din)
variable temp : STD_LOGIC_VECTOR(23 downto 0);
begin
--changes here from BCD code in lab three
temp := "000000000000000000000000";

  if(Din > 999999) then
  overflow <= '1';
  else 
  overflow <= '0';
  end if;
  
  for i in 19 downto 1 loop

   temp := temp(22 downto 0) & Din(i);

   if(unsigned(temp(3 downto 0)) > 4) then
    temp(3 downto 0) := std_logic_vector(unsigned(temp(3 downto 0)) + 3);
   end if;

   if(unsigned(temp(7 downto 4)) > 4) then
    temp(7 downto 4) := std_logic_vector(unsigned(temp(7 downto 4)) + 3);
   end if;

   if(unsigned(temp(11 downto 8)) > 4) then
    temp(11 downto 8) := std_logic_vector(unsigned(temp(11 downto 8)) + 3);
   end if;

   if(unsigned(temp(15 downto 12)) > 4) then
    temp(15 downto 12) := std_logic_vector(unsigned(temp(15 downto 12)) + 3);
   end if;

   if(unsigned(temp(19 downto 16)) > 4) then
    temp(19 downto 16) := std_logic_vector(unsigned(temp(19 downto 16)) + 3);
   end if;

   if(unsigned(temp(23 downto 20)) > 4) then
    temp(23 downto 20) := std_logic_vector(unsigned(temp(23 downto 20)) + 3);
   end if;

  end loop;

temp := temp(22 downto 0) & Din(0);

D0out <= temp(23 downto 20);
D1out <= temp(19 downto 16);
D2out <= temp(15 downto 12);
D3out <= temp(11 downto 8);
D4out <= temp(7 downto 4);
D5out <= temp(3 downto 0);
end process;

end struct;
