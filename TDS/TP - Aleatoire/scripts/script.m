
%% MA369 -  TDS Aleatoire - TP - Script
% * Auteurs : Raphael Castanier, Gautier Serodon
% * Date    : 13/04/2018
% * Script principal du TP

%%
%
% <<../logo_ESISAR.svg>>
%

% -------------------------------
% TODO :
% - attention aux noms de variables
% - utiliser des disp() pour affichier les resultats de RSB
% - Ajouter le Schema recapitualtif du TP
% -------------------------------

% Initialisation
clear all;
close all;
clc;

%% Exercice 1 : Etude de la quantification

%% Partie Simulation

%% 51. Signal gaussien
% Generer  un  signal  aleatoire  de  2000  echantillons  et  d'ecart-type 
% egal  a   un,  en  utilisant  la  fonction erandne. Prelever, a  partir 
% de l'aide de Matlab, les caracteristiques du signal ainsi genere. 
% Determiner sa puissance moyenne.

nb_ech    = 2000;                  % nombre d'echantillons
sigma     = 4;                     % largeur de la gaussienne
signal_g  = sigma*randn(1,nb_ech); % signal
amplitude = max(signal_g);         % amplitude du signal

figure; hold on;
plot(signal_g);
title('Signal guassien');
legend('signal gaussien');
xlabel('Temps (s)');
ylabel('Amplitude');


%% 52. Quantification
% Quantifier (par arrondi) le signal aleatoire genere precedemment pour un 
% nombre de bits allant de 1 a  7. La fonction "floor" ou ses semblables 
% pourra etre utilisee.

figure; hold on;
plot(signal_g, 's');

quantif_bits = zeros(7, length(signal_g));                       % reservation de l'espace memoire
for index = 1:7                                                  % quantification pour chaque nombre de bits allant de 1 à 7
    quantif_bits(index,:) = quantif(signal_g, amplitude, index); % quantification avec ii bits
    plot(quantif_bits(index,:), '.');                            % affichage de la quantification
end

title('Quantification du signal guassien');
legend('signal gaussien','1bit','2bit','3bit','4bit','5bit','6bit','7bit');
xlabel('Temps (s)');
ylabel('Amplitude');

% Note : plus le point est loin de sa case, plus l'erreur de quantification
% est grande


%% 53. Erreur de quantification
% Dans chaque cas (nombre de bits allant de 1 a  7), calculer et  tracer 
% l'histogramme de l'erreur commise lors de la quantification. Cette erreur 
% est definie comme la difference entre le signal aleatoire genere et celui 
% quantifie. L'histogramme  pourra  etre  represente  en  utilisant  la 
% fonction  "hist". Verifier  l'hypothaese d'equirepartition du bruit de 
% quantification.

figure;

erreur_quantif = zeros(7, length(signal_g));                    % reservation de l'espace memoire
for index = 1:7                                                 % calcul de l'erreur pour chaque nombre de bits allant de 1 à 7
    erreur_quantif(index,:) = signal_g - quantif_bits(index,:); % erreur de quantifiaction
    subplot(7,1,index);
    hist(erreur_quantif(index,:));                              % histogramme de l'erreur
    xlabel('Amplitude de l erreur');
    ylabel('Nombre d occurences');
end


%% 54. Rapport signal bruit
% Determiner le rapport signal sur bruit en utilisant d une part, le calcul
% direct a partir du signal genere et de l erreur commise lors de la 
% quantification, et d autre part, la relation determinee theoriquement.
% Pour la comparaison, representer sur un meme graphique ces rapports
% signal sur bruit en fonction du nombre de bits.

% ----------------------------
% TODO : faire cet exercice
% ----------------------------

% puissance = var(x)
% puissance du bruit de quantification = var(quantif - x)
% RSB = p1 / p2


%% Exercice 2 : Mise en forme spectrale du bruit de quantification

%% 1. Generation des signaux

Amplitudes     = [1,2 3,2 2,7 ];  % Amplitudes
Frequences     = [437 504 1367];  % Frequences
Fe1            = 44100;           % Fe1 = 44,1kHz
Fe2            = 4*Fe1;           % Fe2 = 4*Fe1
tt1            = 0:1/Fe1:10/Frequences(1);  % vecteur temporel de pas Te1 et couvrant 10 periodes du signal de plus faible frequence (donc de plus grande periode)
tt2            = 0:1/Fe2:10/Frequences(1);  % vecteur temporel de pas Te2 et couvrant 10 periodes du signal de plus faible frequence

% 3 sinusoides
sin0_1 = Amplitudes(1)*sin(2*pi*Frequences(1)*tt1);
sin1_1 = Amplitudes(2)*sin(2*pi*Frequences(2)*tt1);
sin2_1 = Amplitudes(3)*sin(2*pi*Frequences(3)*tt1);

sin0_2 = Amplitudes(1)*sin(2*pi*Frequences(1)*tt2);
sin1_2 = Amplitudes(2)*sin(2*pi*Frequences(2)*tt2);
sin2_2 = Amplitudes(3)*sin(2*pi*Frequences(3)*tt2);

SE1    = sin0_1 + sin1_1 + sin2_1;       % signal SE echanillonnne a Fe1
SE4    = sin0_2 + sin1_2 + sin2_2;       % signal SE echanillonnne a Fe2

figure; hold on;
plot(tt1, SE1);
plot(tt2, SE4);
title('Signaux SE1 et SE4');
xlabel('Temps (s)');
ylabel('Amplitude');
legend('SE1','SE4');

% Note : la qualite des signaux reste acceptable a l'oeil

%% 2. Interpolation

SE4int  = interp(SE1, 4); % SE4 interpolee

% Limitation de la plage
figure; hold on;
plot(tt2(1:1000), SE4(1:1000));
plot(tt2(1:1000), SE4int(1:1000));
title('Signaux SE4 et SE4int');
xlabel('Temps (s)');
ylabel('Amplitude');
legend('SE4','SE4int');

% Bruit, RSB et RSB en dB pour SE4int
bruit_SE4int    = SE4int(1:1000)-SE4(1:1000);          % ecart SE4-SE4int
RSB_SE4int      = var(SE4(1:1000))/var(bruit_SE4int);  % rapport signal bruit
RSBdB_SE4int    = 10*log10(RSB_SE4int)                 % RSB exprime en dB

% On obtient un RSB de 77,4dB.
% Il doit se rapprocher d'un RSB de x bits (avec x compris entre 1 et 7,
% voir 53, 54)
% On perd 6dB par bit supplementaire


%% 3. Rapport signal sur bruit de la quantification
% Quantifier sur N1 = 8 bits les echantillons preleves à la frequence 
% Fe1 = 44,1 kHz.

amp   = sum(Amplitudes);
SE1Q8 = quantif(SE1, amp, 8); % Seqence echantillonnee a la frequence Fe1 et quantifie sur 8 bits
SE1Q6 = quantif(SE1, amp, 6); % Seqence echantillonnee a la frequence Fe1 et quantifie sur 6 bits

bruit_SE1Q8   = SE1Q8(1:1000)-SE1(1:1000);          % ecart
RSB_SE1Q8     = var(SE1(1:1000))/var(bruit_SE1Q8);  % rapport signal bruit
RSBdB_SE1Q8   = 10*log10(RSB_SE1Q8)                 % RSB exprime en dB

% On obtient un RSB de 36,9dB.
% La reponse est coherente car 36.9dB est inferieur à 6.02*8+1.75 = 50dB
% Le RSB est moins bon que le premier, donc on a plus de bruit

bruit_SE1Q6   = SE1Q6(1:1000)-SE1(1:1000);          % ecart
RSB_SE1Q6     = var(SE1(1:1000))/var(bruit_SE1Q6);  % rapport signal bruit
RSBdB_SE1Q6   = 10*log10(RSB_SE1Q6)                 % RSB exprime en dB

% On obtient un RSB de 24,6dB.
% C'est un meilleur RSB

figure; hold on;
plot(tt1, SE1);
plot(tt1, SE1Q8);
plot(tt1, SE1Q6);
title('Signaux SE1Q8 et SE1Q6');
xlabel('Temps (s)');
ylabel('Amplitude');
legend('SE1','SE1Q8','SE1Q6');


%% 4. Sur-echantillonnage

%% 42. Application et simulation
% Sur-echantillonner à la frequence fe2 la sequence SE1Q8 en utilisant la fonction d’interpolation, la sequence obtenue est notee SE4Q8.

% interpolation
SE4Q8 = interp1(tt1, SE1Q8, tt2, 'spline'); % interpolation du signal SE1Q8 de la frequence Fe1 à la frequence Fe2, avec la methode spline (meilleure du marche)

% quantification
SE4Q6 = quantif(SE4Q8, amp, 6); % quantification sur 6 bits

% filtrage
SE4Q6_avant_filtrage = SE4Q6;
SE4Q6_apres_filtrage = filter(rif(100,1/8), 1, SE4Q6); % filtrage

% Choix de la frequence de coupure : cela permet d'obtenir un spectre de
% largeur Fe1

% Reponse impulsionnelle du RIF  : fenêtre de hamming
% Reponse en frequence           : filtre passe-bas

% figure : module en decibels de la reponse en frequence du RIF
Nb_points      = 999;
axe_des_temps  = linspace(-Nb_points/2,Nb_points/2,Nb_points);
figure; hold on;
plot(axe_des_temps, abs(fftshift(fft(rif(Nb_points,1/8)))));
title('Module en decibels de la reponse en frequence du RIF');
xlabel('Frequence (Hz)');
ylabel('Gain (dB)');


% figure : SE4, SE4Q6 (avant filtrtage) , SE4Q6 (après filtrage)
figure; hold on;
plot(tt2, SE4);
plot(tt2, SE4Q6_avant_filtrage);
plot(tt2, SE4Q6_apres_filtrage);
title('Signaux SE4/SE4Q6 avant filtrage/SE4Q6 après filtrage');
legend('SE4','SE4Q6 avant filtrage','SE4Q6 après filtrage');
xlabel('Frequence (Hz)');
ylabel('Gain (dB)');

% On remarque la presence d'un dephasage par le RIF

% RSB : avant filtrage
bruit_avant_filtrage = SE4Q6_avant_filtrage - SE4;
RSB_avant_filtrage   = var(SE4)/var(bruit_avant_filtrage);  % rapport signal bruit

% RSB : après filtrage
SE4Q6_apres_filtrage = SE4Q6_apres_filtrage(50:end); % compensation du dephasage du filtre
bruit_apres_filtrage = SE4Q6_apres_filtrage - SE4(1:end-49);
RSB_apres_filtrage   = var(SE4(1:end-49))/var(bruit_apres_filtrage);  % rapport signal bruit
RSBdB_SE4Q6 = 10*log10(RSB_apres_filtrage)  % rapport signal bruit

gain_obtenu = RSB_apres_filtrage / RSB_avant_filtrage;

% On a un gain de 2,5 ce qui est très encourageant



%% 5. Mise en forme spectrale du bruit

%% 54. Simulation

% On a SE1Q8
% On a SE4Q8

Err = zeros(1, length(SE4Q8));  % erreur
Z   = zeros(1, length(SE4Q8));  % sortie du quantificateur avant filtre
U   = zeros(1, length(SE4Q8));  % entree du quantificateur

% on parcourt tout SE4Q8 pour obtenir Z (sortie avant filtre)
for index = 2 : length(SE4Q8)-1
    U(index)   = SE4Q8(index) - Err(index-1); % entree du quantificateur (avec l'erreur precedente)
    Z(index)   = quantif(U(index), amp, 6);  % sortie du quantificateur
    Err(index) = Z(index) - U(index);         % erreur de quantification
end

% Filtrage de Z
SE4Q6M = filter(rif(100,1/8), 1, Z); % filtrage

% RSB
SE4Q6M_comp = SE4Q6M(50:end); % compensation du dephasage du filtre
bruit  = SE4Q6M_comp - SE4Q8(1:end-49);
RSB_apres    = var(SE4Q8(1:end-49))/var(bruit); % rapport signal bruit
RSBdB_SE4Q6M  = 10*log10(RSB_apres)                    % RSB exprime en dB


% Très sale : gerer correctement les variables
bruit   = SE1Q8(1:1000)-SE1(1:1000);    % ecart
RSB_avant     = var(SE1(1:1000))/var(bruit);  % rapport signal bruit

gain_obtenu = RSB_apres / RSB_avant

% On a un gain entre SE1Q8 et SE4Q6M de 0.3346 (bon)

figure; hold on;
plot(tt2, SE4Q8);
plot(tt2, Z);
plot(tt2, Err);
plot(tt2, SE4Q6M);
title('Signal SE4Q8 après filtrage (SE4Q6M)');
legend('SE4Q8','Z','Err','SE4Q6M');
xlabel('Frequence (Hz)');
ylabel('Gain (dB)');


%% 6. Recapitulatif

% Schema avec les annotations

%%
% 
% <<../recap.png>>
% 

