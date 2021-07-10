----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2021 06:54:08 PM
-- Design Name: 
-- Module Name: simSumador32bits - Behavioral
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

entity simSumador32bits is
--  Port ( );
end simSumador32bits;

architecture Behavioral of simSumador32bits is

COMPONENT sumador32bits
    Port (  A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           S : out STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

SIGNAL A, B, S: STD_LOGIC_VECTOR(31 DOWNTO 0);

begin
miVariable: sumador32bits PORT MAP(A, B, S);

A<=x"00000000", x"00000011" AFTER 200 NS, x"FFFFFFFF" AFTER 400 NS;
B<=x"00000000", x"0000000F" AFTER 200 NS, x"00000000" AFTER 400 NS, x"00000001" AFTER 600 NS;

end Behavioral;
