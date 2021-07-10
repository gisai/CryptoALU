library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


ENTITY Memoria_RAM IS
PORT(
     CLK: IN STD_LOGIC;
     MemWrite: IN STD_LOGIC;
     MemRead: IN STD_LOGIC;
     ADRESS: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
     DATA_IN: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
     DATA_OUT: INOUT STD_LOGIC_VECTOR (31 DOWNTO 0)
);
END Memoria_RAM;

ARCHITECTURE comportamiento OF Memoria_RAM IS

type ram_type is array (0 to 15) of std_logic_vector(31 downto 0);

SIGNAL rammemory: ram_type :=(
    x"00000000", --numero introducido por teclado para cifrar.
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000",
    x"00000000", 
    x"00000000", --k
    x"00000000",
    x"00000000", 
    x"00000000",
    x"00000000",
    x"00000000", --j
    x"00000000"  
);

BEGIN
process(CLK, MemWrite, MemRead, ADRESS)
BEGIN
	IF(CLK'EVENT AND CLK='1') THEN
		IF(MemWrite='1') THEN --Escritura
			rammemory(conv_integer(ADRESS(3 DOWNTO 0)))<=DATA_IN;
		ELSIF (MemRead='1') THEN --Lectura
		    DATA_OUT<=rammemory(conv_integer(ADRESS(3 DOWNTO 0)));
        END IF;
	END IF;
END PROCESS;

END comportamiento;