----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2021 16:53:09
-- Design Name: 
-- Module Name: simRegistro - Behavioral
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

entity simRegistro is
--  Port ( );
end simRegistro;

architecture Behavioral of simRegistro is

COMPONENT Registro
    Port ( CLKr : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           Dr : in STD_LOGIC_VECTOR (31 downto 0);
           Qr : inout STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

Signal CLKr, enable, reset: STD_LOGIC;
Signal Dr, Qr: STD_LOGIC_VECTOR(31 downto 0);

begin
miVariable: Registro PORT MAP (CLKr, enable, reset, Dr, Qr);

reloj: PROCESS
BEGIN
WAIT FOR 20 NS; CLKr<='1';
WAIT FOR 20 NS; CLKr<='0';
END PROCESS;

Dr<=x"00000000", x"00000001" AFTER 200 NS, x"0000000A" AFTER 600 NS, x"00000001" AFTER 2000 NS;
enable<='1', '0' AFTER 1500 NS;
reset<='0', '1' AFTER 2300 NS;

end Behavioral;
