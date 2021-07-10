----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.02.2021 20:19:00
-- Design Name: 
-- Module Name: Mux32a5 - Behavioral
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

entity mux32a1 is
    Port ( x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31 : in STD_LOGIC_VECTOR (31 downto 0);
           sel : in STD_LOGIC_VECTOR(4 DOWNTO 0);
           Y : inout STD_LOGIC_VECTOR (31 downto 0));
end mux32a1;

architecture Behavioral of mux32a1 is
begin
    
    
  y <=  x0  when sel = "00000" else
        x1  when sel = "00001" else
        x2  when sel = "00010" else
        x3  when sel = "00011" else
        x4  when sel = "00100" else
        x5  when sel = "00101" else
        x6  when sel = "00110" else
        x7  when sel = "00111" else
        x8  when sel = "01000" else
        x9  when sel = "01001" else
        x10 when sel = "01010" else
        x11 when sel = "01011" else
        x12 when sel = "01100" else
        x13 when sel = "01101" else
        x14 when sel = "01110" else
        x15 when sel = "01111" else
        x16 when sel = "10000" else
        x17 when sel = "10001" else
        x18 when sel = "10010" else
        x19 when sel = "10011" else
        x20 when sel = "10100" else
        x21 when sel = "10101" else
        x22 when sel = "10110" else
        x23 when sel = "10111" else
        x24 when sel = "11000" else
        x25 when sel = "11001" else
        x26 when sel = "11010" else
        x27 when sel = "11011" else
        x28 when sel = "11100" else
        x29 when sel = "11101" else
        x30 when sel = "11110" else
        x31 when sel = "11111"; 

end Behavioral;
