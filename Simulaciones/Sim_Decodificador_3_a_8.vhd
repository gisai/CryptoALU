----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2021 19:33:33
-- Design Name: 
-- Module Name: simDecodificador3a8 - Behavioral
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

entity simDecodificador3a8 is
--  Port ( );
end simDecodificador3a8;

architecture Behavioral of simDecodificador3a8 is

COMPONENT Decodificador_3_a_8
    Port ( E : in STD_LOGIC;
           S2 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           O7 : inout STD_LOGIC;
           O6 : inout STD_LOGIC;
           O5 : inout STD_LOGIC;
           O4 : inout STD_LOGIC;
           O3 : inout STD_LOGIC;
           O2 : inout STD_LOGIC;
           O1 : inout STD_LOGIC;
           O0 : inout STD_LOGIC);
END COMPONENT;

SIGNAL E, S2, S1, S0, O7, O6, O5, O4, O3, O2, O1, O0: STD_LOGIC;

begin
miVariable: Decodificador_3_a_8 PORT MAP(E, S2, S1, S0, O7, O6, O5, O4, O3, O2, O1, O0);

E<='1', '0' AFTER 1000 NS;
S2<='0', '1' AFTER 600 NS;
S1<='0', '1' AFTER 250 NS, '0' AFTER 350 NS, '1' AFTER 500 NS;
S0<='0', '1' AFTER 150 NS, '0' AFTER 250 MS, '0' AFTER 400 NS; 


end Behavioral;