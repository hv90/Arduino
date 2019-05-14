%{
UFRJ
Trabalho de finalizacao da semana de capacitacao
Calcula os dados nescessarios para plotar o grafico de trajetoria
%}

function [vel, centripeta]=velocidade()
  %define as constantes
  deltaT=1/256;
  vel=0;
  arrasto=0;
  fimT=1.5;
  massa=0.561;
  raio=0.8;
  motor=15.125+(15.125*0.6);% +(15.125*06) e pq temos 2 motores e o segundo vai trabalhar com 60 % de forca
  centripeta=0;
  %loop para variacao do tempo
  for tempo=(deltaT:deltaT:fimT)
    %calcula o vetor resultante
    resultante=motor-arrasto;
    %calcula a acelaracao do robo
    aceleracao=resultante/massa;
    %calcula a nova velocidade do robo
    vel=vel+aceleracao*deltaT
    %calcula o novo arrasto do robo
    arrasto=2.49*vel**2
    %calcula a nova forca centripeta
    centripeta=massa*(vel**2)/raio
  end
end