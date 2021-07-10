----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2021 04:58:31 PM
-- Design Name: 
-- Module Name: ensamblaje_busqueda_instrucciones - Behavioral
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

entity ensamblaje_busqueda_instrucciones is
    Port (CLK: IN STD_LOGIC;
          Reset: IN STD_LOGIC;
          instruccion: INOUT STD_LOGIC_VECTOR(31 DOWNTO 0) );
end ensamblaje_busqueda_instrucciones;

architecture Behavioral of ensamblaje_busqueda_instrucciones is

COMPONENT Contador_De_Programa
    Port ( CLK : in STD_LOGIC;
           Reset: in STD_LOGIC;
           Entrada : in STD_LOGIC_VECTOR (31 downto 0);
           Salida : inout STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

COMPONENT sumador_Mas_4
    Port ( Entrada : in STD_LOGIC_VECTOR (31 downto 0);
           Salida: inout STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

COMPONENT memoria_De_Instrucciones
    Port ( Address : in STD_LOGIC_VECTOR (31 downto 0);
           Instruccion : inout STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

SIGNAL aux_salida_cp: STD_LOGIC_VECTOR (31 downto 0);
SIGNAL aux_salida_sum: STD_LOGIC_VECTOR (31 downto 0);

begin

sum: sumador_Mas_4 PORT MAP(aux_salida_cp, aux_salida_sum);
c_p: contador_De_Programa PORT MAP(CLK, Reset, aux_salida_sum, aux_salida_cp);
mem: memoria_De_Instrucciones PORT MAP(aux_salida_cp, instruccion);

end Behavioral;
