clear;
clc;

fx=@(x) (0.2+(25*x)-(200*(x.^2))+(675*(x.^3))-(900*(x.^4))+(400*(x.^5)));

a=0;
b=0.8;
n=1;
h=(b-a)/n;

points=linspace(a,b,n+1);

x=integral(fx,a,b);

trap=0;
for i=2:length(points)
    
    b=points(i);
    a=points(i-1);
    
    trap=trap+(h*(fx(a)+fx(b))/2);
    
end

disp(trap);
er=abs(trap-x)/x;
er=er*100;

disp(er);


