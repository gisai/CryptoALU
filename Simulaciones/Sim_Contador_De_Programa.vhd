----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2021 07:24:08 PM
-- Design Name: 
-- Module Name: simContadorDePrograma - Behavioral
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

entity simContadorDePrograma is
--  Port ( );
end simContadorDePrograma;

architecture Behavioral of simContadorDePrograma is

COMPONENT Contador_De_Programa
    Port ( CLK : in STD_LOGIC;
           Reset: in STD_LOGIC;
           Entrada : in STD_LOGIC_VECTOR (31 downto 0);
           Salida : inout STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

SIGNAL CLK, Reset: STD_LOGIC;
SIGNAL Entrada, Salida: STD_LOGIC_VECTOR(31 downto 0);

begin
miVariable: Contador_De_Programa PORT MAP(CLK, Reset,Entrada, Salida);

reloj: PROCESS
BEGIN
WAIT FOR 20 NS; CLK<='1';
WAIT FOR 20 NS; CLK<='0';
END PROCESS;
Reset<='1', '0' AFTER 300 NS;
Entrada<=x"00000000", x"00000FF0" AFTER 200 NS, x"20000AA0" AFTER 400 NS;


end Behavioral;
