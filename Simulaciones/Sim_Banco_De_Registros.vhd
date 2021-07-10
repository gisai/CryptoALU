----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2021 05:22:08 PM
-- Design Name: 
-- Module Name: simBancoDeRegistros - Behavioral
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

entity simBancoDeRegistros is
--  Port ( );
end simBancoDeRegistros;

architecture Behavioral of simBancoDeRegistros is

COMPONENT Banco_De_Registros
        Port ( Clk : in STD_LOGIC;
           RA : in STD_LOGIC_VECTOR (4 downto 0);
           RB : in STD_LOGIC_VECTOR (4 downto 0);
           RW : in STD_LOGIC_VECTOR (4 downto 0);
           busW : in STD_LOGIC_VECTOR (31 downto 0);
           regWR : in STD_LOGIC;
           reset_banco: in STD_LOGIC; 
           busA : inout STD_LOGIC_VECTOR (31 downto 0);
           busB : inout STD_LOGIC_VECTOR (31 downto 0);
           salida_cifrada: out STD_LOGIC_VECTOR(31 DOWNTO 0));
END COMPONENT;
SIGNAL Clk, regWR, reset_banco: STD_LOGIC;
SIGNAL RA, RB, RW: STD_LOGIC_VECTOR(4 downto 0);
SIGNAL busA, busB, salida_cifrada : STD_LOGIC_VECTOR(31 downto 0);
SIGNAL busW: STD_LOGIC_VECTOR(31 downto 0);

begin
miVariable: Banco_De_Registros PORT MAP(Clk, RA, RB, RW, busW, regWR, reset_banco, busA, busB, salida_cifrada);

reloj: PROCESS
BEGIN
Clk<='0'; WAIT FOR 20 NS;
Clk<='1'; WAIT FOR 20 NS;
END PROCESS;

RA<="00000" after 1000 ns;
RB<="00001" after 1000 ns;
reset_banco<='0', '1' AFTER 10000 NS;
regWR<='1', '0' after 700 ns;
RW<="00000";
busW<="11111111111111111111111111111111"; 

end Behavioral;
