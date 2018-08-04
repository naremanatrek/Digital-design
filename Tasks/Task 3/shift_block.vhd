----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:08:11 07/31/2018 
-- Design Name: 
-- Module Name:    shift_block - Behavioral 
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

entity shift_block is
    Port ( k2 : in  STD_LOGIC_VECTOR (2 downto 0);
           x : in  STD_LOGIC_VECTOR (31 downto 0);
           z : out  STD_LOGIC_VECTOR (31 downto 0));
end shift_block;

architecture Behavioral of shift_block is
signal cf : STD_LOGIC;
begin
process 
begin 
case k2 is
when "000" => z(31 downto 1) <= x(30 downto 0);
              z(0) <= '0';
when "001" => z(30 downto 0) <= x(31 downto 1);
              z(31) <= '0';
when "010" => z(31 downto 1) <= x(30 downto 0);
              z(0) <= '0';
              cf <= x(31);
when "011" => z(30 downto 0) <= x(31 downto 1);
              z(31) <= x(31);
              cf <= cf;	
when "100" => z(31 downto 1) <= x(30 downto 0);
              z(0) <= x(31);
when "101" => z(30 downto 0) <= x(31 downto 1);
              z(31) <= x(0);				  
when "110" => z(31 downto 1) <= x(30 downto 0);
              cf <= x(31);
				  z(0) <= cf;
when "111" => z(30 downto 0) <= x(31 downto 1);
              cf <= x(0);
				  z(31) <= cf;
				  end case;
end process;
end Behavioral;

