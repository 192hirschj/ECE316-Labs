Library ieee;
Use ieee.STD_LOGIC_1164.all;
use ieee.std_logic_signed.all;


entity trafficLight is
port(
	clock : in std_logic;
	clr : in std_logic;
	LightNS_Traffic: out std_logic_vector(6 downto 0);
	LightEW_Traffic: out std_logic_vector(6 downto 0);
	LightNS_Ped: out std_logic_vector(6 downto 0);
	LightEW_Ped: out std_logic_vector(6 downto 0));
end trafficLight;


architecture behav of trafficLight is
component clockDiv
	port(
		clock:in std_logic;
         	clr:in std_logic;
        	afterDivisionClk:out std_logic);
end component;

component trafficController
	port(
		clock: in std_logic;
        	clr:in std_logic;
        	NSLight_Traffic:out std_logic_vector(6 downto 0);
  		EWLight_Traffic:out std_logic_vector(6 downto 0);
		NSLight_Ped:out std_logic_vector(6 downto 0);
		EWLight_Ped:out std_logic_vector(6 downto 0));
end component;

signal tiktok: std_logic;

begin
clockPM:clockDiv port map(clock,clr,tiktok);
trafficPM: trafficController port map(tiktok,clr,LightNS_Traffic,LightEW_Traffic, LightNS_Ped, LightEW_Ped);

end behav;
