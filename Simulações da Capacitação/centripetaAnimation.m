   vC = [4; 10];                          % initial position of A
   Fc = [2.3100; -0.5500];                % initial velocity of A
   a=3;
   dt = 0.1;                              % time step for animation
   %clf;                                   % Clear the figure 
   axis(50*[0 1 0 1],'square');           % Set axis limits
   grid on;
   hold on;                               % Keep plot from erasing
     for t=0:dt:15                        % t is time variable 
        plot(Fc(1),Fc(2),'ro')            % Plot circle
        v = v + a*dt;
        Fc=m.*v.*v./2;
        % update position
        pause(dt)                         % pause for animation
     end