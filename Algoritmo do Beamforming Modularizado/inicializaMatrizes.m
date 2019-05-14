function [theta, phi, s, delta_m, par] = inicializaMatrizes(az, el, h, larg_az_theta, larg_el_phi, coord)
    v_som = 1500; % velocidade do som no meio em m/s
    f = 25000; % frequencia do sinal simulado
    k = 1/4; % k <= 1/2, ja que v_som/f = lambda e r <= lambda/2, aliasing espacial
    r = v_som/f * k; % raio do arranjo em m

    for n = 1:az
        for m = 1:el
            for k = 1:h %( lembrar: h eh num_hidrofones )

                %(matriz de angulos azimute e elevacao)
                theta = (n - 1) * larg_az_theta;%( theta eh o angulo de azimute)
                phi = (m - 1) * larg_el_phi;%( phi eh o angulo de elevacao)

                %(matriz de atraso: onda plana)
                s = [cosd(theta)*sind(phi) sind(theta)*sind(phi) cosd(phi)];

                %(matriz de atraso correspondente ao espaco de busca)
                delta_m(k,(n-1)*el+m) = (dot(s,coord(k,:)))/v_som;



                par((n-1)*el+m,:) = [theta phi]; % pares de angulos para consulta
            end
        end
    end

end