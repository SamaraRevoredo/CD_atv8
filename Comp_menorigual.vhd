entity comp_menorigual is
  port (A,B : in bit_vector(3 downto 0);
        C : out bit);
end comp_menorigual;

architecture comparacao of comp_menorigual is
signal llt,leq : bit;
signal lt,eq : bit_vector(3 downto 0);
component comp_menorigual1bit
  port (A,B,in_lt,in_eq : in bit;
        out_lt,out_eq : out bit);
end component;
  begin
    llt <= '0';
    leq <= '1';
    comp1 : comp_menorigual1bit port map(A(3),B(3),llt,leq, lt(0), eq(0));
    comp2 : comp_menorigual1bit port map(A(2),B(2),lt(0),eq(0), lt(1), eq(1));
    comp3 : comp_menorigual1bit port map(A(1),B(1),lt(1),eq(1), lt(2), eq(2));
    comp4 : comp_menorigual1bit port map(A(0),B(0),lt(2),eq(2), lt(3), eq(3));
    C <= (lt(3) or eq(3));
   
end comparacao;

