library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity demux2_8 is
  port(
    V1      	: out  std_logic_vector(31 downto 0);
	 V2      	: out  std_logic_vector(31 downto 0);
	 V3      	: out  std_logic_vector(31 downto 0);
	 V4      	: out  std_logic_vector(31 downto 0);
	 X1      	: out  std_logic_vector(31 downto 0);
	 X2      	: out  std_logic_vector(31 downto 0);
	 X3      	: out  std_logic_vector(31 downto 0);
	 X4      	: out  std_logic_vector(31 downto 0);
	 sel			: in  std_logic_vector(2 downto 0);
	 F_in1      : in  std_logic_vector(31 downto 0);
	 F_in2      : in  std_logic_vector(31 downto 0)
	 );
end demux2_8;

architecture behavioral of demux2_8 is
signal multRes   : std_logic_vector(63 downto 0);
begin
  process (sel) is
  begin
		if    (sel = "00") then
			V1 <= F_in1;
			X1 <= F_in2;
		elsif (sel = "01") then
			V2 <= F_in1;
			X2 <= F_in2;
		elsif (sel = "10") then
			V3 <= F_in1;
			X3 <= F_in2;
		elsif (sel = "11") then
			V4 <= F_in1;
			X4 <= F_in2;
		end if;
  end process;
end behavioral;