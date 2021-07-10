library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;

ENTITY simRAM IS
END simRAM;

ARCHITECTURE comportamiento OF simRAM is
COMPONENT Memoria_RAM 
PORT(
     CLK: IN STD_LOGIC;
     MemWrite: IN STD_LOGIC;
     MemRead: IN STD_LOGIC;
     ADRESS: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
     DATA_IN: IN STD_LOGIC_VECTOR (31 DOWNTO 0);
     DATA_OUT: INOUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END COMPONENT;

SIGNAL MemWrite, MemRead, CLK: STD_LOGIC;
SIGNAL ADRESS: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL DATA_IN: STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL DATA_OUT: STD_LOGIC_VECTOR(31 DOWNTO 0); 

BEGIN
miVariable: Memoria_RAM PORT MAP(CLK, MemWrite, MemRead ,ADRESS, DATA_IN, DATA_OUT);
reloj: PROCESS
BEGIN
CLK<='0'; WAIT FOR 20 NS;
CLK<='1'; WAIT FOR 20 NS;
END PROCESS;

MemWrite<='1';
MemRead<='0';
ADRESS<=x"00000000", x"00000001" AFTER 40 NS, x"00000002" AFTER 80 NS, x"00000003" AFTER 260 NS, x"00000004" AFTER 300 NS, x"00000005" AFTER 340 NS, x"00000006" AFTER 550 NS, x"00000007" AFTER 700 NS, x"00000008" AFTER 900 NS, x"00000009" AFTER 1100 NS, x"0000000A" AFTER 1300 NS, x"0000000B" AFTER 1500 NS, x"0000000C" AFTER 1700 NS, x"0000000D" AFTER 1900 NS, x"0000000E" AFTER 2100 NS, x"0000000F" AFTER 2300 NS, x"00000010" AFTER 3000 NS;
DATA_IN<=x"0000000F" AFTER 300 NS;
END comportamiento;