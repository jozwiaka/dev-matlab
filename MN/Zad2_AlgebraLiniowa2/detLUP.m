function [detA] = detLUP(A)
n=length(A); L=eye(n); P=eye(n); U=A; p=0;
for i = 1:n-1
  [M, I] = max(abs(U(i:n, i)));     
  
  I = I+i-1;
  if I ~= i
    p=p+1;
    U([I,i],:) =  U([i,I], :); %zamiana wierszy U
    P([I,i],:) =  P([i,I], :); %zamiana wierszy P
    
    if i >= 2
      L([I,i],1:i-1) =  L([i,I], 1:i-1); %zamiana wierszy L dopiero dla i>=2
    end
  end

  for j = i+1:n      
    L(j, i) = U(j, i) / U(i, i);
    U(j, :) =  U(j, :) - L(j, i)*U(i, :);
  end
end

detA=prod(diag(U))*(-1)^p;
end

