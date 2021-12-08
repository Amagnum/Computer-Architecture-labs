library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity beq is
  port(
    RSV      	: in  std_logic_vector(31 downto 0);
	 RTV      	: in  std_logic_vector(31 downto 0);
	 IMM			: in  std_logic_vector(15 downto 0);
	 PC_in 		: in  std_logic_vector(31 downto 0);
    PC_out		: out  std_logic_vector(31 downto 0);
	 clk        : in  std_logic
    );
end beq;

architecture behavioral of beq is
begin
  process ( clk) is
  begin
     if (RSV = RTV) then
			PC_out <= PC_in + 4 + 4 * to_integer(signed(IMM));
      else
			PC_out <= PC_in + 4;    
		end if;
  end process;

end behavioral;