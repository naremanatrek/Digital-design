----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:08 07/31/2018 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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

entity ALU is
    Port ( k : in  STD_LOGIC_VECTOR (1 downto 0);
	        k1 : in STD_LOGIC_VECTOR (1 DOWNTO 0);
			  k2 : in STD_LOGIC_VECTOR (2 DOWNTO 0);
			  k3 : in STD_LOGIC_VECTOR (2 DOWNTO 0);
	        x : in  STD_LOGIC_VECTOR (31 downto 0);
			  y : in  STD_LOGIC_VECTOR (31 downto 0);
			  cf : in  STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is
component arithmatic_block2
port(
           x : in  STD_LOGIC_VECTOR (31 downto 0);
           y : in  STD_LOGIC_VECTOR (31 downto 0);
           k3 : in  STD_LOGIC_VECTOR (2 downto 0);
			  cf : in STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
component Logic_block is
    Port ( x : in  STD_LOGIC_VECTOR(31 downto 0);
           y : in  STD_LOGIC_VECTOR(31 downto 0);
           k1 : in  STD_LOGIC_VECTOR(1 downto 0);
           z : out  STD_LOGIC_VECTOR(31 downto 0));
			  end component;
component shift_block is
    Port ( k2 : in  STD_LOGIC_VECTOR (2 downto 0);
           x : in  STD_LOGIC_VECTOR (31 downto 0);
           z : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
signal z1,z2,z3 : STD_LOGIC_VECTOR(31 downto 0);
begin
xx : arithmatic_block2 port map(x,y,k3,cf,z1);
xy : Logic_block port map(x,y,k1,z2);
xz : shift_block port map(k2,x,z3);
process (k)
begin
case k is
when "00" => z <= z1;
when "01" => z <= z2;
when "10" => z <= z3;
when others => z <= z1;
end case;
end process;
end Behavioral;

