library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk is
  Port (clk: in std_logic;
        clk_s: out std_logic
         );
end clk;

architecture Behavioral of clk is
signal clk_aux: std_logic;
signal count: integer := 0;
begin

    process(clk)
    begin
        if rising_edge(clk) then
            if count = 49999999 then
                count <= 0;
                clk_aux <= not clk_aux;
            else
                count <= count + 1;
            end if;
        end if;
    end process;
    
    clk_s <= clk_aux;

end Behavioral;
