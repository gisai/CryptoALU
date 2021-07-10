----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/19/2021 01:00:50 PM
-- Design Name: 
-- Module Name: mux_control_DW - Behavioral
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

entity mux_control_ADDR is
    Port ( Salida_ALU : in STD_LOGIC_VECTOR (31 downto 0);
           Salida_Mux_Direcciones : in STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC;
           Salida : inout STD_LOGIC_VECTOR (31 downto 0));
end mux_control_ADDR;

architecture Behavioral of mux_control_ADDR is

begin

 Salida <= Salida_ALU when Sel='0' else
           Salida_Mux_Direcciones when Sel='1';

end Behavioral;
