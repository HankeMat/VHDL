----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:29:24 04/10/2023 
-- Design Name: 
-- Module Name:    top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( mclk : in   STD_LOGIC;
           btn0 : in   STD_LOGIC;
           btn1 : in   STD_LOGIC;
           btn2 : in   STD_LOGIC;
           leds : out  STD_LOGIC_VECTOR (1 downto 0);
           seg  : out  STD_LOGIC_VECTOR (6 downto 0);
	   an : out STD_LOGIC_VECTOR (3 downto 0));
end top;

architecture Behavioral of top is
	signal clken		: STD_LOGIC := '0';
	signal btnINdeb	: STD_LOGIC := '0';
	signal btnOUTdeb	: STD_LOGIC := '0';
	signal btnResetdeb: STD_LOGIC := '0';
begin

an <= "1110";

GAR: entity work.garage PORT MAP(
	btnIN		=> btnINdeb,
	btnOUT 		=> btnOUTdeb,
	btnReset 	=> btnResetdeb,
	clk		=> mclk,
	ce		=> clken,
	segment 	=> seg,
	semaphore 	=> leds
);

PULS: entity work.pulse PORT MAP(
	clk   		=> mclk,
	pulse 		=> clken
);

DEBIN: entity work.debouncer PORT MAP(
	clk 		=> mclk,
	ce  		=> clken,
	btn_in      	=> btn0,
	btn_posedge 	=> btnINdeb
);
DEBOUT: entity work.debouncer PORT MAP(
	clk 		=> mclk,
      	ce  		=> clken,
      	btn_in      	=> btn1,
      	btn_posedge 	=> btnOUTdeb
);
DEBRESET: entity work.debouncer PORT MAP(
	clk 		=> mclk,
      	ce  	 	=> clken,
      	btn_in      	=> btn2,
      	btn_posedge 	=> btnResetdeb
);

end Behavioral;

