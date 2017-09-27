clear;
clc;

mat=[1 2 1 0 0 0 16;1 1 0 1 0 0 9;3 2 0 0 1 0 24;-40 -30 0 0 0 1 0];

[n,m]=size(mat);

while(true)
    
    %--------------------------------------------------------------------------
    %searching the last row for most negative value
    %pivoting column will be found
    value=0;jdx=-1;
    for i=1:m
        if(value>mat(n,i))
            jdx=i;
            value=mat(n,i);
        end
    end
    %fprintf('value  %f  %f',value,mat(n,2));
    %--------------------------------------------------------------------------
    
    
    %--------------------------------------------------------------------------
    %checking if there is no negative value found 
    if(jdx==-1 || value>=0)
        break;
    end
  
    %--------------------------------------------------------------------------
    
    
    %--------------------------------------------------------------------------
    temp=zeros(n-1,1);
    %finding pivoting row
    for i=1:n
        temp(i)=mat(i,m)/mat(i,jdx);
    end
    
    idx=-1;value=99999;
    for i=1:n-1
        if(temp(i,1)<value)
            value=temp(i,1);
            idx=i;
        end
    end
    %--------------------------------------------------------------------------
    
    
    %--------------------------------------------------------------------------
    %dividing the idx row by mat[idx][jdx]
    value=mat(idx,jdx);
    for i=1:m
        mat(idx,i)=mat(idx,i)/value;
    end
    %--------------------------------------------------------------------------
    
    
    %--------------------------------------------------------------------------
    %making evrthing 0 in jdx column
    for i=1:n
        
        if i~=idx && mat(i,jdx)~=0
            x=mat(i,jdx)/mat(idx,jdx);
            x=x*-1;
            for k=1:m
                mat(i,k)=mat(idx,k)*x+mat(i,k);
            end
        end
        
    end
    %--------------------------------------------------------------------------
   disp(mat);
end

fprintf('maximum value is %f\n',mat(n,m));

%the max has been determined, but what about points!!
p1=0;f=0;
for i=1:n
    if mat(i,1)==0
        continue;
    end
    
    if mat(i,1)~=0 && f==1
        p1=0;
        break;
    end
    
    if mat(i,1)==1 && f==0
        p1=i;f=1;
    end
    
end

p2=0;f=0;
for i=1:n
    if mat(i,2)==0
        continue;
    end
    
    if mat(i,2)==1 && f==0
        p2=i;f=1;
    else
        p2=0;
        break;
    end
end

fprintf('The maximum lies in (');

if(p1==0)
    fprintf('0,');
else
    fprintf('%d,',mat(p1,m));
end

if(p2==0)
    fprintf('0)');
else
    fprintf('%.f)',mat(p2,m));
end


