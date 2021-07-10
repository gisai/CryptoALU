----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2021 03:51:46 PM
-- Design Name: 
-- Module Name: controlPrincipal - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Control_Principal is
    Port ( op : in STD_LOGIC_VECTOR (5 downto 0);
           RegDst : inout STD_LOGIC;
           Branch : inout STD_LOGIC;
           memRead: inout STD_LOGIC;
           memWrite: inout STD_LOGIC;
           MentoReg : inout STD_LOGIC;
           ALUop : inout STD_LOGIC_VECTOR(1 DOWNTO 0);
           ALUsrc : inout STD_LOGIC;
           RegWrite : inout STD_LOGIC);
end Control_Principal;

architecture Behavioral of Control_Principal is

SIGNAL salida_NAND_R: STD_LOGIC;  --op=000000
SIGNAL salida_NAND_lw: STD_LOGIC;  --op=100011
SIGNAL salida_NAND_sw: STD_LOGIC;  --op=101011
SIGNAL salida_NAND_beq_cond: STD_LOGIC;  --op=000100

begin

salida_NAND_R<=NOT op(5) AND NOT op(4) AND NOT op(3) AND NOT op(2) AND NOT op(1) AND NOT op(0);
salida_NAND_lw<=op(5) AND NOT op(4) AND NOT op(3) AND NOT op(2) AND op(1) AND op(0);
salida_NAND_sw<=op(5) AND NOT op(4) AND op(3) AND NOT op(2) AND op(1) AND op(0);
salida_NAND_beq_cond<=NOT op(5) AND NOT op(4) AND NOT op(3) AND op(2) AND NOT op(1) AND NOT op(0);

RegDst<=salida_NAND_R;
ALUsrc<=salida_NAND_lw OR salida_NAND_sw;
MentoReg<=salida_NAND_lw;
RegWrite<=salida_NAND_R OR salida_NAND_lw;
memRead<=salida_NAND_lw;
memWrite<=salida_NAND_sw;
Branch<=salida_NAND_beq_cond;
ALUop(1)<=salida_NAND_R;
ALUop(0)<=salida_NAND_beq_cond;

end Behavioral;
