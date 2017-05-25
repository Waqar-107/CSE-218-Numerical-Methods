function  array= s1505107_Midpoint(fx,fx2,xi,yi,xs,xf,h)

y_Midpoint(1)=yi;
y_true=yi;

i=xs+h;
idx=2;

fprintf('x               y               true_y               error \n');
fprintf('%f %f %f \n',xs,y_Midpoint(1),y_true(1));

while(i<=xf)
  
    k2=fx(i+h/2-h);
    
    y_Midpoint(idx)=y_Midpoint(idx-1)+k2*h;
    y_true(idx)=fx2(i);
    
    err=abs(y_true(idx)-y_Midpoint(idx))/y_true(idx);
    err=err*100;
    
    fprintf('%f   %f   %f  %f \n',i,y_Midpoint(idx),y_true(idx),err);
    
    i=i+0.5;
    idx=idx+1;
    
end

array=y_Midpoint;


end

