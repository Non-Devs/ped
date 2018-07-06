library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity octal is
    Port ( entrada : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           s_out : out STD_LOGIC_VECTOR (4 downto 0));
end octal;

architecture Behavioral of octal is
signal a, b: std_logic_vector(4 downto 0);
begin

a <= "0000"&entrada(3);
b <= "00"&entrada(2 downto 0);
                process(entrada, sel)
                begin
                    case sel is
                    when "11" => s_out <= b;
                    when "10" => s_out <= a;
                    when others => s_out <= "00000";
                    end case;
          
                end process;
end Behavioral;
