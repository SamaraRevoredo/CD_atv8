entity main is
  port(Num1,Num2 : in bit_vector(3 downto 0);
       Enable,clr,clk,lood,start : in bit);
end main;
architecture circuito of main is
signal UP,DOWN,seletor,pre_latch,clr_latch,sobe,desce,clock : bit;
signal x,menor,maior,preset,clear,jk,q : bit_vector(3 downto 0);
signal and_up,and_down : bit_vector(1 downto 0);
component ffjk
  port (clk ,J,K,P,C: IN BIT;
  q: OUT BIT );
end component;
component multiplexador
  port (A,B : in bit_vector(3 downto 0);
        C : in bit;
        S : out bit_vector(3 downto 0));
end component;
component multiplexador2
  port (A,B : in bit_vector(3 downto 0);
        C : in bit;
        S : out bit_vector(3 downto 0));
end component;
component comp_igual
  port (A,B : in bit_vector(3 downto 0);
        C : out bit);
end component;
component comp_menorigual
  port (A,B : in bit_vector(3 downto 0);
        C : out bit);
end component;
  begin
    comparacao_menorigual : comp_menorigual port map(num1,num2,seletor);
    --Entra nos multiplexadores para descobrir o maior e menor valor
    multiplex1 : multiplexador port map(num1, num2,seletor,menor);
    multiplex2 : multiplexador2 port map(num1, num2,seletor,maior);
    --Compara a variavel atual da saida com o menor e maior valor
    compXeMenor : comp_igual port map(menor,x,sobe);
    compXeMaior : comp_igual port map(maior,x,desce);
    --usa um latch para fazer a variavel UP and DOWN
    pre_latch <= (not sobe) and clr;
    clr_latch <= (not desce);
    latch : ffjk port map('0','0','0',pre_latch,clr_latch,UP);
    DOWN <= (not UP);
    --Coloca os preset e clear de cada flip flop em um vetor de bits
    preset(0) <= (lood nand menor(0));
    preset(1) <= (lood nand menor(1));
    preset(2) <= (lood nand menor(2));
    preset(3) <= (lood nand menor(3));
    clear(0) <= ((lood nand preset(0)) and clr);
    clear(1) <= ((lood nand preset(1)) and clr);
    clear(2) <= ((lood nand preset(2)) and clr);
    clear(3) <= ((lood nand preset(3)) and clr);
    --inicia o clock apenas quando o circuito está pronto para o start
    --Isso foi feito para que o comparador nao use lixo
    clock <= (clk and start);
    --Coloca todos os valores de jk em um vetor e executa o port map do flio flop
    jk(0) <= Enable;
    jk1 : ffjk port map(clock,jk(0),jk(0),preset(0),clear(0),q(0));
    jk(1) <= ((UP and q(0)) or (DOWN and (not q(0)))) and Enable;
    and_up(0) <= (UP and q(0));
    and_down(0) <=(DOWN and (not q(0)));
    jk2 : ffjk port map(clock,jk(1),jk(1),preset(1),clear(1),q(1));
    jk(2) <= ((and_up(0) and q(1)) or (and_down(0) and (not q(1)))) and Enable; 
    and_up(1) <= (and_up(0) and q(1)); 
    and_down(1) <= (and_down(0) and (not q(1)));  
    jk3 : ffjk port map(clock,jk(2),jk(2),preset(2),clear(2),q(2));
    jk(3) <= ((and_up(1) and q(2)) or (and_down(1) and (not q(2)))) and Enable;
    jk4 : ffjk port map(clock,jk(3),jk(3),preset(3),clear(3),q(3));
    --Coloca o valor de q na variavel para ser comparada com o valores limites
    x(0) <= q(0);
    x(1) <= q(1);
    x(2) <= q(2);
    x(3) <= q(3);
end circuito;
