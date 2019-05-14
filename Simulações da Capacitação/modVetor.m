%{
Bruno Zarjitsky
UFRJ
Trabalho de finalizacao da semana de capacitacao
Calcula o moduli do vetor resultante entre 2 vetores
%}

function[x, y, novoAng]=modVetor(motor, Fc, ang)
  %Força do motor
  a=motor;
  %Força centripeta
  b=Fc;
  modulo=sqrt(a**2+b**2+2*a*b*cos(deg2rad(ang)));
  %Novo angulo e a soma do angulo antigo com a variacao do angulo no ponto do modulo
  %Esse dado e calculado para ser usado no plotGrafico.m
  novoAng=(b/a);
  novoAng=novoAng+ang;
  %Sen e cos do novo angulo, esses dados tambem serao usados no plotGrafico.m
  x=sin(deg2rad(novoAng));
  y=cos(deg2rad(novoAng));
end