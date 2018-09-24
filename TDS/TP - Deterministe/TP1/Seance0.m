
%% S�ance 0

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Promo  : P2020 APP
% Auteur : Rapha�l Castanier
% Date   : 28/09/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

%% Introduction

% L�objectif de cette premi�re s�ance est de prendre en main le logiciel Matlab
% qui servira d�outils pour le reste des TP.


%% 1 Op�rations sur les vecteurs


%% 1.1 Vecteur temps compos� de 1001 �chantillons de 0 � 1 secondes
t1 = linspace(0,1,1001);


%% 1.2 Vecteur t2 de 1001 �chantillons avec un pas temporel de 10 ms
t2 = (0:0.01:1000*0.01);


%% 1.3 Taille du vecteur
size(t1);
size(t2);
% vecteur ligne (1 ligne, 1001 colonnes)


%% 1.4 et 1.5 Op�rations
t3 = [1+j , 2+j , 3+j]; % vecteur ligne
t4 = t3'; % vecteur colonne inverse
t5 = t3.'; % vecteur colonne transpos�e
% ' inverse
% .' transpose


%% 1.6 Erreur

%t3*t3;

% Erreur renvoy�e :
% Error using  * 
% Inner matrix dimensions must agree.

% Explication : on essaie de multiplier une matrice 1,3 avec une 1,3
% Cette op�ration n'existe pas
% En revance, on peut multiplier une matrice 1,3 par une 3,1
% Ou 3,1 et 1,3

% Solution : remplacer * par .*


%% 1.7 et 1.8 Multiplications
A1 = t3*t4; % multiplication de matrices
A2 = t3.*t3; % multiplication �l�ment � �l�ment


%% 1.9 Concat�nation
B = [ t1 t2 ];


%% 1.10 Selection d�une partie d�un vecteur
C = t1(1:20); % on selectionne les 20 premi�res valeurs


%% 1.11 Find

k = find(t1==1); % ici, on cherche � quel indice la matrice t1 vaut 1


%% 2 G�n�ration d�un signal num�rique et de son spectre


%% 2.1 Signal num�rique S1
% de N=101 �chantillons repr�sentant une cosinuso�de de
% fr�quence f 0 = 2 kHz,
% la fr�quence d��chantillonnage �tant fix�e � 8 kHz.

N   = 101;  % nombre d'�chantillons
f0  = 2000; % fr�quence du signal 2kHz
fe  = 8000; % fr�quence d'�chantillonnage 8kHz
tt  = 0 : 1/fe : (N-1)*1/fe ; % vecteur temps de pas Te=1/fe de N points

S1  = cos(2*pi*f0*tt); % signal num�rique


%% 2.2 Affichage du signal
figure(1);
plot(tt,S1,'--b');
xlabel('t (s)');
ylabel('S1(t)');
legend('S1');


%% 2.3 Axis
axis([0 1/f0 -1 1])


%% 2.4 Energie du signal
E = S1*S1'; % multiplication de x(n) par x*(n)
%E = sum(abs(S1).^2); % somme du module carr� de x(n)


%% 2.5 FFT
ff = ( 0: fe/N: (N-1)*fe/N ); % �chelle des fr�quences
spectre_S1 = fft(S1);         % spectre de S1

figure(2);
subplot(2,1,1);
plot(ff, abs(spectre_S1));
subplot(2,1,2);
plot(ff, angle(spectre_S1));

% fr�quence des pics observ�s : 2kHz et 6kHz


%% 2.6 Warning
%plot(ff, spectre_S1);

% Erreur lev�e :
% Warning: Imaginary parts of complex X and/or Y arguments ignored
% Explication :
% Le spectre est complexe (module et argument). Matlab ne peut pas afficher
% le tout en un seul graphique


%% 3 Formules du cours


%% 3.1.1 Lin�arit� : TF[a*x1(t)+b*x2(t)] = a*X1(f) + b*X2(f)
a  = 5;
b  = 3;
x1 = linspace(0,1,10);
x2 = linspace(5,9,10);

TF = fft(a*x1+b*x2)
F  = a*fft(x1)+b*fft(x2)

figure(3);
plot(TF,'-xb');
hold on
plot(F,'--sr');


%% 3.1.2 Translation : TF[x(t-t0)] = X(f)*e(-2*pi*j*f*t0)
x  = linspace(0,1,10);
f  = 50;
t0 = 1;
TF = fft(x-t0);
F  = fft(x)*exp(2*pi*j*f*t0);

figure(4);
plot(TF,'-xb');
hold on;
plot(F,'--sr');


%% 3.1.3 Modulation : TF[x(t)*exp(2*pi*j*f0*t)] = X(f-f0)
N  = 100;
f0 = 200;
fe = 600;
fd = 10;
tt = linspace(0,100,N);
ff = (0: fe/N: (N-1)*fe/N);
x  = sin(2*pi*f0*tt);

TF = fft(x.*exp(2*pi*j*fd*tt));

figure(5);
subplot(2,1,1);
plot(ff,abs(TF),'-xb');
subplot(2,1,2);
plot(ff,angle(TF),'--sr');


%% 3.1.4 Dilatation/Contraction : TF[x(a*t)] = 1/abs(a) * X(f/a)

N  = 100;
a  = 5;
f0 = 200;
fe = 600;
fd = 10;
tt = linspace(0,100,N);
ff = (0: fe/N: (N-1)*fe/N);
x  = sin( a * 2*pi*f0*tt);

TF = fft( (2*pi*f0*tt/a) / abs(a) );

figure(6);
subplot(2,1,1);
plot(ff,abs(TF),'-xb');
subplot(2,1,2);
plot(ff,angle(TF),'--sr');


%% 3.2 Signal carr� de fr�quence 50Hz

N            = 100;
F            = 50;
nn           = (0:F/N:(N-1)*F/N);
signal_carre = square(50*nn);

figure(7);
plot(nn, signal_carre, '-xb');
ylim([-2 2]);
xlim([0 100]);

