----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:55:33 07/31/2018 
-- Design Name: 
-- Module Name:    Arithmetic_block - Behavioral 
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

entity Arithmatic_block is
    Port ( 
           x : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           y : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           cf : in  STD_LOGIC; 
			  cout: out STD_LOGIC;
           z : out  STD_LOGIC_VECTOR(31 downto 0));
end Arithmatic_block;

architecture Behavioral of Arithmatic_block is
component fadder
port(
           a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           s : out  STD_LOGIC;
           cout : out  STD_LOGIC
);
end component;
signal temp : STD_LOGIC_VECTOR(32 DOWNTO 0);
begin
temp(0) <= cf;
cout <= temp(32);
x1 : for i in 0 to 31 generate
x2 : fadder port map(x(i),y(i),temp(0),z(i),temp(i+1));
end generate x1;

end Behavioral;

