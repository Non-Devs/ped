library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_erro is
    Port ( seletor : in STD_LOGIC_VECTOR(1 downto 0);
           saida : out STD_LOGIC_VECTOR (4 downto 0));
end mux_erro;

architecture Behavioral of mux_erro is

begin

    with seletor select
        saida<="01110" when "00",
               "10000" when "01",
               "10000" when "10",
               "00000" when others;
end Behavioral;
