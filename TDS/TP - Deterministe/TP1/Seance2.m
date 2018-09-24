
%% Séance 2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Promo  : P2020 APP
% Auteur : Raphaël Castanier
% Date   : 15/11/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

%% Introduction
% L’objectif principal de ce TP est d’étudier plus particulièrement la représentation fréquentielle des
% signaux.


%% 1) Observation d’une sinusoide


%% 1.1) Signal et module du spectre

Ns  = 85;
f0	= 1000;         % fréquence f0 = 1 kHz
t0  = 1/f0;         % période t0 = 1ms
fe  = 8000;         % fréquence d’échantillonnage = 8 kHz
te  = 1/fe;         % période d’échantillonnage = 0.125ms

tt80        = (0:te:(Ns-1)*te);
signal_x    = cos(2*pi*f0*tt80);

ff80              = (0:fe/Ns:(Ns-1)*fe/Ns); % échelle des fréquences
module_spectre_x  = abs(fft(signal_x));

figure(1);
plot(ff80, module_spectre_x, '-om');

%% 1.2) Nfft
% Calculer et représenter le spectre de X(f) en utilisant fft(x,Nfft) avec Nfft = 2000.
% Comparer le résultat avec celui de la question précédente.
% En vous aidant de l’aide de matlab, expliquer l’opération effectuée par l’option Nfft.
% Expliquer alors le résultat obtenu.

Nfft                   = 2000;
ff80                   = (0:fe/Nfft:(Nfft-1)*fe/Nfft);
module_spectre_x_nfft  = abs(fft(signal_x, Nfft));

hold on;
plot(ff80, module_spectre_x_nfft, '-sb');

% La deuxième courbe met en évidence les lobes.

% L'utilisation de Nfft permet d'ajouter des 0 après le signal pour
% augmenter la précision du spectre.
% Ainsi, on observe avec le deuxième signal les lobes du sinus cardinal lié
% à l'apodisation du signal par une fenêtre rectangulaire.


%% 1.3) Précision
% Calculer et représenter le spectre de X(f) avec Ns = 2000.
% Comparer le résultat avec celui de la question précédente.

Ns2000  = 2000;

tt2000           = (0: te: (Ns2000-1)*te);
signal_x_2000    = cos(2*pi*f0*tt2000);

ff2000                 = (0:fe/Ns2000:(Ns2000-1)*fe/Ns2000); % échelle des fréquences
module_spectre_x_2000  = abs(fft(signal_x_2000));

figure(2);
plot(ff2000, module_spectre_x_2000, '-or');

% On obtient un spectre beaucoup plus précis, et un dirac très fin.
% Le signal est sur plus de points, le spectre est plus précis.


%% 1.4) Module en dB
% Représenter le module calculé en 1.2) en décibels.
% Quel est l’intérêt de cette représentation ?
% (attention sous matlab : la fonction log correspond au ln et la fonction log10 correspond au log).

dB = log10(module_spectre_x_nfft);

figure(3);
plot(ff80, dB);

% Cette représentation permet de dilater l'échelle des ordonnées, et ainsi
% représenter aisément toutes les valeurs prises par le spectre.


%% 2) Observation d’un signal modulé en amplitude


%% 2.1) Travail préparatoire

%% 2.2) Travail préparatoire

%% 2.3) Fréquence d'échantillonnage
% Choisir en justifiant une fréquence d’échantillonnage
% puis en déduire la durée minimale d’observation du signal
% qui permet de distinguer par analyse de Fourier,
% les fréquences présentes dans le spectre de s(t).

% Fréquence d'échantillonnage  : 110kHz
% Période d'échantillonnage    : 10µs

% Nombre de points             : 110000 points (nombre choisi arbitrairement)

% Pas fréquentiel              : 1Hz
% Durée minimale d'observation : 1s


%% 2.4) Nombre de points nécessaires
% Quel est le nombre de points de la FFT nécessaire,
% si l’on souhaite lire le spectre avec une
% précision de 10 Hz ?

% Nobmre de points             : 11000points


%% 2.5) Signal modulé
% Ecrire un programme qui trace le spectre du signal modulé
% avec une résolution de 10 Hz.

N           = 11000;

f0          = 50000;
f1          = 2310;
f2          = 3750;
f3          = 4960;

fe          = 110000;
te          = 1/fe;

tt          = linspace(0, (N-1)*te, N);

composante_f0   = cos(2*pi*f0*tt);
composante_f1   = cos(2*pi*f1*tt);
composante_f2   = cos(2*pi*f2*tt)*1.8;
composante_f3   = cos(2*pi*f3*tt)*0.9;

signal_m = composante_f1 + composante_f2 + composante_f3;

k = 0.25;
signal_s = (1 + k*signal_m) .* composante_f0;

ff          = linspace(0, (N-1)*fe/N, N);
spectre_s   = abs(fft(signal_s));

figure(4);
plot(ff, spectre_s);


%% 3) Effets du fenêtrage sur la résolution


%% 3.1) Signal
% Générer le signal x(n) obtenue par échantillonnage du signal exp(2*pi*j*F0*n*Te) à la fréquence
% d’échantillonnage F e = 1/Te pour une fréquence normalisée f 0 = F 0 / F e = 0.2. Vous prendrez un
% nombre d’échantillons N égal à 2000

N       = 2000;
f0      = 0.2; % f0 = F0/Fe
t0      = 1/f0;

tt          = linspace(0, (N-1)*t0, N);
signal_x    = exp(2*pi*1j*f0*tt);



%% 3.2) Spectre
% Tracer le spectre du signal x(n) en fonction de la fréquence normalisée F 0 / F e .
% Quelle est la fréquence du signal mesurée sur ce spectre ?

ff          = linspace(0, (N-1)*f0/N, N);
spectre_x   = abs(fft(signal_x));

figure(5);
plot(ff, spectre_x);


%% 3.3) Constante de l'amplitude maximale



%% 3.4) Module en DB
% Programme qui affiche le module en décibels de la Transformée de Fourier et de
% x(n) pour la pondération rectangulaire et la pondération de Hamming.

spectre_x_dB        = log10(spectre_x);
module_spectre_x_dB = abs(spectre_x_dB);

%% 3.5) Largeur des lobes



%% 3.6) Illustration des conclusions




