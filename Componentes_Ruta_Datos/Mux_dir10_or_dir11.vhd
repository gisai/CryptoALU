----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/19/2021 01:43:59 PM
-- Design Name: 
-- Module Name: mux_dir10_or_dir11 - Behavioral
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

entity Mux_dir10_or_dir11 is
    Port ( sel: in STD_LOGIC_VECTOR(1 DOWNTO 0);
           salida : inout STD_LOGIC_VECTOR (31 downto 0));
end Mux_dir10_or_dir11;

architecture Behavioral of Mux_dir10_or_dir11 is

begin

salida <= x"00000001" when Sel="01" else
          x"00000002" when Sel="10" else
          x"00000002" when Sel="11" else
          x"00000000" when Sel="00";
            
end Behavioral;