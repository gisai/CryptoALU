----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2021 07:30:06 PM
-- Design Name: 
-- Module Name: simDesplazador - Behavioral
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

entity simDesplazador is
--  Port ( );
    Generic(
        N: INTEGER:=2;
        W: INTEGER:=32
    );
end simDesplazador;

architecture Behavioral of simDesplazador is

COMPONENT desplazador
    Port ( entrada : in STD_LOGIC_VECTOR (W-1 downto 0);
           salida : inout STD_LOGIC_VECTOR (W-1 downto 0));
END COMPONENT;

SIGNAL entrada, salida: STD_LOGIC_VECTOR (W-1 downto 0); 

begin
miVariable: desplazador PORT MAP(entrada, salida);

entrada<=x"00000000", x"0001F011" AFTER 200 NS, x"0FFFFFFF" AFTER 400 NS;

end Behavioral;
