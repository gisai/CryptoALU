----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.02.2021 13:22:42
-- Design Name: 
-- Module Name: simMux32a1 - Behavioral
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

entity simMux32a1 is
--  Port ( );
end simMux32a1;

architecture Behavioral of simMux32a1 is

COMPONENT mux32a1
    Port ( x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31 : in STD_LOGIC_VECTOR (31 downto 0);
           sel : in STD_LOGIC_VECTOR(4 DOWNTO 0);
           Y : inout STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

SIGNAL x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31, Y: STD_LOGIC_VECTOR (31 downto 0);
SIGNAL sel: STD_LOGIC_VECTOR(4 DOWNTO 0);

begin
miVariable: mux32a1 PORT MAP(x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31, Sel, Y);

x0<=x"00000000", x"00000002" AFTER 300 NS, x"00000002" AFTER 2000 NS; --SEL<="00000"
x2<=x"00000003", x"0000000A" AFTER 700 NS, x"00000002" AFTER 3000 NS; --SEL<="00010"
x10<=x"0000000F", x"0000000A" AFTER 700 NS, x"00000000" AFTER 4000 NS; --SEL<="01010"

Sel<="00000", "00010" after 500 NS, "01010" after 1000 NS;

end Behavioral;
