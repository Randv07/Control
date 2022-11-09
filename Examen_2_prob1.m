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
step(Hg);

