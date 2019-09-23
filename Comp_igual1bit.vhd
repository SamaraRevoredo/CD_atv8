entity comp_igual1bit is
  port (A,B,in_eq : in bit;
        out_eq : out bit);
end comp_igual1bit;

architecture comparacaoigual1bit of comp_igual1bit is
  begin
    out_eq <= in_eq and (A xnor B);
end comparacaoigual1bit;


