----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:25:59 08/08/2018 
-- Design Name: 
-- Module Name:    data_memory - Behavioral 
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

entity data_memory is
    Port ( address : in  STD_LOGIC_VECTOR (4 downto 0);
           write_bit : in  STD_LOGIC;
           read_bit : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end data_memory;

architecture Behavioral of data_memory is
type ram is array (0 to 31) of std_logic_vector(31 downto 0);
signal data_mem : ram;
begin
process(write_bit,read_bit,data_in,address)
begin
if write_bit = '1' then
data_mem(to_integer(unsigned(address))) <= data_in;
end if;
if read_bit = '1' then 
data_out <= data_mem(to_integer(unsigned(address)));
end if;
end process;
end Behavioral;

