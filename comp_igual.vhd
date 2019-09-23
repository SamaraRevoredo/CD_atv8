entity comp_igual is
  port (A,B : in bit_vector(3 downto 0);
        C : out bit);
end comp_igual;

architecture comparacao_igual of comp_igual is
signal leq : bit;
signal eq : bit_vector(3 downto 0);
component comp_igual1bit
  port (A,B,in_eq : in bit;
        out_eq : out bit);
end component;
  begin
    leq <= '1';
    comp1 : comp_igual1bit port map(A(3),B(3),leq, eq(0));
    comp2 : comp_igual1bit port map(A(2),B(2),eq(0), eq(1));
    comp3 : comp_igual1bit port map(A(1),B(1),eq(1), eq(2));
    comp4 : comp_igual1bit port map(A(0),B(0),eq(2), eq(3));
    C <= eq(3);
   
end comparacao_igual;


