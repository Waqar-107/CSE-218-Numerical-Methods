clear;
clc;

f=@(x1,x2) 40*x1+30*x2;

%------------------------------------------------------------------------------
%graphically determining maximum
x2=0:0.1:10;
y2=0:0.1:10;
z2=0:0.1:10;

x1=16-(2*x2);
y1=9-y2;
z1=(24-2*z2)/3;

grid on;hold on;
plot(x1,x2,'r');hold on;
plot(y1,y2,'b');hold on
plot(z1,z2,'c');hold off;

disp('How many extreme point do you want to check?')
n=input('');

X1=0;X2=0;max=0;
for i=1:n
    a=input('Insert x1:');
    b=input('Insert x2:');
    
    if(f(a,b)>max)
        max=f(a,b);
        X1=a;X2=b;
    end
end

fprintf('The maximum value %d lies in (%d,%d) ',max,X1,X2);
%------------------------------------------------------------------------------
