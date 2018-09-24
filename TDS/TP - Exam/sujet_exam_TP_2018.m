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
% 1. Créez et affichez un signal x(t) représentant une cosinusoïde 
% de fréquence 5 kHz et de durée 5 millisecondes. Prenez une fréquence d'échantillonnage égale à 5 fois la fréquence minimale de Shannon. 







% 2. Calculez l'énergie et la puissance du signal x(t)







% 3. tracez le module du spectre de x(t) normalisé par rapport à son maximum






% 4. Vérifiez la validité du théorème de Parseval





%5. tracez le module du spectre de x(t) normalisé par rapport à son maximum 
% sur 10000 points en utilisant la technique du prolongement par des zéros ('zero padding')
% Quel est l'intérêt de cette technique?






%6. Effet des fenêtres d'observation. 

%a. observer le signal avec une fenêtre rectangle de 20 points suivie de 231 zéros. 
%   Affichez le spectre du signal observé avec la fenêtre rectangle normalisé par rapport à son maximum






%b.observer le signal avec une fenêtre de Hamming de 20 points suivie de 231 zéros. 
%   Affichez le spectre du signal observé avec la fenêtre Hamming normalisé par rapport à son maximum 
%   sur la même figure que le spectre du signal observé avec la fenêtre rectangle





% c. commentez l'effet de chaque fenêtre sur le spectre.

%7. tracez sur le même graphique les signaux :
%        - y(t) : une cosinusoide de fréquence 50 Hz échantillonné à 200 Hz d'un durée de 400 ms
%        - z(t) : une cosinusoide de fréquence 50 Hz échantillonné à 20 Hz d'une durée de 400 ms
% Vous ferez apparaitre les échantillons de couleur différentes pour y(t) et z(t) sur le graphique (option '--b*') 







% 8. tracez le spectre des signaux y(t) et z(t) avec un zero padding de 1000 sur la même figure mais deux graphiques séparés avec la fonction subplot. 
% Justifiez précisément le spectre de z(t)







% 9. Modulation d'amplitude
% a. Nous souhaitons moduler le signal x(t) de la question 1 par une porteuse de fréquence 30 kHz. Est-ce possible sans modification du signal x(t)?



% b. générez et afficher un signal cosinusoidale v(t) de fréquence 5 kHz échantillonné à 180 kHz avec 500 points.






% c. modulez le signal v(t) suivant la formule suivante : mod(t) = p(t)*(1+k*v(t))
%    Le signal porteur p(t) est une cosinusoide de fréquence 30 kHz. 
%    tracez le signal mod(t) ainsi que le module de son spectre pour k = 0.5
%    Vous utiliserez un zero padding de 5000 points pour afficher le spectre





  % d. expliquez l'allulre du spectre de mod(t)
  
  % e. Multipliez le signal mod(t) par la porteuse p(t). Nous appellerons ce signal demod(t). Affichez le module du spectre de ce signal avec un zero padding de 5000 points.

  
  
  
 % f. expliquez l'allure de ce spectre. Quelle étape supplémentaire est necessaire pour optenir le signal v(t)?
 


% 10. En utilisant la méthode de la fenêtre (décrite dans le cours), 
% déterminez théoriquement la suite h(n) des N = 101 coefficients d’un filtre 
% RIF passe-bas idéal dans la bande [0, 4 kHz]. 
% La fréquence d'échantillonnage est fixée à 180 kHz. La fenêtre de
% pondération est un fenêtre rectangle.
%
% Affichez la réponse impulsionnelle en fonction du temps puis le module et
% la phase de la fonction de transfert en fonction de la fréquence.




% 11. Appliquez le filtre de la question 10 au signal 'demod(t)' de la question 9.e. Ce nouveau
% Commentez l'effet du filtre.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Bonus %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%12. Refaite le filtre de la question 10 en utilisant une fenêtre de
% Blackman. Affichez le module de la fonction de transfert du filtre en
% fonction de la fréquence.






