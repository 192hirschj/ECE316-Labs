--this code design is meant for a two floor elevator using six states (s0 - s5)
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity elevator is
	port(n1: in std_logic;
		n2 : in std_logic;
		fs1 : in std_logic;
		fs2 : in std_logic;
		doorcl : in std_logic;
		clk : in std_logic;
		reset : in std_logic;
		floornum : out std_logic_vector(6 downto 0);
		mup : out std_logic;
		mdown : out std_logic;
		doorop : out std_logic;
		resetn1 : out std_logic;
		resetn2 : out std_logic);
end elevator;

architecture behav of elevator is
type state_type is (s0, s1, s2, s3, s4, s5);
signal current_state, next_state : state_type;
signal ns1, ns2 : std_logic;
begin
	Sreg: process(clk, reset) --push buttons on the DE1 Board are active low so reset will only work when set to zero
	begin
		if reset = '0' then
			current_state <= s0;
		elsif clk'event and clk = '1' then
			current_state <= next_state;
		end if; 
	end process;
	
	C1: process(current_state, n1, n2, fs1, fs2, doorcl)
	begin
		case current_state is
			when s0 =>
				if (n2 = '1' and doorcl = '0') then
					next_state <= s2;
					
				elsif (n2 = '0' and doorcl = '1') then
					next_state <= s1;
					
				else
					next_state <= s0;
					
				end if;
			when s1 =>
					next_state <= s0;
					
			when s2 =>
				if (fs2 = '1' and doorcl = '0') then
					next_state <= s4;
					
				else
					next_state <= s2;
					 
				end if;			
			when s3 =>
				if (n1 = '0' and doorcl = '1') then
					next_state <= s4;
					
				elsif (n1 = '1' and doorcl = '0') then
					next_state <= s5;
					
				else
					next_state <= s3;
					
				end if; 			
				when s4 =>
					next_state <= s3;
					
			when s5 =>
				if (fs1 = '1' and doorcl = '0') then
					next_state <= s1;
					
				else
					next_state <= s5;
					
				end if;
			when others =>
				null;
			end case;
		end process;
	C2: process(current_state) --my 7 seg display values are backwards so the floor numbers are upside down so alter this
	begin
		if current_state = s0 then 
			ns1 <= '1';
			ns2 <= '0';
			mup <= '0';
			mdown <= '0';
			doorop <= '0';
			floornum <= "1001111";
		elsif current_state = s1 then
			ns1 <= '1';
			ns2 <= '0';
			mup <= '0';
			mdown <= '0';
			doorop <= '1';
			floornum <= "1001111";
		elsif current_state = s2 then
			ns1 <= '0';
			ns2 <= '0';
			mup <= '1';
			mdown <= '0';
			doorop <= '0';
		elsif current_state = s3 then
			ns1 <= '0';
			ns2 <= '1';
			mup <= '0';
			mdown <= '0';
			doorop <= '0';
			floornum <= "0010010";
		elsif current_state = s4 then
			ns1 <= '0';
			ns2 <= '1';
			mup <= '0';
			mdown <= '0';
			doorop <= '1';
			floornum <= "0010010";
		elsif current_state = s5 then
			ns1 <= '0';
			ns2 <= '0';
			mup <= '0';
			mdown <= '1';
			doorop <= '0';
		end if;
	end process;	
	end behav;
