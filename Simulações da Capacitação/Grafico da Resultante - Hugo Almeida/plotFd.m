%Trabalho de finalizacao da semana de capacitacao
%Plota o arrasto ao longo do tempo
%Nao recebe valores como entrada.  
%                                          
%Retorna o valor da força de arrasto.
%
%constantes: area do corpo (m^2) = Pi*0.038^2 do hull mais 2*Pi*0.0135^2 dos motores
%            densidade do fluido(kg/m^3) = 1000 
%            Fa = 2,49*v^2

function [Fd] = plotFd()
  
  timeRange=1000; 
  m=0.561;
  v=linspace(0,3.1175,timeRange);
  Fd=2.49.*v.*v; 
  x=1:1:timeRange;

  plot(x,Fd,'-g');
  xlabel('Tempo(s)','fontsize', 20);
  text(timeRange, Fd(length(Fd)), 'Arrasto');

endfunction
