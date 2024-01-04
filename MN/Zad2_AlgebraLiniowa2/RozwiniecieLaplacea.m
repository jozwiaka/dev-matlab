function [detA] = RozwiniecieLaplacea(A)

n=length(A);
j=1;
if(n==1)
    detA=A;
else
    detA=0;
    for i=1:n
        Aji=A(j+1:n,[1:i-1,i+1:n]);
        detA=detA+(-1)^(i+j)*A(j,i)*RozwiniecieLaplacea(Aji);
    end
end
end

