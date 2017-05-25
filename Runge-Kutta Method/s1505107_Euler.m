function array= s1505107_Euler(fx,fx2,xi,yi,xs,xf,h)

y_euler(1)=yi;
y_true=yi;

i=xs+h;
idx=2;

fprintf('x               y               true_y               error \n');
fprintf('%f %f %f \n',xs,y_euler(1),y_true(1));

while(i<=xf)
  
    y_euler(idx)=y_euler(idx-1)+fx(i-h)*h;
    y_true(idx)=fx2(i);
    
    err=abs(y_true(idx)-y_euler(idx))/y_true(idx);
    err=err*100;
    
    fprintf('%f   %f   %f  %f \n',i,y_euler(idx),y_true(idx),err);
    
    i=i+0.5;
    idx=idx+1;
    
end

array=y_euler;

end

