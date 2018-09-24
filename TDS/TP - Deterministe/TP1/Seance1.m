
%% S�ance 1

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Promo  : P2020 APP
% Auteur : Rapha�l Castanier
% Date   : 09/11/2017
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
clc;

%% Introduction
% L�objectif de ce travail est d�aborder la manipulation de signaux discrets en utilisant le logiciel Matlab


%% 1) G�n�ration d'un signal num�rique


%% 1.1) Signal
% G�n�rer un signal num�rique, x1,
% repr�sentant N = 100 �chantillons d�une cosinuso�de
% de fr�quence f 0 = 1 kHz,
% la fr�quence d��chantillonnage �tant fix�e � 8 kHz.

N   = 100;          % nombre d'�chantillons
f0	= 1000;         % fr�quence f0 = 1 kHz
t0  = 1/f0;         % p�riode t0 = 1ms

fe  = 8000;         % fr�quence d��chantillonnage = 8 kHz
te  = 1/fe;         % p�riode d��chantillonnage = 0.125ms
tt100  = (0:te:(N-1)*te); % vecteur temporel (�chantillonnage)

x100 = cos(2*pi*f0*tt100); % signal num�rique


%% 1.2) Trace
% Tracer ce signal en faisant appara�tre en abscisse le temps.
% Pour cela aidez vous de la fonction � plot �.

figure(1);
plot(tt100,x100);


%% 1.3) Energie
% D�terminer l��nergie du signal :
% Comment varie l��nergie lorsque N augmente ?
% Commenter ce r�sultat.

energie_x100 = x100*x100';

% Valeur obtenue : 51J (pour N=100)
% L'�nergie augemnte lorsque N augmente (on augmente le nombre de points,
% donc on augemnte le nombre de valeurs dans la somme)


%% 1.4) Puissance
% D�terminer la puissance du signal :
% Comment varie la puissance lorsque N augmente ?
% Est-ce en accord avec la th�orie ?

puissance_x100 = energie_x100/N;

% Valeur obtenue : 0.5W
% La puissance ne varie pas lorsque N augmente (car l'energie est liss�e
% sur le temps -nombre de points/�chantillons-)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2) Transformation de Fourier Discr�te
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 2.1) Spectre
% Calculer le spectre du signal x1
% avec la fonction FFT pour N = 100.

spectre_x100 = fft(x100);


%% 2.2 )Trace
% Tracer le *module* du spectre correspondant en fonction de la fr�quence.
% Commenter le spectre obtenu.
% Est-il en accord avec ce que vous vous attendiez � trouver ?
% Quelle est la fr�quence exacte du signal indiqu�e par le spectre ?

ff100               = (0:fe/N:(N-1)*fe/N); % �chelle des fr�quences
module_spectre_x100 = abs(spectre_x100);

figure(2);
subplot(2,1,1);
plot(tt100,x100);
subplot(2,1,2);
plot(ff100,module_spectre_x100);

% Le spectre montre un pic de fr�quence � 1kHz (fr�quence de notre signal
% sinusoidal) et un autre � 7kHz (correspondant au pic � -1kHz boucl�)
% fr�quence exacte = 1040Hz


%% 2.3) Pr�cision
% Tracer � nouveau le spectre mais pour N = 1000.
% Commenter le spectre obtenu.
% Quelle est la fr�quence du signal indiqu�e par le spectre ?
% Conclure sur l�influence du nombre de points dans la d�duction de la fr�quence du signal.

N                    = 1000;
tt1000               = (0:te:(N-1)*te);
x1000                = cos(2*pi*f0*tt1000);
spectre_x1000        = fft(x1000);
module_spectre_x1000 = abs(spectre_x1000);
ff1000               = (0:fe/N:(N-1)*fe/N); % �chelle des fr�quences

figure(3);
subplot(2,1,1);
plot(tt1000,x1000);
subplot(2,1,2);
plot(ff1000,module_spectre_x1000);

% On obtient des pics plus fins
% La fr�quence indiqu�e est de 1kHz
% Le nombre de points influence la pr�cision du spectre


%% 2.4) Mise en garde
% Tracer � nouveau le spectre mais pour N = 104 et N = 405.
% Quelle est la fr�quence du signal indiqu�e par les spectres ?
% Est-ce en accord avec la conclusion de la question 2.3) ?
% Expliquer pr�cis�ment pourquoi nous observons cela et
% conclure sur ce cas particulier.

N                   = 104;
tt104               = (0:te:(N-1)*te);
x104                = cos(2*pi*f0*tt104);
spectre_x104        = fft(x104);
module_spectre_x104 = abs(spectre_x104);
ff104               = (0:fe/N:(N-1)*fe/N); % �chelle des fr�quences

figure(4);
subplot(2,1,1);
plot(ff104,module_spectre_x104);

% fr�quence indiqu�e = 1000Hz

N                      = 405;
tt405                  = (0:te:(N-1)*te);
x405                   = cos(2*pi*f0*tt405);
spectre_x405           = fft(x405);
module_spectre_x405    = abs(spectre_x405);
ff405                  = (0:fe/N:(N-1)*fe/N); % �chelle des fr�quences

subplot(2,1,2);
plot(ff405,module_spectre_x405);

% fr�quence indiqu�e = 1007Hz

% Les fr�quences obtenues pour les deux exemples pr�c�dents ne sont pas 
% coh�rentes avec les r�sultats de la question 2.3 : en effet, la pr�cision
% est moindre pour 405 points qu'avec 104 points.

% Ces r�sultats sont dus � la pr�cision des spectres et aux multiples pour
% lesquelles ces valeurs sont obtenues :
%   - pour 104 points, on a chaque valeur sur une annulation des lobes du
%   sinus cardinal
%   - pour 405 points, on a chaque valeur sur un maximun des lobes du sinus
%   cardinal


%% 2.5) Amplitude
% Comment varie l�amplitude des raies pour N = 1000 et N = 2000.
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
ff2000                  = (0:fe/N:(N-1)*fe/N); % �chelle des fr�quences

subplot(2,1,2);
plot(ff2000,module_spectre_x2000);

% amplitude des raies = 100W

% Cette variation d'amplitude est due � la dispersion de l'�nergie dans la
% largeur des lobes.



%% 2.6) Parseval
% D�terminer l��nergie du spectre pour N = 100.
% Comparer avec l��nergie obtenue � la question 1.3)
% (en discret, l��nergie du spectre est : 1/N*sum(abs(spectre).^2)).

energie_spectre_x100= 1/N*sum(module_spectre_x100.^2)

% L'�nergie du spectre est la m�me que l'�nergie du signal (Th�or�me de
% Parseval)




%% 3) Transform�e de Fourier inverse - Reconstruction


% A partir du spectre du signal x1, reconstruire le signal
% gr�ce � la transform�e de Fourier inverse (fonction ifft).
% Comparer le signal reconstruit � l�aide de la FFT inverse,
% au signal original de la question 1.1).

% Quelle condition doit-on respecter pour effectuer cette op�ration ?

x100_reconstitue        = ifft(spectre_x100);

figure(6);
subplot(2,1,1)
plot(tt100,x100);
subplot(2,1,2)
plot(tt100,x100_reconstitue);

% Ce sont bien les m�mes signaux
% La condition � respecter est le Th�or�me de Shannon (fe>2f0)



%% 4) Th�or�me de Shannon


%% 4.1) Spectres
% Tracer les spectres des signaux num�riques sinuso�daux
% de fr�quence 1 kHz et 7 kHz,
% �chantillonn�s � la fr�quence de 8 kHz
% avec N = 100 �chantillons.
% Expliquer les r�sultats obtenus.

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
% En effet, la fr�quence d'�chantillonnage est de 8kHz.
% 	- le signal � 1kHz a un pic � 1kHz et un pic � 7kHz (pour -1kHz)
% 	- le signal � 7kHz a un pic � 7kHz et un pic � 1kHz (pour -7kHz)
% Le th�or�me de Shannon n'est pas respect� pour le deuxi�me signal


%% 4.2) Fr�quence Max
% D�une fa�on g�n�rale, quelle est la fr�quence maximale autoris�e
% sans qu�apparaisse un ph�nom�ne de repliement de spectre ?
% Si cette fr�quence est d�pass�e,
% quelle est la fr�quence apparaissant en r�alit�
% dans le spectre �chantillonn� ?

% La fr�quence maximum autoris�e est F=4kHz c'est-�-dire Fe/2.
% Ainsi, 2F < Fe.

% Si la fr�quence maximum est d�pass�e,
% la fr�quence apparaissant est -F+Fe


%% 4.3) Sinuso�des
% G�n�rer deux sinuso�des
% de fr�quence 200 Hz
% �chantillonn�e � la fr�quence F e1 = 1000 Hz
% avec N1 = 80 �chantillons
% et �chantillonn�e � la fr�quence F e2 = 250 Hz
% avec N2 = 20 �chantillons.

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
% Tracer sur une m�me figure ces deux signaux
% en faisant appara�tre les �chantillons.

figure(8);
subplot(2, 1, 1)
plot( tt80, signal80);
subplot(2, 1, 2)
plot( tt20, signal20);



%% 4.5) Interpolation
% Gr�ce � la fonction interp de matlab,
% interpoler les deux signaux d�un facteur 5.
% Tracer sur une m�me figure les signaux obtenus.
% Expliquer les r�sultats :
% pour cela vous pouvez mesurer la fr�quence de chaque signal
% et la comparer avec celle obtenue par la fonction FFT.
% Conclure sur l�int�r�t du la limite de Shannon.

signal80_interpole      = interp(signal80, 5);
signal20_interpole      = interp(signal20, 5);
tt80_interpole          = interp(tt80, 5);
tt20_interpole          = interp(tt20, 5);

figure(9);
subplot(2, 1, 1)
plot( tt80_interpole, signal80_interpole);
subplot(2, 1, 2)
plot( tt20_interpole, signal20_interpole);


















