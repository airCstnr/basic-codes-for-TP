
%% Séance 3

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Promo  : P2020 APP
% Auteur : Raphaël Castanier
% Date   : 08/12/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

%% Introduction
% Représentation par spectrogrammess


%% 1) Spectrogramme d'un signal


%% 1.1) Chirp
% La fréquence commence à 1hz et atteind 400 hertz à t = 2 secondes.

N  = 2000;
fe = N/2;
te = 1/fe;
tt = linspace(0,N*te,N);

f0 = 1;
f1 = 400;
t1 = 2;     % fin à t1 = 2s

y_quadratic = chirp( tt, f0, t1, f1, 'quadratic' );
y_lineaire  = chirp( tt, f0, t1, f1);

figure(1);
subplot(2,1,1);
plot( tt, y_quadratic );
subplot(2,1,2);
plot( tt, y_lineaire  );


%% 1.2) Spectrogramme

figure(2);
subplot(2,1,1);
spectrogram( y_quadratic );
subplot(2,1,2);
spectrogram( y_lineaire );


%% 1.3) Type de fenetre

figure(3);
subplot(2,1,1);
spectrogram( y_quadratic, hann(20), 10, 320 );
subplot(2,1,2);
spectrogram( y_lineaire, hamming(20), 10, 320 );


%% 1.4) Type de fenetre

figure(4);

subplot(2,2,1);
spectrogram( y_quadratic, 20, 10, 20 );
title('quadratique 20');
subplot(2,2,2);
spectrogram( y_quadratic, 20, 10, 320 );
title('quadratique 320');

subplot(2,2,3);
spectrogram( y_lineaire, 20, 10, 20 );
title('linéaire 20');
subplot(2,2,4);
spectrogram( y_lineaire, 20, 10, 320 );
title('linéaire 320');


%% 1.5) Intéret du spectrogramme

% Le spectrogramme permet de visualiser la variation
% dans le temps du 
% spectre du signal


%% 2) Spectrogramme d'un signal audio


%% 2.1) Chargement flux
% electro, rap, metal1, metal2 et guitare

electro  = audioread('res/electro.wav');
% rap      = audioread('res/rap.wav');
% metal1   = audioread('res/metal.wav');
% metal2   = audioread('res/metal2.mp3');
% guitare  = audioread('res/guitare.mp3');

%% 2.2) Ecoute

%disp ('lecture...');
%sound(metal1, 44100);


%% 2.3) Taille de fichier

%disp ('taille de rap.wav : ');
%size(rap)

% taille du flux lu = 23833992 (par piste)
% taille du flux lu = 23833992*2 (stéréo)
% taille du flux lu = 23833992*2*2 (lus en long (32bits) --> en int (15bits))
% taille en ko      = 23833992*2*2 / 1024 = 93 102 ko

% Les différences sont liées aux données d'en-tête
% du format wav


%% 2.4) Troncature

tronq_electro  = audioread( 'res/electro.wav' , [2000e3, 2400e3] );
% tronq_rap      = audioread( 'res/rap.wav'     , [2000e3, 2400e3] );
% tronq_metal1   = audioread( 'res/metal.wav'   , [2000e3, 2400e3] );
% tronq_metal2   = audioread( 'res/metal2.mp3'  , [2000e3, 2400e3] );
% tronq_guitare  = audioread( 'res/guitare.mp3' , [2000e3, 2400e3] );



%% 2.5) Spectrogrammes
% fenêtre de hamming de 100, un overlap de 50 et un nFFT de 320

figure(5);

subplot(2,2,1);
spectrogram( tronq_electro(:,1), hamming(100), 50, 320 );
title('Electro');

% subplot(2,2,2);
% spectrogram( tronq_rap(:,1), hamming(100), 50, 320 );
% title('Rap');
% 
% subplot(2,2,3);
% spectrogram( tronq_metal1(:,1), hamming(100), 50, 320 );
% title('Métal 1');
% 
% subplot(2,2,4);
% spectrogram( tronq_metal2(:,1), hamming(100), 50, 320 );
% title('Métal 2');


%% 3) Recherche d’un extrait musical

% lecture de l'extrait
load('res/extrait.mat', 'extrait');

% corrélation de l'extrait avec les morceaux

C_electro  = xcorr( electro(:,1), extrait );
% C_rap      = xcorr( rap(:,1),     extrait );
% C_metal1   = xcorr( metal1(:,1),  extrait );
% C_metal2   = xcorr( metal2(:,1),  extrait );
% C_guitare  = xcorr( guitare(:,1), extrait );


figure(6);

subplot(2,2,1);
spectrogram( C_electro, hamming(100), 50, 320 );
title('Electro');

% subplot(2,2,2);
% spectrogram( C_rap, hamming(100), 50, 320 );
% title('Rap');
% 
% subplot(2,2,3);
% spectrogram( C_metal1, hamming(100), 50, 320 );
% title('Métal 1');
% 
% subplot(2,2,4);
% spectrogram( C_metal2, hamming(100), 50, 320 );
% title('Métal 2');







