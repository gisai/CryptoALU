----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.05.2021 18:03:58
-- Design Name: 
-- Module Name: sim_bloque_operaciones_tipo_lw - Behavioral
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

entity sim_bloque_operaciones_tipo_lw is
--  Port ( );
end sim_bloque_operaciones_tipo_lw;

architecture Behavioral of sim_bloque_operaciones_tipo_lw is

component ensambaje_tipo_lw
    Port ( CLK : in STD_LOGIC;
         reset: IN STD_LOGIC;
         rs: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
         rt: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
         rd: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
         reg_dst: IN STD_LOGIC;
         reg_write: IN STD_LOGIC;
         alu_src: IN STD_LOGIC;
         inmed: IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         alu_ctrl: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
         mem_write: IN STD_LOGIC;
         mem_read: IN STD_LOGIC;
         mem_to_reg: IN STD_LOGIC;
         salida: OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
         zero: OUT STD_LOGIC);
end component;

signal CLK: STD_LOGIC;
signal reset, reg_dst,reg_write,alu_src,mem_write,mem_read, mem_to_reg,zero: STD_LOGIC;
signal rs, rt, rd: STD_LOGIC_VECTOR(4 DOWNTO 0);
signal salida: STD_LOGIC_VECTOR(31 DOWNTO 0);
signal inmed: STD_LOGIC_VECTOR(15 DOWNTO 0);
signal alu_ctrl: STD_LOGIC_VECTOR(2 DOWNTO 0);

begin

mi_variable_lw: ensambaje_tipo_lw PORT MAP(CLK, reset, rs, rt, rd, reg_dst, reg_write, alu_src, inmed, alu_ctrl, mem_write, mem_read, mem_to_reg, salida, zero);


reloj: PROCESS
BEGIN
WAIT FOR 20 NS; CLK<='1';
WAIT FOR 20 NS; CLK<='0';
END PROCESS;

reset<='1', '0' after 20ns;
reg_dst<='1';
alu_src<='1';
alu_ctrl<="000";
mem_write<='0';
mem_read<='1';
mem_to_reg<='0';  --cuidado con lo que tenemos en la tabla de seguimiento

reg_write<='0', '1' after 100ns;

--se va a usar como registro destino rd pero en realidad es rt ojito con eso
rs<="00100", "00111" after 550ns;
rt<="00010","00001" after 900ns;
rd<="00010", "00001" after 600ns; --"00001" after 300ns;
inmed<=x"0001",x"0002" after 550ns;

end Behavioral;
