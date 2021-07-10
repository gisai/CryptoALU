----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.05.2021 19:23:28
-- Design Name: 
-- Module Name: sim_divisor_frecuencia - Behavioral
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

entity sim_divisor_frecuencia is
--  Port ( );
end sim_divisor_frecuencia;

architecture Behavioral of sim_divisor_frecuencia is

component Divisor_De_Frecuencia
port (
	clk50mhz: 	in STD_LOGIC;
	clk:		out STD_LOGIC
);
end component;

signal CLK,clk_salida: STD_LOGIC;

begin

mi_variable: Divisor_De_Frecuencia PORT MAP(CLK,clk_salida);

reloj: PROCESS
BEGIN
WAIT FOR 100 NS; CLK<='1';
WAIT FOR 100 NS; CLK<='0';
END PROCESS;

end Behavioral;
