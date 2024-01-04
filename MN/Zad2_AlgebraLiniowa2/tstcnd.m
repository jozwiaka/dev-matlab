function [A,b,x]=tstcnd(n,c)
% TSTCND - generuje przyk�ady testowe do drugiego �wiczenia w Laboratorium 
%          Metod Numerycznych

if nargin<2, c=1e12; end

A=round(exp(2.3*n+3)*gallery('randsvd',n,c));
x=round(n*randn(n,1));
while ~all(x), x=round(n*randn(n,1)); end
b=A*x;
end

