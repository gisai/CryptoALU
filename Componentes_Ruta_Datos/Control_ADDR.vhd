----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/19/2021 04:20:11 PM
-- Design Name: 
-- Module Name: bloque_control_ADDR - Behavioral
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

entity bloque_control_ADDR is
    Port ( salida_ALU: in STD_LOGIC_VECTOR (31 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           sw11: in STD_LOGIC;
           salida : inout STD_LOGIC_VECTOR (31 downto 0));
end bloque_control_ADDR;

architecture Behavioral of bloque_control_ADDR is

COMPONENT mux_control_ADDR is
    Port ( Salida_ALU : in STD_LOGIC_VECTOR (31 downto 0);
           Salida_Mux_Direcciones : in STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC;
           Salida : inout STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

COMPONENT mux_dir10_or_dir11 is
    Port ( sel: in STD_LOGIC_VECTOR(1 DOWNTO 0);
           salida : inout STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

COMPONENT mux_control_texto
    Port ( E1: in STD_LOGIC_VECTOR (31 downto 0);
           sel: in STD_LOGIC;
           salida : inout STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

SIGNAL salida_mux_dir10_or_dir11: STD_LOGIC_VECTOR (31 downto 0);
SIGNAL salida_mux: STD_LOGIC_VECTOR (31 downto 0);

SIGNAL sel_aux: STD_LOGIC;

begin

mux_dir: mux_dir10_or_dir11 PORT MAP(sel, salida_mux_dir10_or_dir11);

sel_aux<=sel(0) or sel(1);
mux_control: mux_control_ADDR PORT MAP(salida_ALU, salida_mux_dir10_or_dir11, sel_aux, salida_mux);

mux_dir_texto: mux_control_texto PORT MAP(salida_mux, sw11,salida);

end Behavioral;