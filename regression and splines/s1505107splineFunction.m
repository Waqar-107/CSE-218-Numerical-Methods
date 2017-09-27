function  [x] = s1505107splineFunction(training2)

training_points=training2;
%training_points=[-5.0000 0.0000000;-3.3333 2.2360680; -1.6667 2.8284271;0.0000 3.0000000;1.6667 2.8284271;3.3333 2.2360680;5.0000 0.0000000];

for i=1:7
    tpx(i)=training_points(i,1);
    tpy(i)=training_points(i,2);
end

%tpx=[3 4.5 7 9];
%tpy=[2.5 1 2.5 0.5];

%test points
test_x=[-4.1667 0.8333 4.1667];
test_y=[1.6583124 2.9580399 1.6583124];

%matrix formation
[n,m]=size(tpx);
n=(m-1)*3;
n=n-1;
matrix=zeros(n);

%------------------------------------------------------------------------------
%step-1 : forming equations using the data except the first and last one.
%each of these data are present in two splines
row=0;bidx=0;
for i=2:m-1
    
    target=i-1;row=row+1;
    %b1 and c1 exists
    if(target==1)
        matrix(row,1)=tpx(i);
        matrix(row,2)=1;
    else
        jdx=(target*3)-3;
        matrix(row,jdx)=tpx(i)*tpx(i);
        matrix(row,jdx+1)=tpx(i);
        matrix(row,jdx+2)=1;
    end
    
    B(row)=tpy(i);
    
    target=i;row=row+1;
    jdx=(target*3)-3;
    matrix(row,jdx)=tpx(i)*tpx(i);
    matrix(row,jdx+1)=tpx(i);
    matrix(row,jdx+2)=1;
    B(row)=tpy(i);
    
    %disp(matrix);
end
%------------------------------------------------------------------------------


%------------------------------------------------------------------------------
%using 1st and last item and updating the matrix
row=row+1;
matrix(row,1)=tpx(1);matrix(row,2)=1;B(row)=tpy(1);
row=row+1;
matrix(row,n-2)=tpx(m)*tpx(m);
matrix(row,n-1)=tpx(m);
matrix(row,n)=1;B(row)=tpy(m);
%------------------------------------------------------------------------------
%disp(matrix);

%------------------------------------------------------------------------------
%now updating the matrix with the derivatives
%row is already defined and will be updated before using
for i=2:m-1
    
    row=row+1;
    temp=tpx(i)*2;
    target=i-1;
    if(target==1)
        matrix(row,1)=1;
    else
        jdx=(target*3)-3;
        matrix(row,jdx)=temp;
        matrix(row,jdx+1)=1;
    end
    
    target=target+1;
    jdx=(target*3)-3;
    matrix(row,jdx)=-temp;
    matrix(row,jdx+1)=-1;
    
    B(row)=0;
    
end
%------------------------------------------------------------------------------
for i=1:n
    B2(i,1)=B(i);
end

X=linsolve(matrix,B2);
coEff(1)=0;
for i=2:n+1
    coEff(i)=X(i-1,1);
end

disp(coEff);

x=-5:0.1:5;idx=-1;
for i=1:length(x)
    
    for j=1:m-1
         if(x(i)>=tpx(j) && x(i)<=tpx(j+1))
            idx=3*j-2;
            fx(i)=x(i)*x(i)*coEff(idx)+x(i)*coEff(idx+1)+coEff(idx+2);
        end
    end
    
end
pause(1);
scatter(tpx(:,1),tpy(:,2));
hold on;
plot(x,fx);
hold off;


end

