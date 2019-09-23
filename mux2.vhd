entity multiplexador2 is
  port (A,B : in bit_vector(3 downto 0);
        C : in bit;
        S : out bit_vector(3 downto 0));
end multiplexador2;

architecture atribuir2 of multiplexador2 is
  
  component mux2_1bit
     port(A,B,Comp : in bit;
          saida : out bit);
  end component;
  begin
    bit01 : mux2_1bit port map(A(0),B(0),C,S(0));
    bit02 : mux2_1bit port map(A(1),B(1),C,S(1));
    bit03 : mux2_1bit port map(A(2),B(2),C,S(2));
    bit04 : mux2_1bit port map(A(3),B(3),C,S(3)); 
end atribuir2;


