library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity divisor_clock is
    Port ( clk : in STD_LOGIC;
           saida : out STD_LOGIC_VECTOR(1 downto 0));
end divisor_clock;

architecture Behavioral of divisor_clock is
signal count: integer:= 1;
signal s_in: std_logic_vector(1 downto 0):= "00";
begin
        saida <= s_in;
        process(clk)
            begin
            if rising_edge(clk) THEN
            if count = 50000 then
            count <= 1;
            
            s_in <= s_in + 1;
            else count <= count + 1;
            end if;
            end if;
        end process; 
end Behavioral;
