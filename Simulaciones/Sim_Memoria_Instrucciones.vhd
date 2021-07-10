----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/21/2021 11:23:10 AM
-- Design Name: 
-- Module Name: sim_mem_instrucciones - Behavioral
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

entity sim_mem_instrucciones is
--  Port ( );
end sim_mem_instrucciones;

architecture Behavioral of sim_mem_instrucciones is

COMPONENT Memoria_De_Instrucciones
    Port ( Address : in STD_LOGIC_VECTOR (31 downto 0);
           Instruccion : inout STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

SIGNAL Address, Instruccion: STD_LOGIC_VECTOR (31 downto 0);

begin
miVariable: Memoria_De_Instrucciones PORT MAP(Address, Instruccion);

Address<=x"00000000", x"00000004" AFTER 300 NS, x"00000008" AFTER 600 NS;


end Behavioral;
