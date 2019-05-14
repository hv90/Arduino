%A analise no dominio do tempo abrange todas as tecnicas que sao aplicadas
%diretamente em um sinal medido no tempo. Um método básico consiste em
%medir o valor global de vibracao, geralmente o valor eficaz (RMS), do
%sinal no dominio do tempo proveniente de um transdutor. O nivel do valor
%medido eh entao comparado com valores determinados por recomendacoes do
%fabricante, em relacao ao tipo de equipamento.


function [n_amostras] = beamforming_inverso_tempo_teste(fs,y,az,el,delta_m,h,par)
    

    sinal = zeros(length(y),az*el); % numero de elementos do array x combinacoes de angulos
    media = zeros(1,az*el);

    for i = 1:az*el
       n_amostras = delta_m(:,i) * fs; % numero de amostras (medido em )
       sinal(:,i) = (sum(delayseq(y,n_amostras),2))/h; % Negative values of DELAY advance data, while positive values delay data
                                                       % (delayseq estah atrasando o sinal em funcao
                                                       %   do num de amostras)   
                                                       % ( sum (info,2) eh um vetor coluna que estah somando 
                                                       %   cada linha. 2 eh o numero da dimensao em que ocorre a soma)
                                                       % (sinal eh uma matriz tam(y) X az*el)

    end

    RMSref = rms(y(:,1));%(valor eficaz do sinal com ruido calculado a partir de y )
    RMS = rms(sinal);      %(idem para sinal)

    [Max,ind] = max(RMS); %(maiores elementos do sinal com ruido e defasado, respectivo vetor de indices dos valores max)
    p = par(ind,:)             

    mediar = reshape(RMS/RMSref,el,az);%(remodela RMS/RMSref a uma matriz de dimensao el X az)
    figure
    imagesc(0:180,0:360,mediar');
    return
    %%
    figure
    imagesc(sinal(10:end-10,:))
    figure
    plot(sinal(10:end-10,:))

            
end