----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:33:16 08/08/2018 
-- Design Name: 
-- Module Name:    line_follower_controller - Behavioral 
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

entity line_follower_controller is
    Port ( r : in  STD_LOGIC;
           l : in  STD_LOGIC;
           c : in  STD_LOGIC;
			  LINE_MODE : in STD_LOGIC;
           ENA : out  STD_LOGIC;
           IN1 : out  STD_LOGIC;
           IN2 : out  STD_LOGIC;
           IN3 : out  STD_LOGIC;
           IN4 : out  STD_LOGIC;
           ENB : out  STD_LOGIC);
end line_follower_controller;
architecture Behavioral of line_follower_controller is
begin
process (r,l,c)
variable last_state : integer;
begin
while (LINE_MODE <= '1') loop
if c <= '1' and l <= '0' and r <= '0' then --FORWARD
 ENA <= '1';
 IN1 <= '0';
 IN2 <= '1';
 IN3 <= '0';
 IN4 <= '1';
 ENB <= '1';
 last_state := 1;
 end if;
 if c <= '0' and l <= '0' and r <= '1' then --RIGHT
 ENA <= '1';
 IN1 <= '1';
 IN2 <= '0';
 IN3 <= '0';
 IN4 <= '1';
 ENB <= '1';
 last_state := 2;
 end if;
 if c <= '0' and l <= '1' and r <= '0' then --LEFT
 ENA <= '1';
 IN1 <= '0';
 IN2 <= '1';
 IN3 <= '1';
 IN4 <= '0';
 ENB <= '1';
 last_state := 3;
 end if;
 if c <= '1' and l <= '0' and r <= '1' then --RIGHT
 ENA <= '1';
 IN1 <= '1';
 IN2 <= '0';
 IN3 <= '0';
 IN4 <= '1';
 ENB <= '1';
 last_state := 2;
 end if;
 if c <= '1' and l <= '1' and r <= '0' then --LEFT
 ENA <= '1';
 IN1 <= '0';
 IN2 <= '1';
 IN3 <= '1';
 IN4 <= '0';
 ENB <= '1';
 last_state := 3;
 end if;
 if c <= '0' and l <= '0' and r <= '0' then --do inverse of last state
 if last_state = 1 then --backward
 ENA <= '1';
 IN1 <= '1';
 IN2 <= '0';
 IN3 <= '1';
 IN4 <= '0';
 ENB <= '1'; end if;
 if last_state = 2 then --left
 ENA <= '1';
 IN1 <= '0';
 IN2 <= '1';
 IN3 <= '1';
 IN4 <= '0';
 ENB <= '1'; end if;
 if last_state = 3 then --right
 ENA <= '1';
 IN1 <= '0';
 IN2 <= '1';
 IN3 <= '1';
 IN4 <= '0';
 ENB <= '1'; end if;
end if;
end loop;
end process;
end Behavioral;

