----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2021 07:13:10 PM
-- Design Name: 
-- Module Name: contadorDePrograma - Behavioral
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

entity Contador_De_Programa is
    Port ( CLK : in STD_LOGIC;
           Reset: in STD_LOGIC; --ENTRADA ACTIVADA MIENTRAS NO SE HAYAN GENERADO TODAS LAS VARIABLES DEL RSA.
           Entrada : in STD_LOGIC_VECTOR (31 downto 0);
           Salida : inout STD_LOGIC_VECTOR (31 downto 0));
end Contador_De_Programa;

architecture Behavioral of Contador_De_Programa is

begin

cp: PROCESS(RESET, CLK)
BEGIN
    IF RESET = '0' THEN
        Salida<=X"00000000";
    ELSE
        IF CLK'EVENT AND CLK='1' THEN
            Salida<=ENTRADA;
        END IF;
    END IF;
END PROCESS;



end Behavioral;