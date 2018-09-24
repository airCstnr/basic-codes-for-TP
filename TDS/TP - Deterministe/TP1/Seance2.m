
%% S�ance 2

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Promo  : P2020 APP
% Auteur : Rapha�l Castanier
% Date   : 15/11/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

%% Introduction
% L�objectif principal de ce TP est d��tudier plus particuli�rement la repr�sentation fr�quentielle des
% signaux.


%% 1) Observation d�une sinusoide


%% 1.1) Signal et module du spectre

Ns  = 85;
f0	= 1000;         % fr�quence f0 = 1 kHz
t0  = 1/f0;         % p�riode t0 = 1ms
fe  = 8000;         % fr�quence d��chantillonnage = 8 kHz
te  = 1/fe;         % p�riode d��chantillonnage = 0.125ms

tt80        = (0:te:(Ns-1)*te);
signal_x    = cos(2*pi*f0*tt80);

ff80              = (0:fe/Ns:(Ns-1)*fe/Ns); % �chelle des fr�quences
module_spectre_x  = abs(fft(signal_x));

figure(1);
plot(ff80, module_spectre_x, '-om');

%% 1.2) Nfft
% Calculer et repr�senter le spectre de X(f) en utilisant fft(x,Nfft) avec Nfft = 2000.
% Comparer le r�sultat avec celui de la question pr�c�dente.
% En vous aidant de l�aide de matlab, expliquer l�op�ration effectu�e par l�option Nfft.
% Expliquer alors le r�sultat obtenu.

Nfft                   = 2000;
ff80                   = (0:fe/Nfft:(Nfft-1)*fe/Nfft);
module_spectre_x_nfft  = abs(fft(signal_x, Nfft));

hold on;
plot(ff80, module_spectre_x_nfft, '-sb');

% La deuxi�me courbe met en �vidence les lobes.

% L'utilisation de Nfft permet d'ajouter des 0 apr�s le signal pour
% augmenter la pr�cision du spectre.
% Ainsi, on observe avec le deuxi�me signal les lobes du sinus cardinal li�
% � l'apodisation du signal par une fen�tre rectangulaire.


%% 1.3) Pr�cision
% Calculer et repr�senter le spectre de X(f) avec Ns = 2000.
% Comparer le r�sultat avec celui de la question pr�c�dente.

Ns2000  = 2000;

tt2000           = (0: te: (Ns2000-1)*te);
signal_x_2000    = cos(2*pi*f0*tt2000);

ff2000                 = (0:fe/Ns2000:(Ns2000-1)*fe/Ns2000); % �chelle des fr�quences
module_spectre_x_2000  = abs(fft(signal_x_2000));

figure(2);
plot(ff2000, module_spectre_x_2000, '-or');

% On obtient un spectre beaucoup plus pr�cis, et un dirac tr�s fin.
% Le signal est sur plus de points, le spectre est plus pr�cis.


%% 1.4) Module en dB
% Repr�senter le module calcul� en 1.2) en d�cibels.
% Quel est l�int�r�t de cette repr�sentation ?
% (attention sous matlab : la fonction log correspond au ln et la fonction log10 correspond au log).

dB = log10(module_spectre_x_nfft);

figure(3);
plot(ff80, dB);

% Cette repr�sentation permet de dilater l'�chelle des ordonn�es, et ainsi
% repr�senter ais�ment toutes les valeurs prises par le spectre.


%% 2) Observation d�un signal modul� en amplitude


%% 2.1) Travail pr�paratoire

%% 2.2) Travail pr�paratoire

%% 2.3) Fr�quence d'�chantillonnage
% Choisir en justifiant une fr�quence d��chantillonnage
% puis en d�duire la dur�e minimale d�observation du signal
% qui permet de distinguer par analyse de Fourier,
% les fr�quences pr�sentes dans le spectre de s(t).

% Fr�quence d'�chantillonnage  : 110kHz
% P�riode d'�chantillonnage    : 10�s

% Nombre de points             : 110000 points (nombre choisi arbitrairement)

% Pas fr�quentiel              : 1Hz
% Dur�e minimale d'observation : 1s


%% 2.4) Nombre de points n�cessaires
% Quel est le nombre de points de la FFT n�cessaire,
% si l�on souhaite lire le spectre avec une
% pr�cision de 10 Hz ?

% Nobmre de points             : 11000points


%% 2.5) Signal modul�
% Ecrire un programme qui trace le spectre du signal modul�
% avec une r�solution de 10 Hz.

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


%% 3) Effets du fen�trage sur la r�solution


%% 3.1) Signal
% G�n�rer le signal x(n) obtenue par �chantillonnage du signal exp(2*pi*j*F0*n*Te) � la fr�quence
% d��chantillonnage F e = 1/Te pour une fr�quence normalis�e f 0 = F 0 / F e = 0.2. Vous prendrez un
% nombre d��chantillons N �gal � 2000

N       = 2000;
f0      = 0.2; % f0 = F0/Fe
t0      = 1/f0;

tt          = linspace(0, (N-1)*t0, N);
signal_x    = exp(2*pi*1j*f0*tt);



%% 3.2) Spectre
% Tracer le spectre du signal x(n) en fonction de la fr�quence normalis�e F 0 / F e .
% Quelle est la fr�quence du signal mesur�e sur ce spectre ?

ff          = linspace(0, (N-1)*f0/N, N);
spectre_x   = abs(fft(signal_x));

figure(5);
plot(ff, spectre_x);


%% 3.3) Constante de l'amplitude maximale



%% 3.4) Module en DB
% Programme qui affiche le module en d�cibels de la Transform�e de Fourier et de
% x(n) pour la pond�ration rectangulaire et la pond�ration de Hamming.

spectre_x_dB        = log10(spectre_x);
module_spectre_x_dB = abs(spectre_x_dB);

%% 3.5) Largeur des lobes



%% 3.6) Illustration des conclusions




