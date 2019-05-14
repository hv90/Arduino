%A analise no dominio da frequencia eh a ferramenta mais usada para o
%diagnostico. O espectro de amplitude eh um grafico que apresenta as
%componentes de frequencia presentes no sinal medido com as amplitudes
%correspondentes.




function [] = beamforming_inverso_frequencia_teste(fs,y,az,el,delta_m,h,par)

    k = 0;
    m = 0;
    n = 0;

    L = length(y); %L = length(X) returns the length of the largest array dimension in X
    N = 2^nextpow2(L);

    sinais = zeros(h,N,az*el);

    for n = 1 : az*el
        for m = 1 : h
            for k = 0 : (N - 1) % N elementos
                FFT = fft(y(m,:),N)/L;
                sinais(m,k + 1,n) = FFT(:,k + 1) * exp(-1j*((2*pi*k*fs)/N)*delta_m(m,n));            
            end
        end
    end

    %%
    %if A is a matrix, sum(A,1) is a row vector containing the sum of each column.

    beam = (sum(sinais,1))/h; % normalizacao

    RMS = rms(beam);

    RMSref = rms(y(:,1));

    [Max,ind] = max(RMS);
    p = par(ind,:)

    mediar = reshape(RMS/RMSref,el,az);
    figure
    imagesc(0:180,0:360,mediar');
    return 
    %%
    figure
    imagesc(signal(10:end-10,:))
    figure
    plot(signal(10:end-10,:))
end