clc;

runTime = 50;
pauseTime = 0.1;
iteration=1;

init=[pi/2, 0];
pendTopX=0;
pendTopY=1;
L=0.5; g=0.81;
r=g/L;


f= @(t,x) [x(2); -g/L * sin(x(1))];
[t,x] = ode45(f, [0 runTime], init);
sol1=x(:,1);
sol2=x(:,2);
tSize=size(t);
cartX=L*sin(sol1);
cartY=L*cos(sol2);

for i=1:max(tSize)
       
   subplot(2,1,1);
   plotX=[pendTopX, cartX(iteration)];
   plotY=[pendTopY, cartY(iteration)];
   plot(cartX(iteration), cartY(iteration), 'ko', plotX, plotY, 'r-');
   axis([min(cartX), max(cartX), min(cartY), max(cartY)]);
   
   title(['Simple pendulum simulation            \theta = ' num2str(sol1(iteration))],'fontsize',12);
    xlabel('x [m]','fontsize',12);
    ylabel('y [m]','fontsize',12);
    axis([min(cartX), max(cartX) min(cartY) max(cartY)]);

   
   
   
   
   subplot(2,1,2);
   plot(t(iteration), sol1(iteration),'*r');   
   
   hold on;
   axis([0 t(iteration)+t(2)-t(1) min(sol1) max(sol1)]);
   title(['Simple pendulum time series for \theta1       t = ' num2str(t(iteration))],'fontsize',12);
   xlabel('t [seconds]','fontsize',12);
   ylabel('\theta1','fontsize',12);
   
   
   pause(pauseTime);
   
   iteration = iteration+1;
   
end