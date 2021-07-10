----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2021 06:09:05 PM
-- Design Name: 
-- Module Name: memoriaDeInstrucciones - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Memoria_De_Instrucciones is
    Port ( Address : in STD_LOGIC_VECTOR (31 downto 0);
           Instruccion : inout STD_LOGIC_VECTOR (31 downto 0));
end Memoria_De_Instrucciones;

architecture Behavioral of Memoria_De_Instrucciones is


    TYPE RAM_16_x_32 IS ARRAY(0 TO 87) OF STD_LOGIC_VECTOR(31 DOWNTO 0);
         
    SIGNAL INST: RAM_16_x_32:=(
    
    x"00000000", --0
    x"00000000", --1
    x"00000000", --2
    x"00000000",
   
    --instruccion 0
    x"8D000000", --0
    x"A6000000", --1
    x"00000000", --2
    x"00000006", --3
    --instruccion 0
      
    --instruccion 1  carga del primer primo en el banco de registros
    x"8D000000", --4
    x"A0000000", --5
    x"00000000", --6
    x"01000000", --7
    --instruccion 1
    
    --instruccion 2    carga del segundo primo en el banco de registros
    x"8D000000", --8
    x"A1000000", --9
    x"00000000", --10
    x"02000000", --11
    --instruccion 2
    
    --instruccion 3   multiplicacion de los 2 primos
    x"00000000", --12
    x"01000000", --13
    x"10000000", --14
    x"22000000", --15
    --instruccion 3
    
    --instruccion 4  guardar en memoria de datos el registro 2 (multiplicacion p*q)
    x"AD000000", --16
    x"A2000000", --17
    x"00000000", --18
    x"03000000", --19
    --instruccion 4
    
    --instruccion 5  primera parte operacion Phi (p-1) 
    x"00000000", --20
    x"0D000000", --21
    x"18000000", --22
    x"21000000", --23
    --instruccion 5
      
    --instruccion 6  segunda parte operacion Phi (q-1)
    x"00000000", --24
    x"2D000000", --25
    x"20000000", --26
    x"21000000", --27
    --instruccion 6
      
    --instruccion 7  Ultimo paso operacion Phi ((p-1)*(q-1))
    x"00000000", --28
    x"64000000", --29
    x"28000000", --30
    x"22000000", --31
    --instruccion 7
      
    --instruccion 8  Carga en memoria de datos del resultado de la operacion phi
    x"AD000000", --32
    x"A5000000", --33
    x"00000000", --34
    x"04000000", --35
    --instruccion 8
      
    --instruccion 9 tipo R para k
    x"00000000", --36
    x"AD000000", --37
    x"38000000", --38
    x"26000000", --39
    --instruccion 9
    
    --instruccion 10 tipo sw para k
    x"AD000000", --40
    x"A7000000", --41
    x"00000000", --42
    x"05000000", --43
    --instruccion 10
    
    --instruccion 11 tipo R para j
    x"00000000", --44
    x"AD000000", --45
    x"40000000", --46
    x"27000000", --47
    --instruccion 11
    
    --instruccion 12 tipo sw para J
    x"AD000000", --48
    x"A8000000", --49
    x"00000000", --50
    x"06000000", --51
    --instruccion 12
          
    --instruccion 14  Elevamos texto en claro a K 
    x"00000000", --56
    x"C7000000", --57 
    x"48000000", --58
    x"24000000", --59
    --instruccion 14
      
    --instruccion 15  Guardamos la operacion de elevacion
    x"AD000000", --60
    x"A9000000", --61
    x"00000000", --62
    x"07000000", --63
    --instruccion 15
      
    --instruccion 16  Operacion resto (texto cifrado)
    x"01000000", --64
    x"22000000", --65
    x"50000000", --66
    x"25000000", --67
    --instruccion 16
      
    --instruccion 17  Guardado del texto cifrado en memoria de datos
    x"AD000000", --68
    x"AA000000", --69
    x"00000000", --70
    x"08000000", --71
    --instruccion 17
      
    --instruccion 18  Elevamos texto crifrado a J
    x"01000000", --72
    x"48000000", --73
    x"58000000", --74
    x"24000000", --75
    --instruccion 18
      
    --instruccion 19  Guardamos operacion de texto claro elevado a J
    x"AD000000", --76
    x"AB000000", --77
    x"00000000", --78
    x"09000000", --79
    --instruccion 19
      
    --instruccion 20 Resto de operacion texto clar elevado a J entre P*Q
    x"01000000", --80
    x"62000000", --81
    x"60000000", --82
    x"25000000", --83
    --instruccion 20
      
    --instruccion 21 carga de numero descifrado en la misma posicion de numero en claro
    x"AD000000", --84
    x"AC000000", --85
    x"00000000", --86
    x"0A000000"  --87
    --instruccion 21
      
          --BIG ENDIAN
    );
    
SIGNAL instruccion_0: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL instruccion_1: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL instruccion_2: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL instruccion_3: STD_LOGIC_VECTOR(31 DOWNTO 0);

begin


instruccion_0<= INST((to_integer(unsigned(Address(6 DOWNTO 0)))));
instruccion_1<= INST((to_integer(unsigned(Address(6 DOWNTO 0)) + 1)));
instruccion_2<= INST((to_integer(unsigned(Address(6 DOWNTO 0)) + 2)));
instruccion_3<= INST((to_integer(unsigned(Address(6 DOWNTO 0)) + 3)));


instruccion(31 DOWNTO 24) <= instruccion_0(31 DOWNTO 24);
instruccion(23 DOWNTO 16) <= instruccion_1(31 DOWNTO 24);
instruccion(15 DOWNTO 8) <= instruccion_2(31 DOWNTO 24);
instruccion(7 DOWNTO 0) <= instruccion_3(31 DOWNTO 24);

end Behavioral;