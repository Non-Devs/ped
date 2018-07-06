library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decodificador is
    Port ( e : in STD_LOGIC_VECTOR (3 downto 0);
           seletora : in STD_LOGIC_VECTOR (1 downto 0);
           segmento : out STD_LOGIC_VECTOR (6 downto 0);
           overflow: in std_logic;
           anodo : out STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC);
end decodificador;

architecture Behavioral of decodificador is

component conv_bcd is
    Port ( a : in STD_LOGIC_VECTOR (4 downto 0);
           sout : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component mux4_1 is
    Port ( eneble1 : in STD_LOGIC_VECTOR (4 downto 0);
           eneble2 : in STD_LOGIC_VECTOR (4 downto 0);
           eneble3 : in STD_LOGIC_VECTOR (4 downto 0);
           eneble4 : in STD_LOGIC_VECTOR (4 downto 0);
           seletora : in STD_LOGIC_VECTOR (1 downto 0);
           sout : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component decimal is
    Port ( s : in STD_LOGIC_vector(3 downto 0);
           sout : out STD_LOGIC_VECTOR (4 downto 0);
           seletora : in STD_LOGIC_VECTOR (1 downto 0));
           
end component;

component hexadecimal is
    Port ( s : in STD_LOGIC_VECTOR (3 downto 0);
           seletora : in STD_LOGIC_VECTOR (1 downto 0);
           sout : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component octal is
    Port ( s : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           sout : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component binario is 
    Port ( SEL : in STD_LOGIC_VECTOR (1 downto 0);
           S : in STD_LOGIC_VECTOR (3 downto 0);
           SOUT : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component divisor_clock is
    Port ( clk : in STD_LOGIC;
           s : out STD_LOGIC_VECTOR(1 downto 0));
end component;

component mux_erro is
    Port ( SEL : in STD_LOGIC_VECTOR(1 downto 0);
           saida : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component mux_dec is
    Port ( Op : in STD_LOGIC_VECTOR(4 downto 0);
           ov: in STD_LOGIC;
           over : in STD_LOGIC_VECTOR(4 downto 0);
           saida: out STD_LOGIC_VECTOR(4 downto 0));
end component;


signal saida_clk: std_logic_vector(1 downto 0);
signal sb, sd, sh, so: std_logic_vector (4 downto 0);
signal smux,studo,sover: std_logic_vector (4 downto 0);



begin

clock: divisor_clock port map (clk => clk, 
                               s => saida_clk);
mux_error: mux_erro port map(SEL=>saida_clk,
                             saida=>sover);
mux_final: mux_dec port map(Op=>smux,
                            ov=>overflow,
                            over=>sover,
                            saida=>studo);
mux: mux4_1 port map (eneble1 => sd, 
                      eneble2 => sh, 
                      eneble3 => sb, 
                      eneble4 => so, 
                      seletora => seletora, 
                      sout => smux);
conversorBCD: conv_bcd port map (a => studo,
                                 sout => segmento);
decodificador_decimal: decimal port map (s => e, 
                                         seletora => saida_clk, 
                                         sout => sd);
decodificador_hexadecimal: hexadecimal port map (s => e,
                                                 seletora => saida_clk,
                                                 sout => sh);
decodificador_octal: octal port map (s => e,
                                     sel => saida_clk,
                                     sout => so);
decodificador_binario: binario port map (s => e,
                                         sel => saida_clk,
                                         sout => sb);


with saida_clk select
 anodo <= "0111" when "00",
          "1011" when "01",
          "1101" when "10",
          "1110" when others;

end Behavioral;
