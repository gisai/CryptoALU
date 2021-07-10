----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.03.2021 17:54:15
-- Design Name: 
-- Module Name: Mux2a1_32 - Behavioral
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

entity Mux2a1_32 is
    Port ( E1 : in STD_LOGIC_VECTOR (31 downto 0);
           E2 : in STD_LOGIC_VECTOR (31 downto 0);
           F : inout STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC);
end Mux2a1_32;

architecture Behavioral of Mux2a1_32 is
begin

       F <= E1 when Sel='0' else
            E2 when Sel='1';

end Behavioral;