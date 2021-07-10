----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/25/2021 01:03:09 PM
-- Design Name: 
-- Module Name: sim_bloque_operaciones_TIPO_R - Behavioral
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

entity sim_bloque_operaciones_TIPO_R is
--  Port ( );
end sim_bloque_operaciones_TIPO_R;

architecture Behavioral of sim_bloque_operaciones_TIPO_R is

COMPONENT ensamblaje_tipo_R
    Port ( CLK: IN STD_LOGIC;
         reset: IN STD_LOGIC;
         rs: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
         rt: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
         rd: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
         cw: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
         sel: IN STD_LOGIC;
         reg_write: IN STD_LOGIC;
         alu_ctrl: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         salida: INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         zero: OUT STD_LOGIC);
END COMPONENT;

SIGNAL CLK, RESET, reg_write: STD_LOGIC;
SIGNAL rs, rt, rd: STD_LOGIC_VECTOR (4 downto 0);
SIGNAL alu_ctrl: STD_LOGIC_VECTOR (2 downto 0);
SIGNAL salida, cw: STD_LOGIC_VECTOR (31 downto 0);
SIGNAL zero, sel: STD_LOGIC;


begin
miVariable: ensamblaje_tipo_R PORT MAP(CLK, reset, rs, rt, rd, cw, sel, reg_write, alu_ctrl, salida, zero);

reloj: PROCESS
BEGIN
WAIT FOR 20 NS; CLK<='1';
WAIT FOR 20 NS; CLK<='0';
END PROCESS;

RESET<='1', '0' after 50ns;

rs<="00000","00001" after 600ns;
rt<="00001","00010" after 600ns;
rd<="00000" after 100ns, "00001" after 200ns, "00011" after 300ns, "00010" after 500ns,"00100" after 700ns;
sel<='0','1' after 500ns; 
cw<=x"00000001" after 100ns, x"00000002" after 200ns, x"00000003" after 300ns;
reg_write<='1','0' after 550ns,'1' after 700ns;

alu_ctrl<="000","001" after 700ns;

end Behavioral;
