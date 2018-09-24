
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TP - TDS Aleatoire - Fonction
%% Auteurs : Raphael Castanier, Gautier Serodon
%% Date    : 04/06/2018
%% Filtre RIF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Filtre RIF synth�tis� par la m�thode de la fen�tre
% USAGE : h = rif(N,f0)
% N = longueur du filtre
% f0 = fr�quence de coupure normalis�e
function h=rif(N,f0)
    P=fix(N/2);
    ham=0.54-0.46*cos(2*pi*(0:P-1)/(N-1)); % Fen�tre de Hamming
    if (rem(N,2)==0) % Cas o� N est pair
        d=((-P:-1)+0.5)*pi; % Calcul sur une moiti�
        h=sin(2*d*f0)./d; % R�ponse impulsionnelle de la fen�tre rectangle
        h=h.*ham; % Apodisation
        h=[h h(P:-1:1)]; % Sym�trie
    else % Cas o� N est impair
        d=(-P:-1)*pi; % Cacul sur une moiti�
        h=sin(2*d*f0)./d; % R�ponse impulsionnelle de la fen�tre rectangle
        h=h.*ham; % Apodisation
        h=[h 2*f0 h(P:-1:1)];% Sym�trie et l'�chantillon central
    end
end
