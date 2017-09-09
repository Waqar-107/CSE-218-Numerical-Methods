%give the upper and lower bounds yourrself

clear
clc

%bisection
fx=@(x) ((x^6)-x-1);

lb=input('give the lower bound ');
ub=input('give the upper bound:');


%---------------------------------------------------
%0.5-error tolerance, 1000-max iteration
s1505107_bisect(fx,lb,ub,0.5,1000);
%---------------------------------------------------
