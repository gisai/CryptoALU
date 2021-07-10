----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2021 19:28:28
-- Design Name: 
-- Module Name: decodificador3a8 - Behavioral
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

--Decodificador 3:8. Entrada enable activa a nivel bajo.
entity Decodificador_3_a_8 is
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
end Decodificador_3_a_8;

architecture Behavioral of Decodificador_3_a_8 is

begin
--Ecuaciones lógicas obtenidas de la tabla de verdad.
O7<=E AND S2 AND S1 AND S0;
O6<=E AND S2 AND S1 AND (NOT S0);
O5<=E AND S2 AND (NOT S1) AND S0;
O4<=E AND S2 AND (NOT S1) AND (NOT S0);
O3<=E AND (NOT S2) AND S1 AND S0;
O2<=E AND (NOT S2) AND S1 AND (NOT S0);
O1<=E AND (NOT S2) AND (NOT S1) AND S0;
O0<=E AND (NOT S2) AND (NOT S1) AND (NOT S0);

end Behavioral;
