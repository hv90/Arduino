%Tarefa de Software 
%Plota a trajetoria de um robo com pre-determinadas especificacoes 
%e janelas de graficos com relacoes das variaveis que atuam sobre o robo
%Atividade em dupla:
%Bruno Zarjitsky - plot das janelas com as variaveis atuantes sobre o robo
%Hugo Almeida    - plot da trajetoria do robo


clf;
%-------------------------------------------------------------------------
%constants:

deltaT=0.001; %variacao pre-definida
vel=0;   %v0 em m/s
motor=3; %valor estimado para o thrust
massa=0.561; %massa do robo em kg 
DF=0;    %drag force inicial em N
ang=90;  %posicao angular estimada
t=0;     %t0 em segundos
pos=0;   %s0 em metro
r=0.08;  %raio pre-fixado em 80 cm

%---------------------------------------------------------------------------
%animacao:

iterations=1;

%define a animacao para parar de plotar no instante t=100 segundos
for i=linspace(1, 100, 100); 
       
  %--------------------------------------------------------------------------     
  %calcula e atualiza valores a serem plotados no grafico:
  
  resultante1=motor-DF;
  aceleracao=resultante1/massa;
  vel=vel+aceleracao*deltaT;
  DF=2.49*vel**2;
  centripeta=(1/r)*massa*vel**2;
  t=t+deltaT;
  ang=ang+(t*vel+aceleracao*t**2)/r;
  
  %-------------------------------------------------------------------------
  %plota o grafico Force(t):
  
  subplot(2, 2, 1);
  title('Force(t)', 'fontsize', 20);
  xlabel('Tempo(segundos)', 'fontsize', 20);
  ylabel('Force(N)', 'fontsize', 20);
  axis([0, 150, 0, 5]);
  hold on
  plot(iterations, resultante1, 'b');
  plot(iterations, motor, 'k');
  plot(iterations, DF, 'g');
  plot(iterations, centripeta, 'c');
  text(140,4,'motor','color','black');;
  text(120,3,'motor-drag','color','blue');
  text(120,5,'centripeta','color','cyan');
  text(140,2,'drag','color','green');
  drawnow;
  
  %---------------------------------------------------------------------------
  %plota o grafico Velocidade(t):
  
  hold on;
  subplot(2, 2, 2);
  title('Velocidade(t)', 'fontsize', 20);
  xlabel('Tempo(segundos)', 'fontsize', 20);
  ylabel('Velocidade(m/s)', 'fontsize', 20);  
  axis([0, 150, 0, 5]);
  hold on;
  plot(iterations, vel, 'r');
  drawnow; 
  hold on
  subplot(2,1,2);
  axis([0, 10, 0, 10]);
  
  %---------------------------------------------------------------------------
  %plota a trajetoria do robo

  r1=3/2;  %raio maior da plataforma (arbitrario)
  r2=r1/3; %raio menor da plataforma (arbitrario)  

  plot(cos(ang), sin(ang),'ko');
  rectangle('Position',[-r1 -r1 2*r1 2*r1],'Curvature',[1,1]);
  rectangle('Position',[-r2 -r2 2*r2 2*r2],'Curvature',[1,1]);
  text(-0.3,0,'Trajetoria','fontsize',20);
  drawnow;
  iterations=iterations+1;
  
end
