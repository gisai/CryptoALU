----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2021 16:28:48
-- Design Name: 
-- Module Name: simBiestableD - Behavioral
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

entity simBiestableD is
--  Port ( );
end simBiestableD;

architecture Behavioral of simBiestableD is

COMPONENT BiestableD
     Port ( CLK : in STD_LOGIC;
           D : in STD_LOGIC;
           Clear : in STD_LOGIC;
           Q : inout STD_LOGIC);
END COMPONENT;

Signal CLK, D, Clear, Q: STD_LOGIC;

begin
miVariable: BiestableD PORT MAP(CLK, D, Clear, Q);

reloj: PROCESS
BEGIN
WAIT FOR 20 NS; CLK<='1';
WAIT FOR 20 NS; CLK<='0';
END PROCESS;

D<='0', '1' AFTER 100 NS, '0' AFTER 250 NS, '1' AFTER 500 NS;
Clear<='0', '1' AFTER 1000 NS;

end Behavioral;
