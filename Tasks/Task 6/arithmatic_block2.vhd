----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:21:48 07/31/2018 
-- Design Name: 
-- Module Name:    arithmatic_block2 - Behavioral 
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

entity arithmatic_block2 is
    Port ( x : in  STD_LOGIC_VECTOR (31 downto 0);
           y : in  STD_LOGIC_VECTOR (31 downto 0);
           k3 : in  STD_LOGIC_VECTOR (2 downto 0);
			  cf : in STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (31 downto 0));
end arithmatic_block2;

architecture Behavioral of arithmatic_block2 is
component arithmatic_block
port(
           x : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           y : in  STD_LOGIC_VECTOR(31 DOWNTO 0);
           cf : in  STD_LOGIC; 
			  cout: out STD_LOGIC;
           z : out  STD_LOGIC_VECTOR(31 downto 0)
			  );
			  end component;
component mux
port ( 
           a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           f : out  STD_LOGIC;
           n : in  STD_LOGIC
);
end component;
signal p1,p2,p5,c : STD_LOGIC;
signal k3at,k2at,p3,p4 : STD_LOGIC_VECTOR(31 downto 0);
begin
x1 : mux port map(cf,'1',p1,k3(2));
x2 : mux port map(p1,'0',p2,k3(0));
p5 <= p2 xor k3(1);
process (k3)
begin
for i in 0 to 31 loop
k2at(i) <= k3(1);
end loop;
for i in 0 to 31 loop
k3at(i) <= k3(2);
end loop;
end process;
p3 <= y and k3at; 
p4 <= p3 xor k2at;
x3 : arithmatic_block port map(x,p4,p5,c,z);

end Behavioral;

