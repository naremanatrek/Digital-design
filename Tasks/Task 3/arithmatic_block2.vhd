----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:21:48 07/31/2018 
-- Design Name: 
-- Module Name:    arithmatic_block2 - Behavioral 
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

entity arithmatic_block2 is
    Port ( x : in  STD_LOGIC_VECTOR (31 downto 0);
           y : in  STD_LOGIC_VECTOR (31 downto 0);
           k3 : in  STD_LOGIC_VECTOR (2 downto 0);
			  cf : in STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (31 downto 0));
end arithmatic_block2;

architecture Behavioral of arithmatic_block2 is
component arithmatic_block
port(
           x : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           y : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           cf : in  STD_LOGIC; 
			  cout: out STD_LOGIC;
           z : out  STD_LOGIC_VECTOR(31 downto 0));
			  end component;
signal c : STD_LOGIC;
begin
process (x,y,k3,cf)
begin
case k3 is
when "000" => x1 : arithmatic_block port map (x,y,'0',c,z);
when "101" => x2 : arithmatic_block port map (x,y,cf,c,z);
when "110" => x3 : arithmatic_block port map (x,not y,'1',c,z);
when "111" => x4 : arithmatic_block port map (x,y,cf,c,z); -- i don't know how to make it;
when "001" => x5 : arithmatic_block port map (x,"0",'1',c,z);
when "011" => x6 : arithmatic_block port map (x,y,cf,c,z); -- i don't know the condition;
end case;
end process;

end Behavioral;

