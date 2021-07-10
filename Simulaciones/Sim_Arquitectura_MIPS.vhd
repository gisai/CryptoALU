----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.05.2021 19:22:50
-- Design Name: 
-- Module Name: sim_arquitectura_mips_original - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sim_arquitectura_mips is
--  Port ( );
end sim_arquitectura_mips;

architecture Behavioral of sim_arquitectura_mips is
component Arquitectura_MIPS is
Port (  --ENTRADAS Y SALIDAS DE NUESTRO BLOQUE FINAL
          RESET_GLOBAL: IN STD_LOGIC ; --A FALTA DE VER DE QUE FORMA SE HACE EL RESETEO
          CLK_GLOBAL: IN STD_LOGIC; --W5
          SWITCH_V16: IN STD_LOGIC; --PARA GEENERAR EL PRIMO P DEL ALGORITMO
          SWITCH_V17: IN STD_LOGIC; --PARA GEENERAR EL PRIMO Q DEL ALGORITMO
          SWITCHES_TEXTO_CLARO: IN STD_LOGIC_VECTOR(3 DOWNTO 0); --PARA GENERAR EL NÚMERO EN CLARO. (R2, T1, U1, W2, R3).
          SWITCH_ENVIO_TEXTO_CLARO: IN STD_LOGIC; --PARA OONTROLAR EL ENVÍO DEL TEXTO EN CLARO. (T2).
          ACTIVACION_DISPLAYS: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --CONTROLAR COMO ACTIVAR/DESACTIVAR DÍGITOS.
          ACTIVACION_PUNTOS: OUT STD_LOGIC;
          SALIDA_SEGMENTOS: OUT STD_LOGIC_VECTOR(6 DOWNTO 0); --DECODIFICADOR DE NUMERO A 7 SEGMENTOS
          SALIDA_ACTIVACION_LEDS: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)); --PARA ENCENDER LEDS (W3, E19, U16)
          --ENTRADAS Y SALIDAS DE NUESTRO BLOQUE FINAL
end component;

SIGNAL CLK_GLOBAL, RESET_GLOBAL, ACTIVACION_PUNTOS: STD_LOGIC;
SIGNAL SWITCH_V16, SWITCH_V17, SWITCH_ENVIO_TEXTO_CLARO: STD_LOGIC;
SIGNAL SWITCHES_TEXTO_CLARO: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL ACTIVACION_DISPLAYS: STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL SALIDA_SEGMENTOS: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL SALIDA_ACTIVACION_LEDS: STD_LOGIC_VECTOR(2 DOWNTO 0);

begin

mivariable: Arquitectura_MIPS PORT MAP(RESET_GLOBAL, CLK_GLOBAL, SWITCH_V16, SWITCH_V17, SWITCHES_TEXTO_CLARO, SWITCH_ENVIO_TEXTO_CLARO, ACTIVACION_DISPLAYS, ACTIVACION_PUNTOS,SALIDA_SEGMENTOS, SALIDA_ACTIVACION_LEDS);

reloj: PROCESS
BEGIN
WAIT FOR 100 NS; CLK_GLOBAL<='1';
WAIT FOR 100 NS; CLK_GLOBAL<='0';
END PROCESS;

RESET_GLOBAL<='1', '0' after 200ns;
SWITCH_V16<='0', '1' AFTER 100 us, '0' AFTER 150 us;
SWITCH_V17<='0', '1' AFTER 150 us, '0' AFTER 200 us;

SWITCHES_TEXTO_CLARO<="1111";
SWITCH_ENVIO_TEXTO_CLARO<='0', '1' AFTER 50 us, '0' AFTER 100 us;

end Behavioral;