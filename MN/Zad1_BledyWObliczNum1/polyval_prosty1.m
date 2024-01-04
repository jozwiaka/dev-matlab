function y = polyval_prosty1(w, x )
y=0;
for i=1:length(w)
    y=y+w(length(w)-i+1)*x.^(i-1);
end
end