library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity multiplex is
  port(
    V1      	: in  std_logic_vector(7 downto 0);
	 V2      	: in  std_logic_vector(7 downto 0);
	 V3      	: in  std_logic_vector(7 downto 0);
	 V4      	: in  std_logic_vector(7 downto 0);
	 X1      	: in  std_logic_vector(7 downto 0);
	 X2      	: in  std_logic_vector(7 downto 0);
	 X3      	: in  std_logic_vector(7 downto 0);
	 X4      	: in  std_logic_vector(7 downto 0);
	 sel			: in  std_logic_vector(1 downto 0);
	 F_out1      : out  std_logic_vector(7 downto 0);
	 F_out2      : out  std_logic_vector(7 downto 0)
	 );
end multiplex;

architecture behavioral of multiplex is
begin	
  process (V1,V2) is
  begin
		if    (sel = "00") then
			F_out1 <= V1;
			F_out2 <= X1;
		elsif (sel = "01") then
			F_out1 <= V2;
			F_out2 <= X2;
		elsif (sel = "10") then
			F_out1 <= V3;
			F_out2 <= X3;
		elsif (sel = "11") then
			F_out1 <= V4;
			F_out2 <= X4;
		end if;
  end process;
end behavioral;