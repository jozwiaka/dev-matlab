function [invA] = inverse_LU(A)
n=length(A);
invA=zeros(n);
[L,U]=gauss(A);
LU=L*U;
mac_jedn=eye(n);
for i=1:n
    invA(:,i)=eliminacja_gaussa_z_wyborem_czesciowym(LU,mac_jedn(:,i));
end
end
