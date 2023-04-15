--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:47:14 04/14/2023
-- Design Name:   
-- Module Name:   /home/q30/4.B/had/had_tb.vhd
-- Project Name:  had
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: had
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY had_tb IS
END had_tb;
 
ARCHITECTURE behavior OF had_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT had
    PORT(
         btnLoad : IN  std_logic;
         btnDir : IN  std_logic;
         leds : OUT  std_logic_vector(7 downto 0);
         swPattern : IN  std_logic_vector(7 downto 0);
         ce : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal btnLoad : std_logic := '0';
   signal btnDir : std_logic := '0';
   signal swPattern : std_logic_vector(7 downto 0) := (others => '0');
   signal ce : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal leds : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: had PORT MAP (
          btnLoad => btnLoad,
          btnDir => btnDir,
          leds => leds,
          swPattern => swPattern,
          ce => ce,
          clk => clk
        );

   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 1 ns;	

      wait for clk_period*1;
			ce <= '1';
			wait for clk_period*1;
			swPattern <= "00011000";
			wait for clk_period*1;
			btnLoad <= '1';
			wait for clk_period*1;
			btnLoad <= '0';
			swPattern <= "10000001";
			wait for clk_period*10;
			btnDir <= '1';
			wait for clk_period*10;
      wait;
   end process;

END;
