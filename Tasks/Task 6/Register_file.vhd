----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:37:04 08/08/2018 
-- Design Name: 
-- Module Name:    Register_file - Behavioral 
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

entity Register_file is
    Port ( register1 : in  STD_LOGIC_VECTOR (4 downto 0);
           register2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           write_address : in  STD_LOGIC_VECTOR (4 downto 0);
           writee : in  STD_LOGIC;
           read_data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           read_data2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in STD_LOGIC);
end Register_file;
architecture Behavioral of Register_file is
type registerfile is array (0 to 31) of std_logic_vector(31 downto 0);
signal regfile : registerfile;
begin
read_data1 <= regfile(to_integer(unsigned (register1)));
read_data2 <= regfile(to_integer (unsigned (register2)));
process (writee ,write_address,write_data,clk)
begin
if(falling_edge(clk)) then
if(writee = '1' )then
 regfile(to_integer (unsigned(write_address))) <= write_data;
end if;
end if;
end process;
end Behavioral;

