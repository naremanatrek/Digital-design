----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:55:09 07/31/2018 
-- Design Name: 
-- Module Name:    Logic_block - Behavioral 
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

entity Logic_block is
    Port ( x : in  STD_LOGIC_VECTOR(31 downto 0);
           y : in  STD_LOGIC_VECTOR(31 downto 0);
           k1 : in  STD_LOGIC_VECTOR(1 downto 0);
           z : out  STD_LOGIC_VECTOR(31 downto 0));
end Logic_block;

architecture Behavioral of Logic_block is

begin
process(k1,x,y)
begin
case k1 is
when "00" => z <= x and y;
when "01" => z <= x or y;
when "10" => z <= x xor y;
when "11" => z <= x nand y;
when others => z <= x ;
end case;
end process;
end Behavioral;

