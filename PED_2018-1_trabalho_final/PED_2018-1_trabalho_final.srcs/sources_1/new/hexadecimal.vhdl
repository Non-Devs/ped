library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hexadecimal is
    Port ( e : in STD_LOGIC_VECTOR (3 downto 0);
           seletor : in STD_LOGIC_VECTOR (1 downto 0);
           s_out : out STD_LOGIC_VECTOR (4 downto 0));
end hexadecimal;

architecture Behavioral of hexadecimal is

begin
        process (e, seletor)
            begin
             case seletor is
                 when "11" => s_out <= '0'&e;
                 when others => s_out <= "00000";
             end case; 
        end process;
end Behavioral;
