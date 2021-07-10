----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/23/2021 07:23:08 PM
-- Design Name: 
-- Module Name: simCtrlALU - Behavioral
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

entity simCtrlALU is
--  Port ( );
end simCtrlALU;

architecture Behavioral of simCtrlALU is

COMPONENT control_ALU
    Port ( funct : in STD_LOGIC_VECTOR (5 downto 0);
           ALUop : in STD_LOGIC_VECTOR (1 downto 0);
           ALUctrl : inout STD_LOGIC_VECTOR (2 downto 0));
END COMPONENT;
SIGNAL Funct: STD_LOGIC_VECTOR(5 downto 0);
SIGNAL ALUop: STD_LOGIC_VECTOR (1 downto 0);
SIGNAL ctrlALU: STD_LOGIC_VECTOR(2 downto 0);

begin
miVariable: control_ALU PORT MAP(Funct, ALUop,ctrlALU);

ALUop<="00", "01" AFTER 100 NS, "10" AFTER 200 NS, "11" AFTER 600 NS;
Funct<="100000", "100001" after 200 ns, "100010" after 400 ns, "100011" after 600 ns,"100100" after 800 ns,"100101" after 1000 ns, "100110" after 1200 ns,"100111" after 1400 ns;

end Behavioral;
