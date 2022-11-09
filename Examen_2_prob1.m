%Curso control automatico - Instituto Tecnologico de Costa Rica
%Problema 1 - Discretización - Parcial 2 - 2S2022
%Estudiantes: Enmanuel Araya y Randall Vargas
%Profesor: Hugo Sanchez

%Inicialización
clc
clear all
close all

%Creación sistemas
s=tf('s');
Gp = 2000/(s^2+32*s+1024); %Sistema
Gc = (s+30)/s; %Controlador

%Retroalimentación unitaria
H = Gp * Gc;
Hg = feedback(H,1);
%step(Hg);

%Discretización
T1=0.1;
T2=0.005;

%Para T = 0.1
Gz_zoh1=c2d(Gp,T1,'zoh');
Gz_tustin1=c2d(Gp,T1,'tustin');
Gz_matched1=c2d(Gp,T1,'matched');

%Para T = 0.005
Gz_zoh2=c2d(Gp,T2,'zoh');
Gz_tustin2=c2d(Gp,T2,'tustin');
Gz_matched2=c2d(Gp,T2,'matched');

%{
%Figuras
figure(1)
step(Gp);
hold on
step(Gz_zoh1)
step(Gz_tustin1)
step(Gz_matched1)
title('Respuesta a escalón a sistemas discretizado con T=0.1')
axis([0 0.5 0 3])
%}

%{
figure(2)
step(Gp);
hold on
step(Gz_zoh2)
step(Gz_tustin2)
step(Gz_matched2)
title('Respuesta a escalón a sistemas discretizado con T=0.005')
axis([0 0.35 0 3])
%}

%{
figure(3)
rlocus(Gz_zoh1)
title("Lugar de las raices para método ZoH")
grid on
hold on

figure(4)
rlocus(Gz_tustin1)
title("Lugar de las raices para método Tustin")
grid on
hold on


figure(5)
rlocus(Gz_matched1)
title("Lugar de las raices para método polos/ceros")
grid on
hold on
%}

%{
figure(6)
rlocus(Gz_zoh2)
title("Lugar de las raices para método ZoH")
grid on
hold on

figure(7)
rlocus(Gz_tustin2)
title("Lugar de las raices para método Tustin")
grid on
hold on

figure(8)
rlocus(Gz_matched2)
title("Lugar de las raices para método polos/ceros")
grid on
hold on
%}
Gzc_tustin = c2d(Gc,T2,'tustin');
Hz = Gz_tustin2 * Gzc_tustin;
Hgz = feedback(Hz,1);
step(Hgz)
title("Respuesta del sistema digital")
