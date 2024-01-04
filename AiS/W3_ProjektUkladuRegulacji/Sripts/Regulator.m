clear;clc;warning('off','all');close all
z=1
P=zpk([],[0 -2 -4],10)
C=zpk([-z],[-10^10],16/5/z*10^10)
G0=P*C;
bode(P);
hold on;
bode(G0)
hold off;
legend("P","G0")
grid on;
margin(G0)

step(feedback(P,1))
hold on;
step(feedback(G0,1))
hold off;
legend("P","G0")
grid on;

t=(0:5);
u=t;
lsim(feedback(G0,1),u,t)
hold on;
lsim(feedback(P,1),u,t)
grid on;
legend("P","G0")