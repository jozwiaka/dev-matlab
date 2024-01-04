function [L,U] = gauss(A)
n=length(A);
L=diag(ones(n,1));
for i=1:n-1
    
        L(i+1:n,i)=A(i+1:n,i)/A(i,i);
    
    A(i+1:n,:)=A(i+1:n,:)-A(i,:).*A(i+1:n,i)/A(i,i);
end
U=A;
end

