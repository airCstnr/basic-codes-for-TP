%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%                       EXAMEN DE TP MA 361
%  Durée : 1h30
%  Sans documents, sans calculatrice, sans accès internet
%
% Nom :
%
% Prénom : 
%
% Consignes : 
%       - le script matlab ou octave doit être enregistré sous le format : Nom.m
%       - répondre directement dans le script avec des commentaires 
%       - Commenter chaque ligne de votre script exemple :
%             a = 10 ; % a : fréquence du signal x(t)
%       - affichage : les courbes doivent être lisibles avec une légende si
%       plusieurs courbes sur un même graphique
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
% de fréquence 2 kHz, de fréquence d'échantillonnage de 20 kHz et de durée 10 millisecondes. 

d   = 0.010;  % durée = 10millisecondes
f   = 2000;   % fréquence = 2kHz
fe  = 20000;  % fréquence d'échantillonnage = 20kHz
te  = 1/fe;   % période d'échantillonnage
N   = d * fe; % nombre d'échantillons = d * fe

tt  = (0 : te : (N-1)*te); % vecteur temporel = N échantillons, de pas te

x   = cos( 2*pi*f*tt ); % signal cosinusoidal

figure(1);
plot(tt,x,'-s')
xlabel('temps (s)','fontsize',14)
ylabel('x(t)','fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')


%% 2. Pour plus de lisibilité, affichez seulement une période du signal x(t) 
% à l'aide de la fonction "find".

indexes = find(tt <= 1/f); % inedxes = indexes pour lesquels le temps est inférieur ou égal à une période

figure(2);
plot(tt(indexes),x(indexes),'-s')
xlabel('temps (s)','fontsize',14)
ylabel('x(t)','fontsize',14)
set(gca,'fontsize',14)
set(gcf,'color','white')


%% 3. calculez l'énergie du signal x(t)

energie_x = x*x';


%% 4. tracez le module du spectre de x(t)




%5. tracez le module du spectre  de x(t) normalisé par rapport à son maximum 
% sur 10000 points en utilisant la technique du prolongement par des zéros ('zero padding')
% Quel est l'intérêt de cette technique?




%6. même question que précedemment mais affichez le module en décibel. Quel
%   est le niveau du premier lobe secondaire? Est-ce cohérent ?




%7. tracez sur le même graphique les signaux :
%        - y(t) : une cosinusoide de fréquence 50 Hz échantillonné à 200 Hz d'un durée de 400 ms
%        - z(t) : une cosinusoide de fréquence 50 Hz échantillonné à 20 Hz d'une durée de 400 ms
% Vous ferez apparaitre les échantillons de couleur différentes pour y(t) et z(t) sur le graphique (option '--b*') 



% 8. tracez le spectre des signaux y(t) et z(t) avec un zero padding de 1000 sur la même figure mais deux graphiques séparés avec la fonction subplot. 
% Justifiez le spectre du signal z(t)




% 9. creez et affichez un signal 'sig' composite cosinusoidale d'une durée de 1 secondes tel que : 
%        sig est de fréquence 195 Hz et d'amplitude 2 de 0 seconde à 0.6 seconde
%        sig est de fréquence 210 Hz et d'amplitude 1 de 0.6 secondes à 1 seconde.
% La fréquence d'échantillonnage est de 1000 Hz.




% 10. afficher le spectrogramme du signal sig en utilisant :
%   - une fenêtre de blackman de 100 points, un zero padding de 1000 points et sans overlap.
%   - une fenêtre de type rectangle de 100 points, un zero padding de 1000 points et sans overlap.
%     Expliquez clairement les differences que vous voyez.




% 11. En utilisant la méthode de la fenêtre (décrite dans le cours), 
% déterminez théoriquement la suite h(n) des N = 17 coefficients d’un filtre 
% RIF passe-bas idéal dans la bande [0, 205 Hz]. 
% La fréquence d'échantillonnage est fixée à 1000 Hz. La fenêtre de
% pondération est un fenêtre rectangle.
%
% Affichez la réponse impulsionnelle en fonction du temps puis le module et
% la phase de la fonction de transfert en fonction de la fréquence.




% 12. Appliquez le filtre de la question 11 au signal 'sig'. Ce nouveau
% signal sera nommé 'sig_rect'. 
% Affichez le signal sig_rect 
% Affichez sur le même graphique le module du spectre de 'sig', nommé 'sig_f' et de 'sig_rect' nommé 'sig_rect_f'  en utilisant un zero padding de 10000 points.
% Calculer le rapport |sig_f(f=195)|/|sig_f(f=210)|
% Calculer le rapport |sig_rect_f(f=195)|/|sig_rect_f(f=210)|
% Commentez l'effet du filtre.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Bonus %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%13. Refaite le filtre de la question 11 en utilisant une fenêtre de
% Blackman. Affichez le module de la fonction de transfert du filtre en
% fonction de la fréquence.




%14. Appliquez le signal sig au filtre de la question 13. La sortie du
% filtre sera nommé 'sig_black' et son spectre 'sig_black_f'
% Calculer le rapport |sig_black_f(f=195)|/|sig_black_f(f=210)|
% Commentez les differences par rapport au filtre utilisant la fenêtre rectangle.



