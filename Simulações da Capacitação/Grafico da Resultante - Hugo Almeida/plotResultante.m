%Trabalho de finalizacao da semana de capacitacao
%Plota a forca resultante ao longo do tempo
%Nao recebe entrada.
%                    

function [] = plotResultante()

  timeRange=1000; 
  Ft=15.125+(15.125*0.6)*ones(1,timeRange);
  Fd=plotFd();
% F resultante = m*a = Thrust - F drag
  Fr = (Ft - Fd);
  x=1:1:timeRange;

  plot(x,Fr,'-r');
  title('Resultante Fc X Fd','fontsize',20);
  xlabel('Tempo(s)','fontsize', 20);
  text(timeRange, Fr(length(Fr)), "Resultante");

endfunction
