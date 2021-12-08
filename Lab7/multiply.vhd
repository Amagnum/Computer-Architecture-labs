library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity multiply is
  port(
    V1      	: in  std_logic_vector(7 downto 0);
	 V2      	: in  std_logic_vector(7 downto 0);
	 F_out      : out  std_logic_vector(7 downto 0)
	 );
end multiply;

architecture behavioral of multiply is
signal multRes   : std_logic_vector(15 downto 0);
begin
  process (V1,V2) is
  begin
		multRes <= V1*V2; 
		F_out <= multRes(7 downto 0);
  end process;
end behavioral;