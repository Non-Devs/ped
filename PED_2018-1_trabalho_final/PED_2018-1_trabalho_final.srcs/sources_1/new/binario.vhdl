library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity binario is
    Port ( seletor : in STD_LOGIC_VECTOR (1 downto 0);
           entry : in STD_LOGIC_VECTOR (3 downto 0);
           s_out : out STD_LOGIC_VECTOR (4 downto 0));
end binario;

architecture Behavioral of binario is
signal a, b, c, d: std_logic_vector (4 downto 0);
begin
    a <= "0000" & entry(3);
    b <= "0000" & entry(2);
    c <= "0000" & entry(1);
    d <= "0000" & entry(0);
         process(entry, seletor)
            begin
                case seletor is
                    when "00" => s_out <= a;
                    when "01" => s_out <= b;
                    when "10" => s_out <= c;
                    when others => s_out <= d;          
                end case;
         end process;
end Behavioral;
