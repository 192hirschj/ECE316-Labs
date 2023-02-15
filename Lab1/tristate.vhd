library ieee;
use ieee.std_logic_1164.all;

--transfers from a 14-bit Tri-state buffer to a 16-bit Tri-state buffer

entity tristate_buffer16 is
	port(input: in std_logic_vector(13 downto 0);
		enable: in std_logic;
		output: out std_logic_vector(15 downto 0));
end tristate_buffer16;

architecture behav of tristate_buffer16 is begin
	process(input, enable) begin
		if(enable='1')then
			output <= "00" & input; --adds the two bits of 00 to the most significant two bits
		else
			output <= "ZZZZZZZZZZZZZZZZ";
		end if;
	end process;
end behav;
