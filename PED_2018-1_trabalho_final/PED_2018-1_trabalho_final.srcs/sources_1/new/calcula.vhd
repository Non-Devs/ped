----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/14/2018 10:57:29 PM
-- Design Name: 
-- Module Name: calcula - Behavioral
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

entity calcula is
    Port ( operacao : in STD_LOGIC_VECTOR(3 downto 0);
           num_A : in STD_LOGIC_VECTOR(3 downto 0);
           num_B : in STD_LOGIC_VECTOR(3 downto 0);
           saida : out STD_LOGIC_VECTOR(3 downto 0);
           erro : out STD_LOGIC);
end calcula;

architecture Behavioral of calcula is
    signal s_soma, s_subtracao, s_soma_A_1 : STD_LOGIC_VECTOR(3 downto 0);
    signal e_soma, e_subtracao, e_soma_A_1 : STD_LOGIC := '0';

    component somador_subtrator is
        Port ( enabler : in STD_LOGIC;
               num_A, num_B : in STD_LOGIC_VECTOR(3 downto 0);
               saida : out STD_LOGIC_VECTOR(3 downto 0);
               cout  : out STD_LOGIC);
    end component;

begin

    -- port maps para serem usados dentro do mux
    soma: somador_subtrator port map(
                enabler => '0',
                num_A => num_A,
                num_B => num_B,
                saida => s_soma,
                cout => e_soma
    );

    subtracao: somador_subtrator port map(
                enabler => '1',
                num_A => num_A,
                num_B => num_B,
                saida => s_subtracao,
                cout => e_subtracao
    );

    soma_A_1: somador_subtrator port map(
                enabler => '0',
                num_A => num_A,
                num_B => "0001",
                saida => s_soma_A_1,
                cout => e_soma_A_1
    );

    -- mux para determinar qual a operacao desejada
    process(operacao, num_A, num_B)
        begin
            erro <= '0';

            case operacao is
                when "0000" => saida <= "0000";
                when "0001" => saida <= "1111";
                when "0010" => saida <= num_A;
                when "0011" => saida <= num_B;
                when "0100" => saida <= num_A or num_B;
                when "0101" => saida <= num_A and num_B;
                when "0110" => saida <= num_A xor num_B;
                when "0111" => saida <= not(num_A);
                when "1000" => 
                    saida <= s_soma;
                    erro <= e_soma;
                when "1001" => 
                    saida <= s_subtracao;
                    erro <= e_subtracao;
                when "1111" => 
                    saida <= s_soma_A_1;
                    erro <= e_soma_A_1;
                when others => saida <= "1001";
            end case;
    end process;

end Behavioral;
