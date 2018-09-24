%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                       EXAMEN DE TP MA 361
%  Dur�e : 1h30
%  Sans documents, sans calculatrice, sans acc�s internet
%
% Nom :
%
% Pr�nom : 
%
% Consignes : 
%       - le script matlab ou octave doit �tre enregistr� sous le format : Nom.m
%       - r�pondre directement dans le script avec des commentaires 
%       - Commenter chaque ligne de votre script exemple :
%             a = 10 ; % a : fr�quence du signal x(t)
%       - affichage : les courbes doivent �tre lisibles avec une l�gende si
%       plusieurs courbes sur un m�me graphique
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
% de fr�quence 2 kHz, de fr�quence d'�chantillonnage de 20 kHz et de dur�e 10 millisecondes. 

d   = 0.010;  % dur�e = 10millisecondes
f   = 2000;   % fr�quence = 2kHz
fe  = 20000;  % fr�quence d'�chantillonnage = 20kHz
te  = 1/fe;   % p�riode d'�chantillonnage
N   = d * fe; % nombre d'�chantillons = d * fe

tt  = (0 : te : (N-1)*te); % vecteur temporel = N �chantillons, de pas te

x   = cos( 2*pi*f*tt ); % signal cosinusoidal

figure(1);
plot(tt,x,'-s')
xlabel('temps (s)','fontsize',14)
ylabel('x(t)','fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')


%% 2. Pour plus de lisibilit�, affichez seulement une p�riode du signal x(t) 
% � l'aide de la fonction "find".

indexes = find(tt <= 1/f); % inedxes = indexes pour lesquels le temps est inf�rieur ou �gal � une p�riode

figure(2);
plot(tt(indexes),x(indexes),'-s')
xlabel('temps (s)','fontsize',14)
ylabel('x(t)','fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')


%% 3. calculez l'�nergie du signal x(t)

energie_x = x*x';


%% 4. tracez le module du spectre de x(t)




%5. tracez le module du spectre  de x(t) normalis� par rapport � son maximum 
% sur 10000 points en utilisant la technique du prolongement par des z�ros ('zero padding')
% Quel est l'int�r�t de cette technique?




%6. m�me question que pr�cedemment mais affichez le module en d�cibel. Quel
%   est le niveau du premier lobe secondaire? Est-ce coh�rent ?




%7. tracez sur le m�me graphique les signaux :
%        - y(t) : une cosinusoide de fr�quence 50 Hz �chantillonn� � 200 Hz d'un dur�e de 400 ms
%        - z(t) : une cosinusoide de fr�quence 50 Hz �chantillonn� � 20 Hz d'une dur�e de 400 ms
% Vous ferez apparaitre les �chantillons de couleur diff�rentes pour y(t) et z(t) sur le graphique (option '--b*') 



% 8. tracez le spectre des signaux y(t) et z(t) avec un zero padding de 1000 sur la m�me figure mais deux graphiques s�par�s avec la fonction subplot. 
% Justifiez le spectre du signal z(t)




% 9. creez et affichez un signal 'sig' composite cosinusoidale d'une dur�e de 1 secondes tel que : 
%        sig est de fr�quence 195 Hz et d'amplitude 2 de 0 seconde � 0.6 seconde
%        sig est de fr�quence 210 Hz et d'amplitude 1 de 0.6 secondes � 1 seconde.
% La fr�quence d'�chantillonnage est de 1000 Hz.




% 10. afficher le spectrogramme du signal sig en utilisant :
%   - une fen�tre de blackman de 100 points, un zero padding de 1000 points et sans overlap.
%   - une fen�tre de type rectangle de 100 points, un zero padding de 1000 points et sans overlap.
%     Expliquez clairement les differences que vous voyez.




% 11. En utilisant la m�thode de la fen�tre (d�crite dans le cours), 
% d�terminez th�oriquement la suite h(n) des N = 17 coefficients d�un filtre 
% RIF passe-bas id�al dans la bande [0, 205 Hz]. 
% La fr�quence d'�chantillonnage est fix�e � 1000 Hz. La fen�tre de
% pond�ration est un fen�tre rectangle.
%
% Affichez la r�ponse impulsionnelle en fonction du temps puis le module et
% la phase de la fonction de transfert en fonction de la fr�quence.




% 12. Appliquez le filtre de la question 11 au signal 'sig'. Ce nouveau
% signal sera nomm� 'sig_rect'. 
% Affichez le signal sig_rect 
% Affichez sur le m�me graphique le module du spectre de 'sig', nomm� 'sig_f' et de 'sig_rect' nomm� 'sig_rect_f'  en utilisant un zero padding de 10000 points.
% Calculer le rapport |sig_f(f=195)|/|sig_f(f=210)|
% Calculer le rapport |sig_rect_f(f=195)|/|sig_rect_f(f=210)|
% Commentez l'effet du filtre.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Bonus %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%13. Refaite le filtre de la question 11 en utilisant une fen�tre de
% Blackman. Affichez le module de la fonction de transfert du filtre en
% fonction de la fr�quence.




%14. Appliquez le signal sig au filtre de la question 13. La sortie du
% filtre sera nomm� 'sig_black' et son spectre 'sig_black_f'
% Calculer le rapport |sig_black_f(f=195)|/|sig_black_f(f=210)|
% Commentez les differences par rapport au filtre utilisant la fen�tre rectangle.



