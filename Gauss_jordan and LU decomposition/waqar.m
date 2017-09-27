function [arr]= waqar(A,B)

[m,n]=size(A);

%forward elimination
for i=1:m-1
    
   %--------------------------------
   %partial pivotting if A(i,i)=0
   if(A(i,i)==0)
       max=abs(A(i,i));
       idx=i;

       for j=i+1:m
           if(abs(A(j,i))>max || (A(j,i)~=0 && max==0))
               max=abs(A(j,i));
               idx=j;
           end
       end
   
       %if max is 0 then no divison will be possible thus no solution will
       %be found
       if(max==0)
           arr=B;
           return
       end
       
       %swap
       for j=1:n
           temp=A(i,j);
           A(i,j)=A(idx,j);
           A(idx,j)=temp;
       end

            temp=B(i,1);
            B(i,1)=B(idx,1);
            B(idx,1)=temp;
            
            disp('A after pivotting');
            disp(A);
   end
   %--------------------------------
   
   
   %--------------------------------
   for j=i+1:m
       x=A(j,i)/A(i,i);
       x=x*-1;
       
       for k=1:n
           A(j,k)=(x*A(i,k))+A(j,k);
       end
       
       B(j,1)=(x*B(i,1))+B(j,1);
       %the element may not be 0 because of round-off error
       %so we make it 0
       A(j,i)=0;
       
   end
   
   %--------------------------------
   
end

%--------------------------------
%back substitution

xn=B(n,1)/A(n,n);
B(n,1)=xn;

for i=n-1:-1:1
    
    sum=A(i,n)*xn;
    for j=m-1:-1:i+1
        sum=sum+(A(i,j)*B(j,1));
    end
    B(i,1)=(B(i,1)-sum)/A(i,i);
    
end

%--------------------------------

arr=B;

end

