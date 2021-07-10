----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/22/2021 07:35:48 PM
-- Design Name: 
-- Module Name: sim_controlPrincipal - Behavioral
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

entity sim_controlPrincipal is
--  Port ( );
end sim_controlPrincipal;

architecture Behavioral of sim_controlPrincipal is

COMPONENT Control_Principal
    Port ( op : in STD_LOGIC_VECTOR (5 downto 0);
           RegDst : inout STD_LOGIC;
           Branch : inout STD_LOGIC;
           memRead: inout STD_LOGIC;
           memWrite: inout STD_LOGIC;
           MentoReg : inout STD_LOGIC;
           ALUop : inout STD_LOGIC_VECTOR(1 DOWNTO 0);
           ALUsrc : inout STD_LOGIC;
           RegWrite : inout STD_LOGIC);
END COMPONENT;

SIGNAL op: STD_LOGIC_VECTOR (5 downto 0);
SIGNAL ALUop: STD_LOGIC_VECTOR (1 downto 0);
SIGNAL RegDst, Branch, memRead, memWrite, MentoReg, ALUsrc, RegWrite: STD_LOGIC;

begin
miVariable: Control_Principal PORT MAP(op, RegDst, Branch, memRead, memWrite, MentoReg, ALUop, ALUsrc, RegWrite);

op<="000000", "100011" AFTER 300 NS, "101011" AFTER 600 NS, "000100" AFTER 900 NS;



end Behavioral;
