library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity Divisor_De_Frecuencia is
port (
	clk50mhz: 	in STD_LOGIC;
	clk:		out STD_LOGIC
);
end Divisor_De_Frecuencia;

architecture comportamiento of Divisor_De_Frecuencia is
	constant divisorFlancos: INTEGER := 5;
	signal contador: INTEGER range 0 to divisorFlancos; 
	signal clk_state: STD_LOGIC := '0';
	
begin
	reloj: process(clk50mhz, clk_state, contador)
	begin
		if clk50mhz'event and clk50mhz='1' then
			if contador < divisorFlancos then 
				contador<= contador+1;
			else
				clk_state <= not clk_state;
				contador <= 0;
			end if;
		end if;
	end process;
	
	persecond: process (clk_state)
	begin
		clk <= clk_state;
	end process;
	
end comportamiento;