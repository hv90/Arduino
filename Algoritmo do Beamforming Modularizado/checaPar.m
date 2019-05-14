function [fase] = checaPar(PAR,az,el,par,f,delta_m)
% (escolhe-se um par [az_theta, el_phi]. Se esse par estiver na matriz
% "par", a fase recebe f2pidelta_m, onde o delta_m eh o correspondente
% na matriz "par" do par escolhido)
% (como eh feita a escolha do par ?)

    for i = 1:az*el

        %(checando se o par escolhido estah na matriz "par")
        if par(i,:) == PAR
            fase = 2 * pi * f * delta_m(:,i);
        end
    end

end