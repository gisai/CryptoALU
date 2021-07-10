----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/25/2021 05:20:10 PM
-- Design Name: 
-- Module Name: BancoDeRegistros - Behavioral
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

--Con regWR solo escogemos el registro donde vamos a querer escribir
--junto con la salida del decoder dependera la entrada enbale
--de cada uno de ellos.
--No tiene nada que ver con elegir escritura/lectura

entity Banco_De_Registros is
    Port ( Clk : in STD_LOGIC;
           RA : in STD_LOGIC_VECTOR (4 downto 0);
           RB : in STD_LOGIC_VECTOR (4 downto 0);
           RW : in STD_LOGIC_VECTOR (4 downto 0);
           busW : in STD_LOGIC_VECTOR (31 downto 0);
           regWR : in STD_LOGIC;
           reset_banco: in STD_LOGIC; 
           busA : inout STD_LOGIC_VECTOR (31 downto 0);
           busB : inout STD_LOGIC_VECTOR (31 downto 0);
           salida_cifrada: out STD_LOGIC_VECTOR(31 DOWNTO 0));
end Banco_De_Registros;

architecture Behavioral of Banco_De_Registros is

--Declaracion del multiplexor 32 a 1.
COMPONENT mux32a1
    Port ( x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20,x21,x22,x23,x24,x25,x26,x27,x28,x29,x30,x31 : in STD_LOGIC_VECTOR (31 downto 0);
           sel : in STD_LOGIC_VECTOR(4 DOWNTO 0);
           Y : inout STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

--Declaracion del registro de 32 bits.
COMPONENT Registro
    Port ( CLKr : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           Dr : in STD_LOGIC_VECTOR (31 downto 0);
           Qr : inout STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;


COMPONENT Decodificador_5_a_32
    Port ( E : in STD_LOGIC;
           S4 : in STD_LOGIC;
           S3 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           SALIDA : inout STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;


SIGNAL salidas_registro_0: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_1: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_2: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_3: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_4: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_5: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_6: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_7: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_8: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_9: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_10: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_11: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_12: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_13: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_14: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_15: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_16: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_17: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_18: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_19: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_20: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_21: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_22: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_23: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_24: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_25: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_26: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_27: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_28: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_29: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_30: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL salidas_registro_31: STD_LOGIC_VECTOR(31 DOWNTO 0);

SIGNAL enable_registro_0: STD_LOGIC;
SIGNAL enable_registro_1: STD_LOGIC;
SIGNAL enable_registro_2: STD_LOGIC;
SIGNAL enable_registro_3: STD_LOGIC;
SIGNAL enable_registro_4: STD_LOGIC;
SIGNAL enable_registro_5: STD_LOGIC;
SIGNAL enable_registro_6: STD_LOGIC;
SIGNAL enable_registro_7: STD_LOGIC;
SIGNAL enable_registro_8: STD_LOGIC;
SIGNAL enable_registro_9: STD_LOGIC;
SIGNAL enable_registro_10: STD_LOGIC;
SIGNAL enable_registro_11: STD_LOGIC;
SIGNAL enable_registro_12: STD_LOGIC;
SIGNAL enable_registro_13: STD_LOGIC;
SIGNAL enable_registro_14: STD_LOGIC;
SIGNAL enable_registro_15: STD_LOGIC;
SIGNAL enable_registro_16: STD_LOGIC;
SIGNAL enable_registro_17: STD_LOGIC;
SIGNAL enable_registro_18: STD_LOGIC;
SIGNAL enable_registro_19: STD_LOGIC;
SIGNAL enable_registro_20: STD_LOGIC;
SIGNAL enable_registro_21: STD_LOGIC;
SIGNAL enable_registro_22: STD_LOGIC;
SIGNAL enable_registro_23: STD_LOGIC;
SIGNAL enable_registro_24: STD_LOGIC;
SIGNAL enable_registro_25: STD_LOGIC;
SIGNAL enable_registro_26: STD_LOGIC;
SIGNAL enable_registro_27: STD_LOGIC;
SIGNAL enable_registro_28: STD_LOGIC;
SIGNAL enable_registro_29: STD_LOGIC;
SIGNAL enable_registro_30: STD_LOGIC;
SIGNAL enable_registro_31: STD_LOGIC;



SIGNAL salida_decodificador: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL busWaux:STD_LOGIC_VECTOR(31 DOWNTO 0);
begin


--PROBLEMA CON EL ENABLE
--Instanciación del decodificador 5 a 32.
decoder5a32: decodificador_5_a_32 PORT MAP('1', RW(4), RW(3), RW(2), RW(1), RW(0), salida_decodificador);


busWaux<=busW AFTER 10 NS;

--Instanciación de los 32 registros.
enable_registro_0 <= RegWR AND salida_decodificador(0);
registro_0: Registro PORT MAP(Clk, enable_registro_0, reset_banco, busWaux, salidas_registro_0);

enable_registro_1<=RegWR AND salida_decodificador(1);
registro_1: Registro PORT MAP(Clk, enable_registro_1, reset_banco, busWaux, salidas_registro_1);

enable_registro_2<=RegWR AND salida_decodificador(2);
registro_2: Registro PORT MAP(Clk, enable_registro_2, reset_banco, busWaux, salidas_registro_2);

enable_registro_3<=RegWR AND salida_decodificador(3);
registro_3: Registro PORT MAP(Clk, enable_registro_3, reset_banco, busWaux, salidas_registro_3);

enable_registro_4<=RegWR AND salida_decodificador(4);
registro_4: Registro PORT MAP(Clk, enable_registro_4, reset_banco, busWaux, salidas_registro_4);

enable_registro_5<=RegWR AND salida_decodificador(5);
registro_5: Registro PORT MAP(Clk, enable_registro_5, reset_banco, busWaux, salidas_registro_5);

enable_registro_6<=RegWR AND salida_decodificador(6);
registro_6: Registro PORT MAP(Clk, enable_registro_6, reset_banco, busWaux, salidas_registro_6);

enable_registro_7<=RegWR AND salida_decodificador(7);
registro_7: Registro PORT MAP(Clk, enable_registro_7, reset_banco, busWaux, salidas_registro_7);

enable_registro_8<=RegWR AND salida_decodificador(8);
registro_8: Registro PORT MAP(Clk, enable_registro_8, reset_banco, busWaux, salidas_registro_8);

enable_registro_9<=RegWR AND salida_decodificador(9);
registro_9: Registro PORT MAP(Clk, enable_registro_9, reset_banco, busWaux, salidas_registro_9);

enable_registro_10<=RegWR AND salida_decodificador(10);
registro_10: Registro PORT MAP(Clk, enable_registro_10, reset_banco, busWaux, salidas_registro_10);
salida_cifrada<=salidas_registro_10;

enable_registro_11<=RegWR AND salida_decodificador(11);
registro_11: Registro PORT MAP(Clk, enable_registro_11, reset_banco, busWaux, salidas_registro_11);

enable_registro_12<=RegWR AND salida_decodificador(12);
registro_12: Registro PORT MAP(Clk, enable_registro_12, reset_banco, busWaux, salidas_registro_12);

enable_registro_13<=RegWR AND salida_decodificador(13);
registro_13: Registro PORT MAP(Clk, enable_registro_13, reset_banco, busWaux, salidas_registro_13);

enable_registro_14<=RegWR AND salida_decodificador(14);
registro_14: Registro PORT MAP(Clk, enable_registro_14, reset_banco, busWaux, salidas_registro_14);

enable_registro_15<=RegWR AND salida_decodificador(15);
registro_15: Registro PORT MAP(Clk, enable_registro_15, reset_banco, busWaux, salidas_registro_15);

enable_registro_16<=RegWR AND salida_decodificador(16);
registro_16: Registro PORT MAP(Clk, enable_registro_16, reset_banco, busWaux, salidas_registro_16);

enable_registro_17<=RegWR AND salida_decodificador(17);
registro_17: Registro PORT MAP(Clk, enable_registro_17, reset_banco, busWaux, salidas_registro_17);

enable_registro_18<=RegWR AND salida_decodificador(18);
registro_18: Registro PORT MAP(Clk, enable_registro_18, reset_banco, busWaux, salidas_registro_18);

enable_registro_19<=RegWR AND salida_decodificador(19);
registro_19: Registro PORT MAP(Clk, enable_registro_19, reset_banco, busWaux, salidas_registro_19);

enable_registro_20<=RegWR AND salida_decodificador(20);
registro_20: Registro PORT MAP(Clk, enable_registro_20, reset_banco, busWaux, salidas_registro_20);

enable_registro_21<=RegWR AND salida_decodificador(21);
registro_21: Registro PORT MAP(Clk, enable_registro_21, reset_banco, busWaux, salidas_registro_21);

enable_registro_22<=RegWR AND salida_decodificador(22);
registro_22: Registro PORT MAP(Clk, enable_registro_22, reset_banco, busWaux, salidas_registro_22);

enable_registro_23<=RegWR AND salida_decodificador(23);
registro_23: Registro PORT MAP(Clk, enable_registro_23, reset_banco, busWaux, salidas_registro_23);

enable_registro_24<=RegWR AND salida_decodificador(24);
registro_24: Registro PORT MAP(Clk, enable_registro_24, reset_banco, busWaux, salidas_registro_24);

enable_registro_25<=RegWR AND salida_decodificador(25);
registro_25: Registro PORT MAP(Clk, enable_registro_25, reset_banco, busWaux, salidas_registro_25);

enable_registro_26<=RegWR AND salida_decodificador(26);
registro_26: Registro PORT MAP(Clk, enable_registro_26, reset_banco, busWaux, salidas_registro_26);

enable_registro_27<=RegWR AND salida_decodificador(27);
registro_27: Registro PORT MAP(Clk, enable_registro_27, reset_banco, busWaux, salidas_registro_27);

enable_registro_28<=RegWR AND salida_decodificador(28);
registro_28: Registro PORT MAP(Clk, enable_registro_28, reset_banco, busWaux, salidas_registro_28);

enable_registro_29<=RegWR AND salida_decodificador(29);
registro_29: Registro PORT MAP(Clk, enable_registro_29, reset_banco, busWaux, salidas_registro_29);

enable_registro_30<=RegWR AND salida_decodificador(30);
registro_30: Registro PORT MAP(Clk, enable_registro_30, reset_banco, busWaux, salidas_registro_30);

enable_registro_31<=RegWR AND salida_decodificador(31);
registro_31: Registro PORT MAP(Clk, enable_registro_31, reset_banco, busWaux, salidas_registro_31);




--Instanciación de los dos multiplexores.
mux32a1_0: mux32a1 PORT MAP(salidas_registro_0, salidas_registro_1, salidas_registro_2, salidas_registro_3, salidas_registro_4, salidas_registro_5, salidas_registro_6, salidas_registro_7, salidas_registro_8, salidas_registro_9, salidas_registro_10, salidas_registro_11, salidas_registro_12, salidas_registro_13, salidas_registro_14, salidas_registro_15, salidas_registro_16, salidas_registro_17, salidas_registro_18, salidas_registro_19, salidas_registro_20, salidas_registro_21, salidas_registro_22, salidas_registro_23, salidas_registro_24, salidas_registro_25, salidas_registro_26, salidas_registro_27, salidas_registro_28, salidas_registro_29, salidas_registro_30, salidas_registro_31, RA, busA);
mux32a1_1: mux32a1 PORT MAP(salidas_registro_0, salidas_registro_1, salidas_registro_2, salidas_registro_3, salidas_registro_4, salidas_registro_5, salidas_registro_6, salidas_registro_7, salidas_registro_8, salidas_registro_9, salidas_registro_10, salidas_registro_11, salidas_registro_12, salidas_registro_13, salidas_registro_14, salidas_registro_15, salidas_registro_16, salidas_registro_17, salidas_registro_18, salidas_registro_19, salidas_registro_20, salidas_registro_21, salidas_registro_22, salidas_registro_23, salidas_registro_24, salidas_registro_25, salidas_registro_26, salidas_registro_27, salidas_registro_28, salidas_registro_29, salidas_registro_30, salidas_registro_31, RB, busB);



end Behavioral;
