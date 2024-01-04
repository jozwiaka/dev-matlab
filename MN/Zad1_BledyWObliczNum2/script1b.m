%f(x)=ln(x^2)
x0=3;
h0=0.9;
wDokladna=2/x0;
h=zeros(1,40);
DP=zeros(1,40);
DC=zeros(1,40);
DPp=zeros(1,40);
DCp=zeros(1,40);


for i=1:40
   h(i)=h0*2^(-i+1);
   
   DP(i)=(f(x0+h(i))-f(x0))/h(i);
   DC(i)=(f(x0+h(i))-f(x0-h(i)))/(2*h(i));
   
   DPp(i)=(-f(x0+2*h(i))+4*f(x0+h(i))-3*f(x0))/(2*h(i));
   DCp(i)=(-f(x0+2*h(i))+8*f(x0+h(i))-8*f(x0-h(i))+f(x0-2*h(i)))/(12*h(i));
end

eDP=abs(DP-wDokladna)/wDokladna;
eDC=abs(DC-wDokladna)/wDokladna;

eDPp=abs(DPp-wDokladna)/wDokladna;
eDCp=abs(DCp-wDokladna)/wDokladna;


f2=-2/x0^2;
f3=4/x0^3;
BGP=abs(((h/2)*f2)/wDokladna);
BGC=abs(((h.^2/6)*f3)/wDokladna);

loglog(h,eDP,'o');
hold on
loglog(h,eDC,'+');
loglog(h,BGP,'*');
loglog(h,BGC,'x');
loglog(h,eDPp,'s');
loglog(h,eDCp,'d');
title("Błędy - cześć 2")
xlabel("h");
ylabel("błędy względne");
legend("błąd metody różnicy progresywnej",...
    "błąd metody różnicy centralnej",...
    "błąd odcięcia różnicy progresywnej",...
    "błąd odcięcia różnicy centralnej",...
    "błąd metody różnicy progresywnej+",...
    "błąd metody różnicy centralnej+",...
    'Location','southeast');