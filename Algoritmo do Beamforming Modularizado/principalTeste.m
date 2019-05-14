%(NOTA: O sistema funciona recebendo sinais dos transdutores, gravando estes 
%       sinais para posterior analise, e realizando processamentos e analises
%       em tempo real. Os arquivos gravados podem ser lidos e processados 
%       como se o experimento estivesse sendo feito naquele momento, 
%       permitindo testes off-line com novos algoritmos e configuracoes.
%       Para o processamento, criou-se a matriz de atrasos teoricos 
%       calculados a partir das posicoes de busca. Apos, eh calculada a 
%       matriz de atrasos reais correspondente a cada pulso recebido.
%       O pulso transmitido é gravado em um canal separado. 
%       Depois varre todo o espaco de angulos desejado, usando a matriz de atrasos
%       para cada par de angulos de elevacao e azimute para criar um conjunto
%       de sinais sincronizados para as direcoes.)


clc; clear all; close all;

%%(Declaracao de variaveis)--------------------------------------------------

v_som = 1500; % velocidade do som no meio em m/s
f = 25000; % frequencia do sinal simulado
k = 1/4; % k <= 1/2, ja que v_som/f = lambda e r <= lambda/2, aliasing espacial
r = v_som/f * k; % raio do arranjo em m
coord = [0 0 r
         -r 0 0
         0 0 -r
         0 r 0];
         %r 0 0];
         %0 r 0]; % coordenadas dos hidrofones
h = size(coord,1); % numero de hidrofones
larg_az_theta = 5; % largura (azimute)
larg_el_phi = 5; % largura (elevacao)
az = length(0:larg_az_theta:360); % numero de angulos
el = length(0:larg_el_phi:180);
fs = f * 10; % frequencia de amostragem

% (area coberta pelos microfones? num_ondas*segundo ?)
delta_m = zeros(h,az*el);

% (matriz de pares [az, el] para consulta)
par = zeros(az*el,2);


%----------------------------------------------------------------------------------------------------

[az_theta, el_phi, s, delta_m, par] = inicializaMatrizes(az, el, h, larg_az_theta, larg_el_phi, coord);



%% Simulacao dos canais--------------------------------------------------

PAR = [30 120]; % 0 <= (az_theta) <= 360�, 0 <= (el_phi) <= 180�

% na prova da ROBOSUB -> 0 <= theta <= 180�, 90� <= phi <= 180�

fase=checaPar(PAR,az,el,par,f,delta_m);


[Y,y]= constroiSinal(fs,f,h,fase); 
%plot(y);
%legend('1','2','3','4','5');
%grid;

beamforming_inverso_tempo_teste(fs,y,az,el,delta_m,h,par);

beamforming_inverso_frequencia_teste(fs,y,az,el,delta_m,h,par);

%lobulos(fs,y,az,el,delta_m,h,par)


