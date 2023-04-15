--------------------------------------------------------------------------------
-- Company: 	
-- Engineer:	  Hanke Matěj
--
-- Create Date:   16:36:41 04/10/2023
-- Design Name:   
-- Module Name:   C:/XilinxProjects/garage/garagetest.vhd
-- Project Name:  garage
-- Target Device: 
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: garage
-- 
-- Revision:
-- Revision 0.01 - File Created
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
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY garagetest IS
END garagetest;
 
ARCHITECTURE behavior OF garagetest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT garage
    PORT(
         btnIN 		: IN   std_logic;
	 btnOUT 	: IN   std_logic;
         btnReset 	: IN   std_logic;
 	 clk 		: IN   std_logic;
	 ce          	: IN   std_logic;
	 segment 	: OUT  std_logic_vector(6 downto 0);
         semaphore 	: OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal btnIN 	: std_logic := '0';
   signal btnOUT 	: std_logic := '0';
   signal btnReset 	: std_logic := '0';
   signal clk 		: std_logic := '0';
   signal ce         	: std_logic := '0';

   --Outputs
   signal segment 	: std_logic_vector(6 downto 0);
   signal semaphore 	: std_logic_vector(1 downto 0);

   -- Clock period definitions
   constant clk_period  : time := 10 ns;
 
BEGIN
 
   -- Instantiate the Unit Under Test (UUT)
   uut: garage PORT MAP (
          btnIN 	=> btnIN,
          btnOUT 	=> btnOUT,
          btnReset	=> btnReset,
          clk 		=> clk,
	  ce 		=> ce,
          segment 	=> segment,
          semaphore 	=> semaphore
        );

   -- Clock process definitions
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
      wait for 1 ns;	
		ce 	<= '1';
		btnIN 	<= '1';
		btnOUT 	<= '0';
      wait for clk_period;
		btnOUT 	<= '1';
		btnIN 	<= '0';
		wait for clk_period;
		btnIN 	<= '1';
		btnOUT 	<= '0';
		wait for clk_period*4;
		btnOUT 	<= '1';
		btnIN 	<= '0';
		wait for clk_period;
		btnIN 	<= '1';
		btnOUT 	<= '0';
      wait;
   end process;

END;
