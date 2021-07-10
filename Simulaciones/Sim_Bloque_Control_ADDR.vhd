----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/30/2021 04:54:27 PM
-- Design Name: 
-- Module Name: sim_bloque_control_addr - Behavioral
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

entity sim_bloque_control_addr is
--  Port ( );
end sim_bloque_control_addr;

architecture Behavioral of sim_bloque_control_addr is

COMPONENT bloque_control_ADDR is
    Port ( salida_ALU: in STD_LOGIC_VECTOR (31 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           sw11: in STD_LOGIC;
           salida : inout STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

SIGNAL salida_ALU, salida: STD_LOGIC_VECTOR (31 downto 0);
SIGNAL sel: STD_LOGIC_VECTOR (1 downto 0);
SIGnAL sw11: STD_LOGIC;

begin
miVariable: bloque_control_ADDR PORT MAP(salida_ALU,sel,sw11,salida);

salida_ALU<=x"FFFFFFFF";
sel<="00";
sw11<='0', '1' AFTER 200 NS;
end Behavioral;
