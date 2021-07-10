----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.02.2021 15:02:43
-- Design Name: 
-- Module Name: Registro - Behavioral
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

entity Registro is
    Port ( CLKr : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           Dr : in STD_LOGIC_VECTOR (31 downto 0);
           Qr : inout STD_LOGIC_VECTOR (31 downto 0));
end Registro;

architecture Behavioral of Registro is

COMPONENT BiestableD 
     Port ( CLK : in STD_LOGIC;
           D : in STD_LOGIC;
           Clear : in STD_LOGIC;
           Q : inout STD_LOGIC);
END COMPONENT;

SIGNAL reloj : STD_LOGIC;

begin
reloj <= CLKr or NOT enable;

biestable0 : BiestableD PORT MAP(reloj, Dr(0), reset, Qr(0));
biestable1 : BiestableD PORT MAP(reloj, Dr(1), reset, Qr(1));
biestable2 : BiestableD PORT MAP(reloj, Dr(2), reset, Qr(2));
biestable3 : BiestableD PORT MAP(reloj, Dr(3), reset, Qr(3));
biestable4 : BiestableD PORT MAP(reloj, Dr(4), reset, Qr(4));
biestable5 : BiestableD PORT MAP(reloj, Dr(5), reset, Qr(5));
biestable6 : BiestableD PORT MAP(reloj, Dr(6), reset, Qr(6));
biestable7 : BiestableD PORT MAP(reloj, Dr(7), reset, Qr(7));
biestable8 : BiestableD PORT MAP(reloj, Dr(8), reset, Qr(8));
biestable9 : BiestableD PORT MAP(reloj, Dr(9), reset, Qr(9));
biestable10 : BiestableD PORT MAP(reloj, Dr(10), reset, Qr(10)); 
biestable11 : BiestableD PORT MAP(reloj, Dr(11), reset, Qr(11));
biestable12 : BiestableD PORT MAP(reloj, Dr(12), reset, Qr(12));
biestable13 : BiestableD PORT MAP(reloj, Dr(13), reset, Qr(13));
biestable14 : BiestableD PORT MAP(reloj, Dr(14), reset, Qr(14));
biestable15 : BiestableD PORT MAP(reloj, Dr(15), reset, Qr(15));
biestable16 : BiestableD PORT MAP(reloj, Dr(16), reset, Qr(16));
biestable17 : BiestableD PORT MAP(reloj, Dr(17), reset, Qr(17));
biestable18 : BiestableD PORT MAP(reloj, Dr(18), reset, Qr(18));
biestable19 : BiestableD PORT MAP(reloj, Dr(19), reset, Qr(19));
biestable20 : BiestableD PORT MAP(reloj, Dr(20), reset, Qr(20));
biestable21 : BiestableD PORT MAP(reloj, Dr(21), reset, Qr(21));
biestable22 : BiestableD PORT MAP(reloj, Dr(22), reset, Qr(22));
biestable23 : BiestableD PORT MAP(reloj, Dr(23), reset, Qr(23));
biestable24 : BiestableD PORT MAP(reloj, Dr(24), reset, Qr(24));
biestable25 : BiestableD PORT MAP(reloj, Dr(25), reset, Qr(25));
biestable26 : BiestableD PORT MAP(reloj, Dr(26), reset, Qr(26));
biestable27 : BiestableD PORT MAP(reloj, Dr(27), reset, Qr(27));
biestable28 : BiestableD PORT MAP(reloj, Dr(28), reset, Qr(28));
biestable29 : BiestableD PORT MAP(reloj, Dr(29), reset, Qr(29));
biestable30 : BiestableD PORT MAP(reloj, Dr(30), reset, Qr(30));
biestable31 : BiestableD PORT MAP(reloj, Dr(31), reset, Qr(31));

end Behavioral;