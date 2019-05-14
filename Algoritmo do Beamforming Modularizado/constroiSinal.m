function [Y,y] = constroiSinal(fs,f,h,fase)

    t = 0:1/fs:1;%( t incrementa 1/fs no intervalo 0:1)
    A = 1;%( o que eh A?)

    % (onda)
    x = A*sin(2*pi*f*t + fase);


    % (x1 e x2 estabelecem as bordas de um intervalo a ser utilizado para gerar
    %um sinal "y" com ruido) 
    x1 = 1;
    x2 = x1 + 10 * fs/f;%(fs=f*10 -> x2 = x1+10*10)

    Y = x';%( componentes do sinal,matriz invertida)

    sorteio = sorteioRuido(x2,h);

    y=Y(x1:x2,:) + 0.15*sorteio; % sinais COM RUIDO ate 15% 


end