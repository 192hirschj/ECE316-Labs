library ieee;
use ieee.std_logic_1164.all;

entity fsm is
	port( clk: in std_logic;
	      init: in std_logic;
	      Din: in std_logic;
	      Dout: out std_logic);
end fsm;

architecture behav of fsm is
type state_type is (s0, s1, s2, s3, s4);
signal next_state, present_state: state_type;
begin
	Sreg: process(clk, init)
	begin
		if init = '1' then
			present_state <= s0;
		elsif clk'event and clk='1' then
			present_state <= next_state;
		end if;
	end process;

	C1: process(present_state, Din)
	begin
		case present_state is
			when s0 =>
				if Din = '1' then
				next_state <= s1;
				else
				next_state <= s0;
				end if;
			when s1 =>
				if Din = '0' then
				next_state <= s2;
				else
				next_state <= s1;
				end if;
			when s2 =>
				if Din = '1' then
				next_state <= s3;
				else
				next_state <= s0;
				end if;
			when s3 =>
				if Din = '1' then
				next_state <= s4;
				else
				next_state <= s2;
				end if;
			when s4 =>
				if Din = '1' then
				next_state <= s1;
				else
				next_state <= s2;
				end if;
			when others =>
				null;
			end case;
	end process;
	
	C2: process(present_state)
	begin
		if present_state = s4 then
			Dout <= '1';
		else
			Dout <= '0';
		end if;
	end process;
	end behav;
