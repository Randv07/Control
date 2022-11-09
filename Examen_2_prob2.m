% Tarea 3 Control Automático 
%Estudiantes: Enmanuel Araya Esquivel y Randall Vargas Chaves
% Profesor: Hugo Sanchez Ortíz

Gc = (s+3)/(s^2+4*s+10);

Gc_ss= ss(Gc)

A = [-4 -2.5; 4 0]
B = [1; 0]
C = [1 0.75]

%{
figure(1)
step(Gc)
grid on
title('Respuesta al impulso sin control')
%}





















