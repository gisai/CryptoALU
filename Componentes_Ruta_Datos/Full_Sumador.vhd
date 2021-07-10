----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2021 05:53:24 PM
-- Design Name: 
-- Module Name: sumador32bits - Behavioral
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

entity sumador32bits is
    Port ( A : in STD_LOGIC_VECTOR (31 downto 0);
           B : in STD_LOGIC_VECTOR (31 downto 0);
           S : out STD_LOGIC_VECTOR (31 downto 0));
end sumador32bits;

architecture Behavioral of sumador32bits is

COMPONENT sumador1bit
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin: in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : inout STD_LOGIC);
END COMPONENT;

SIGNAL aux: STD_LOGIC_VECTOR(31 DOWNTO 0);

begin

sumador_1bit_0: sumador1bit PORT MAP(A(0), B(0), '0', S(0), aux(0));
sumador_1bit_1: sumador1bit PORT MAP(A(1), B(1), aux(0), S(1), aux(1));
sumador_1bit_2: sumador1bit PORT MAP(A(2), B(2), aux(1), S(2), aux(2));
sumador_1bit_3: sumador1bit PORT MAP(A(3), B(3), aux(2), S(3), aux(3));
sumador_1bit_4: sumador1bit PORT MAP(A(4), B(4), aux(3), S(4), aux(4));
sumador_1bit_5: sumador1bit PORT MAP(A(5), B(5), aux(4), S(5), aux(5));
sumador_1bit_6: sumador1bit PORT MAP(A(6), B(6), aux(5), S(6), aux(6));
sumador_1bit_7: sumador1bit PORT MAP(A(7), B(7), aux(6), S(7), aux(7));
sumador_1bit_8: sumador1bit PORT MAP(A(8), B(8), aux(7), S(8), aux(8));
sumador_1bit_9: sumador1bit PORT MAP(A(9), B(9), aux(8), S(9), aux(9));
sumador_1bit_10: sumador1bit PORT MAP(A(10), B(10), aux(9), S(10), aux(10));
sumador_1bit_11: sumador1bit PORT MAP(A(11), B(11), aux(10), S(11), aux(11));
sumador_1bit_12: sumador1bit PORT MAP(A(12), B(12), aux(11), S(12), aux(12));
sumador_1bit_13: sumador1bit PORT MAP(A(13), B(13), aux(12), S(13), aux(13));
sumador_1bit_14: sumador1bit PORT MAP(A(14), B(14), aux(13), S(14), aux(14));
sumador_1bit_15: sumador1bit PORT MAP(A(15), B(15), aux(14), S(15), aux(15));
sumador_1bit_16: sumador1bit PORT MAP(A(16), B(16), aux(15), S(16), aux(16));
sumador_1bit_17: sumador1bit PORT MAP(A(17), B(17), aux(16), S(17), aux(17));
sumador_1bit_18: sumador1bit PORT MAP(A(18), B(18), aux(17), S(18), aux(18));
sumador_1bit_19: sumador1bit PORT MAP(A(19), B(19), aux(18), S(19), aux(19));
sumador_1bit_20: sumador1bit PORT MAP(A(20), B(20), aux(19), S(20), aux(20));
sumador_1bit_21: sumador1bit PORT MAP(A(21), B(21), aux(20), S(21), aux(21));
sumador_1bit_22: sumador1bit PORT MAP(A(22), B(22), aux(21), S(22), aux(22));
sumador_1bit_23: sumador1bit PORT MAP(A(23), B(23), aux(22), S(23), aux(23));
sumador_1bit_24: sumador1bit PORT MAP(A(24), B(24), aux(23), S(24), aux(24));
sumador_1bit_25: sumador1bit PORT MAP(A(25), B(25), aux(24), S(25), aux(25));
sumador_1bit_26: sumador1bit PORT MAP(A(26), B(26), aux(25), S(26), aux(26));
sumador_1bit_27: sumador1bit PORT MAP(A(27), B(27), aux(26), S(27), aux(27));
sumador_1bit_28: sumador1bit PORT MAP(A(28), B(28), aux(27), S(28), aux(28));
sumador_1bit_29: sumador1bit PORT MAP(A(29), B(29), aux(28), S(29), aux(29));
sumador_1bit_30: sumador1bit PORT MAP(A(30), B(30), aux(29), S(30), aux(30));
sumador_1bit_31: sumador1bit PORT MAP(A(31), B(31), aux(30), S(31), aux(31));


end Behavioral;
