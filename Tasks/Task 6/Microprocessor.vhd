----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:10:04 08/08/2018 
-- Design Name: 
-- Module Name:    Microprocessor - Behavioral 
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

entity Microprocessor is
    Port ( pc : in  STD_LOGIC_VECTOR (31 downto 0);
	 clk : IN STD_LOGIC);
end Microprocessor;

architecture Behavioral of Microprocessor is
component instruction_memory 
Port ( pc : in  STD_LOGIC_VECTOR (4 downto 0);
           instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
component Register_file 
    Port ( register1 : in  STD_LOGIC_VECTOR (4 downto 0);
           register2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           write_address : in  STD_LOGIC_VECTOR (4 downto 0);
           writee : in  STD_LOGIC;
           read_data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           read_data2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in STD_LOGIC);
end component;
component ALU is
    Port ( k : in  STD_LOGIC_VECTOR (4 downto 0);
	        x : in  STD_LOGIC_VECTOR (31 downto 0);
			  y : in  STD_LOGIC_VECTOR (31 downto 0);
			  cf : in  STD_LOGIC;
			  zf : out STD_LOGIC;
           z : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
component data_memory is
    Port ( address : in  STD_LOGIC_VECTOR (4 downto 0);
           write_bit : in  STD_LOGIC;
           read_bit : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (31 downto 0);
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end component;
component Control_unit is
    Port ( op_code : in  STD_LOGIC_VECTOR(5 DOWNTO 0);
           regDest : out  STD_LOGIC;
           branch : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemToReg : out  STD_LOGIC;
           ALUop : out  STD_LOGIC_VECTOR (2 downto 0);
           MemWrite : out  STD_LOGIC;
           ALUsrc : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC);
end Component;
component ALU_control_unit is
    Port ( ALUop : in  STD_LOGIC_VECTOR (2 downto 0);
           func : in  STD_LOGIC_VECTOR (4 downto 0);
           k : out  STD_LOGIC_VECTOR (4 downto 0));
end component;
signal instruction,write_d,data1,data2,alu_in,sign_ext,z ,data_o,b_label: STD_LOGIC_VECTOR (31 DOWNTO 0);
signal reg_dest,branchh,mem_read,mem_to_reg,mem_write,alu_src,reg_write,cf,zf : STD_LOGIC;
SIGNAL ALU_op : STD_LOGIC_VECTOR(2 DOWNTO 0);
signal write_register,k : STD_LOGIC_vector(4 downto 0);
begin
process(pc,instruction,write_d,data1,data2,alu_in,sign_ext,z ,data_o,reg_dest,branchh,mem_read,mem_to_reg,mem_write,alu_src,reg_write,cf,zf,ALU_op,write_register,k,clk)
begin
instr_memory : instruction_memory port map (pc,instruction);
cont_unit : control_unit port map (instruction(31 downto 26),reg_dest,branchh,mem_read,mem_to_reg,alu_op,mem_write,alu_src,reg_write);
if reg_dest = '0' then write_register <= instruction(20 downto 16);
else write_register <= instruction(15 downto 11);
end if;
reg_file : register_file port map (instruction(25 downto 21),instruction(20 downto 16),write_d,write_register,reg_write,data1,data2,CLK);
ALU_control : ALU_CONTROL_UNIT port map(ALU_OP,instruction(4 downto 0),k);
sign_ext <= instruction(0 to 15) & (others => instruction(15));
alu_in <= data2 when alu_src <= '0' else alu_in <= sign_ext;
if instruction(31 downto 26) = "000000" then 
cf <= '0' when instruction(0 to 4) = "00100" else cf <= '1'; end if;
ALUU : ALU port map(k,data1,alu_in,cf,zf,z);
data_mem : data_memory port map (to_integer(unsigned (z)),mem_write,mem_read,data2,data_o);
write_d <= z when mem_to_reg = '0' else write_d <= data_o;
b_label(0 to 1) <= "00";
b_label(2 to 31) <= sign_ext(0 to 29);
case pc is
when branchh = '0' => pc <= pc + "0100";
when branchh = '1' => pc <= pc + "0100" when zf = '0' else pc <= pc + "0100" + b_label ;
end case;
end process;
end Behavioral;

