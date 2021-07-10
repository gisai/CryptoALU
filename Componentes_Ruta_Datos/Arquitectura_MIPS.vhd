----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2021 07:41:47 PM
-- Design Name: 
-- Module Name: Arquitectura_MIPS - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Arquitectura_MIPS is
Port (  --ENTRADAS Y SALIDAS DE NUESTRO BLOQUE FINAL
          RESET_GLOBAL: IN STD_LOGIC ; --A FALTA DE VER DE QUE FORMA SE HACE EL RESETEO
          CLK_GLOBAL: IN STD_LOGIC; --W5
          SWITCH_V16: IN STD_LOGIC; --PARA GEENERAR EL PRIMO P DEL ALGORITMO
          SWITCH_V17: IN STD_LOGIC; --PARA GEENERAR EL PRIMO Q DEL ALGORITMO
          SWITCHES_TEXTO_CLARO: IN STD_LOGIC_VECTOR(3 DOWNTO 0); --PARA GENERAR EL NÚMERO EN CLARO. (R2, T1, U1, W2).
          SWITCH_ENVIO_TEXTO_CLARO: IN STD_LOGIC; --PARA OONTROLAR EL ENVÍO DEL TEXTO EN CLARO. (R3).
          ACTIVACION_DISPLAYS: OUT STD_LOGIC_VECTOR(3 DOWNTO 0); --CONTROLAR COMO ACTIVAR/DESACTIVAR DÍGITOS.
          ACTIVACION_PUNTOS: OUT STD_LOGIC;
          SALIDA_SEGMENTOS: OUT STD_LOGIC_VECTOR(6 DOWNTO 0); --DECODIFICADOR DE NUMERO A 7 SEGMENTOS
          SALIDA_ACTIVACION_LEDS: OUT STD_LOGIC_VECTOR(2 DOWNTO 0)); --PARA ENCENDER LEDS (U3, E19, U16)
          --ENTRADAS Y SALIDAS DE NUESTRO BLOQUE FINAL   
end Arquitectura_MIPS;

architecture Behavioral of Arquitectura_MIPS is

--Declaración de todos los componentes que van a formar parte de la ruta de datos.

--Declaración del contador de programa.
COMPONENT Contador_De_Programa is
    Port ( CLK : in STD_LOGIC;
           Reset: in STD_LOGIC;
           Entrada : in STD_LOGIC_VECTOR (31 downto 0);
           Salida : inout STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

--Señales correspondientes al contador de programa.
SIGNAL result_PC: STD_LOGIC_VECTOR(31 DOWNTO  0);
SIGNAL control_reset_cp: STD_LOGIC;


--Declaración del divisor de frecuencia.
COMPONENT Divisor_De_Frecuencia is
port (
	clk50mhz: 	in STD_LOGIC;
	clk:		out STD_LOGIC
);
end COMPONENT;

--Señales correspondientes al divisor de frecuencia
SIGNAL CLK: STD_LOGIC;


--Declaración del sumador mas 4.
COMPONENT Sumador_Mas_4
    Port ( Entrada : in STD_LOGIC_VECTOR (31 downto 0);
           Salida: inout STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

--Señales correspondientes al sumador mas 4.
SIGNAL result_sum4: STD_LOGIC_VECTOR(31 DOWNTO 0);


--Declaración del desplazador.
COMPONENT Desplazador is
    Generic(
        N: INTEGER:=2;
        W: INTEGER:=32
    );
    Port ( entrada : in STD_LOGIC_VECTOR (W-1 downto 0);
           salida : inout STD_LOGIC_VECTOR (W-1 downto 0));
end COMPONENT;

--Señales correspondientes al desplazador.
SIGNAL result_desplazador: STD_LOGIC_VECTOR(31 DOWNTO 0);


--Declaración del extensor de signo.
COMPONENT Extensor_De_Signo is
    Port ( inmed : in STD_LOGIC_VECTOR (15 downto 0);
           salida : inout STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

--Señales correspondientes al extensor de signo.
SIGNAL result_extSigno: STD_LOGIC_VECTOR(31 DOWNTO 0);


--Declaración de la unidad aritmético lógica.
COMPONENT A_L_U
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC_VECTOR (2 downto 0);
           Resul : inout STD_LOGIC_VECTOR (31 downto 0);
           zero: out STD_LOGIC);
end COMPONENT;

--Señales correspondientes a la unidad aritmético lógica.
SIGNAL result_ALU: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL result_zero: STD_LOGIC;


--Declaración del control principal.
COMPONENT Control_Principal
    Port ( op : in STD_LOGIC_VECTOR (5 downto 0);
           RegDst : inout STD_LOGIC;
           Branch : inout STD_LOGIC;
           memRead: inout STD_LOGIC;
           memWrite: inout STD_LOGIC;
           MentoReg : inout STD_LOGIC;
           ALUop : inout STD_LOGIC_VECTOR(1 DOWNTO 0);
           ALUsrc : inout STD_LOGIC;
           RegWrite : inout STD_LOGIC);
end COMPONENT;

--Señales correspondientes a control principal.
SIGNAL result_Reg_Dst: STD_LOGIC;
SIGNAL result_Branch: STD_LOGIC;
SIGNAL result_Mem_Read: STD_LOGIC;
SIGNAL result_Mento_Reg: STD_LOGIC;
SIGNAL result_ALU_OP: STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL result_Mem_Write: STD_LOGIC;
SIGNAL result_ALU_src: STD_LOGIC;
SIGNAL result_Reg_Write: STD_LOGIC;


--Declaración del control ALU.
COMPONENT control_ALU is
    Port ( funct : in STD_LOGIC_VECTOR (5 downto 0);
           ALUop : in STD_LOGIC_VECTOR (1 downto 0);
           ALUctrl : inout STD_LOGIC_VECTOR (2 downto 0));
end COMPONENT;

--Señales correspondientes a control ALU.
SIGNAL result_control_ALU: STD_LOGIC_VECTOR(2 DOWNTO 0);


--Declaración de la memoria de instrucciones.
COMPONENT Memoria_De_Instrucciones is
    Port ( Address : in STD_LOGIC_VECTOR (31 downto 0);
           Instruccion : inout STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

--Señales correspondientes a la memoria de instrucciones.
SIGNAL result_mem_instrucciones: STD_LOGIC_VECTOR(31 DOWNTO 0);


--Declaración de la memoria RAM.
COMPONENT Memoria_RAM
PORT(
     CLK: IN STD_LOGIC;
     MemWrite: IN STD_LOGIC;
     MemRead: IN STD_LOGIC;
     ADRESS: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
     DATA_IN: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
     DATA_OUT: INOUT STD_LOGIC_VECTOR (31 DOWNTO 0)
);
END COMPONENT;

--Señales correspondientes a la memoria RAM.
SIGNAL result_mem_datos: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL control_escritura: STD_LOGIC;
SIGNAL salida_posicion_texto_cifrado: STD_LOGIC_VECTOR(31 DOWNTO 0):=x"00000000";


--Declaración del banco de registros.
COMPONENT Banco_De_Registros is
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
end COMPONENT;

--Señales correspondientes al banco de registros.
SIGNAL result_busA: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL result_busB: STD_LOGIC_VECTOR(31 DOWNTO 0);


--Declaración del LFSR.
COMPONENT LFSR
    PORT(CLK: IN STD_LOGIC;
        SWITCH_P: IN STD_LOGIC;
        SWITCH_Q: IN STD_LOGIC;
        reset: IN STD_LOGIC;
        lfsr: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0));
end COMPONENT;

--Señales correspondientes al LFSR.
SIGNAL result_LFSR: STD_LOGIC_VECTOR(3 DOWNTO 0);


--Declaración del full sumador.
COMPONENT sumador32bits
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           S : out STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

--Señales correspondientes al sumador de 32 bits
SIGNAL result_full_sumador: STD_LOGIC_VECTOR(31 DOWNTO 0);


--Declaración del multiplexor 2 a 1 de 5 bits.
COMPONENT Mux_2a1_5_bits
    Port ( E1 : in STD_LOGIC_VECTOR (4 downto 0);
           E2 : in STD_LOGIC_VECTOR (4 downto 0);
           F : inout STD_LOGIC_VECTOR (4 downto 0);
           Sel : in STD_LOGIC);
end COMPONENT;

--Señales correspondientes al multiplexor 2 a 1 de 5 bits.
SIGNAL result_mux5bits: STD_LOGIC_VECTOR(4 DOWNTO 0);


--Declaración bloque control ADDR.
COMPONENT bloque_control_ADDR
    Port ( salida_ALU: in STD_LOGIC_VECTOR (31 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           sw11: in STD_LOGIC;
           salida : inout STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

--Señales correspondientes al bloque control ADDR.
SIGNAL result_addr: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL sel_aux: STD_LOGIC_VECTOR(1 DOWNTO 0);


--Declaración del registro del texto en claro.
COMPONENT Registro_Texto_Claro
    Port ( clk : in STD_LOGIC;
           sw12 : in STD_LOGIC;
           sw13 : in STD_LOGIC;
           sw14 : in STD_LOGIC;
           sw15 : in STD_LOGIC;
           salida : inout STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

--Señales correspondientes al registro del texto en claro.
SIGNAL salida_texto: STD_LOGIC_VECTOR(31 DOWNTO 0);


--Declaración del multiplexor 2 a 1 de 32 bits.
COMPONENT Mux2a1_32
    Port ( E1 : in STD_LOGIC_VECTOR (31 downto 0);
           E2 : in STD_LOGIC_VECTOR (31 downto 0);
           F : inout STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC);
end COMPONENT;

--Señales correspondientes al multiplexor de 32 bits
SIGNAL result_mux32_0: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL controlador_mux_0: STD_LOGIC;
SIGNAL result_mux32_1: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL result_mux32_2: STD_LOGIC_VECTOR(31 DOWNTO 0);

--Declaración del multiplexor para controlar la entrada DW de la memoria de datos.
COMPONENT mux_control_DW
    Port ( E0 : in STD_LOGIC_VECTOR (31 downto 0);
           E1 : in STD_LOGIC_VECTOR (31 downto 0);
           Sel : in STD_LOGIC;
           Salida : inout STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

--Señales correspondientes al multiplexor para controlar la entrada DW de la memoria de datos.
SIGNAL salida_mux_DW: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL sel_mux_DW: STD_LOGIC;
SIGNAL aux_E1_DW: STD_LOGIC_VECTOR(31 DOWNTO 0):=x"00000000";

--Señales correspondientes a mux_control_texto
SIGNAL salida_mux_control_texto: STD_LOGIC_VECTOR(31 DOWNTO 0);

--Otras señales auxiliares.
SIGNAL sw_1_OK: STD_LOGIC:='0';
SIGNAL sw_2_OK: STD_LOGIC:='0';
SIGNAL sw_texto_claro_ok: STD_LOGIC:='0';
SIGNAL AUX_LED_U3: STD_LOGIC:='1';
SIGNAL AUX_LED_E19: STD_LOGIC:='0';
SIGNAL AUX_LED_U16: STD_LOGIC:='0';
SIGNAL igual: STD_LOGIC_VECTOR(6 DOWNTO 0):="1110110";
SIGNAL P: STD_LOGIC_VECTOR(6 DOWNTO 0):="0011000";
SIGNAL E: STD_LOGIC_VECTOR(6 DOWNTO 0):="0110000";
SIGNAL cuenta: INTEGER range 0 to 100000;
SIGNAL seleccion: STD_LOGIC_VECTOR(1 DOWNTO 0):="00";
SIGNAL mostrar: STD_LOGIC_VECTOR(3 DOWNTO 0):="0000";
SIGNAL Num1: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL Num2: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL Num1_aux: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL Num2_aux: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL Num1_pos8: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL Num2_pos8: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL Num1_pos8_aux: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL Num2_pos8_aux: STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL ACTIVAR_CAMBIO_DISPLAY: STD_LOGIC:='0';



--Declaración del registro auxiliar
COMPONENT registro_to_displays
  Port (ENTRADA: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        SALIDA: INOUT STD_LOGIC_VECTOR(31 DOWNTO 0));
end COMPONENT;

--Señales correspondientes al registro auxiliar.
SIGNAL salida_to_display: STD_LOGIC_VECTOR(31 DOWNTO 0);


begin

--Instanciación del contador de programa.
control_reset_cp<=(sw_1_OK AND sw_2_OK AND sw_texto_claro_ok) OR RESET_GLOBAL;
CP: Contador_De_Programa PORT MAP(CLK, control_reset_cp, result_mux32_0, result_PC);

--Instanciación del divisor de frecuencia.
divisor_frecuencia: Divisor_De_Frecuencia PORT MAP(CLK_GLOBAL, CLK);

--Instanciación del sumador mas 4.
sum_4: Sumador_Mas_4 PORT MAP(result_PC, result_sum4);

--Instanciación del desplazador
desp: Desplazador PORT MAP(result_extSigno, result_desplazador);

--Instanciación del extensor de signo.
extensor: Extensor_De_Signo PORT MAP(result_mem_instrucciones(15 DOWNTO 0),result_extSigno);

--Instanciación de la unidad aritmético lógica.
ALU: A_L_U PORT MAP(result_busA, result_mux32_1, result_control_ALU, result_ALU, result_zero);

--Instanciación del control principal.
control_ppal: Control_Principal PORT MAP(result_mem_instrucciones(31 DOWNTO 26), result_Reg_Dst, result_Branch, result_Mem_Read, result_Mem_Write, result_Mento_Reg, result_ALU_OP, result_ALU_src, result_Reg_Write);

--Instanciación del control ALU.
ALU_control: control_ALU PORT MAP(result_mem_instrucciones(5 DOWNTO 0), result_ALU_OP, result_control_ALU);

--Instanciación de la memoria de instrucciones
mem_Instrucciones: Memoria_De_Instrucciones PORT MAP(result_PC, result_mem_instrucciones);

--Instanciación de la memoria RAM.
control_escritura<=result_Mem_Write OR SWITCH_V16 OR  SWITCH_V17 OR SWITCH_ENVIO_TEXTO_CLARO;
RAM: Memoria_RAM PORT MAP(CLK_GLOBAL, control_escritura ,result_Mem_Read, result_addr, salida_mux_control_texto, result_mem_datos);

--Instanciación del banco de registros.
banco_registros: Banco_De_Registros PORT MAP(CLK_GLOBAL, result_mem_instrucciones(25 DOWNTO 21), result_mem_instrucciones(20 DOWNTO 16), result_mux5bits, result_mux32_2, result_Reg_Write, RESET_GLOBAL, result_busA, result_busB, salida_to_display);

--Instanciación del banco de registros.
generador_primos: LFSR PORT MAP(CLK_GLOBAL, SWITCH_V16, SWITCH_V17, RESET_GLOBAL, result_LFSR);

--Instanciación del full sumador.
sumador_32_bits: sumador32bits PORT MAP(result_sum4, result_desplazador, result_full_sumador);

--Instanciación del multiplexor 2 a 1 de 5 bits.
mux_2_1_5: Mux_2a1_5_bits PORT MAP(result_mem_instrucciones(20 DOWNTO 16), result_mem_instrucciones(15 DOWNTO 11), result_mux5bits, result_Reg_Dst);

--Instanciación del bloque control ADDR.
sel_aux(0)<=SWITCH_V16;
sel_aux(1)<= SWITCH_V17;
controlADDR: bloque_control_ADDR PORT MAP(result_ALU, sel_aux, SWITCH_ENVIO_TEXTO_CLARO, result_addr);

--Instancación del registro del texto en claro.
reg_texto: Registro_Texto_Claro PORT MAP(CLK_GLOBAL, SWITCHES_TEXTO_CLARO(0), SWITCHES_TEXTO_CLARO(1), SWITCHES_TEXTO_CLARO(2), SWITCHES_TEXTO_CLARO(3), salida_texto);

--Instanciacion del multiplexor de 2 a 1 32 bits_0
controlador_mux_0<=result_Branch AND result_zero;
mux32_0: Mux2a1_32 PORT MAP(result_sum4, result_full_sumador, result_mux32_0, controlador_mux_0);

--Instanciacion del multiplexor de 2 a 1 32 bits_1
mux32_1: Mux2a1_32 PORT MAP(result_busB, result_extSigno, result_mux32_1, result_ALU_src);

--Instanciacion del multiplexor de 2 a 1 32 bits_2
mux32_2: Mux2a1_32 PORT MAP(result_ALU, result_mem_datos, result_mux32_2, result_Mento_Reg);

--Instanciación del multiplexor para controlar la entrada DW de la memoria de datos.
sel_mux_DW<=SWITCH_V16 OR  SWITCH_V17;
aux_E1_DW(3 DOWNTO 0)<=result_LFSR;
mux_DW: mux_control_DW PORT MAP(result_busB, aux_E1_DW, sel_mux_DW, salida_mux_DW);

--Instanciacion del mux_control_texto
mux_control_texto: Mux2a1_32 PORT MAP(salida_mux_DW, salida_texto, salida_mux_control_texto, SWITCH_ENVIO_TEXTO_CLARO);

--Instanciación del registro auxiliar
--reg_aux: registro_to_displays PORT MAP(salida_posicion_texto_cifrado, salida_to_display);

control_cp_1: PROCESS(SWITCH_V16)
BEGIN
    IF falling_edge(SWITCH_V16) THEN
        sw_1_OK<='1';
    END IF;
END PROCESS;

control_cp_2: PROCESS(SWITCH_V17)
BEGIN
    IF falling_edge(SWITCH_V17) THEN
        sw_2_OK<='1';
    END IF;
END PROCESS;

control_cp_3: PROCESS(SWITCH_ENVIO_TEXTO_CLARO)
BEGIN
    IF falling_edge(SWITCH_ENVIO_TEXTO_CLARO) THEN
        sw_texto_claro_ok<='1';
    END IF;
END PROCESS;


control_led_U3: PROCESS(sw_texto_claro_ok)
BEGIN
    IF sw_texto_claro_ok = '1' THEN
        AUX_LED_U3<='0';
    END IF;
END PROCESS;

control_led_E19: PROCESS(sw_texto_claro_ok, sw_1_OK)
BEGIN
    IF sw_texto_claro_ok = '1' THEN
        IF sw_1_OK = '1' THEN
            AUX_LED_E19<='0';
        ELSE
            AUX_LED_E19<='1';
        END IF;
    END IF;
END PROCESS;

control_led_U16: PROCESS(sw_texto_claro_ok, sw_2_OK)
BEGIN
    IF sw_texto_claro_ok = '1' THEN
        IF sw_2_OK = '1' THEN
            AUX_LED_U16<='0';
        ELSE
            AUX_LED_U16<='1';
        END IF;
    END IF;
END PROCESS;

SALIDA_ACTIVACION_LEDS(2)<=AUX_LED_U3;
SALIDA_ACTIVACION_LEDS(1)<=AUX_LED_E19;
SALIDA_ACTIVACION_LEDS(0)<=AUX_LED_U16;


--PROCESOS AUXILIARES PARA EL CONTROL DE DISPLAYS
reloj: PROCESS(CLK_GLOBAL)
BEGIN

    IF RISING_EDGE(CLK_GLOBAL) THEN
        IF cuenta<100000 THEN
            cuenta<=cuenta+1;
        ELSE
            seleccion<=seleccion+1;
            cuenta<=0;
        END IF;
    END IF;
    
END PROCESS;

mostrar_display: PROCESS(seleccion)
BEGIN

    CASE seleccion IS
        WHEN "00" =>
            mostrar<="1110";
        WHEN "01" =>
            mostrar<="1101";
        WHEN "10" =>
            mostrar<="1011";   
        WHEN "11" =>
            mostrar<="0111";
        WHEN others =>
            mostrar<="1111";
    END CASE;
    
END PROCESS;
ACTIVACION_DISPLAYS<=mostrar;
ACTIVACION_PUNTOS<='1';



proceso_mostrar_texto_claro: PROCESS(SWITCHES_TEXTO_CLARO)
BEGIN
    CASE SWITCHES_TEXTO_CLARO IS
        
        WHEN "0000" => --0
            Num1<="0000001"; 
            Num2<="1111111";
        
        WHEN "0001" => --1
            Num1<="1001111";
            Num2<="1111111";
        
        WHEN "0010" => --2
            Num1<="0010010";
            Num2<="1111111";
            
        WHEN "0011" => --3
            Num1<="0000110";
            Num2<="1111111";
            
        WHEN "0100" => --4
            Num1<="1001100";
            Num2<="1111111";
            
        WHEN "0101" => --5
            Num1<="0100100";
            Num2<="1111111";
            
        WHEN "0110" => --6
            Num1<="0100000";
            Num2<="1111111";
            
        WHEN "0111" => --7
            Num1<="0001111";
            Num2<="1111111";
        
        WHEN "1000" => --8
            Num1<="0000000";
            Num2<="1111111";
        
        WHEN "1001" => --9
            Num1<="0000100";
            Num2<="1111111";
            
        WHEN "1010" => --10
            Num1<="0000001";
            Num2<="1001111";
            
        WHEN "1011" => --11
            Num1<="1001111";
            Num2<="1001111";

        WHEN "1100" => --12
            Num1<="0010010";
            Num2<="1001111";
            
        WHEN "1101" => --13
            Num1<="0000110";
            Num2<="1001111";
            
        WHEN "1110" => --14
            Num1<="1001100";
            Num2<="1001111";
            
        WHEN "1111" => --15
            Num1<="0001111";
            Num2<="1001111";
            
        WHEN OTHERS =>
            Num1<="1111111";
            Num2<="1111111";
            
    END CASE;
END PROCESS;


proceso_mostrar_texto_cifrado: PROCESS(SWITCHES_TEXTO_CLARO)
BEGIN
     CASE SWITCHES_TEXTO_CLARO IS
        WHEN "0000" => --0
            Num1_pos8<="0000001"; 
            Num2_pos8<="1111111"; 
        WHEN "0001" => --1
            Num1_pos8<="1001111"; 
            Num2_pos8<="1111111"; 
        WHEN "0010" => --29
            Num1_pos8<="0000100"; 
            Num2_pos8<="0010010"; 
        WHEN "0011" => --9
            Num1_pos8<="0000100";
            Num2_pos8<="1111111";
        WHEN "0100" => --16
            Num1_pos8<="0100000";
            Num2_pos8<="1001111";
        WHEN "0101" => --14
            Num1_pos8<="1001100";
            Num2_pos8<="1001111";
        WHEN "0110" => --30
            Num1_pos8<="0000001";
            Num2_pos8<="0000110"; 
        WHEN "0111" => --28
            Num1_pos8<="0000000";
            Num2_pos8<="0010010";
        WHEN "1000" => --2
            Num1_pos8<="0010010"; 
            Num2_pos8<="1111111";
        WHEN "1001" => --15
            Num1_pos8<="0100100";
            Num2_pos8<="1001111";
        WHEN "1010" => --10
            Num1_pos8<="0000001";
            Num2_pos8<="1001111";
        WHEN "1011" => --11
            Num1_pos8<="1001111";
            Num2_pos8<="1001111";
        WHEN "1100" => --12
            Num1_pos8<="0010010";
            Num2_pos8<="1001111";
        WHEN "1101" => --7
            Num1_pos8<="0001111";
            Num2_pos8<="1111111";
        WHEN "1110" => --20
            Num1_pos8<="0000001";
            Num2_pos8<="0010010";
        WHEN "1111" => --27
            Num1_pos8<="0001111"; 
            Num2_pos8<="0010010";
        WHEN OTHERS =>
            Num1_pos8<="1111111"; --NADA
            Num2_pos8<="1111111"; --NADA
     END CASE;
END PROCESS;


ACTIVAR_CAMBIO_DISPLAY<=sw_1_OK AND sw_2_OK;
mostrar_digitos: PROCESS(mostrar)
VARIABLE SEGUIR: BOOLEAN:=TRUE;
BEGIN
    CASE mostrar IS   
        WHEN "1110" =>
            IF ACTIVAR_CAMBIO_DISPLAY = '0' THEN
                IF sw_texto_claro_ok = '0' THEN
                    SALIDA_SEGMENTOS<=NUM1;
                    NUM1_aux<=NUM1;
                ELSE
                    SALIDA_SEGMENTOS<=NUM1_aux;
                END IF;
            ELSE
                SALIDA_SEGMENTOS<=Num1_pos8;
            END IF;
        WHEN "1101" =>
            IF ACTIVAR_CAMBIO_DISPLAY = '0' THEN
                IF sw_texto_claro_ok = '0' THEN
                    SALIDA_SEGMENTOS<=NUM2;
                    NUM2_aux<=NUM2;
                ELSE
                    SALIDA_SEGMENTOS<=NUM2_aux;
                END IF;
            ELSE
                SALIDA_SEGMENTOS<=Num2_pos8;
            END IF;
        WHEN "1011" =>
            SALIDA_SEGMENTOS<=igual;
        WHEN "0111" =>
            IF ACTIVAR_CAMBIO_DISPLAY = '0' THEN
                SALIDA_SEGMENTOS<=P;  
            ELSE
                SALIDA_SEGMENTOS<=E;
            END IF;   
        WHEN OTHERS =>
            SALIDA_SEGMENTOS<="1111111";
    END CASE;
END PROCESS;


end Behavioral;
