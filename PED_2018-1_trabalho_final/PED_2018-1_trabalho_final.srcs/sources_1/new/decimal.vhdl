library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decimal is
    Port ( entrada : in STD_LOGIC_vector(3 downto 0);
           s_out : out STD_LOGIC_VECTOR (4 downto 0);
           seletor : in STD_LOGIC_VECTOR (1 downto 0));
end decimal;

architecture Behavioral of decimal is
signal a, b: std_logic_vector(4 downto 0);
begin
    a <= '0' & ((not entrada) + 1);
            process(seletor, entrada, a, b)
            begin
            if entrada(3) = '1' then 
                case seletor is
                when "11" => s_out <= a;
                when "10" => s_out <= "10001";
                when others => s_out <= "00000";
                end case;
                else 
                    case seletor is
                    when "11" => s_out <= '0'&entrada;
                    when others => s_out <= "00000";
                    end case;
                end if;
            
                end process;
end Behavioral;
