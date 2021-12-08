library ieee;
use ieee.std_logic_164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity alu32 is
port ( 
     a     		: in  std_logic_vector(31 downto 0);
     b     		: in  std_logic_vector(31 downto 0);
     alu_out   : in  std_logic_vector(31 downto 0);
	  en 			: in  std_logic;
     op    		: in  std_logic_vector(3  downto 0)
     -- alu_carry : out std_logic
);
end alu32;

architecture behavioral of alu32 is
   signal multRes   : std_logic_vector(63 downto 0);

begin
   process(a,b,op)
   begin
		if en = '1' then
			case op is
				when "000" => alu_out <= a+b;
				when "001" => alu_out <= a-b;
				when "010" => multRes <= a*b; alu_out <= multRes(31 downto 0);
				when "011" => alu_out <= a and b;
				when "100" => alu_out <= a or b;
				when "101" => alu_out <= not a;
				when "110" => alu_out <= not b;
				when "111" => alu_out <= a xor b;
				-- when others => enum_op <= op_nop;
			end case;
		else
			alu_out <= x"00000000";
		end if;
   end process;
end behavioral;