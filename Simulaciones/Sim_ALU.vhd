----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.02.2021 13:13:06
-- Design Name: 
-- Module Name: simALU - Behavioral
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

entity simALU is
--  Port ( );
end simALU;

architecture Behavioral of simALU is

COMPONENT A_L_U
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Resul : inout STD_LOGIC_VECTOR (31 downto 0);
           zero: out STD_LOGIC);
END COMPONENT;

SIGNAL A, B, Resul: STD_LOGIC_VECTOR (31 DOWNTO 0);
SIGNAL Sel: STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL zero: STD_LOGIC;

begin
miVariable: A_L_U PORT MAP (A, B, Sel, Resul, zero);

Sel<="000", "001" AFTER 150 NS, "010" AFTER 250 NS, "011" AFTER 350 NS, "100" AFTER 500 NS, "101" AFTER 600 NS, "110" AFTER 700 NS, "111" AFTER 800 NS;
A<=x"00000002", x"000000FF" AFTER 150 NS, x"00000010" AFTER 250 NS, x"00000100" AFTER 350 NS, x"00000010" AFTER 450 NS, x"00000002" AFTER 500 NS, x"00000111" AFTER 600 NS, x"000000AA" AFTER 700 NS, x"000000AA" AFTER 750 NS, x"00000001" AFTER 800 NS, x"00000001" AFTER 850 NS;
B<=x"00000008", x"000000FE" AFTER 150 NS, x"00000100" AFTER 250 NS, x"00000010" AFTER 350 NS, x"00000100" AFTER 450 NS, x"00000004" AFTER 500 NS, x"00000010" AFTER 600 NS, x"000000AA" AFTER 700 NS, x"000000AB" AFTER 750 NS, x"00000001" AFTER 800 NS, x"00000011" AFTER 850 NS;

end Behavioral;
