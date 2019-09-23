entity mux_1bit is
  port(A,B,Comp : in bit;
       saida : out bit);
end mux_1bit;
architecture escolher of mux_1bit is
  begin
    saida <= ((not comp) and B) or (comp and A);
end escolher;
