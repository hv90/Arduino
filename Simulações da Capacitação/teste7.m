%MUV
%A=dv/dt=V-v0/t-t0
%A*T+v0=V
%plot(1, 1, 'ko','markerfacecolor', 'b', 'markersize', 15); %ponto
clf;
%valores padroes pre definidos
deltaT=0.001;
vel=0;
motor=3;
massa=0.561;
arrasto=0;
ang=90;
t=0;
vel(1)=0;
pos=0;
r=0.08;

%t=linspace(1, 10, 100);
%plot(t, v0+a*t);
%matriz_vel=[];
%matriz_arr=[];
%inicia uma contagem para plotar no grafico

iterations=1;
for i=linspace(1, 100, 100);
  %calcula valores
  resultante1=motor-arrasto;
  aceleracao=resultante1/massa;
  vel=vel+aceleracao*deltaT;
  arrasto=2.49*vel**2;
  centripeta=(1/r)*massa*vel**2;
  t=t+deltaT;
  ang=ang+(t*vel+aceleracao*t**2)/r; 
  %pos=pos+t*vel+aceleracao*t**2;
  
  subplot(2, 2, 1);
  title('Arrasto(t)', 'fontsize', 20);
  xlabel('Tempo(segundos)', 'fontsize', 20);
  ylabel('Arrasto(N)', 'fontsize', 20);
  axis([0, 150, 0, 5]);
  hold on
  plot(iterations, resultante1, 'b');
  plot(iterations, motor, 'k');
  plot(iterations, arrasto, 'g');
  plot(iterations, centripeta, 'c');
  text(140,4,'motor','color','black');;
  text(120,3,'motor-drag','color','blue');
  text(120,5,'centripeta','color','cyan');
  text(140,2,'drag','color','green');
  drawnow;
  
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
  
  
  r1=3/2;
  r2=r1/3;
    plot(cos(ang), sin(ang),'ko');
    rectangle('Position',[-r1 -r1 2*r1 2*r1],'Curvature',[1,1]);
    rectangle('Position',[-r2 -r2 2*r2 2*r2],'Curvature',[1,1]);

  
  drawnow;
  iterations=iterations+1;
  
end


%subplot(2, 1, 1);
%plot(matriz_vel);
%subplot(2, 1, 2);
%plot(matriz_arr);