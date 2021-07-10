----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2021 19:04:18
-- Design Name: 
-- Module Name: simDecodificador2a4 - Behavioral
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

entity simDecodificador2a4 is
--  Port ( );
end simDecodificador2a4;

architecture Behavioral of simDecodificador2a4 is

COMPONENT Decodificador_2_a_4
    Port ( E : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           O3 : inout STD_LOGIC;
           O2 : inout STD_LOGIC;
           O1 : inout STD_LOGIC;
           O0 : inout STD_LOGIC);
END COMPONENT;

SIGNAL E, S1, S0, O3, O2, O1, O0: STD_LOGIC;

begin

miVariable: Decodificador_2_a_4 PORT MAP(E, S1, S0, O3, O2, O1, O0);

E<='1', '0' AFTER 500 NS;
S1<='0', '1' AFTER 200 NS;
S0<='0', '1' AFTER 100 NS;

end Behavioral;
