----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/03/2018 11:18:54 PM
-- Design Name: 
-- Module Name: disp_binario - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity disp_binario is
    Port ( entrada : in STD_LOGIC_VECTOR(3 DOWNTO 0);
           binario4, binario3, binario2, binario1 : out STD_LOGIC_VECTOR(6 DOWNTO 0));
end disp_binario;

architecture Behavioral of disp_binario is

begin
    process(entrada)
        begin
            case entrada is
                when "0000" =>
                    binario4 <= "0000001"; -- 0
                    binario3 <= "0000001";
                    binario2 <= "0000001";
                    binario1 <= "0000001";
                when "0001" =>
                    binario4 <= "0000001";
                    binario3 <= "0000001";
                    binario2 <= "0000001";
                    binario1 <= "1001111"; -- 1
                when "0010" =>
                    binario4 <= "0000001";
                    binario3 <= "0000001";
                    binario2 <= "1001111";
                    binario1 <= "0000001";
                when "0011" =>
                    binario4 <= "0000001";
                    binario3 <= "0000001";
                    binario2 <= "1001111";
                    binario1 <= "1001111";
                when "0100" =>
                    binario4 <= "0000001";
                    binario3 <= "1001111";
                    binario2 <= "0000001";
                    binario1 <= "0000001";
                when "0101" =>
                    binario4 <= "0000001";
                    binario3 <= "1001111";
                    binario2 <= "0000001";
                    binario1 <= "1001111";
                when "0110" =>
                    binario4 <= "0000001";
                    binario3 <= "1001111";
                    binario2 <= "1001111";
                    binario1 <= "0000001";
                when "0111" =>
                    binario4 <= "0000001";
                    binario3 <= "1001111";
                    binario2 <= "1001111";
                    binario1 <= "1001111";
                when "1000" =>
                    binario4 <= "1001111";
                    binario3 <= "0000001";
                    binario2 <= "0000001";
                    binario1 <= "0000001";
                when "1001" =>
                    binario4 <= "1001111";
                    binario3 <= "0000001";
                    binario2 <= "0000001";
                    binario1 <= "1001111";
                when "1010" =>
                    binario4 <= "1001111";
                    binario3 <= "0000001";
                    binario2 <= "1001111";
                    binario1 <= "0000001";
                when "1011" =>
                    binario4 <= "1001111";
                    binario3 <= "0000001";
                    binario2 <= "1001111";
                    binario1 <= "1001111";
                when "1100" =>
                    binario4 <= "1001111";
                    binario3 <= "1001111";
                    binario2 <= "0000001";
                    binario1 <= "0000001";
                when "1101" =>
                    binario4 <= "1001111";
                    binario3 <= "1001111";
                    binario2 <= "0000001";
                    binario1 <= "1001111";
                when "1110" =>
                    binario4 <= "1001111";
                    binario3 <= "1001111";
                    binario2 <= "1001111";
                    binario1 <= "0000001";
                when "1111" =>
                    binario4 <= "1001111";
                    binario3 <= "1001111";
                    binario2 <= "1001111";
                    binario1 <= "1001111";
            end case;
        end process;
end Behavioral;
