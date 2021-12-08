library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_file32 is
  port(
    busA       : out std_logic_vector(31 downto 0);
    busB       : out std_logic_vector(31 downto 0);
    busW      : in  std_logic_vector(31 downto 0);
    wEN			: in  std_logic;
    RA			: in  std_logic_vector(4 downto 0);
    RB     		: in  std_logic_vector(4 downto 0);
    RW	  		: in  std_logic_vector(4 downto 0);
    clk        : in  std_logic
    );
end register_file32;


architecture behavioral of register_file32 is
  type registerFile is array(0 to 31) of std_logic_vector(31 downto 0);
  signal registers : registerFile;
begin
  regFile : process (clk) is
  begin
    if rising_edge(clk) then
      if wEN = '1' then
        registers(to_integer(unsigned(RW))) <= busW;
      end if;
      busA <= registers(to_integer(unsigned(RA)));
      busB <= registers(to_integer(unsigned(RB)));
    end if;
  end process;
end behavioral;