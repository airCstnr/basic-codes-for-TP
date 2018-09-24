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
% 1. Cr�ez et affichez un signal x(t) repr�sentant une cosinuso�de 
% de fr�quence 5 kHz et de dur�e 5 millisecondes. Prenez une fr�quence d'�chantillonnage �gale � 5 fois la fr�quence minimale de Shannon. 







% 2. Calculez l'�nergie et la puissance du signal x(t)







% 3. tracez le module du spectre de x(t) normalis� par rapport � son maximum






% 4. V�rifiez la validit� du th�or�me de Parseval





%5. tracez le module du spectre de x(t) normalis� par rapport � son maximum 
% sur 10000 points en utilisant la technique du prolongement par des z�ros ('zero padding')
% Quel est l'int�r�t de cette technique?






%6. Effet des fen�tres d'observation. 

%a. observer le signal avec une fen�tre rectangle de 20 points suivie de 231 z�ros. 
%   Affichez le spectre du signal observ� avec la fen�tre rectangle normalis� par rapport � son maximum






%b.observer le signal avec une fen�tre de Hamming de 20 points suivie de 231 z�ros. 
%   Affichez le spectre du signal observ� avec la fen�tre Hamming normalis� par rapport � son maximum 
%   sur la m�me figure que le spectre du signal observ� avec la fen�tre rectangle





% c. commentez l'effet de chaque fen�tre sur le spectre.

%7. tracez sur le m�me graphique les signaux :
%        - y(t) : une cosinusoide de fr�quence 50 Hz �chantillonn� � 200 Hz d'un dur�e de 400 ms
%        - z(t) : une cosinusoide de fr�quence 50 Hz �chantillonn� � 20 Hz d'une dur�e de 400 ms
% Vous ferez apparaitre les �chantillons de couleur diff�rentes pour y(t) et z(t) sur le graphique (option '--b*') 







% 8. tracez le spectre des signaux y(t) et z(t) avec un zero padding de 1000 sur la m�me figure mais deux graphiques s�par�s avec la fonction subplot. 
% Justifiez pr�cis�ment le spectre de z(t)







% 9. Modulation d'amplitude
% a. Nous souhaitons moduler le signal x(t) de la question 1 par une porteuse de fr�quence 30 kHz. Est-ce possible sans modification du signal x(t)?



% b. g�n�rez et afficher un signal cosinusoidale v(t) de fr�quence 5 kHz �chantillonn� � 180 kHz avec 500 points.






% c. modulez le signal v(t) suivant la formule suivante : mod(t) = p(t)*(1+k*v(t))
%    Le signal porteur p(t) est une cosinusoide de fr�quence 30 kHz. 
%    tracez le signal mod(t) ainsi que le module de son spectre pour k = 0.5
%    Vous utiliserez un zero padding de 5000 points pour afficher le spectre





  % d. expliquez l'allulre du spectre de mod(t)
  
  % e. Multipliez le signal mod(t) par la porteuse p(t). Nous appellerons ce signal demod(t). Affichez le module du spectre de ce signal avec un zero padding de 5000 points.

  
  
  
 % f. expliquez l'allure de ce spectre. Quelle �tape suppl�mentaire est necessaire pour optenir le signal v(t)?
 


% 10. En utilisant la m�thode de la fen�tre (d�crite dans le cours), 
% d�terminez th�oriquement la suite h(n) des N = 101 coefficients d�un filtre 
% RIF passe-bas id�al dans la bande [0, 4 kHz]. 
% La fr�quence d'�chantillonnage est fix�e � 180 kHz. La fen�tre de
% pond�ration est un fen�tre rectangle.
%
% Affichez la r�ponse impulsionnelle en fonction du temps puis le module et
% la phase de la fonction de transfert en fonction de la fr�quence.




% 11. Appliquez le filtre de la question 10 au signal 'demod(t)' de la question 9.e. Ce nouveau
% Commentez l'effet du filtre.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Bonus %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%12. Refaite le filtre de la question 10 en utilisant une fen�tre de
% Blackman. Affichez le module de la fonction de transfert du filtre en
% fonction de la fr�quence.






