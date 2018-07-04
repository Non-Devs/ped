----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/03/2018 11:49:17 PM
-- Design Name: 
-- Module Name: ula_main - Behavioral
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

entity ula_main is
    Port ( clk : in STD_LOGIC;
           chave1 : in STD_LOGIC;
           chave2 : in STD_LOGIC;
           operacao : in STD_LOGIC_VECTOR(3 downto 0);
           num_A : in STD_LOGIC_VECTOR(3 downto 0);
           num_B : in STD_LOGIC_VECTOR(3 downto 0);
           display4, display3, display2, display1 : out STD_LOGIC_VECTOR(6 downto 0));
end ula_main;

architecture Behavioral of ula_main is
    signal saida_aux : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal erro_aux : STD_LOGIC := '0';
    signal bin_aux4, bin_aux3, bin_aux2, bin_aux1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
    
    component calcula is
        Port ( operacao : in STD_LOGIC_VECTOR(3 downto 0);
               num_A : in STD_LOGIC_VECTOR(3 downto 0);
               num_B : in STD_LOGIC_VECTOR(3 downto 0);
               saida : out STD_LOGIC_VECTOR(3 downto 0);
               erro : out STD_LOGIC);
    end component;

    component disp_binario is
        Port ( entrada : in STD_LOGIC_VECTOR(3 DOWNTO 0);
               binario4, binario3, binario2, binario1 : out STD_LOGIC_VECTOR(6 DOWNTO 0));
    end component;

begin

    calc: calcula port map(
        operacao => operacao,
        num_A => num_A,
        num_B => num_B,
        saida => saida_aux,
        erro => erro_aux
    );

    mostra_binario: disp_binario port map(
        entrada => saida_aux,
        binario4 => bin_aux4,
        binario3 => bin_aux3,
        binario2 => bin_aux2,
        binario1 => bin_aux1
    );

    process(erro_aux, chave1, chave2)
        begin
        
        if erro_aux = '1' then
            display4 <= "0110000";
            display3 <= "0001000";
            display2 <= "0001000";
            display1 <= "0000001";
        elsif chave1 = '1' and chave2 = '0' then -- mostra binario
            display4 <= bin_aux4;
            display3 <= bin_aux3;
            display2 <= bin_aux2;
            display1 <= bin_aux1;
        else -- codigo temporario (ou nao?)
            display4 <= "1111110";
            display3 <= "1111110";
            display2 <= "1111110";
            display1 <= "1111110";
        end if;
    end process;
end Behavioral;
