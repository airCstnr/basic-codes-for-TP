%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nom : Castanier
% Prénom : Raphaël
%
% Titre : TP MA367 n°1
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear all % vide la mémoire de matlab (efface les variables)
close all % Ferme les fenêtres ouvertes (anciens graphiques)
clc % vide la fenêtre "command window" (Permet d'effacer les anciennes erreurs du script par exemple)

%Définition des Variables

f0=100; % fréquence de 100 Hz
A=5; % amplitude de 5
fe=2000; % fréquence d'échantillonnage de 2000 Hz
N=100; % nombre de points 

%% Définition des signaux

tt=0:1/fe:(N-1)*1/fe; %vecteur temps de pas Te=1/fe de N points
sig=A*cos(2*pi*f0*tt); % signal cos de fréquence f0
sig2=A*cos(4*pi*f0*tt); % signal cos de fréquence 2*f0


%% Affichage des résultats

figure(1) %création d'une figure

plot(tt,sig,'-b') %affichage d'une courbe avec le temps en abscisse, signal en ordonnée, trait plein bleu
hold on %superposition des courbes
plot(tt,sig2,'--r') %affichage d'une courbe avec le temps en abscisse, signal 2 en ordonnée, trait pointillé rouge
legend('signal 1','signal 2') %définition de la legend
xlabel('temps (s)','fontsize',14) %label sur l'axe des x de police 14
ylabel('amplitude du signal','fontsize',14) %idem pour l'axe y
set(gcf,'color','white') %fond en blanc
set(gca,'fontsize',14) %police des axes en 14



