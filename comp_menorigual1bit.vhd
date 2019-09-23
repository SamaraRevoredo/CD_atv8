entity comp_menorigual1bit is
  port (A,B,in_lt,in_eq : in bit;
        out_lt,out_eq : out bit);
end comp_menorigual1bit;

architecture comparacao1bit of comp_menorigual1bit is
  begin
    out_lt <= in_lt or (in_eq and (not A) and B);
    out_eq <= in_eq and (A xnor B);
end comparacao1bit;
