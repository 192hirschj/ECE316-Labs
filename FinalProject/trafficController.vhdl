Library ieee;
Use ieee.STD_LOGIC_1164.all;
use IEEE.numeric_std.ALL;


entity trafficController is
    port(
        clock: in std_logic;
        clr:in std_logic;
        NSLight_Traffic:out std_logic_vector(6 downto 0);
  	EWLight_Traffic:out std_logic_vector(6 downto 0);
	NSLight_Ped:out std_logic_vector(6 downto 0);
	EWLight_Ped:out std_logic_vector(6 downto 0)
    );

end trafficController;


architecture behav of trafficController is
    signal count: integer:=0;
    signal state: integer:=0;
    begin
        c1:process(clock,clr)
        begin
            if(clr='0') then
                count<=0;
 		state<=0;
            elsif(clock'event and clock='1') then
		count <=count+1;
		if (state = 0) then
			if(count = 30)then
				state<= 1;
				count<= 0;

			else
				state<=0;
			end if;

		elsif (state = 1) then
			if(count = 6)then
			state<= 2;
			count<= 0;
			else
				state<=1;
			end if;

		elsif (state = 2) then
			if(count = 6)then
				state<= 3;
				count<= 0;
			else
				state<=2;
			end if;

		elsif (state = 3) then
			if(count = 30)then
				state<= 4;
				count<= 0;
			else
				state<=3;
			end if;

		elsif (state = 4) then
			if(count = 6)then
				state<= 5;
				count<= 0;
			else
				state<=4;
			end if;

		elsif (state = 5) then
			if(count = 6)then
				state<= 0;
				count<= 0;
			else
				state<=5;
			end if;
		end if;
	end if;
        end process;

        

        c2:process(state)
                begin
                    if(state=0) then
                        NSLight_Traffic<="1110111";
			EWLight_Traffic<="1111110";
			NSLight_Ped<="1111110";
			EWLight_Ped<="1110111";
                    elsif(state=1) then
                        NSLight_Traffic<="0111111";
			EWLight_Traffic<="1111110";
			NSLight_Ped<="1111110";
			EWLight_Ped<="1110111";
                    elsif(state=2) then
                        NSLight_Traffic<="1111110";
			EWLight_Traffic<="1111110";
			NSLight_Ped<="1111110";
			EWLight_Ped<="1111110";
                    elsif(state=3) then
                        NSLight_Traffic<="1111110";
			EWLight_Traffic<="1110111";
			NSLight_Ped<="1110111";
			EWLight_Ped<="1111110";
                    elsif(state=4) then
                        NSLight_Traffic<="1111110";
			EWLight_Traffic<="0111111";
			NSLight_Ped<="1110111";
			EWLight_Ped<="1111110";
                    elsif(state=5) then
                        NSLight_Traffic<="1111110";
			EWLight_Traffic<="1111110";
			NSLight_Ped<="1111110";
			EWLight_Ped<="1111110";
                end if;

        end process;

end behav;
