%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                       EXAMEN DE TP MA 361
%  Dur�e : 1h30
%  Sans documents, sans calculatrice, sans acc�s internet
%
% Nom : CASTANIER
%
% Pr�nom : Rapha�l
%
% Consignes : 
%       - le script matlab ou octave doit �tre enregistr� sous le format : Nom.m
%       - r�pondre directement dans le script avec des commentaires 
%       - Commenter chaque ligne de votre script exemple :
%             a = 10 ; % a : fr�quence du signal x(t)
%       - affichage : les courbes doivent �tre lisibles avec une l�gende si
%       plusieurs courbes sur un m�me graphique. 
%        - Utilisez le format donn� ci-dessous pour l'affichage.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Fonction utiles (utilisez l'aide pour en savoir plus):
%
% find(A==ii) : trouver l'indice d'un �l�ment ii dans un vecteur A
% plot : affichage 2D
% zeros : vecteur de 0
% ones : vecteur de 1
% max : maximum d'un vecteur
% log : logarithme n�p�rien (ln)
% log10 : ln base 10
% sum : somme 
% spectrogram (Matlab) / specgram (Octave) : calcul et affiche le sprectrogramme
% blackman : fen�tre de pond�ration de blackman
% rectwin : fen�tre de pond�ration rectangle
% hamming : fen�tre de pond�ration de hamming
% sinc : sinus cardinal
% filter : applique le filter � un signal
% selection d'une partie d'un vecteur : a(ii:jj)
%
% exemple de figure avec subplot: 
% figure(ii)
% subplot(2,1,1)
% plot(A,B,'-b','linewidth',3)
% xlabel('fr�quence (Hz)','fontsize',14)
% ylabel('Y(f)','fontsize',14)
% set(gca,'fontsize',14)
% subplot(2,1,2)
% plot(A,C,'-r','linewidth',3)
% xlabel('fr�quence (Hz)','fontsize',14)
% ylabel('Z(f)','fontsize',14)
% set(gca,'fontsize',14)
% set(gcf,'color','white')

%%
clear all
close all 
clc
%

%% 1. Cr�ez et affichez un signal x(t) repr�sentant une cosinuso�de 
% de fr�quence 5 kHz et de dur�e 5 millisecondes. Prenez une fr�quence d'�chantillonnage �gale � 5 fois la fr�quence minimale de Shannon. 

f = 5000; % fr�quence du signal 5kHz
t = 0.005; % dur�e du signal 5 millisecondes

% La fr�quence minimale de Shannon est de 2*f=10000;
% La fr�quence d'�chantillonnage vaut donc 5*2*f=50000;
fe = 50000; % fr�quence d'�chantillonnage

tt = 0:1/fe:t; % vecteur temporel

x = cos( 2*pi*f*tt ); % signal cosinuso�dal

figure(1)
plot(tt,x,'-b')
xlabel('temps (ms)','fontsize',14)
ylabel('x(t)','fontsize',14)
set(gca,'fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')


%% 2. Calculez l'�nergie et la puissance du signal x(t)

energie_x = x*x';
% energie_x = 126J


puissance_x = energie_x / t;
%puissance_x = 25200J.s


%% 3. tracez le module du spectre de x(t) normalis� par rapport � son maximum

n = length(tt); % longueur du vecteur temporel
ff = 0:fe/n:(n-1)*fe/n; % vecteur fr�quentiel

spectre_x = fft(x); % spectre de x

spectre_normalise_x = spectre_x / max(spectre_x); % spectre normalis� par rapport � son maximum

module_spectre_normalise_x = abs(spectre_normalise_x); % module du spectre normalis�

figure(2)
plot(ff,module_spectre_normalise_x,'-b')
xlabel('fr�quence (Hz)','fontsize',14)
ylabel('X(f)','fontsize',14)
set(gca,'fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')


%% 4. V�rifiez la validit� du th�or�me de Parseval

energie_spectre_x = module_spectre_normalise_x*module_spectre_normalise_x'; % energie du spectre de x
% energie_spectre_x = 2.0665J

% Faux...


%% 5. tracez le module du spectre de x(t) normalis� par rapport � son maximum 
% sur 10000 points en utilisant la technique du prolongement par des z�ros ('zero padding')
% Quel est l'int�r�t de cette technique?

% Cette technique permet d'augmenter la r�solution du spectre.

n_fft = 10000; % nombre de points pour le zero padding
ff_nfft = 0:fe/n_fft:(n_fft-1)*fe/n_fft; % vecteur fr�quentiel associ�

spectre_x_nfft = fft(x,n_fft); % spectre de x avec zero padding

spectre_normalise_x_nfft = spectre_x_nfft / max(spectre_x_nfft); % spectre normalis� par rapport � son maximum

module_spectre_normalise_x_nfft = abs(spectre_normalise_x_nfft); % module du spectre normalis�

figure(3)
plot(ff_nfft,module_spectre_normalise_x_nfft,'-b')
xlabel('fr�quence (Hz)','fontsize',14)
ylabel('X(f)','fontsize',14)
set(gca,'fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')


%% 6. Effet des fen�tres d'observation. 

%% a. observer le signal avec une fen�tre rectangle de 20 points suivie de 231 z�ros. 
%   Affichez le spectre du signal observ� avec la fen�tre rectangle normalis� par rapport � son maximum

rect_20 = [ ones(1,20) zeros(1,231) ]; % fenetre rectangle de 20 points suivie de 231 z�ros

signal_apodise = x .* rect_20; % multiplication du signal avec la fenetre rect

spectre_signal_apodise = fft(signal_apodise); % spectre de signal apodis�

spectre_normalise_signal_apodise = spectre_signal_apodise / max(spectre_signal_apodise); % spectre du signal apodis� normalis� par rapport � son maximum

module_spectre_normalise_signal_apodise = abs(spectre_normalise_signal_apodise); % module du spectre du signal apodis� normalis�

figure(4)
plot(ff,module_spectre_normalise_signal_apodise,'-b')
xlabel('fr�quence (Hz)','fontsize',14)
ylabel('X(f)','fontsize',14)
set(gca,'fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')


%% b.observer le signal avec une fen�tre de Hamming de 20 points suivie de 231 z�ros. 
%   Affichez le spectre du signal observ� avec la fen�tre Hamming normalis� par rapport � son maximum 
%   sur la m�me figure que le spectre du signal observ� avec la fen�tre rectangle

hamming_20 = [ hamming(20)' zeros(1,231) ]; % fenetre de hamming de 20 points suivie de 231 z�ros

signal_hamming = x .* hamming_20; % multiplication du signal avec la fenetre de hamming

spectre_signal_hamming = fft(signal_hamming); % spectre de signal apodis� par une fen�tre de hamming

spectre_normalise_signal_hamming = spectre_signal_hamming / max(spectre_signal_hamming); % spectre du signal apodis� normalis� par rapport � son maximum

module_spectre_normalise_signal_hamming = abs(spectre_normalise_signal_hamming); % module du spectre du signal apodis� normalis�

hold on; % affichage de la courbe avec la courbe pr�c�dente
plot(ff,module_spectre_normalise_signal_hamming,'-r')
xlabel('fr�quence (Hz)','fontsize',14)
ylabel('X(f)','fontsize',14)
set(gca,'fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')



%% c. commentez l'effet de chaque fen�tre sur le spectre.

% Les deux fen�tres font apparaitre un sinus cardinal sur le spectre, ceci
% est d� � l'appodisation du signal p�riodique par une fen�tre de taille
% finie.

% La fen�tre rectangle marque un lobe principal plus fin, mais une faible
% att�nuation des lobes secondaires.

% La fen�tre de hamming pontre un lobe principal plus large, mais une plus
% forte att�nuation des lobes secondaires.


%% 7. tracez sur le m�me graphique les signaux :
%        - y(t) : une cosinusoide de fr�quence 50 Hz �chantillonn� � 200 Hz d'un dur�e de 400 ms
%        - z(t) : une cosinusoide de fr�quence 50 Hz �chantillonn� � 20 Hz d'une dur�e de 400 ms
% Vous ferez apparaitre les �chantillons de couleur diff�rentes pour y(t) et z(t) sur le graphique (option '--b*') 

duree = 0.4; % dur�e de 400ms
freq  = 50;  % frequence 50Hz
fe_y  = 200; % fr�quence d'�chantillonnage de y 200Hz
fe_z  = 20;  % fr�quence d'�chantillonnage de z 20Hz

tt_y  = 0:1/fe_y:duree; % vecteur temps pour y
tt_z  = 0:1/fe_z:duree; % vecteur temps pour z

y     = cos( 2*pi*freq*tt_y ); % signal y
z     = cos( 2*pi*freq*tt_z ); % signal z

figure(5)
plot( tt_y , y ,'-bs') % affichage de y
hold on               % affichage sur le m�me graphique
plot( tt_z , z ,'-r+') % affichage de z
xlabel('temps (s)','fontsize',14)
ylabel('y(t) z(t)','fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')


%% 8. tracez le spectre des signaux y(t) et z(t) avec un zero padding de 1000 sur la m�me figure mais deux graphiques s�par�s avec la fonction subplot. 
% Justifiez pr�cis�ment le spectre de z(t)

n_fft_8 = 1000; % nombre de points pour le vecteur fr�quentiel

ff_y = 0:fe_y/n_fft_8:(n_fft_8-1)*fe_y/n_fft_8; % vecteur fr�quentiel pour le spectre de y
ff_z = 0:fe_z/n_fft_8:(n_fft_8-1)*fe_z/n_fft_8; % vecteur fr�quentiel pour le spectre de z

spectre_y = fft(y, n_fft_8); % spectre de y
spectre_z = fft(z, n_fft_8); % spectre de z

figure(6)
subplot(2,1,1)

plot( ff_y , abs(spectre_y) ,'-b') % affichage spectre de y

xlabel('fr�quence (Hz)','fontsize',14)
ylabel('Y(f)','fontsize',14)
set(gca,'fontsize',14)
subplot(2,1,2)

plot( ff_z , abs(spectre_z) ,'-r') % affichage spectre de z

xlabel('fr�quence (Hz)','fontsize',14)
ylabel('Z(f)','fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')

% Le spectre de z pr�sente le module d'un sinus cardinal, centr� en  10
% (Hz). Or il n'y a pas de composante fr�quentielle � 10Hz dans le signal
% de z. Pourquoi, me direz-vous, apparait donc ce "pic" � une fr�quence qui
% n'est pas attendu? Eh bien c'est tout simple Jamy : le th�or�me de
% Shannon n'a pas �t� respect� pour le signal z. En effet, la fr�quence
% maximale composant le signal z est de 50Hz et la fr�quence
% d'�chantillonnage est de 20Hz. Le th�or�me de Shannon nous indique que
% pour �viter un r�couvrement (c'est ce qu'il s'est pass� ici), il faut
% une fr�quence d'�chantillonnage au moins 2 fois sup�rieure � la
% fr�quence maximum du signal. Ici, la fr�quence d'�chantillonnage aurait
% du �tre de 100Hz au minimum! C'est pourquoi on trouve une fr�quence
% "fant�me".
% - Mais alors pourquoi 10Hz?
% C'est � cause de la p�riodicit� de l'�chantillonnage : le spectre est
% p�riodique de p�riode 20Hz, car le signal est discret. Ainsi, le pic que
% l'on doit observer � 50Hz se trouve bien � sa place, mais il est
% p�riodis�, et se retrouve ainsi � 10Hz, 30Hz, 50Hz, 70Hz etc...
% C'est pourquoi on trouve un pic sur le spectre de z � 10Hz :)


%% 9. Modulation d'amplitude

%% a. Nous souhaitons moduler le signal x(t) de la question 1 par une porteuse de fr�quence 30 kHz. Est-ce possible sans modification du signal x(t)?

% Techniquement, Matlab permet de cr�er une copie de x et de le modifier
% ensuite, mais l� n'est pas la question je crois...




%% b. G�n�rez et afficher un signal cosinusoidale v(t) de fr�quence 5 kHz �chantillonn� � 180 kHz avec 500 points.

n_v    = 500;    % nombre de points 500
freq_v = 5000;   % fr�quence de 5kHz
fe_v   = 180000; % fr�quence d'�chantillonnage � 180kHz

tt_v   = 0:1/fe_v:(n_v-1)/fe_v; % vecteur temps

v      = cos( 2*pi*tt_v*freq_v ); % signal

figure(7)
plot( tt_v , v ,'-b') % affichage de v
xlabel('temps (s)','fontsize',14)
ylabel('y(t) z(t)','fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')


%% c. Modulez le signal v(t) suivant la formule suivante : mod(t) = p(t)*(1+k*v(t))
%    Le signal porteur p(t) est une cosinusoide de fr�quence 30 kHz. 
%    tracez le signal mod(t) ainsi que le module de son spectre pour k = 0.5
%    Vous utiliserez un zero padding de 5000 points pour afficher le spectre

f_p  = 30000; % fr�quence du signal porteur 30kHz
tt_p = tt_v;  % vecteur temporel du signal porteur
p    = cos( 2*pi*f_p*tt_p); % signal porteur

k        = 0.5;  % constante
nfft_mod = 5000; % zero padding pour le spectre

ff_mod = 0 : n_v/freq_v : (n_v-1)*freq_v/n_v;

mod  = p .* (ones(1,n_v) + k*v); % signal v modul� par p
spectre_mod = abs(fft(mod, nfft_mod)); % module du spectre de mod

figure(8)
subplot(2,1,1)
plot(tt_v, mod ,'-b') % affichage du signal modul�
xlabel('fr�quence (Hz)','fontsize',14)
ylabel('Y(f)','fontsize',14)
set(gca,'fontsize',14)
subplot(2,1,2)
plot(ff_mod, spectre_mod ,'-r','linewidth',3) % affichage du module du spectre du signal modul�
xlabel('fr�quence (Hz)','fontsize',14)
ylabel('Z(f)','fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')





  % d. expliquez l'allulre du spectre de mod(t)
  
  % e. Multipliez le signal mod(t) par la porteuse p(t). Nous appellerons ce signal demod(t). Affichez le module du spectre de ce signal avec un zero padding de 5000 points.

  
  
  
 % f. expliquez l'allure de ce spectre. Quelle �tape suppl�mentaire est necessaire pour optenir le signal v(t)?
 


%% 10. En utilisant la m�thode de la fen�tre (d�crite dans le cours), 
% d�terminez th�oriquement la suite h(n) des N = 101 coefficients d�un filtre 
% RIF passe-bas id�al dans la bande [0, 4 kHz]. 
% La fr�quence d'�chantillonnage est fix�e � 180 kHz. La fen�tre de
% pond�ration est un fen�tre rectangle.
%
% Affichez la r�ponse impulsionnelle en fonction du temps puis le module et
% la phase de la fonction de transfert en fonction de la fr�quence.




%% 11. Appliquez le filtre de la question 10 au signal 'demod(t)' de la question 9.e. Ce nouveau
% Commentez l'effet du filtre.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Bonus %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%12. Refaite le filtre de la question 10 en utilisant une fen�tre de
% Blackman. Affichez le module de la fonction de transfert du filtre en
% fonction de la fr�quence.






