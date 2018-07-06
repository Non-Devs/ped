library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4_1 is
    Port ( eneble1 : in STD_LOGIC_VECTOR (4 downto 0);
           eneble2 : in STD_LOGIC_VECTOR (4 downto 0);
           eneble3 : in STD_LOGIC_VECTOR (4 downto 0);
           eneble4 : in STD_LOGIC_VECTOR (4 downto 0);
           seletora : in STD_LOGIC_VECTOR (1 downto 0);
           s_out : out STD_LOGIC_VECTOR (4 downto 0));
end mux4_1;

architecture Behavioral of mux4_1 is
begin

        with seletora select
        s_out <= eneble1 when "00",
            eneble2 when "01",
            eneble3 when "10",
            eneble4 when others;
end Behavioral;
