function [L,U] = dolittle(A)
n=length(A);
L=diag(ones(n,1));
U=zeros(n);
for i=1:n
    for j=i:n
        temp=0;
        for k=1:i-1
            temp=temp+L(i,k)*U(k,j);
        end
        U(i,j)=A(i,j)-temp;
    end
    for j=i+1:n
        temp=0;
        for k=1:i-1
            temp=temp+L(j,k)*U(k,i); 
        end
        L(j,i)=1/U(i,i)*(A(j,i)-temp);
    end
end
end


