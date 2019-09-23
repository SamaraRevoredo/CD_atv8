entity mux2_1bit is
  port(A,B,Comp : in bit;
       saida : out bit);
end mux2_1bit;
architecture escolher2 of mux2_1bit is
  begin
    saida <= (comp and B) or ((not comp) and A);
end escolher2;
