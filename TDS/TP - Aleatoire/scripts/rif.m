
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TP - TDS Aleatoire - Fonction
%% Auteurs : Raphael Castanier, Gautier Serodon
%% Date    : 04/06/2018
%% Filtre RIF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Filtre RIF synthétisé par la méthode de la fenêtre
% USAGE : h = rif(N,f0)
% N = longueur du filtre
% f0 = fréquence de coupure normalisée
function h=rif(N,f0)
    P=fix(N/2);
    ham=0.54-0.46*cos(2*pi*(0:P-1)/(N-1)); % Fenêtre de Hamming
    if (rem(N,2)==0) % Cas où N est pair
        d=((-P:-1)+0.5)*pi; % Calcul sur une moitié
        h=sin(2*d*f0)./d; % Réponse impulsionnelle de la fenêtre rectangle
        h=h.*ham; % Apodisation
        h=[h h(P:-1:1)]; % Symétrie
    else % Cas où N est impair
        d=(-P:-1)*pi; % Cacul sur une moitié
        h=sin(2*d*f0)./d; % Réponse impulsionnelle de la fenêtre rectangle
        h=h.*ham; % Apodisation
        h=[h 2*f0 h(P:-1:1)];% Symétrie et l'échantillon central
    end
end
