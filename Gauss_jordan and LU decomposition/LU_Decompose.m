function arr = LU_Decompose(A,B)

%--------------------------------------------------------------------------
%Algorithm:
% AX=B
% let, A=LU. So LUX=B
% let UX=Y; LY=B
% calculate L,U. Then from LY=B get Y
% use X from UX=Y
%--------------------------------------------------------------------------


[m,n]=size(A);

L=zeros(m);
U=A;


%--------------------------------------------------------------------------
%L was initialized as 0 and then the diagonal is assigned 1
for i=1:m
    L(i,i)=1;
end
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%forward elimination to make U
for i=1:m-1
    
   %--------------------------------
   %partial pivotting if U(i,i)=0
   if(U(i,i)==0)
       max=abs(U(i,i));
       idx=i;

       for j=i+1:m
           if(abs(U(j,i))>max)
               max=abs(U(j,i));
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
           temp=U(i,j);
           U(i,j)=U(idx,j);
           U(idx,j)=temp;
       end

            temp=B(i,1);
            B(i,1)=B(idx,1);
            B(idx,1)=temp;
            
            disp('U after partial pivotting');
            disp(A);
   end
   %--------------------------------
    
   
   %--------------------------------
   %forward elimination for A
    for j=i+1:m
       x=U(j,i)/U(i,i);
       L(j,i)=x;
       x=x*-1;
       
       for k=1:n
           U(j,k)=(x*U(i,k))+U(j,k);
       end
       
       %the element may not be 0 because of round-off error
       %so we make it 0
       U(j,i)=0;
    end
   %--------------------------------
end

   %--------------------------------
   %L and U ready
   disp('L');
   disp(L);
   disp('U');
   disp(U);
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%determining Y
Y(1,1)=B(1,1);
for i=2:m
    sum=0;
    for j=1:i-1
        sum=sum+(Y(j,1)*L(i,j));
    end
    Y(i,1)=(B(i,1)-sum)/L(i,i);
end

disp('Y');disp(Y);
%--------------------------------------------------------------------------


%--------------------------------------------------------------------------
%for UX=Y we have to use back substituting
X(m,1)=Y(m,1)/U(m,m);
for i=n-1:-1:1
    sum=0;
    for j=m:-1:i+1
        sum=sum+(U(i,j)*X(j,1));
    end
    X(i,1)=(Y(i,1)-sum)/U(i,i);
    
end
%--------------------------------------------------------------------------

arr=X;
end

