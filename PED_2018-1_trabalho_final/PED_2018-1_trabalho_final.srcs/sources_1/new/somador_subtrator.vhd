----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/07/2018 01:27:56 PM
-- Design Name: 
-- Module Name: somador_subtrator - Behavioral
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

entity somador_subtrator is
    Port (
        enabler : in STD_LOGIC;
        num_A, num_B : in STD_LOGIC_VECTOR(3 downto 0);
        saida : out STD_LOGIC_VECTOR(3 downto 0);
        cout  : out STD_LOGIC
    );
end somador_subtrator;

architecture Behavioral of somador_subtrator is

    signal aux0, aux1, aux2 : STD_LOGIC := '0';
    signal num_aux : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- complemento de 1
    num_aux(0) <= num_B(0) when (enabler = '0') else (not num_B(0));
    num_aux(1) <= num_B(1) when (enabler = '0') else (not num_B(1));
    num_aux(2) <= num_B(2) when (enabler = '0') else (not num_B(2));
    num_aux(3) <= num_B(3) when (enabler = '0') else (not num_B(3));

    -- somador/subtrator
    saida(0)    <=  num_A(0) xor num_aux(0) xor enabler;
    aux0        <=  num_A(0) and num_aux(0);

    saida(1)    <=  num_A(1) xor num_aux(1) xor aux0;
    aux1        <=  (num_A(1) and num_aux(1)) or (num_A(1) and aux0) 
                        or (num_aux(1) and aux0);

    saida(2)    <=  num_A(2) xor num_aux(2) xor aux1;
    aux2        <=  (num_A(2) and num_aux(2)) or (num_A(2) and aux1) 
                        or (num_aux(2) and aux1);

    saida(3)    <=  num_A(3) xor num_aux(3) xor aux2;
    cout        <=  (num_A(3) and num_aux(3)) or (num_A(3) and aux2) 
                        or (num_aux(3) and aux2);

end Behavioral;
