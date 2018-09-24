%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                       EXAMEN DE TP MA 361
%  Durée : 1h30
%  Sans documents, sans calculatrice, sans accès internet
%
% Nom : CASTANIER
%
% Prénom : Raphaël
%
% Consignes : 
%       - le script matlab ou octave doit être enregistré sous le format : Nom.m
%       - répondre directement dans le script avec des commentaires 
%       - Commenter chaque ligne de votre script exemple :
%             a = 10 ; % a : fréquence du signal x(t)
%       - affichage : les courbes doivent être lisibles avec une légende si
%       plusieurs courbes sur un même graphique. 
%        - Utilisez le format donné ci-dessous pour l'affichage.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Fonction utiles (utilisez l'aide pour en savoir plus):
%
% find(A==ii) : trouver l'indice d'un élément ii dans un vecteur A
% plot : affichage 2D
% zeros : vecteur de 0
% ones : vecteur de 1
% max : maximum d'un vecteur
% log : logarithme népérien (ln)
% log10 : ln base 10
% sum : somme 
% spectrogram (Matlab) / specgram (Octave) : calcul et affiche le sprectrogramme
% blackman : fenêtre de pondération de blackman
% rectwin : fenêtre de pondération rectangle
% hamming : fenêtre de pondération de hamming
% sinc : sinus cardinal
% filter : applique le filter à un signal
% selection d'une partie d'un vecteur : a(ii:jj)
%
% exemple de figure avec subplot: 
% figure(ii)
% subplot(2,1,1)
% plot(A,B,'-b','linewidth',3)
% xlabel('fréquence (Hz)','fontsize',14)
% ylabel('Y(f)','fontsize',14)
% set(gca,'fontsize',14)
% subplot(2,1,2)
% plot(A,C,'-r','linewidth',3)
% xlabel('fréquence (Hz)','fontsize',14)
% ylabel('Z(f)','fontsize',14)
% set(gca,'fontsize',14)
% set(gcf,'color','white')

%%
clear all
close all 
clc
%

%% 1. Créez et affichez un signal x(t) représentant une cosinusoïde 
% de fréquence 5 kHz et de durée 5 millisecondes. Prenez une fréquence d'échantillonnage égale à 5 fois la fréquence minimale de Shannon. 

f = 5000; % fréquence du signal 5kHz
t = 0.005; % durée du signal 5 millisecondes

% La fréquence minimale de Shannon est de 2*f=10000;
% La fréquence d'échantillonnage vaut donc 5*2*f=50000;
fe = 50000; % fréquence d'échantillonnage

tt = 0:1/fe:t; % vecteur temporel

x = cos( 2*pi*f*tt ); % signal cosinusoïdal

figure(1)
plot(tt,x,'-b')
xlabel('temps (ms)','fontsize',14)
ylabel('x(t)','fontsize',14)
set(gca,'fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')


%% 2. Calculez l'énergie et la puissance du signal x(t)

energie_x = x*x';
% energie_x = 126J


puissance_x = energie_x / t;
%puissance_x = 25200J.s


%% 3. tracez le module du spectre de x(t) normalisé par rapport à son maximum

n = length(tt); % longueur du vecteur temporel
ff = 0:fe/n:(n-1)*fe/n; % vecteur fréquentiel

spectre_x = fft(x); % spectre de x

spectre_normalise_x = spectre_x / max(spectre_x); % spectre normalisé par rapport à son maximum

module_spectre_normalise_x = abs(spectre_normalise_x); % module du spectre normalisé

figure(2)
plot(ff,module_spectre_normalise_x,'-b')
xlabel('fréquence (Hz)','fontsize',14)
ylabel('X(f)','fontsize',14)
set(gca,'fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')


%% 4. Vérifiez la validité du théorème de Parseval

energie_spectre_x = module_spectre_normalise_x*module_spectre_normalise_x'; % energie du spectre de x
% energie_spectre_x = 2.0665J

% Faux...


%% 5. tracez le module du spectre de x(t) normalisé par rapport à son maximum 
% sur 10000 points en utilisant la technique du prolongement par des zéros ('zero padding')
% Quel est l'intérêt de cette technique?

% Cette technique permet d'augmenter la résolution du spectre.

n_fft = 10000; % nombre de points pour le zero padding
ff_nfft = 0:fe/n_fft:(n_fft-1)*fe/n_fft; % vecteur fréquentiel associé

spectre_x_nfft = fft(x,n_fft); % spectre de x avec zero padding

spectre_normalise_x_nfft = spectre_x_nfft / max(spectre_x_nfft); % spectre normalisé par rapport à son maximum

module_spectre_normalise_x_nfft = abs(spectre_normalise_x_nfft); % module du spectre normalisé

figure(3)
plot(ff_nfft,module_spectre_normalise_x_nfft,'-b')
xlabel('fréquence (Hz)','fontsize',14)
ylabel('X(f)','fontsize',14)
set(gca,'fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')


%% 6. Effet des fenêtres d'observation. 

%% a. observer le signal avec une fenêtre rectangle de 20 points suivie de 231 zéros. 
%   Affichez le spectre du signal observé avec la fenêtre rectangle normalisé par rapport à son maximum

rect_20 = [ ones(1,20) zeros(1,231) ]; % fenetre rectangle de 20 points suivie de 231 zéros

signal_apodise = x .* rect_20; % multiplication du signal avec la fenetre rect

spectre_signal_apodise = fft(signal_apodise); % spectre de signal apodisé

spectre_normalise_signal_apodise = spectre_signal_apodise / max(spectre_signal_apodise); % spectre du signal apodisé normalisé par rapport à son maximum

module_spectre_normalise_signal_apodise = abs(spectre_normalise_signal_apodise); % module du spectre du signal apodisé normalisé

figure(4)
plot(ff,module_spectre_normalise_signal_apodise,'-b')
xlabel('fréquence (Hz)','fontsize',14)
ylabel('X(f)','fontsize',14)
set(gca,'fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')


%% b.observer le signal avec une fenêtre de Hamming de 20 points suivie de 231 zéros. 
%   Affichez le spectre du signal observé avec la fenêtre Hamming normalisé par rapport à son maximum 
%   sur la même figure que le spectre du signal observé avec la fenêtre rectangle

hamming_20 = [ hamming(20)' zeros(1,231) ]; % fenetre de hamming de 20 points suivie de 231 zéros

signal_hamming = x .* hamming_20; % multiplication du signal avec la fenetre de hamming

spectre_signal_hamming = fft(signal_hamming); % spectre de signal apodisé par une fenêtre de hamming

spectre_normalise_signal_hamming = spectre_signal_hamming / max(spectre_signal_hamming); % spectre du signal apodisé normalisé par rapport à son maximum

module_spectre_normalise_signal_hamming = abs(spectre_normalise_signal_hamming); % module du spectre du signal apodisé normalisé

hold on; % affichage de la courbe avec la courbe précédente
plot(ff,module_spectre_normalise_signal_hamming,'-r')
xlabel('fréquence (Hz)','fontsize',14)
ylabel('X(f)','fontsize',14)
set(gca,'fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')



%% c. commentez l'effet de chaque fenêtre sur le spectre.

% Les deux fenêtres font apparaitre un sinus cardinal sur le spectre, ceci
% est dû à l'appodisation du signal périodique par une fenêtre de taille
% finie.

% La fenêtre rectangle marque un lobe principal plus fin, mais une faible
% atténuation des lobes secondaires.

% La fenêtre de hamming pontre un lobe principal plus large, mais une plus
% forte atténuation des lobes secondaires.


%% 7. tracez sur le même graphique les signaux :
%        - y(t) : une cosinusoide de fréquence 50 Hz échantillonné à 200 Hz d'un durée de 400 ms
%        - z(t) : une cosinusoide de fréquence 50 Hz échantillonné à 20 Hz d'une durée de 400 ms
% Vous ferez apparaitre les échantillons de couleur différentes pour y(t) et z(t) sur le graphique (option '--b*') 

duree = 0.4; % durée de 400ms
freq  = 50;  % frequence 50Hz
fe_y  = 200; % fréquence d'échantillonnage de y 200Hz
fe_z  = 20;  % fréquence d'échantillonnage de z 20Hz

tt_y  = 0:1/fe_y:duree; % vecteur temps pour y
tt_z  = 0:1/fe_z:duree; % vecteur temps pour z

y     = cos( 2*pi*freq*tt_y ); % signal y
z     = cos( 2*pi*freq*tt_z ); % signal z

figure(5)
plot( tt_y , y ,'-bs') % affichage de y
hold on               % affichage sur le même graphique
plot( tt_z , z ,'-r+') % affichage de z
xlabel('temps (s)','fontsize',14)
ylabel('y(t) z(t)','fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')


%% 8. tracez le spectre des signaux y(t) et z(t) avec un zero padding de 1000 sur la même figure mais deux graphiques séparés avec la fonction subplot. 
% Justifiez précisément le spectre de z(t)

n_fft_8 = 1000; % nombre de points pour le vecteur fréquentiel

ff_y = 0:fe_y/n_fft_8:(n_fft_8-1)*fe_y/n_fft_8; % vecteur fréquentiel pour le spectre de y
ff_z = 0:fe_z/n_fft_8:(n_fft_8-1)*fe_z/n_fft_8; % vecteur fréquentiel pour le spectre de z

spectre_y = fft(y, n_fft_8); % spectre de y
spectre_z = fft(z, n_fft_8); % spectre de z

figure(6)
subplot(2,1,1)

plot( ff_y , abs(spectre_y) ,'-b') % affichage spectre de y

xlabel('fréquence (Hz)','fontsize',14)
ylabel('Y(f)','fontsize',14)
set(gca,'fontsize',14)
subplot(2,1,2)

plot( ff_z , abs(spectre_z) ,'-r') % affichage spectre de z

xlabel('fréquence (Hz)','fontsize',14)
ylabel('Z(f)','fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')

% Le spectre de z présente le module d'un sinus cardinal, centré en  10
% (Hz). Or il n'y a pas de composante fréquentielle à 10Hz dans le signal
% de z. Pourquoi, me direz-vous, apparait donc ce "pic" à une fréquence qui
% n'est pas attendu? Eh bien c'est tout simple Jamy : le théorème de
% Shannon n'a pas été respecté pour le signal z. En effet, la fréquence
% maximale composant le signal z est de 50Hz et la fréquence
% d'échantillonnage est de 20Hz. Le théorème de Shannon nous indique que
% pour éviter un récouvrement (c'est ce qu'il s'est passé ici), il faut
% une fréquence d'échantillonnage au moins 2 fois supérieure à la
% fréquence maximum du signal. Ici, la fréquence d'échantillonnage aurait
% du être de 100Hz au minimum! C'est pourquoi on trouve une fréquence
% "fantôme".
% - Mais alors pourquoi 10Hz?
% C'est à cause de la périodicité de l'échantillonnage : le spectre est
% périodique de période 20Hz, car le signal est discret. Ainsi, le pic que
% l'on doit observer à 50Hz se trouve bien à sa place, mais il est
% périodisé, et se retrouve ainsi à 10Hz, 30Hz, 50Hz, 70Hz etc...
% C'est pourquoi on trouve un pic sur le spectre de z à 10Hz :)


%% 9. Modulation d'amplitude

%% a. Nous souhaitons moduler le signal x(t) de la question 1 par une porteuse de fréquence 30 kHz. Est-ce possible sans modification du signal x(t)?

% Techniquement, Matlab permet de créer une copie de x et de le modifier
% ensuite, mais là n'est pas la question je crois...




%% b. Générez et afficher un signal cosinusoidale v(t) de fréquence 5 kHz échantillonné à 180 kHz avec 500 points.

n_v    = 500;    % nombre de points 500
freq_v = 5000;   % fréquence de 5kHz
fe_v   = 180000; % fréquence d'échantillonnage à 180kHz

tt_v   = 0:1/fe_v:(n_v-1)/fe_v; % vecteur temps

v      = cos( 2*pi*tt_v*freq_v ); % signal

figure(7)
plot( tt_v , v ,'-b') % affichage de v
xlabel('temps (s)','fontsize',14)
ylabel('y(t) z(t)','fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')


%% c. Modulez le signal v(t) suivant la formule suivante : mod(t) = p(t)*(1+k*v(t))
%    Le signal porteur p(t) est une cosinusoide de fréquence 30 kHz. 
%    tracez le signal mod(t) ainsi que le module de son spectre pour k = 0.5
%    Vous utiliserez un zero padding de 5000 points pour afficher le spectre

f_p  = 30000; % fréquence du signal porteur 30kHz
tt_p = tt_v;  % vecteur temporel du signal porteur
p    = cos( 2*pi*f_p*tt_p); % signal porteur

k        = 0.5;  % constante
nfft_mod = 5000; % zero padding pour le spectre

ff_mod = 0 : n_v/freq_v : (n_v-1)*freq_v/n_v;

mod  = p .* (ones(1,n_v) + k*v); % signal v modulé par p
spectre_mod = abs(fft(mod, nfft_mod)); % module du spectre de mod

figure(8)
subplot(2,1,1)
plot(tt_v, mod ,'-b') % affichage du signal modulé
xlabel('fréquence (Hz)','fontsize',14)
ylabel('Y(f)','fontsize',14)
set(gca,'fontsize',14)
subplot(2,1,2)
plot(ff_mod, spectre_mod ,'-r','linewidth',3) % affichage du module du spectre du signal modulé
xlabel('fréquence (Hz)','fontsize',14)
ylabel('Z(f)','fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')





  % d. expliquez l'allulre du spectre de mod(t)
  
  % e. Multipliez le signal mod(t) par la porteuse p(t). Nous appellerons ce signal demod(t). Affichez le module du spectre de ce signal avec un zero padding de 5000 points.

  
  
  
 % f. expliquez l'allure de ce spectre. Quelle étape supplémentaire est necessaire pour optenir le signal v(t)?
 


%% 10. En utilisant la méthode de la fenêtre (décrite dans le cours), 
% déterminez théoriquement la suite h(n) des N = 101 coefficients d’un filtre 
% RIF passe-bas idéal dans la bande [0, 4 kHz]. 
% La fréquence d'échantillonnage est fixée à 180 kHz. La fenêtre de
% pondération est un fenêtre rectangle.
%
% Affichez la réponse impulsionnelle en fonction du temps puis le module et
% la phase de la fonction de transfert en fonction de la fréquence.




%% 11. Appliquez le filtre de la question 10 au signal 'demod(t)' de la question 9.e. Ce nouveau
% Commentez l'effet du filtre.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Bonus %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%12. Refaite le filtre de la question 10 en utilisant une fenêtre de
% Blackman. Affichez le module de la fonction de transfert du filtre en
% fonction de la fréquence.






