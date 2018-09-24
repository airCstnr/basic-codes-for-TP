%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TP - TDS Aleatoire - Fonction
%% Auteurs : Raphael Castanier, Gautier Serodon
%% Date    : 13/04/2018
%% Fonction de quantification de vecteur
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Quantifie un vecteur
% x : vecteur à quantifier
% A : amplitude
% nbit : nombre de bit
% Retourne Xq : le signal quantifié
function Xq = quantif(x, A, nbit)

    Xq = zeros(1, length(x));  % nouveau vecteur vide de meme taille que x
    q  = 2*A / 2^nbit;         % pas de quantification

    seuil_max = A;      % seuil maximum
    seuil_min = -A+q;   % seuil minimum

    % on parcourt tout x pour quantifier chaque valeur
    for ii = 1:length(Xq)
        Xq(ii) = q*round(x(ii)/q);

        % seuillage
        if Xq(ii) > seuil_max
            Xq(ii) = seuil_max;
        elseif Xq(ii) < seuil_min
            Xq(ii) = seuil_min;
        end
    end


%% Test de quantification par la fonction
%
% A = 3;
% N = 1000;
% nbit = 4;
%
% x = linspace(-5, 5, N);
% %x = randn(1, N);
% y = quantif(x, A, nbit);
%
% figure(2)
% plot(x, x, '--');
% hold on;
% plot(x, y, '-');
