library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_dec is
    Port ( operador : in STD_LOGIC_VECTOR(4 downto 0);
           ov: in STD_LOGIC;
           over : in STD_LOGIC_VECTOR(4 downto 0);
           saida: out STD_LOGIC_VECTOR(4 downto 0));
end mux_dec;

architecture Behavioral of mux_dec is

begin

    process(ov,operador,over)
        begin
            if ov = '1'  then
                saida <= over;
            else 
                saida<=operador;
            end if;
        end process;
end Behavioral;
