----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:35:32 08/08/2018 
-- Design Name: 
-- Module Name:    counterr - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counterr is
port( clk : in STD_LOGIC;
      reset : in STD_LOGIC;
		outp : out STD_LOGIC_VECTOR (7 DOWNTO 0) := (others => '0'));
end counterr;

architecture Behavioral of counterr is
signal ouut : STD_LOGIC_VECTOR (7 DOWNTO 0) := (others => '0');
signal cclk : STD_LOGIC_VECTOR (27 DOWNTO 0) := (others => '0');
begin
process(clk,reset,ouut,CCLK)
begin
if(rising_edge(clk) and reset = '0') then
   cclk <= cclk + '1';
if (cclk >= x"2faf080") then
      CCLK <= X"0000000";
if(ouut = "11111111") then ouut <= "00000000" ;
  else outp <= ouut + "00000001";
  end if;
  end if;
  end if;
if reset = '1' then ouut <= "00000000" ; outp <= ouut; end if;
end process;
end Behavioral;

