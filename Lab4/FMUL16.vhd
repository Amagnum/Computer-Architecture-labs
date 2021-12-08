library ieee;
use ieee.std_logic_1164.all, ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity FMUL16 is 
port ( 
			F1,F2: in std_logic_vector(15 downto 0);
			F: out std_logic_vector(15 downto 0); 
			en : in std_logic);
end FMUL16;

architecture FMULB of FMUL16 is

begin
	process (F1,F2)
      variable F1m, F2m: std_logic_vector(10 downto 0);
		variable expo: std_logic_vector(4 downto 0);
		variable multRes: std_logic_vector(21 downto 0);
	begin	
		F1m(9 downto 0) :=  F1(9 downto 0);
		F2m(9 downto 0) :=  F2(9 downto 0);
		F1m(10) := '1';
		F2m(10) := '1';
		
		multRes := F1m * F2m;
		expo := F1(14 downto 10) + F2(14 downto 10) - "01111";
		F(15) <= F1(15) xor F2(15);
		
		if ( F1(14 downto 10) = "11111" or F2(14 downto 10) = "11111" ) then
			F(14 downto 10) <= "11111";
			F(9 downto 0) <= "0000000000";
		elsif( F1(14 downto 10) = "00000" or F2(14 downto 10) = "00000"  ) then
			F(14 downto 10) <= "00000";
			F(9 downto 0) <= "0000000000";
		elsif(multRes(21)='1') then 
			F(9 downto 0) <= multRes(20 downto 11);
			F(14 downto 10) <= expo + 1;
		else
			F(9 downto 0) <= multRes(19 downto 10);
			F(14 downto 10) <= expo;
		
		end if;
	end process;
end FMULB;

-- 0011010011001100 -  0.3
-- 0011001001100110 -  0.2
-- 1011111000000000 - -1.5
-- 0100010100000000 -  5

--  0.3 * 0.2 = 0010101110101100 = 0.6
-- -1.5 * 0.2 = 0.3
--    5 * 0.2 = 0011101111111111 = 0.99999999