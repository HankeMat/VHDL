----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:58:50 04/14/2023 
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
    Port ( mclk 		: in  STD_LOGIC;
           btn0 		: in  STD_LOGIC;
           btn1 		: in  STD_LOGIC;
           sw 			: in  STD_LOGIC_VECTOR (7 downto 0);
           Led 			: out  STD_LOGIC_VECTOR (7 downto 0));
end top;

architecture Behavioral of top is
	signal btnLoadDeb: STD_LOGIC := '0';
	signal btnDirDeb: STD_LOGIC := '0';
	signal ce: STD_LOGIC := '0';
begin
	LOAD: entity work.debouncer PORT MAP(
		    clk 				=> mclk,
        ce  				=> ce,
        btn_in      => btn1,
        btn_posedge => btnLoadDeb
	);
	DIR: entity work.debouncer PORT MAP(
		    clk 				=> mclk,
        ce  				=> ce,
        btn_in      => btn0,
        btn_posedge => btnDirdeb
	);
	P: entity work.puls PORT MAP(
				clk   			=> mclk,
				pulse 			=> ce
	);
	H: entity work.had PORT MAP(
				btnLoad 		=> btnLoadDeb,
				btnDir 			=> btnDirDeb,
				leds 				=> Led,
				swPattern 	=> sw, 
				ce 				 	=> ce,
				clk 				=> mclk
	);

end Behavioral;
