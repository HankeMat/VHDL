library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity had is
    Port ( btnLoad 		: in   STD_LOGIC;
           btnDir 		: in   STD_LOGIC;
           leds 			: out  STD_LOGIC_VECTOR (7 downto 0);
           swPattern 	: in   STD_LOGIC_VECTOR (7 downto 0);
					 ce 				: in   STD_LOGIC;
					 clk 				: in   STD_LOGIC
		);
end had;

architecture Behavioral of had is
	signal tempPattern : UNSIGNED(7 downto 0) := (others => '0');
	signal dirClick: integer := 0;
begin

process (clk, ce, btnLoad, btnDir, swPattern, dirClick)
begin
	
		if rising_edge (clk) then
			if ce = '1' then
				if btnLoad = '1' then
					tempPattern <= UNSIGNED(swPattern);
				else
		
					if btnDir = '1' then
							dirClick <= dirClick + 1;
					end if;
					
					if (dirClick mod 2) = 0 then 
							tempPattern <= tempPattern rol 1;
					else
							tempPattern <= tempPattern ror 1;
					end if;
				end if;
			end if;
		end if;
end process;

leds <= std_logic_vector(tempPattern);

end Behavioral;

