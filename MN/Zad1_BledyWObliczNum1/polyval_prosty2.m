function y = polyval_prosty2(w, x )
y=0;
for i=1:length(w)
    xn=1;
    for j=1:i-1
     xn=xn.*x;
    end
    y=y+w(length(w)-i+1).*xn;
end
end