clear all, close all, clc

t = linspace(0,10);

x1=linspace(-4,4);
y1=-x1;
x2=linspace(-4,4);
y2=1.5*x2;

x1t = -4/5*exp(-t)+14/5*exp(-6*t);
y1t = 4/5*exp(-t)+21/5*exp(-6*t);
x2t = 2*exp(-t)+1/2*exp(-6*t);
y2t = -4*exp(-t)+1/2*exp(-6*t);
x3t = 2*exp(-t)+1/2*exp(-6*t);
y3t = 1*exp(-t)+2/2*exp(-6*t);
x4t = -2*exp(-t)+1/2*exp(-6*t);
y4t = -3/2*exp(-t)+2/2*exp(-6*t);

plot(x1,y1,x2,y2,x1t,y1t,x2t,y2t,x3t,y3t,x3t,y3t,x4t,y4t)
hold on;
plot(x1t(1),y1t(1),'r*');
plot(x2t(1),y2t(1),'r+');
plot(x3t(1),y3t(1),'r+');
plot(x4t(1),y4t(1),'r+');
xlabel('x1(t)');
ylabel('x2(t)');
grid on;
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';