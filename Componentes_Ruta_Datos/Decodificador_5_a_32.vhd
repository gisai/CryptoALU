----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.02.2021 19:59:24
-- Design Name: 
-- Module Name: decodificador5a32 - Behavioral
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

--Decodificador 5:32. Entrada enable activa a nivel bajo.
--Usado en el protocolo de escritura para seleccionar el registro en el que se va a escribir.
entity Decodificador_5_a_32 is
    Port ( E : in STD_LOGIC;
           S4 : in STD_LOGIC;
           S3 : in STD_LOGIC;
           S2 : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           SALIDA : inout STD_LOGIC_VECTOR (31 downto 0));
end Decodificador_5_a_32;

architecture Behavioral of Decodificador_5_a_32 is

--Se usa el componente decodificador 2:4
COMPONENT Decodificador_2_a_4
    Port ( E : in STD_LOGIC;
           S1 : in STD_LOGIC;
           S0 : in STD_LOGIC;
           O3 : inout STD_LOGIC;
           O2 : inout STD_LOGIC;
           O1 : inout STD_LOGIC;
           O0 : inout STD_LOGIC);
END COMPONENT;

--Se usa el componente decodificador 3:8
COMPONENT Decodificador_3_a_8
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
END COMPONENT;

--Declaracion de señales internas necesarias:
SIGNAL salida0, salida1, salida2, salida3: STD_LOGIC;

begin

--Instanciación del decodificador 2 a 4. Sus salidas son las señales internas.
decoder2a4: Decodificador_2_a_4 PORT MAP(E, S4, S3, salida3, salida2, salida1, salida0);

--Instanciación de CUATRO decodificadores 3 a 8. Sus salidas son las del decodificador 5 a 32.
decoder3a8_0: Decodificador_3_a_8 PORT MAP (salida0, S2, S1, S0, SALIDA(7), SALIDA(6), SALIDA(5), SALIDA(4), SALIDA(3), SALIDA(2), SALIDA(1), SALIDA(0));
decoder3a8_1: Decodificador_3_a_8 PORT MAP (salida1, S2, S1, S0, SALIDA(15), SALIDA(14), SALIDA(13), SALIDA(12), SALIDA(11), SALIDA(10), SALIDA(9), SALIDA(8));
decoder3a8_2: Decodificador_3_a_8 PORT MAP (salida2, S2, S1, S0, SALIDA(23), SALIDA(22), SALIDA(21), SALIDA(20), SALIDA(19), SALIDA(18), SALIDA(17), SALIDA(16));
decoder3a8_3: Decodificador_3_a_8 PORT MAP (salida3, S2, S1, S0, SALIDA(31), SALIDA(30), SALIDA(29), SALIDA(28), SALIDA(27), SALIDA(26), SALIDA(25), SALIDA(24));

end Behavioral;
