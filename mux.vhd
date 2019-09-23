entity multiplexador is
  port (A,B : in bit_vector(3 downto 0);
        C : in bit;
        S : out bit_vector(3 downto 0));
end multiplexador;

architecture atribuir of multiplexador is
  
  component mux_1bit
     port(A,B,Comp : in bit;
          saida : out bit);
  end component;
  begin
    bit01 : mux_1bit port map(A(0),B(0),C,S(0));
    bit02 : mux_1bit port map(A(1),B(1),C,S(1));
    bit03 : mux_1bit port map(A(2),B(2),C,S(2));
    bit04 : mux_1bit port map(A(3),B(3),C,S(3)); 
end atribuir;
