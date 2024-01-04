clear;clc;warning('off','all');close all
P=zpk([],[0 -2 -4],10);
C=zpk([-1],[],16/5)
G0=P*C;
margin(G0)