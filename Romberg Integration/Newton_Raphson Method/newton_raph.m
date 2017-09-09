clear
clc

format long

%Newton-Raphson method for root finding
fx=@(x) (x^3)-x-1;
fx2=@(x) (3*(x^2)-1);

x_old=1.5;
cnt=0;

%error tolerance
es=0.000001;

while(1)
    
    cnt=cnt+1;
    x_new=x_old-(fx(x_old)/fx2(x_old));
    error=(abs(x_new-x_old)/x_new)*100;
    
    if(error<=es)
        break
    end
    
    x_old=x_new;
    
end

fprintf('root: %f \n',x_new);
fprintf('iteration: %d',cnt);

