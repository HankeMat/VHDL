------------------------------------------------------
-- Company:             SPŠE Havírov
-- Engineer:            Matej Hanke
-- 
-- Create Date:         08:51:30 01/25/2023 
-- Module Name:         pulse - Behavioral 
-- Project Name:        Garage
-- Target Devices:      xc3s250e-5cp132
-- Tool versions:       Xilinx ISE
--
-- Description:         Makes button sensing cleaner
------------------------------------------------------

-- Adding libraries
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Entity outputs and inputs
entity pulse is
  generic (
      div_factor  : integer := 50000);
  port(
      clk   : in std_logic;
      pulse : out std_logic
  );
end pulse;

-- Varieble declaration
Architecture Behavioral of pulse is
    signal counter : integer := 0;
begin

process(clk)
  begin
    if(rising_edge(clk)) then        
        if counter = div_factor - 1 then
            pulse <= '1';
            counter <= 0;
        else
            counter <= counter + 1;
            pulse <= '0';
        end if;
    end if;
end process;
end Behavioral;
