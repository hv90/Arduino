       
function pendulumAnimation2()

clc;clear all; close all;
tRange=100;
th=linspace(0,53.13,tRange)*pi/100;
l=5;
xTemp(1)=0;
y(1)=0;
xTemp=linspace(0,53.13,tRange);
x=xTemp';
yTemp=linspace(0,53.13,tRange);
y=yTemp';
  for t=1:length(th)
   
     y(:,2)=-l*cos(th);     
     x(:,2)=l*sin(th);
     plot(x,y,'k-');
     pause(0.1);
    
  end
  disp(size(y));
end