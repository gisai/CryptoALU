----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/18/2021 07:33:09 PM
-- Design Name: 
-- Module Name: simExtSigno - Behavioral
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

entity simExtSigno is
--  Port ( );
end simExtSigno;

architecture Behavioral of simExtSigno is

COMPONENT Extensor_De_Signo
    Port ( inmed : in STD_LOGIC_VECTOR (15 downto 0);
           salida : inout STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;
SIGNAL inmed: STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL salida: STD_LOGIC_VECTOR(31 DOWNTO 0);

begin
miVariable: Extensor_De_Signo PORT MAP(inmed, salida);

inmed<=x"0000", x"F0000" AFTER 200 NS, x"0FFF" AFTER 500 NS, x"A0A0" AFTER 750 NS;

end Behavioral;
