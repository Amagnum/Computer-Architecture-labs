
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity comb_decoder is
port (
        bcd : in std_logic_vector(3 downto 0);  --BCD input
        segment1_7 : out std_logic_vector(6 downto 0);  -- 7 bit decoded output.
		  segment2_7 : out std_logic_vector(6 downto 0)
    );
end comb_decoder;

--'a' corresponds to MSB of segment1_7 and g corresponds to LSB of segment1_7.
architecture Behavioral of comb_decoder is

begin
process (bcd)
BEGIN
	if( (bcd and "1000") = "0000") then
		segment2_7 <= "1111110"; -- '0'
		case  bcd is
		when "0000"=> segment1_7 <="1111110";  -- '0'
		when "0001"=> segment1_7 <="0110000";  -- '1'
		when "0010"=> segment1_7 <="1101101";  -- '2'
		when "0011"=> segment1_7 <="1111001";  -- '3'
		when "0100"=> segment1_7 <="0110011";  -- '4'
		when "0101"=> segment1_7 <="1011011";  -- '5'
		when "0110"=> segment1_7 <="0100000";  -- '6'
		when "0111"=> segment1_7 <="1110000";  -- '7'
		when "1000"=> segment1_7 <="1111111";  -- '8'
		when "1001"=> segment1_7 <="1111011";  -- '9'
		 --nothing is displayed when a number more than 9 is given as input.
		when others=> segment1_7 <="0000000";
		end case;
	else 
		segment2_7 <= "0110000"; -- '1'
		case  bcd is
		when "0000"=> segment1_7 <="1111110";  -- '0'
		when "0001"=> segment1_7 <="0110000";  -- '1'
		when "0010"=> segment1_7 <="1101101";  -- '2'
		when "0011"=> segment1_7 <="1111001";  -- '3'
		when "0100"=> segment1_7 <="0110011";  -- '4'
		when "0101"=> segment1_7 <="1011011";  -- '5'
		 --nothing is displayed when a number more than 9 is given as input.
		when others=> segment1_7 <="0000000";
		end case;
	end if;
end process;

end Behavioral;