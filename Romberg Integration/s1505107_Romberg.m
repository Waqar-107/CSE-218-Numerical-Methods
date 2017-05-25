%integration using Romberg's theory

clear;
clc;

fx=@(x) 1./(1+(x.^2));
a=-3;
b=3;

true_value=2.498091544796509;

%fx=@(x) (0.2+(25*x)-(200*(x.^2))+(675*(x.^3))-(900*(x.^4))+(400*(x.^5)));
%a=0;b=0.8;
%true_value=1.6405;

%for h16 we will need 5 points
%starting  from h4

segment=4;
while(true)
    
    q=segment/2;
    
    %generating values
    j=1;i=1;
    while(i<=q)
        
        values(i)=Trapezoidal(j);
        j=j*2;i=i+1;
        
    end
    
    k=q-1;
    j=2;
    while(k>0)
        
        for i=length(values):-1:j
            values(i)=(4*values(i)-values(i-1))/3;
        end
        
        j=j+1;
        k=k-1;
   
    end

    tv=values(length(values));
    err=abs(tv-true_value)/true_value;
    err=err*100;
    
    disp(tv);
    
    if(segment==16 || err<1)
        break;
    end
    
    segment=segment*2;
    
end
    
    


fprintf('h%d \n',segment);

fprintf('integral: %f \n',tv);

fprintf('error: %f \n',err);
