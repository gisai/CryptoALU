----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/13/2021 08:15:39 PM
-- Design Name: 
-- Module Name: sim_demo_busquedaInstrucciones - Behavioral
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

entity sim_demo_busquedaInstrucciones is
--  Port ( );
end sim_demo_busquedaInstrucciones;

architecture Behavioral of sim_demo_busquedaInstrucciones is

COMPONENT ensamblaje_busqueda_instrucciones
    Port (CLK: IN STD_LOGIC;
          Reset: IN STD_LOGIC;
          instruccion: INOUT STD_LOGIC_VECTOR(31 DOWNTO 0) );
END COMPONENT;
SIGNAL CLK, Reset: STD_LOGIC;
SIGNAL instruccion, CUENTA: STD_LOGIC_VECTOR (31 downto 0);

begin

miVariable: ensamblaje_busqueda_instrucciones PORT MAP(CLK, Reset,  instruccion);

RESET<='1', '0' AFTER 200 NS;

reloj: PROCESS
BEGIN
Clk<='0'; WAIT FOR 20 NS;
Clk<='1'; WAIT FOR 20 NS;
END PROCESS;

end Behavioral;
