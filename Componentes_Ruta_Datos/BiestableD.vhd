----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.02.2021 13:35:09
-- Design Name: 
-- Module Name: BiestableD - Behavioral
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

entity BiestableD is
    Port ( CLK : in STD_LOGIC;
           D : in STD_LOGIC;
           Clear : in STD_LOGIC;
           Q : inout STD_LOGIC);
end BiestableD;

architecture Behavioral of BiestableD is
    
begin
    
    process(clk,clear) --si hay un cambio en clk o clear disparan el proceso.
    begin
     
        if (Clear = '1') then 
            Q <= '0';
        elsif (clk'event and clk = '1') then --mayor prioridad por ser asincrono
            Q <= D;
        
            
        end if;
    end process;
end Behavioral;
