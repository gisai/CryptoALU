----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.06.2021 19:20:38
-- Design Name: 
-- Module Name: registro_texto_claro - Behavioral
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

entity Registro_Texto_Claro is
    Port ( clk : in STD_LOGIC;
           sw12 : in STD_LOGIC;
           sw13 : in STD_LOGIC;
           sw14 : in STD_LOGIC;
           sw15 : in STD_LOGIC;
           salida : inout STD_LOGIC_VECTOR (31 downto 0));
end Registro_Texto_Claro;

architecture Behavioral of Registro_Texto_Claro is

COMPONENT BiestableD is
    Port ( CLK : in STD_LOGIC;
           D : in STD_LOGIC;
           Clear : in STD_LOGIC;
           Q : inout STD_LOGIC);
end COMPONENT;

SIGNAL salida_texto_32: STD_LOGIC_VECTOR (31 downto 0):=x"00000000";
begin

biestable_sw12: BiestableD PORT MAP(clk, sw12, '0',  salida_texto_32(0));
biestable_sw13: BiestableD PORT MAP(clk, sw13, '0',  salida_texto_32(1));
biestable_sw14: BiestableD PORT MAP(clk, sw14, '0',  salida_texto_32(2));
biestable_sw15: BiestableD PORT MAP(clk, sw15, '0',  salida_texto_32(3));

salida<=salida_texto_32;

end Behavioral;