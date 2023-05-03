library ieee;

use IEEE.STD_LOGIC_1164.ALL;

use IEEE.numeric_std.ALL;

  

entity clockDiv is
port (clock, clr: in std_logic;
        afterDivisionClk: out std_logic);
end clockDiv;


architecture behav of clockDiv is

signal count: integer:=1;
signal tempSignal : std_logic := '0';


begin process(clock,clr)

begin
	if(clr='0') then
		count<=1;
		tempSignal<='0';
	elsif(clock'event and clock='1') then
		count <=count+1;
	if (count = 4166667) then
		tempSignal <= not tempSignal;
		count <= 1;
	end if;
	end if;

afterDivisionClk <= tempSignal;

end process;

end behav;
