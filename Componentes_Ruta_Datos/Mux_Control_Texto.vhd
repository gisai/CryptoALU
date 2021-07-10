----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.06.2021 18:39:22
-- Design Name: 
-- Module Name: mux_control_texto - Behavioral
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

entity mux_control_texto is
    Port ( E1: in STD_LOGIC_VECTOR (31 downto 0);
           sel: in STD_LOGIC;
           salida : inout STD_LOGIC_VECTOR (31 downto 0));
end mux_control_texto;

architecture Behavioral of mux_control_texto is

begin

    salida <= E1 when Sel='0' else
              x"00000000" when Sel='1';

end Behavioral;