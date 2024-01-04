function [x]=eliminacja_gaussa_bez_wyboru( A, b )

Ab=[A b];
n=length(A);
for i=1:n-1
Ab(i+1:n,:)=Ab(i+1:n,:)-Ab(i,:).*Ab(i+1:n,i)/Ab(i,i);
end
A=Ab(1:n,1:n);
b=Ab(:,n+1);
x=zeros(n,1);
x(n,1)=b(n,1)/A(n,n);
for i=1:n-1
temp=A(n-i,n-i+1:n)*x(n-i+1:n,1);
x(n-i,1)=(b(n-i,1)-temp)/A(n-i,n-i);
end
end

