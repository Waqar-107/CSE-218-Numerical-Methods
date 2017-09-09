%choose the bounds from the graph plotted

clear;
clc;


Eo=8.9 *10^(-12);
F=1.25;
q=2*10^(-5);
a=0.85;


constant=(q*q)/(4*pi*Eo);
fx=@(x) constant* x/(sqrt(x*x+a*a))^3-F;


X=0:0.1:5;
i=1;
for a=0:0.1:5
    y(i)=fx(X(i));
    i=i+1;
end
grid on;hold on;
plot(X,y);


lb=input('give the lower bound observing the graph:');
ub=input('give the upper bound observing the graph:');


%---------------------------------------------------
s1505107_bisect(fx,lb,ub,0.5,100);
%---------------------------------------------------


