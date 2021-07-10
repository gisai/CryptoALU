----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2021 11:42:27 PM
-- Design Name: 
-- Module Name: sim_generadorPrimos - Behavioral
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

entity sim_generadorPrimos is
--  Port ( );
end sim_generadorPrimos;

architecture Behavioral of sim_generadorPrimos is

COMPONENT LFSR
    PORT(CLK: IN STD_LOGIC;
        SWITCH_P: IN STD_LOGIC;
        SWITCH_Q: IN STD_LOGIC;
        reset: IN STD_LOGIC;
        lfsr: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END COMPONENT;
SIGNAL CLK, reset, SWITCH_P, SWITCH_Q: STD_LOGIC;
SIGNAL primos: STD_LOGIC_VECTOR(3 DOWNTO 0);

begin
miVariable: LFSR PORT MAP(CLK,SWITCH_P, SWITCH_Q ,reset, primos);

reloj: PROCESS
BEGIN
WAIT FOR 20 NS; CLK<='1';
WAIT FOR 20 NS; CLK<='0';
END PROCESS;

SWITCH_P<='0', '1' AFTER 700 NS, '0' AFTER 1000 ns;
SWITCH_Q<='0', '1' AFTER 1100 NS, '0' AFTER 1500 ns;
reset<='1', '0' AFTER 500 NS;

end Behavioral;
