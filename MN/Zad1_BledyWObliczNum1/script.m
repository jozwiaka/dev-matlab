w=[1 10 45 120 210 252 210 120 45 10 1];
x=linspace(-1.05,-0.95,10000);
horner=polyval_horner(w,x);
p1=polyval_prosty1(w,x);
p2=polyval_prosty2(w,x);
pv=polyval(w,x);
y=(x+1).^10;
hold on
plot(x,p1,"Color","red")
plot(x,p2,"Color","cyan")
plot(x,horner,"Color","green")
plot(x,pv,"Color","blue")
plot(x,y,"LineWidth",2,"Color","black")
% ax = gca;
% ax.XAxisLocation = 'origin';
% ax.YAxisLocation = 'origin';
title("Błędy - cześć 1",'Interpreter', 'latex')
xlabel("x",'Interpreter', 'latex');
ylabel("W(x)",'Interpreter', 'latex');
legend("prosty1","prosty2","horner","polyval","$(x+1)^{10}$",'Interpreter', 'latex');