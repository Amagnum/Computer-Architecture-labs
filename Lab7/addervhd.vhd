library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity addervhd is
  port(
    V1      	: in  std_logic_vector(7 downto 0);
	 V2      	: in  std_logic_vector(7 downto 0);
	 F_out      : out  std_logic_vector(7 downto 0)
	 );
end addervhd;

architecture behavioral of addervhd is
begin
  process (V1,V2) is
  begin
		F_out <= V1+V2;
  end process;
end behavioral;