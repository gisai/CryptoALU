----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.05.2021 19:40:23
-- Design Name: 
-- Module Name: ensambaje_tipo_lw - Behavioral
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

entity ensambaje_tipo_lw is
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
end ensambaje_tipo_lw;

architecture Behavioral of ensambaje_tipo_lw is

COMPONENT Mux_2a1_5_bits
    Port ( E1 : in STD_LOGIC_VECTOR (4 downto 0);
           E2 : in STD_LOGIC_VECTOR (4 downto 0);
           F : inout STD_LOGIC_VECTOR (4 downto 0);
           Sel : in STD_LOGIC);
END COMPONENT;

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

COMPONENT Extensor_De_Signo
    Port ( inmed : in STD_LOGIC_VECTOR (15 downto 0);
           salida : inout STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

COMPONENT Mux2a1_32
    Port ( E1 : in STD_LOGIC_VECTOR (31 downto 0);
           E2 : in STD_LOGIC_VECTOR (31 downto 0);
           F : inout STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC);
END COMPONENT;

COMPONENT A_L_U
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Resul : inout STD_LOGIC_VECTOR (31 downto 0);
           zero: out STD_LOGIC);
END COMPONENT;

COMPONENT Memoria_RAM
    PORT(CLK: IN STD_LOGIC;
        MemWrite: IN STD_LOGIC;
        MemRead: IN STD_LOGIC;
        ADRESS: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        DATA_IN: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        DATA_OUT: INOUT STD_LOGIC_VECTOR (31 DOWNTO 0)  );
END COMPONENT;

--Señales correspondientes al extensor de signo.
SIGNAL result_extSigno: STD_LOGIC_VECTOR(31 DOWNTO 0);

--Señales correspondientes al multiplexor de 32 bits_0
SIGNAL result_mux32_0: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL result_mux32_1: STD_LOGIC_VECTOR(31 DOWNTO 0);

--Señales correspondientes al multiplexor de 5 bits
SIGNAL result_mux5bits: STD_LOGIC_VECTOR(4 DOWNTO 0);

--Señales correspondientes a la ALU
SIGNAL result_ALU: STD_LOGIC_VECTOR(31 DOWNTO 0);

--Señales correspondientes al banco de registros
SIGNAL result_busA: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL result_busB: STD_LOGIC_VECTOR(31 DOWNTO 0);

--Señales correspondientes a la meoria de datos
SIGNAL result_mem_datos: STD_LOGIC_VECTOR(31 DOWNTO 0);

begin

--Instanciacion del extensor de Signo
ext_sig: Extensor_De_Signo PORT MAP(inmed, result_extSigno);

--Instanciacion del multiplexor de 2 a 1 32 bits_1
mux32_1: Mux2a1_32 PORT MAP(result_busB, result_extSigno, result_mux32_0, alu_src );
--multiplexor final de la derecha
mux32_2: Mux2a1_32 PORT MAP(result_mem_datos, result_ALU, result_mux32_1, mem_to_reg );

--Instanciacion de la ALU
ALU: A_L_U PORT MAP(result_busA, result_mux32_0, alu_ctrl , result_ALU, zero);

--Instanciacion de la memoria de datos
RAM: Memoria_RAM PORT MAP(CLK, mem_write, mem_read, result_ALU, result_ALU, result_mem_datos);

--Instanciacion del multiplexzor 2 a1 5 bits
mux5: Mux_2a1_5_bits PORT MAP(rt, rd, result_mux5bits, reg_dst);

--Instanciacion del banco de registros
banco: Banco_De_Registros PORT MAP(CLK, rs, rt, result_mux5bits,result_mux32_1 , reg_write, reset, result_busA, result_busB);

salida<=result_busB;

end Behavioral;
