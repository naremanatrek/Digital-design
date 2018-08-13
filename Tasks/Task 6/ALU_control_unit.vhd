----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:57:01 08/08/2018 
-- Design Name: 
-- Module Name:    ALU_control_unit - Behavioral 
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

entity ALU_control_unit is
    Port ( ALUop : in  STD_LOGIC_VECTOR (2 downto 0);
           func : in  STD_LOGIC_VECTOR (4 downto 0);
           k : out  STD_LOGIC_VECTOR (4 downto 0));
end ALU_control_unit;

architecture Behavioral of ALU_control_unit is

begin
process(ALUop,func)
begin
case ALUop is 
when "000" => k <= func;
when "001" => k <= "00100"; --add
when "010" => k <= "01000"; --and
when "011" => k <= "01001"; --or
when "100" => k <= "00110"; --sub
when others => k <= "00000";
end case;
end process;
end Behavioral;

