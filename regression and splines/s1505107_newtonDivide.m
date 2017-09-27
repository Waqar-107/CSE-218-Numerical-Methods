clear;
clc;

%training points
tpx= [-0.6000 -0.5455 -0.4909 -0.4364 -0.3818 -0.3273 -0.2727 -0.2182 -0.1636 -0.1091 -0.0545 0.0000 0.0545 0.1091 0.1636 0.2182 0.2727 0.3273 0.3818 0.4364 0.4909 0.5455 0.6000];
tpy= [5.7994258  4.0150348  2.8738580  2.1260523  1.6108651  1.2302959  0.9285781  0.6767338  0.4614712  0.2777043  0.1239671  -0.0000000  -0.0942150  -0.1586961 -0.1937026 -0.2007007  -0.1847765  -0.1592215  -0.1530139  -0.2219200  -0.4639390  -1.0398120  -2.1992942];


%test points
test_points=[-0.5727 4.8068807;-0.4667 , 2.5042230;-0.3333 , 1.2679470; -0.2000 , 0.6012800;
-0.0667  0.1555561; 0.0667  -0.1111117;0.2000  -0.2012800; 0.3333  -0.1568358; 0.4667  -0.3264447; 0.6000  -2.1992942];

test_x=test_points(:,1);
test_y=test_points(:,2);

for i=2:23
    
    %indexes
    idx2=linspace(1,23,i);
    
    %rounding the value of indexes
    idx=round(idx2);
    
    %building table to get b's
    matrix=zeros(i,i+1);
   
    %update with x and f(x)
    for j=1:i
        matrix(j,1)=tpx(idx(j));
        matrix(j,2)=tpy(idx(j));
    end
    
    %calculating other values
    dist=1;
    for j=3:i+1
        for k=j-1:i
            matrix(k,j)=(matrix(k,j-1)-matrix(k-1,j-1))/(matrix(k,1)-matrix(k-dist,1));
        end
        
        dist=dist+1;
    end
    
    for j=1:i
        b(j)=matrix(j,j+1);
    end
    
 
    x=-0.6:0.01:0.6;
    sizeX=size(x);
    sizeX=sizeX(2);
    
    for j=1:sizeX;
       
        fx(j)=0;
       for w=1:i
           %calculate (x-x1)(x-x2)..
           temp=1;
           for k=1:w-1
               temp=temp*(x(j)-matrix(k,1));
           end    
           fx(j)=fx(j)+b(w)*temp;  
           
       end
  
    end
    
    %show error
    
    
    pause(1);
    scatter(test_x,test_y);
    hold on;
    plot(x,fx);
    hold off;
end