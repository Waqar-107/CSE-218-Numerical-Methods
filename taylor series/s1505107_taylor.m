function answer= s1505107_taylor(x,n)

%function to calculate the summation of 

    answer=0;
    w=x-1;
    b=x-1;
    for a=1:n

       if mod(a,2)==0
           answer=answer-(w/a);
       else
           answer=answer+(w/a);
       end
       
       w=w.*b;

    end

end

