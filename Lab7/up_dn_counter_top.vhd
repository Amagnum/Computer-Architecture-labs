library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity up_dn_counter_top is
    Port ( 
			CLK : in  STD_LOGIC;     -- input clock
         cout : out  STD_LOGIC_VECTOR (1 downto 0)
         );
end up_dn_counter_top;

architecture Behavioral of up_dn_counter_top is
    signal count   : STD_LOGIC_VECTOR (1 downto 0) := "00";
begin
    process (CLK)
    begin
        if (rising_edge(CLK)) then
				count <= count + '1';
            cout <= count;
        end if;
    end process;
end Behavioral;