----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:59:15 07/31/2018 
-- Design Name: 
-- Module Name:    task - Behavioral 
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

entity task is
    Port ( a : in  STD_LOGIC_VECTOR (2 downto 0);
           b : in  STD_LOGIC_VECTOR (2 downto 0);
           c : in  STD_LOGIC_VECTOR (2 downto 0);
           d : in  STD_LOGIC_VECTOR (2 downto 0);
           f : out  STD_LOGIC);
end task;

architecture Behavioral of task is
component orgate
port(      x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           z : in  STD_LOGIC;
           w : in  STD_LOGIC;
           f : out  STD_LOGIC
);
end component;
signal s1 , s2 , s3 ,s4 : STD_LOGIC;

begin
s1 <= a(0) and c(0) and d(0) ;
s2 <= a(1) and b(0) and d(1) ;
s3 <= a(2) and b(1) and c(1) ;
s4 <= b(2) and c(2) and d(2) ; 
or1 : orgate
port map(
           x => s1,
			  y => s2,
			  z => s3,
			  w => s4,
			  f => f
);
end Behavioral;

