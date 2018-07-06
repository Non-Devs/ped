library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity conv_bcd is
    Port ( entrada : in STD_LOGIC_VECTOR (4 downto 0);
           s_out : out STD_LOGIC_VECTOR (6 downto 0));
end conv_bcd;

architecture Behavioral of conv_bcd is

begin
     process(entrada)
       begin
        case entrada is
         when "00001" => s_out <="1111001"; --1        
         when "00010" => s_out <= "0100100"; --2
         when "00011" => s_out <= "0110000"; --3
         when "00100" => s_out <= "0011001"; --4       
         when "00101" => s_out <= "0010010"; --5        
         when "00110" => s_out <= "0000010"; --6        
         when "00111" => s_out <= "1111000"; --7       
         when "01000" => s_out <= "0000000"; --8        
         when "01001" => s_out <= "0010000"; --9        
         when "01010" => s_out <= "0001000"; --A        
         when "01011" => s_out <= "0000011"; --b       
         when "01100" => s_out <= "1000110"; --C       
         when "01101" => s_out <= "0100001"; --d        
         when "01110" => s_out <= "0000110"; --E       
         when "01111" => s_out <= "0001110"; --F       
         when "00000" => s_out <= "1000000"; --0         
         when "10000" => s_out <= "0101111"; --r
         when others => s_out <= "0111111"; -- -
         end case;
     end process;
end Behavioral;
