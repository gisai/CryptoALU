----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2021 07:26:23 PM
-- Design Name: 
-- Module Name: desplazador - Behavioral
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

entity Desplazador is
    Generic(
        N: INTEGER:=2;
        W: INTEGER:=32
    );
    Port ( entrada : in STD_LOGIC_VECTOR (W-1 downto 0);
           salida : inout STD_LOGIC_VECTOR (W-1 downto 0));
end Desplazador;

architecture Behavioral of Desplazador is

begin

    salida(W - 1)          <= entrada(W - 1);
	salida(W - 2 DOWNTO N) <= entrada(W - 2 - N DOWNTO 0);
	salida(N - 1 DOWNTO 0) <= (OTHERS => '0');

end Behavioral;
