----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/26/2021 10:41:49 PM
-- Design Name: 
-- Module Name: LFSR_4bits - Behavioral
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

entity LFSR is
    PORT(CLK: IN STD_LOGIC;
        SWITCH_P: IN STD_LOGIC;
        SWITCH_Q: IN STD_LOGIC;
        reset: IN STD_LOGIC;
        lfsr: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end LFSR;

architecture Behavioral of LFSR is

begin

proceso_primos: PROCESS(SWITCH_P, SWITCH_Q, RESET)
BEGIN
    IF RESET = '1' THEN
        lfsr<="0000";
    ELSE
        IF SWITCH_P = '1' THEN
            lfsr<="0011";
        ELSIF SWITCH_Q = '1' THEN
            lfsr<="1011";
        ELSE
            lfsr<="0000";
        END IF;
    END IF;
END PROCESS;

end Behavioral;
