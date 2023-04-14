----------------------------------------------------------------------------------
-- Company: SPSE Havirov
-- Engineer: Hanke Matej
-- 
-- Create Date:    16:05:06 04/10/2023 
-- Module Name:    garage - Behavioral 
-- Project Name: 	Garage
-- Target Devices: Spartan E250
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

entity garage is
    Port ( btnIN		: in   STD_LOGIC;
           btnOUT 	: in   STD_LOGIC;
           btnReset 	: in   STD_LOGIC;
			  clk			: in 	 STD_LOGIC;
			  ce			: in	 STD_LOGIC;
           segment 	: out  STD_LOGIC_VECTOR (6 downto 0);
           semaphore : out  STD_LOGIC_VECTOR (1 downto 0));
end garage;

architecture Behavioral of garage is
	--Use descriptive names for the states, like st1_reset, st2_search
   type state_type is (s0, s1, s2, s3, s4, s5); 
   signal state, next_state : state_type; 
   --Declare internal signals for all outputs of the state-machine

begin
	SYNC_PROC: process (clk)
   begin
      if (clk'event and clk = '1') then
         if (btnReset = '1') then
            state <= s0;
         elsif (ce = '1') then
            state <= next_state;
         -- assign other outputs to internal signals
         end if;        
      end if;
   end process;
 
   --MOORE State-Machine - Outputs based on state only
   OUTPUT_DECODE: process (state)
   begin
      --insert statements to decode internal output signals
      --below is simple example
		case (state) is 
			when s0 =>
				segment <= "1000000";
				semaphore <= "01";
			when s1 =>
				segment <= "1111001";
				semaphore <= "01";
			when s2 =>
				segment <= "0100100";
				semaphore <= "01";
			when s3 =>
				segment <= "0110000";
				semaphore <= "01";
			when s4 =>
				segment <= "0011001";
				semaphore <= "01";
			when s5 =>
				segment <= "0010010";
				semaphore <= "10";
		end case;
   end process;
 
   NEXT_STATE_DECODE: process (state, btnIN, btnOUT, btnReset)
   begin
      --declare default state for next_state to avoid latches
      next_state <= state;  --default is to stay in current state
      --insert statements to decode next_state
      --below is a simple example
      case (state) is
         when s0 =>
            if btnIN = '1' then
               next_state <= s1;
				elsif btnOUT = '1' then
					next_state <= s0;
            end if;
         when s1 =>
            if btnIN = '1' then
               next_state <= s2;
				elsif btnOUT = '1' then
					next_state <= s0;
            end if;
         when s2 =>
				if btnIN = '1' then
               next_state <= s3;
				elsif btnOUT = '1' then
					next_state <= s1;
            end if;
         when s3 =>
				if btnIN = '1' then
               next_state <= s4;
				elsif btnOUT = '1' then
					next_state <= s2;
            end if;
         when s4 =>
				if btnIN = '1' then
               next_state <= s5;
				elsif btnOUT = '1' then
					next_state <= s3;
            end if;
         when s5 =>
				if btnIN = '1' then
               next_state <= s5;
				elsif btnOUT = '1' then
					next_state <= s4;
            end if;				
      end case;      
   end process;
	
	
end Behavioral;

