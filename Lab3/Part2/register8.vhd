library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register8 is
    Port ( clk : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           load : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (7 downto 0));
end Register8;


architecture Behavioral of Register8 is
  signal internal_register : STD_LOGIC_VECTOR (7 downto 0);
begin
  process (clk, load)
    begin
      if (clk'event and clk = '0') then
        if (load = '0') then
          internal_register <= data_in;
        end if;
      end if;
    if (clk'event and clk = '1') then
      data_out <= internal_register;
    end if;
  end process;
end Behavioral;
