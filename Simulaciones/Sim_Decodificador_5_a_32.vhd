----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2021 20:24:08
-- Design Name: 
-- Module Name: simDecodificador5a32 - Behavioral
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

entity simDecodificador5a32 is
--  Port ( );
end simDecodificador5a32;

architecture Behavioral of simDecodificador5a32 is

COMPONENT Decodificador_5_a_32
    Port ( E : in STD_LOGIC;
           S4 : in STD_LOGIC;
           S3 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           SALIDA : inout STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

SIGNAL E, S4, S3, S2, S1, S0: STD_LOGIC;
SIGNAL SALIDA: STD_LOGIC_VECTOR (31 DOWNTO 0);

begin
miVariable: Decodificador_5_a_32 PORT MAP(E, S4, S3, S2, S1, S0, SALIDA);

E<='1', '0' AFTER 3000 NS;
S4<='0', '1' AFTER 1000 NS, '0' AFTER 1200 NS, '1' AFTER 1600 NS;
S3<='0', '1' AFTER 700 NS;
S2<='0', '1' AFTER 450 NS, '0' AFTER 700 NS, '1' AFTER 850 NS;
S1<='0', '1' AFTER 300 NS;
S0<='0', '1' AFTER 250 NS;

end Behavioral;