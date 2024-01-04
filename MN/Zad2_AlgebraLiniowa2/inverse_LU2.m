function [invA] = inverse_LU2(A)
n = length(A);
invA = zeros(n);
[L,U,P] = LUP(A);
invU = zeros(n);
invL = eye(n);
for j = n:-1:1
    for i = j:-1:1
        if i == j
            delta = 1;
        else
            delta = 0;
        end
        invU(i,j) = 1/U(i,i) * (delta - U(i,i+1:j)*invU(i+1:j,j));
    end
end
for j = 1:n-1
    for i = j+1:n
        if i == j
            delta = 1;
        else
            delta = 0;
        end
        invL(i,j) = 1/L(i,i) * (delta - L(i,j:i-1)*invL(j:i-1,j));
    end
end
invA = invU*invL*P;
end