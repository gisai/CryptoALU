----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.02.2021 12:58:53
-- Design Name: 
-- Module Name: ALU - Behavioral
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
USE IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity A_L_U is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Resul : inout STD_LOGIC_VECTOR (31 downto 0);
           zero: out STD_LOGIC);
end A_L_U;

architecture Behavioral of A_L_U is

SIGNAL signalAUX: STD_LOGIC_VECTOR(31 DOWNTO 0); --Señar auxiliar interna
SIGNAL signalAUX_bucle: STD_LOGIC_VECTOR(31 DOWNTO 0); --Señar auxiliar interna
SIGNAL aux_A: INTEGER;

type k is array (0 to 1) of std_logic_vector(31 downto 0); --Para los posibles valores de K
type j is array (0 to 2) of std_logic_vector(31 downto 0); --Para los posibles valores de J

SIGNAL valoresK: k :=( --Para los posibles valores de K
    x"00000005",
    x"00000007"
);

SIGNAL valoresJ: j :=( --Para los posibles valores de J
    x"00000005",
    x"00000007",
    x"00000001"
);

begin
PROCESS(A,B,Sel)
Variable Control_Bucle: BOOLEAN:=FALSE;
Variable CONTADOR: INTEGER:=0;
BEGIN
    CASE Sel IS
        WHEN "000"  =>
            signalAUX<=std_logic_vector(unsigned(A)+unsigned(B));  --SUMA
        WHEN "001"  =>
            signalAUX<=std_logic_vector(unsigned(A)-1);  --RESTA
        WHEN "010"  =>
            signalAUX<=std_logic_vector(to_unsigned(to_integer(unsigned(A))*to_integer(unsigned(B)),32)); --MULTIPLICACIÓN
        WHEN "011"  =>
            signalAUX<=std_logic_vector(unsigned(A) mod unsigned(B));  --MÓDULO
        WHEN "100"  =>
            IF B = x"00000007" THEN
                signalAux<=std_logic_vector(to_unsigned(to_integer(unsigned(A))*to_integer(unsigned(A))*to_integer(unsigned(A))*to_integer(unsigned(A))*to_integer(unsigned(A))*to_integer(unsigned(A))*to_integer(unsigned(A)),32));
            ELSIF B = x"00000003" THEN
                signalAux<=std_logic_vector(to_unsigned(to_integer(unsigned(A))*to_integer(unsigned(A))*to_integer(unsigned(A)),32));
            END IF;
        WHEN "101"  =>
            signalAUX<= std_logic_vector(unsigned(A) REM unsigned(B));  --CALCULAR EL RESTO.
        WHEN "110"  => --USADO PARA GENERAR K 
            IF A = x"00000008" THEN
                signalAux<=valoresK(0);
            ELSIF A = x"0000000C" THEN
                signalAux<=valoresK(1);
            ELSIF A = x"00000018" THEN
                signalAux<=valoresK(0);
            ELSIF A = x"00000010" THEN
                signalAux<=valoresK(1);
            ELSIF A = x"00000004" THEN
                signalAux<=x"00000005";
            ELSIF A = x"00000014" THEN
                signalAux<=x"00000007";    
            END IF;
        WHEN "111"  => --USADO PARA GENERAR j
            IF A = x"00000008" THEN
                signalAux<=valoresJ(0);
            ELSIF A = x"0000000C" THEN
                signalAux<=valoresJ(1);
            ELSIF A = x"00000018" THEN
                signalAux<=valoresJ(0);
            ELSIF A = x"00000010" THEN
                signalAux<=valoresK(1);
            ELSIF A = x"00000004" THEN
                signalAux<=x"00000001";
            ELSIF A = x"00000014" THEN
                signalAux<=x"00000003";    
            END IF;
        WHEN others => NULL;
        signalAux<=x"00000000";
     END CASE;
END PROCESS;

Resul<=signalAux;
zero <= '1' WHEN signalAux = x"00000000" ELSE
	    '0';
	    
end Behavioral;