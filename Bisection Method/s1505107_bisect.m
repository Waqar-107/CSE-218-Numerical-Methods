function s1505107_bisect( fx,lower_bound, upper_bound,es,itr )

%bisection

if fx(lower_bound)*fx(upper_bound)>0
    disp('no bracket');
    return
end

for i=1:1:itr
    mid=(lower_bound+upper_bound)/2;
    error=abs(upper_bound-lower_bound)/lower_bound;

    test=fx(lower_bound)*fx(upper_bound);
    
    if test==0
        error=0;
    end
    
    if test<0
        upper_bound=mid;
    end
    
    if test>0
        lower_bound=mid;
    end
    
    if error<es
        fprintf('root: %f\n',mid);
        fprintf('iteration: %d',i);
        break;
    end

end

