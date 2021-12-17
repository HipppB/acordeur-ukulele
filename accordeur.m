%%% ISEP CII I2
%%% Accordeur de ukulele
%%% Hippolyte Bach, Matthieu Delarue, Raphaël Carabeuf

clc 

Fs=20000;
record = audiorecorder(Fs,16,1);

%Défini les fréquences des notes
sol3 = 392;
do3 = 261.6;
mi3 = 329.6;
la3 = 440;

ukulele=[sol3,do3,mi3,la3];
fprintf('<strong> Bienvenu dans notre super accordeur </strong> \n') 

%% Selection de la corde et enregistrement
corde=input('Selectionner la corde à accorder : 1 (sol 3)    2 (do3)     3 (mi3)    4 (la3) ');
Freq_choose=ukulele(corde);
facteur= length(record);
Fs=20000;
disp('Début')
recordblocking(record,3);
disp('Fin')
play(record)
data=getaudiodata(record);
k=2;
I=data(1:k:end);
soundsc(I,Fs);
J = abs(fft(data));

%% Super algorithme pour determiner si la corde est bien accordée ou non 
if corde==4
    i=max(J);
    la3_bis=i;
     disp(['fréquence jouée : '   num2str(la3_bis)  'frequence théorique : '  num2str(Freq_choose) ' Hz'])
     if la3_bis < Freq_choose
        disp("Il faut tendre la corde");
     elseif la3_bis > Freq_choose
        disp("Il faut détendre la corde");
     else
         disp("c'est bien accordé");
     end
            
     x=2;y=2;
elseif corde==3
    i=max(J);
    mi3_bis=i;
    disp(['fréquence jouée '  num2str(mi3_bis)  'frequence théorique : '  num2str(Freq_choose) ' Hz'])
    x=2;y=2;
    if mi3_bis < Freq_choose
        disp("Il faut tendre la corde");
     elseif mi3_bis > Freq_choose
        disp("Il faut détendre la corde");
     else
         disp("c'est bien accordé");
     end
elseif corde==2
    i=max(J);
    do3_bis=i;
    disp(["la fréquence jouée : "  num2str(do3_bis)  'frequence théorique : '  num2str(Freq_choose) ' Hz'])
    x=2;y=2;
    if do3_bis < Freq_choose
        disp("Il faut tendre la corde");
     elseif do3_bis > Freq_choose
        disp("Il faut détendre la corde");
     else
         disp("c'est bien accordé");
     end
elseif corde==1
    i=max(J);
    sol3_bis=i;
    disp(['frequence jouée : '  num2str(sol3_bis)  'frequence théorique : '  num2str(Freq_choose) ' Hz'])
    x=2;y=2;
    if sol3_bis < Freq_choose
        disp("Il faut tendre la corde");
     elseif sol3_bis > Freq_choose
        disp("Il faut détendre la corde");
     else
         disp("C'est bien accordé");
     end
end

fprintf('<strong> Powered by Matthieu, Hippolyte et Raphaël  </strong>'); % le fait d'utiliser "fprintf" et non "disp" nous permet de mettre des fonctions dans le texte
