function y = G(zeros,poles,gain,w)
y=1;
for i=1:length(zeros)
    y=y*(1i*w-zeros(i));
end
for i=1:length(poles)
    y=y/(1i*w-poles(i)); 
end
    y=y*gain;
    y=abs(y);
   y=log10(y);
end

