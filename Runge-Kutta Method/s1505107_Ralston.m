function array= s1505107_Ralston(fx,fx2,xi,yi,xs,xf,h)

y_ralston(1)=yi;
y_true=yi;

i=xs+h;
idx=2;

fprintf('x               y               true_y               error \n');
fprintf('%f %f %f \n',xs,y_ralston(1),y_true(1));

while(i<=xf)
  
    k1=fx(i-h);
    k2=fx(i-h+(3*h/4));k2=k2*2;
    
    y_ralston(idx)=y_ralston(idx-1)+(k1+k2)*h/3;
    y_true(idx)=fx2(i);
    
    err=abs(y_true(idx)-y_ralston(idx))/y_true(idx);
    err=err*100;
    
    fprintf('%f   %f   %f  %f \n',i,y_ralston(idx),y_true(idx),err);
    
    i=i+0.5;
    idx=idx+1;
    
end

array=y_ralston;

end

