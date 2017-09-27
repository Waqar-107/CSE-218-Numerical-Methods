clear;
clc;

fx=@(x) (0.2+(25*x)-(200*(x.^2))+(675*(x.^3))-(900*(x.^4))+(400*(x.^5)));

a=0;
b=0.8;
n=4;
h=(b-a)/n;

x=integral(fx,a,b);
points=linspace(a,b,n+2);

sim=fx(points(1)) + fx(points(n));

w=0;
for i=2:2:length(points)-1
    w=w+fx(points(i));
end

sim=sim+4*w;
w=0;

for i=3:2:length(points)-1
    w=w+fx(points(i));
end

sim=sim+2*w;

sim=sim*h/3;

disp('integral:');
disp(sim);

disp('true integral');
disp(x);

disp('error');
er=abs(sim-x)/x;
er=er*100;

disp(er);


