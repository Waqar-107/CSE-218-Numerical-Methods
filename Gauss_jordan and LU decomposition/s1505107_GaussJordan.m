function [ arr] = s1505107_GaussJordan(A,B)

[m,n]=size(A);

%forward elimination
for i=1:m-1
   %--------------------------------pivotting starts
   %partial pivotting if A(i,i)=0
   if(A(i,i)==0)
       max=abs(A(i,i));
       idx=i;

       for j=i+1:m
           if(abs(A(j,i))>max)
               max=abs(A(j,i));
               idx=j;
           end
       end
   
       %if max is 0 then no divison will be possible thus no solution will
       %be found
       if(max==0)
           arr=A;
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
   %--------------------------------pivotting done
   
   
   %--------------------------------making the lower triangle 0
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
end
   
   %--------------------------------making the lower triangle 0
   
   
   %--------------------------------making the upper triangle 0

   %changing the matrix so that the same operation
   %done above can be done without re-calculating the indexes of the loops
   X=zeros(m);
   for i=m:-1:1
       for j=m:-1:1
           X(m-i+1,m-j+1)=A(i,j);
       end
       Y(m-i+1,1)=B(i,1);
   end
   
   A=X;
   B=Y;
    
%forward elimination
for i=1:m-1
   %make the upper(which is actually lower now) 0
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
end

   %make the main diagonal 1
    for i=1:m
        B(i,1)=B(i,1)/A(i,i);
        A(i,i)=1;
    end
    
    for i=1:m
        Y(i,1)=B(m-i+1,1);
    end
   
   %--------------------------------making the upper triangle 0
   B=Y;
   arr=B;

end

