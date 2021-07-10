----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2021 10:49:46 PM
-- Design Name: 
-- Module Name: ensamblaje_tipo_R - Behavioral
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

entity ensamblaje_tipo_R is
    PORT(CLK: IN STD_LOGIC;
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
end ensamblaje_tipo_R;

architecture Behavioral of ensamblaje_tipo_R is

COMPONENT Banco_De_Registros
    Port ( Clk : in STD_LOGIC;
           RA : in STD_LOGIC_VECTOR (4 downto 0);
           RB : in STD_LOGIC_VECTOR (4 downto 0);
           RW : in STD_LOGIC_VECTOR (4 downto 0);
           busW : in STD_LOGIC_VECTOR (31 downto 0);
           regWR : in STD_LOGIC;
           reset_banco: in STD_LOGIC; 
           busA : inout STD_LOGIC_VECTOR (31 downto 0);
           busB : inout STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

COMPONENT A_L_U
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Resul : inout STD_LOGIC_VECTOR (31 downto 0);
           zero: out STD_LOGIC);
END COMPONENT;

COMPONENT Mux2a1_32
    Port ( E1 : in STD_LOGIC_VECTOR (31 downto 0);
           E2 : in STD_LOGIC_VECTOR (31 downto 0);
           F : inout STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC);
END COMPONENT;

SIGNAL bus_A: STD_LOGIC_VECTOR (31 downto 0);
SIGNAL bus_B: STD_LOGIC_VECTOR (31 downto 0);
SIGNAL salida_aux: STD_LOGIC_VECTOR (31 downto 0);
SIGNAL salida_mux: STD_LOGIC_VECTOR (31 DOWNTO 0);

begin

banco: Banco_De_Registros PORT MAP(CLK, rs, rt, rd, salida_mux, reg_write, reset, bus_A, bus_B);
multiplexsor: Mux2a1_32 PORT MAP(cw, salida_aux, salida_mux, sel);
alu: A_L_U PORT MAP(bus_A, bus_B, alu_ctrl, salida, zero);
salida_aux<=salida;

end Behavioral;
