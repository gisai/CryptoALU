----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2021 07:00:17 PM
-- Design Name: 
-- Module Name: sumadorMas4 - Behavioral
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


LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Sumador_Mas_4 is
    Port ( Entrada : in STD_LOGIC_VECTOR (31 downto 0);
           Salida: inout STD_LOGIC_VECTOR (31 downto 0));
end Sumador_Mas_4;

architecture Behavioral of Sumador_Mas_4 is

SIGNAL AUX: STD_LOGIC_VECTOR (31 downto 0):=x"00000000";
SIGNAL FIN: BOOLEAN:=FALSE;

begin

add4: PROCESS(Entrada)
BEGIN
    IF FIN = FALSE THEN
        IF AUX = x"00000054" THEN
            AUX<=x"00000000";
            FIN<=TRUE;
        ELSE
            AUX<=AUX+4;
        END IF;
    ELSE
        AUX<=x"00000000";
    END IF;
Salida <= AUX;
END PROCESS add4;

end Behavioral;