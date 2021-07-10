----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2021 05:45:49 PM
-- Design Name: 
-- Module Name: simSumador1bit - Behavioral
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

entity simSumador1bit is
--  Port ( );
end simSumador1bit;

architecture Behavioral of simSumador1bit is

COMPONENT sumador1bit
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin: in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : inout STD_LOGIC);
END COMPONENT;

Signal A,B,Cin,S,Cout: STD_LOGIC;

begin
miVariable: sumador1bit PORT MAP(A, B, Cin, S, Cout);

A<='0', '1' AFTER 50 NS, '0' AFTER 100 NS, '1' AFTER 200 NS;
B<='0', '1' AFTER 50 NS, '0' AFTER 100 NS, '1' AFTER 200 NS, '0' AFTER 250 NS;
Cin<='0', '1' AFTER 200 NS;

end Behavioral;
