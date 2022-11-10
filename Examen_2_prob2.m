% Tarea 3 Control Automático 
%Estudiantes: Enmanuel Araya Esquivel y Randall Vargas Chaves
% Profesor: Hugo Sanchez Ortíz
s=tf('s');
Gc = (s+3)/(s^2+4*s+10);

Gc_ss= ss(Gc);

A = [-4 -2.5; 4 0];
B = [1; 0];
C = [1 0.75];

%{
figure(1)
step(Gc)
grid on
title('Respuesta al impulso sin control')
%}

As=[A [0;0]; -C 0];
Bs=[B;0];


%{
Q=[100 0 0;
   0 25 0;
   0 0 500];
%}

Q=[100 0 0;
   0 25 0;
   0 0 500];

R=1;

Ks_LQR=lqr(As,Bs,Q,R);
K=Ks_LQR(1:2);
Ki=-Ks_LQR(3);

sim("Prob2")

figure(1)
plot(simout)
hold on
step(Gc)
yline(1+1*0.1)
yline(1+1*0.02)
yline(1-1*0.02)
xline(1.5)
axis([0 3 0 1.5])
grid on
title('Analisis de respuesta')








