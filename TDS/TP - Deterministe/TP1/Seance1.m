
%% Séance 1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Promo  : P2020 APP
% Auteur : Raphaël Castanier
% Date   : 09/11/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

%% Introduction
% L’objectif de ce travail est d’aborder la manipulation de signaux discrets en utilisant le logiciel Matlab


%% 1) Génération d'un signal numérique


%% 1.1) Signal
% Générer un signal numérique, x1,
% représentant N = 100 échantillons d’une cosinusoïde
% de fréquence f 0 = 1 kHz,
% la fréquence d’échantillonnage étant fixée à 8 kHz.

N   = 100;          % nombre d'échantillons
f0	= 1000;         % fréquence f0 = 1 kHz
t0  = 1/f0;         % période t0 = 1ms

fe  = 8000;         % fréquence d’échantillonnage = 8 kHz
te  = 1/fe;         % période d’échantillonnage = 0.125ms
tt100  = (0:te:(N-1)*te); % vecteur temporel (échantillonnage)

x100 = cos(2*pi*f0*tt100); % signal numérique


%% 1.2) Trace
% Tracer ce signal en faisant apparaître en abscisse le temps.
% Pour cela aidez vous de la fonction « plot ».

figure(1);
plot(tt100,x100);


%% 1.3) Energie
% Déterminer l’énergie du signal :
% Comment varie l’énergie lorsque N augmente ?
% Commenter ce résultat.

energie_x100 = x100*x100';

% Valeur obtenue : 51J (pour N=100)
% L'énergie augemnte lorsque N augmente (on augmente le nombre de points,
% donc on augemnte le nombre de valeurs dans la somme)


%% 1.4) Puissance
% Déterminer la puissance du signal :
% Comment varie la puissance lorsque N augmente ?
% Est-ce en accord avec la théorie ?

puissance_x100 = energie_x100/N;

% Valeur obtenue : 0.5W
% La puissance ne varie pas lorsque N augmente (car l'energie est lissée
% sur le temps -nombre de points/échantillons-)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2) Transformation de Fourier Discrète
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 2.1) Spectre
% Calculer le spectre du signal x1
% avec la fonction FFT pour N = 100.

spectre_x100 = fft(x100);


%% 2.2 )Trace
% Tracer le *module* du spectre correspondant en fonction de la fréquence.
% Commenter le spectre obtenu.
% Est-il en accord avec ce que vous vous attendiez à trouver ?
% Quelle est la fréquence exacte du signal indiquée par le spectre ?

ff100               = (0:fe/N:(N-1)*fe/N); % échelle des fréquences
module_spectre_x100 = abs(spectre_x100);

figure(2);
subplot(2,1,1);
plot(tt100,x100);
subplot(2,1,2);
plot(ff100,module_spectre_x100);

% Le spectre montre un pic de fréquence à 1kHz (fréquence de notre signal
% sinusoidal) et un autre à 7kHz (correspondant au pic à -1kHz bouclé)
% fréquence exacte = 1040Hz


%% 2.3) Précision
% Tracer à nouveau le spectre mais pour N = 1000.
% Commenter le spectre obtenu.
% Quelle est la fréquence du signal indiquée par le spectre ?
% Conclure sur l’influence du nombre de points dans la déduction de la fréquence du signal.

N                    = 1000;
tt1000               = (0:te:(N-1)*te);
x1000                = cos(2*pi*f0*tt1000);
spectre_x1000        = fft(x1000);
module_spectre_x1000 = abs(spectre_x1000);
ff1000               = (0:fe/N:(N-1)*fe/N); % échelle des fréquences

figure(3);
subplot(2,1,1);
plot(tt1000,x1000);
subplot(2,1,2);
plot(ff1000,module_spectre_x1000);

% On obtient des pics plus fins
% La fréquence indiquée est de 1kHz
% Le nombre de points influence la précision du spectre


%% 2.4) Mise en garde
% Tracer à nouveau le spectre mais pour N = 104 et N = 405.
% Quelle est la fréquence du signal indiquée par les spectres ?
% Est-ce en accord avec la conclusion de la question 2.3) ?
% Expliquer précisément pourquoi nous observons cela et
% conclure sur ce cas particulier.

N                   = 104;
tt104               = (0:te:(N-1)*te);
x104                = cos(2*pi*f0*tt104);
spectre_x104        = fft(x104);
module_spectre_x104 = abs(spectre_x104);
ff104               = (0:fe/N:(N-1)*fe/N); % échelle des fréquences

figure(4);
subplot(2,1,1);
plot(ff104,module_spectre_x104);

% fréquence indiquée = 1000Hz

N                      = 405;
tt405                  = (0:te:(N-1)*te);
x405                   = cos(2*pi*f0*tt405);
spectre_x405           = fft(x405);
module_spectre_x405    = abs(spectre_x405);
ff405                  = (0:fe/N:(N-1)*fe/N); % échelle des fréquences

subplot(2,1,2);
plot(ff405,module_spectre_x405);

% fréquence indiquée = 1007Hz

% Les fréquences obtenues pour les deux exemples précédents ne sont pas 
% cohérentes avec les résultats de la question 2.3 : en effet, la précision
% est moindre pour 405 points qu'avec 104 points.

% Ces résultats sont dus à la précision des spectres et aux multiples pour
% lesquelles ces valeurs sont obtenues :
%   - pour 104 points, on a chaque valeur sur une annulation des lobes du
%   sinus cardinal
%   - pour 405 points, on a chaque valeur sur un maximun des lobes du sinus
%   cardinal


%% 2.5) Amplitude
% Comment varie l’amplitude des raies pour N = 1000 et N = 2000.
% Justifier cette variation.

figure(5);
subplot(2,1,1);
plot(ff1000,module_spectre_x1000);

% amplitude des raies = 500W

N                       = 2000;
tt2000                  = (0:te:(N-1)*te);
x2000                   = cos(2*pi*f0*tt2000);
spectre_x2000           = fft(x2000);
module_spectre_x2000    = abs(spectre_x2000);
ff2000                  = (0:fe/N:(N-1)*fe/N); % échelle des fréquences

subplot(2,1,2);
plot(ff2000,module_spectre_x2000);

% amplitude des raies = 100W

% Cette variation d'amplitude est due à la dispersion de l'énergie dans la
% largeur des lobes.



%% 2.6) Parseval
% Déterminer l’énergie du spectre pour N = 100.
% Comparer avec l’énergie obtenue à la question 1.3)
% (en discret, l’énergie du spectre est : 1/N*sum(abs(spectre).^2)).

energie_spectre_x100= 1/N*sum(module_spectre_x100.^2)

% L'énergie du spectre est la même que l'énergie du signal (Théorème de
% Parseval)




%% 3) Transformée de Fourier inverse - Reconstruction


% A partir du spectre du signal x1, reconstruire le signal
% grâce à la transformée de Fourier inverse (fonction ifft).
% Comparer le signal reconstruit à l’aide de la FFT inverse,
% au signal original de la question 1.1).

% Quelle condition doit-on respecter pour effectuer cette opération ?

x100_reconstitue        = ifft(spectre_x100);

figure(6);
subplot(2,1,1)
plot(tt100,x100);
subplot(2,1,2)
plot(tt100,x100_reconstitue);

% Ce sont bien les mêmes signaux
% La condition à respecter est le Théorème de Shannon (fe>2f0)



%% 4) Théorème de Shannon


%% 4.1) Spectres
% Tracer les spectres des signaux numériques sinusoïdaux
% de fréquence 1 kHz et 7 kHz,
% échantillonnés à la fréquence de 8 kHz
% avec N = 100 échantillons.
% Expliquer les résultats obtenus.

N            = 100;

f1           = 1000;
f7           = 7000;
fe           = 8000;

signal1      = sin(2*pi*f1*tt100);
signal7      = sin(2*pi*f7*tt100);

spectre1     = fft(signal1);
spectre7     = fft(signal7);

module_spectre1     = abs(spectre1);
module_spectre7     = abs(spectre7);

figure(7);
subplot(2, 1, 1)
plot(ff100, module_spectre1);
subplot(2, 1, 2)
plot(ff100, module_spectre7);

% Les deux spectres sont identiques.
% En effet, la fréquence d'échantillonnage est de 8kHz.
% 	- le signal à 1kHz a un pic à 1kHz et un pic à 7kHz (pour -1kHz)
% 	- le signal à 7kHz a un pic à 7kHz et un pic à 1kHz (pour -7kHz)
% Le théorème de Shannon n'est pas respecté pour le deuxième signal


%% 4.2) Fréquence Max
% D’une façon générale, quelle est la fréquence maximale autorisée
% sans qu’apparaisse un phénomène de repliement de spectre ?
% Si cette fréquence est dépassée,
% quelle est la fréquence apparaissant en réalité
% dans le spectre échantillonné ?

% La fréquence maximum autorisée est F=4kHz c'est-à-dire Fe/2.
% Ainsi, 2F < Fe.

% Si la fréquence maximum est dépassée,
% la fréquence apparaissant est -F+Fe


%% 4.3) Sinusoïdes
% Générer deux sinusoïdes
% de fréquence 200 Hz
% échantillonnée à la fréquence F e1 = 1000 Hz
% avec N1 = 80 échantillons
% et échantillonnée à la fréquence F e2 = 250 Hz
% avec N2 = 20 échantillons.

N1         = 80;
N2         = 20;
f          = 200;
fe1        = 1000;
fe2        = 250;
te1        = 1/fe1;
te2        = 1/fe2;
tt80       = (0:te1:(N1-1)*te1);
tt20       = (0:te2:(N2-1)*te2);
signal80   = sin(2*pi*f*tt80);
signal20   = sin(2*pi*f*tt20);


%% 4.4) Traces
% Tracer sur une même figure ces deux signaux
% en faisant apparaître les échantillons.

figure(8);
subplot(2, 1, 1)
plot( tt80, signal80);
subplot(2, 1, 2)
plot( tt20, signal20);



%% 4.5) Interpolation
% Grâce à la fonction interp de matlab,
% interpoler les deux signaux d’un facteur 5.
% Tracer sur une même figure les signaux obtenus.
% Expliquer les résultats :
% pour cela vous pouvez mesurer la fréquence de chaque signal
% et la comparer avec celle obtenue par la fonction FFT.
% Conclure sur l’intérêt du la limite de Shannon.

signal80_interpole      = interp(signal80, 5);
signal20_interpole      = interp(signal20, 5);
tt80_interpole          = interp(tt80, 5);
tt20_interpole          = interp(tt20, 5);

figure(9);
subplot(2, 1, 1)
plot( tt80_interpole, signal80_interpole);
subplot(2, 1, 2)
plot( tt20_interpole, signal20_interpole);


















