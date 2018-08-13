----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:49:53 08/08/2018 
-- Design Name: 
-- Module Name:    Control_unit - Behavioral 
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

entity Control_unit is
    Port ( op_code : in  STD_LOGIC_VECTOR(5 DOWNTO 0);
           regDest : out  STD_LOGIC;
           branch : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemToReg : out  STD_LOGIC;
           ALUop : out  STD_LOGIC_VECTOR (2 downto 0);
           MemWrite : out  STD_LOGIC;
           ALUsrc : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC);
end Control_unit;

architecture Behavioral of Control_unit is

begin
process (op_code)
begin
case op_code is
when "000000" => regDest <= '1'; --R-FORMAT
                 branch <= '0';
                 MemRead <= '0';
                 MemToReg <= '0';
                 ALUop <= "000";
                 MemWrite <= '0';
                 ALUsrc <= '0';
                 RegWrite <= '1'; 
when "000001" => regDest <= '0'; --ADDI
                 branch <= '0';
                 MemRead <= '0';
                 MemToReg <= '0';
                 ALUop <= "001";
                 MemWrite <= '0';
                 ALUsrc <= '1';
                 RegWrite <= '1';
when "000010" => regDest <= '0'; --ANDI
                 branch <= '0';
                 MemRead <= '0';
                 MemToReg <= '0';
                 ALUop <= "010";
                 MemWrite <= '0';
                 ALUsrc <= '1';
                 RegWrite <= '1'; 
when "000011" => regDest <= '0'; --ORI
                 branch <= '0';
                 MemRead <= '0';
                 MemToReg <= '0';
                 ALUop <= "011";
                 MemWrite <= '0';
                 ALUsrc <= '1';
                 RegWrite <= '1'; 		
when "000100" => regDest <= '0'; --LW
                 branch <= '0';
                 MemRead <= '1';
                 MemToReg <= '1';
                 ALUop <= "001";
                 MemWrite <= '0';
                 ALUsrc <= '1';
                 RegWrite <= '1';
when "000101" => regDest <= '0'; --SW
                 branch <= '0';
                 MemRead <= '0';
                 MemToReg <= '0';
                 ALUop <= "001";
                 MemWrite <= '1';
                 ALUsrc <= '1';
                 RegWrite <= '0';
when "000110" => regDest <= '1'; --BEQ
                 branch <= '1';
                 MemRead <= '0';
                 MemToReg <= '0';
                 ALUop <= "100";
                 MemWrite <= '0';
                 ALUsrc <= '0';
                 RegWrite <= '0';   					  
end case;
end process;
end Behavioral;

