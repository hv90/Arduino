%Trabalho de finalizacao da semana de capacitacao
%Plota a força centrípeta ao longo do tempo
%Não recebe entrada.  
%                     
%Retorna o valor da força centrípeta.

function [Fc] = plotFc()
  
  timeRange=1000;  
  m=0.561;
  v=linspace(0,3.1175,timeRange);
  Fc=m*(v.*v)/raio;
  x=1:1:timeRange;

  plot(x,Fc,'-b');
  xlabel('Tempo(s)','fontsize', 20);
  text(timeRange, Fc(length(Fc)), "Centripeta");  
endfunction;


