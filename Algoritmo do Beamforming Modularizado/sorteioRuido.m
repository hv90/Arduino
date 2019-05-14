function [sorteio] = sorteioRuido(x2,h)

%("sorteio" recebe uma matriz pseudo-aleatoria de tamanho x2 por num_hidrofones, 
%extrai-se 15% dele para somar a Y(x1:x2, :) 
%que sao os vetores linha ao longo das 4 colunas. 
%O sinal eh guardado em "y")

sorteio=randn(x2,h); % (matriz  com valores pseudo-random)



end