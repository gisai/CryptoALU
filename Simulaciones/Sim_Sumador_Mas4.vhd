----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/09/2021 07:05:49 PM
-- Design Name: 
-- Module Name: simSumadorMas4 - Behavioral
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

entity simSumadorMas4 is
--  Port ( );
end simSumadorMas4;

architecture Behavioral of simSumadorMas4 is

COMPONENT Sumador_Mas_4
    Port ( Entrada : in STD_LOGIC_VECTOR (31 downto 0);
           Salida: inout STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

SIGNAL Entrada, Salida: STD_LOGIC_VECTOR(31 DOWNTO 0);

begin
miVariable: Sumador_Mas_4 PORT MAP (Entrada, Salida);

Entrada<=x"00000000", x"FFFFFFF0" AFTER 200 NS, x"FFFFFFFA" AFTER 400 NS;

end Behavioral;
