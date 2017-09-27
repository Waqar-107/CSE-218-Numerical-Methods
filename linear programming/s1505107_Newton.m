clear;
clc;

f=@(x) ((3*x*x)-(x*x*x));
fd=@(x) ((6*x)-(3*x*x));
fdd=@(x) (6-(6*x));

%f=@(x) (2*sin(x)-(x*x/10));
%fd=@(x) ((2*cos(x)) -(x/5));
%fdd=@(x) (((-2)*sin(x))-(1/5));

%initial value of x and error, max relative approx. error 
prev_x=2.5;
e=0;
es=0.0001;
i=0;
while(true)
    
    current_x=prev_x - (fd(prev_x)/fdd(prev_x));
    e=(abs(current_x-prev_x)/current_x)*100;
   
    if(e<es)
        break;
    end
    prev_x=current_x;i=i+1;
    
end

disp('maximum:')
disp(f(current_x));
disp('iteration');
disp(i);

