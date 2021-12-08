library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


ENTITY pc IS PORT(
    d   : IN STD_LOGIC_VECTOR(31 DOWNTO 0); -- input
    ld  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
	 inc : IN STD_LOGIC; -- increment
    q   : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0) -- output
);
END pc;

ARCHITECTURE description OF pc IS

BEGIN
    process(clk, clr)
    begin
        if clr = '1' then
            q <= x"00000000";
        elsif rising_edge(clk) then
            if ld = '1' then
                q <= d;
            end if;
				if inc = '1' then 
					q <= q + 4;
				end if;
        end if;
    end process;
END description;