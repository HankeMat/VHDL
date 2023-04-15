------------------------------------------------------
-- Company:             SPŠE Havírov
-- Engineer:            Matej Hanke
-- 
-- Create Date:         08:51:30 01/25/2023 
-- Module Name:         debouncer - Behavioral 
-- Project Name:        Snake
-- Target Devices:      xc3s250e-5cp132
-- Tool versions:       Xilinx ISE
--
-- Description:         Makes button sensing cleaner
------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-------------------------------------------------------------------------------

entity debouncer is
    port (
        clk : in std_logic;
        ce  : in std_logic;
        btn_in      : in  std_logic;
        btn_posedge : out std_logic
        );

end entity debouncer;

architecture str of debouncer is

    signal debounce_reg : std_logic_vector(15 downto 0);

begin

    deb_proc : process (clk) is
    begin  
        if rising_edge(clk) then

                -- make sure pulse is 1clk wide
                --btn_posedge <= '0';

                if ce = '1' then
                    debounce_reg <= debounce_reg(debounce_reg'high -1 downto 0) & btn_in;
						  
						  if debounce_reg = X"00FF" then
								btn_posedge <= '1';
								
						  else btn_posedge <= '0';
						  end if;

            end if;
        end if;
    end process deb_proc;

end architecture str;

