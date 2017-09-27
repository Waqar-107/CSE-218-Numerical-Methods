clear;
clc;

%training points
training_points=[-5.0000 0.0000000;-3.3333 2.2360680; -1.6667 2.8284271;0.0000 3.0000000;1.6667 2.8284271;3.3333 2.2360680;5.0000 0.0000000];

for i=1:7
    tpx(i)=training_points(i,1);
    tpy(i)=training_points(i,2);
end

[n,m]=size(training_points);
for i=2:n
    idx=linspace(1,7,i);
    
    training2=zeros(n,2);
    
    for j=1:i
        training2(j,1)=training_points(round(idx(j)),1);
        training2(j,2)=training_points(round(idx(j)),2);
    end
    
    s1505107splineFunction(training2);
    
end