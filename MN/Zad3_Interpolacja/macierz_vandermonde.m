function V = macierz_vandermonde(X)
    nX = length(X);
    N = nX - 1;
    V1 = ones(nX);
    V2 = ones(nX);
   
    V1=V1.*X;

    for i=1:nX
        V2(:,i)=V2(:,i)*(N-i+1);
    end
    V = V1.^V2;
end
