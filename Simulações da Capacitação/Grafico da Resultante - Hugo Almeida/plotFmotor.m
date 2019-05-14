%Trabalho de finalizacao da semana de capacitacao
%
%Plota o valor de thrust ao longo do tempo.
%Nao recebe valores de entrada
%retorna o valor de thrust.
%Para o valor de thrust eh considerado que o robo
%utiliza um motor em seu thrust total e o outro
%em 60 por cento.


function [] = plotFmotor()
  timeRange = 1000;
  thrust = 15.125+(15.125*0.6);
  y=thrust*ones(1,timeRange);
  x=1:1:timeRange;
  
  plot(x,y,'.y');
  xlabel('Time(seconds)','fontsize',20);
  text(timeRange/2, thrust, 'thrust');
endfunction
