library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
 
entity alu4 is
	 Port ( a : in std_logic_vector(3 downto 0);
	 b : in std_logic_vector(3 downto 0);
	 op : in STD_LOGIC_VECTOR (2 downto 0);
	 en 			: in  std_logic;
	 alu_out : out std_logic_vector(3 downto 0));
end alu4;


architecture behavioral of alu4 is
   signal multRes   : std_logic_vector(7 downto 0);
begin
   process(a,b,op,en)
   begin
		if(en = '1') then
			case op is
				when "000" => alu_out <= a+b;
				when "001" => alu_out <= a-b;
				when "010" => multRes <= a*b; alu_out <= multRes(3 downto 0);
				when "011" => alu_out <= a and b;
				when "100" => alu_out <= a or b;
				when "101" => alu_out <= not a;
				when "110" => alu_out <= not b;
				when "111" => alu_out <= a xor b;
				when others => alu_out <= NULL;
			end case;
		else
			alu_out <= "0000";
		end if;
   end process;
end behavioral;
