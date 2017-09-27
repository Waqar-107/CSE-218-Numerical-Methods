clear;
clc;

%n terms, lnx
syms n; 
syms x;
syms answer;

%input section
x=input('Enter the value of x:');
n=input('Enter the number of terms:');

answer=s1505107_taylor(x,n);
    
disp('lnx:');
disp(answer);


%plotting taking terms (1,3,5,200) and the input
X=0:0.1:2;
grid on
hold on;

%using the built in function
y1=log(X);
plot(X,y1,'r');
hold on;

%1
y2=s1505107_taylor(X,1);
plot(X,y2,'g');
hold on;

%1
y3=s1505107_taylor(X,3);
plot(X,y3,'b');
hold on;

%1
y4=s1505107_taylor(X,5);
plot(X,y4,'k');
hold on;

%200
y5=s1505107_taylor(X,200);
plot(X,y5,'c');
hold off;


%-----------------------------------------------------
%task-2. relative approx. error of ln(1.5) upto 50 terms
%task2 array is initialized as 0 and later will be updated

task2=1:1:49;
answer=0;
x=1.5;n=50;
relative_error=0;
prev=s1505107_taylor(x,1);

for a=2:n
   answer=s1505107_taylor(x,a);
   
   relative_error=((answer-prev)/answer)*100;
   prev=answer;
   task2(a-1)=(relative_error);
   
end

x=2:1:50;
figure
grid on;hold on;
plot(x,task2,'r');
title('relative approx. error in each step');
xlabel('step no.');
ylabel('relaative approx. error');
hold off;
