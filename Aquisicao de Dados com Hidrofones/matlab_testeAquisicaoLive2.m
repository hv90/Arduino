clc;close all;

s = daq.createSession('ni');
addAnalogInputChannel(s,'dev1', 0, 'Voltage');
addAnalogInputChannel(s,'dev1', 1, 'Voltage');
addAnalogInputChannel(s,'dev1', 2, 'Voltage');
addAnalogInputChannel(s,'dev1', 3, 'Voltage');
s.Rate = 1000;
s.DurationInSeconds = 1;
lh = addlistener(s,'DataAvailable', @beamforming_tempo);
s.startBackground();

%%
function [az,el]= beamforming_tempo(src,event)

    y=event.Data
    disp(size(y));
    plot(y);
    
    [az,el,delta_m,fs,h]=atraso();
    
    signal = zeros(length(y),az*el); % numero de elementos do array x combinacoes de angulos
    media = zeros(1,az*el);

    for i = 1:az*el
       n_amostras = delta_m(:,i) * fs; % numero de amostras
       sinal(:,i) = (sum(delayseq(y,n_amostras),2))/h; % Negative values of DELAY advance data, while positive values delay data
    end

    RMSref = rms(y(:,1));
    RMS = rms(sinal);

    [Max,ind] = max(RMS);
    %p = par(ind,:);    
    figure
    plot(sinal)
    mediar = reshape(RMS/RMSref,el,az);
    figure
    imagesc(0:180,0:360,mediar');
    
end
%%
function [az,el,delta_m,fs,h] = atraso()
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
    larg_theta = 5; % largura
    larg_phi = 5; % largura
    az = length(0:larg_theta:360); % numero de angulos
    el = length(0:larg_phi:180);
    fs = f * 10; % frequencia de amostragem

    delta_m = zeros(h,az*el);
    par = zeros(az*el,2);

    for n = 1:az
        for m = 1:el
            for k = 1:h
                theta = (n - 1) * larg_theta;
                phi = (m - 1) * larg_phi;
                s = [cosd(theta)*sind(phi) sind(theta)*sind(phi) cosd(phi)];
                delta_m(k,(n-1)*el+m) = (dot(s,coord(k,:)))/v_som;
                par((n-1)*el+m,:) = [theta phi]; % pares de angulos para consulta
            end
        end
    end

    %THETA -> AZIMUTE
    %PHI -> ELEVAÇÃO
end


