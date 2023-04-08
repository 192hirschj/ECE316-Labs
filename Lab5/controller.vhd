library ieee;
use ieee.std_logic_1164.all;

entity Controller is
port (Start, clk, Reset : in std_logic; 
      Load, Add, Shift4, Done : out std_logic);

end Controller;

Architecture struct of Controller is

type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, s10);

signal next_state, present_state : state_type;

begin

Accumulator: process(clk, Reset)
begin
	if Reset = '1' then
	 present_state <= s0;
	elsif clk'event and clk='0' then
	 present_state <= next_state;
	end if;
end process;

C1: process(present_state, Start)
begin
case present_state is

	when s0 =>
	 if (Start = '1') then
	  next_state <= s1;
	 else
	  next_state <= s0;
	 end if;

	when s1 =>
	 if (Start = '0') then
	  next_state <= s2;
	 else
	  next_state <= s1;
	 end if;

	when s2 =>
	  next_state <= s3;

	when s3 =>
	  next_state <= s4;

	when s4 =>
	  next_state <= s5;

	when s5 =>
	  next_state <= s6;

 	when s6 =>
	  next_state <= s7;

	when s7 =>
	  next_state <= s8;

	when s8 =>
	  next_state <= s9;

	when s9 =>
	  next_state <= s10;

	when s10 =>
	  if (Start = '0') then
	  next_state <= s0;
	 else
	  next_state <= s10;
	 end if;

	when others =>
	 null;
end case;
end process;

C2: process(present_state)
begin
if present_state = s0 then
Load <= '0'; Add <= '0'; Shift4 <= '0'; Done <= '0';

elsif present_state = s1 then
Load <= '1'; Add <= '0'; Shift4 <= '0'; Done <= '0';

elsif present_state = s2 then
Load <= '0'; Add <= '1'; Shift4 <= '0'; Done <= '0';

elsif present_state = s3 then
Load <= '0'; Add <= '0'; Shift4 <= '1'; Done <= '0';

elsif present_state = s4 then
Load <= '0'; Add <= '1'; Shift4 <= '0'; Done <= '0';

elsif present_state = s5 then
Load <= '0'; Add <= '0'; Shift4 <= '1'; Done <= '0';

elsif present_state = s6 then
Load <= '0'; Add <= '1'; Shift4 <= '0'; Done <= '0';

elsif present_state = s7 then
Load <= '0'; Add <= '0'; Shift4 <= '1'; Done <= '0';

elsif present_state = s8 then
Load <= '0'; Add <= '1'; Shift4 <= '0'; Done <= '0';

elsif present_state = s9 then
Load <= '0'; Add <= '0'; Shift4 <= '1'; Done <= '0';

elsif present_state = s10 then
Load <= '0'; Add <= '0'; Shift4 <= '0'; Done <= '1';


end if;
end process;
end struct;
