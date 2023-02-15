library ieee;
use ieee.std_logic_1164.all;

--code for an eight bits register
--loaded 1010 0101 to the register and then carried the data to the output port

	Entity Register8 is
		Port(Inp : in std_logic_vector(7 downto 0);
			Load, Clk : in std_logic;
			Outp: out std_logic_vector(7 downto 0));
	end Register8;
	
architecture behav of Register8 is
	Signal storage : std_logic_vector(7 downto 0);
		begin
			process(Inp, Load, Clk)
			begin
				if(Clk'event and Clk = '1' and Load = '1') then
					storage<=Inp;
				elsif(Clk'event and Clk = '0') then
					Outp <= storage;
				end if;
			end process;
		end;
