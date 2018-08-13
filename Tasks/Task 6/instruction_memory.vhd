----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:18:55 08/08/2018 
-- Design Name: 
-- Module Name:    instruction_memory - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instruction_memory is
    Port ( pc : in  STD_LOGIC_VECTOR (4 downto 0);
           instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end instruction_memory;

architecture Behavioral of instruction_memory is
type instructionMemory is array (0 to 31) of std_logic_vector(31 downto 0);
constant instructionMem : instructionMemory:=(
   "1000000110000000",
   "0010110010001011",
   "1100010000000011",
   "0001000111000000",
   "1110110110000001",
   "1100000001111011",
   "0100010001100000",
   "0010110010001011",
   "0110000110000100",
   "0001000111000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
   "0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000",
	"0000000000000000");
	signal address : std_logic_vector(4 downto 0);
begin
instruction <= instructionMem(to_integer(unsigned (pc)));
end Behavioral;

