----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2021 03:48:06 PM
-- Design Name: 
-- Module Name: controlDeALU - Behavioral
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

entity control_ALU is
    Port ( funct : in STD_LOGIC_VECTOR (5 downto 0);
           ALUop : in STD_LOGIC_VECTOR (1 downto 0);
           ALUctrl : inout STD_LOGIC_VECTOR (2 downto 0));
end control_ALU;

architecture Behavioral of control_ALU is


begin

control_ALU: PROCESS(funct, ALUop)
BEGIN
    IF ALUop = "00" THEN
        ALUctrl<="000";
    ELSIF ALUop = "10" THEN
        IF funct = "100000" THEN
            ALUctrl<="000";
        ELSIF funct = "100001" THEN
            ALUctrl<="001";
        ELSIF funct = "100010" THEN
            ALUctrl<="010";
        ELSIF funct = "100011" THEN
            ALUctrl<="011";
        ELSIF funct = "100100" THEN
            ALUctrl<="100";
        ELSIF funct = "100101" THEN
            ALUctrl<="101";
        ELSIF funct = "100110" THEN
            ALUctrl<="110";
        ELSIF funct = "100111" THEN
            ALUctrl<="111";
        END IF;
    END IF;
END PROCESS;

end Behavioral;
