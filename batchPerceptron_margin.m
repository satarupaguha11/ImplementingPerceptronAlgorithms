function [a] = batchPerceptron_margin(data, label, margin) 
%Implementation of the Batch Perceptron Algorithm without margin for binary classification
%Initializing
n=size(data,1);
a = ones(1,3); 
k=1;
eta=0.01;
count=1;
dataAug = zeros(n,3);
one=ones(n,1);
dataNeg=zeros(n,2);

%augmenting the train data vector with 1
dataAug = [one data];

%finding samples which have labels equal to 1
otherClass=find(label==1);
dataNeg=dataAug;
%negating the train data point vectors having label=1
dataNeg(otherClass, :) = -dataAug(otherClass, :);

 

 while(1)
     sum = zeros(1,3);
     flag = 0;
     
     for i=1:n
         %checking for misclassified samples
         if a*dataNeg(i,:)'< margin
             %computing sum
             sum = sum + dataNeg(i,:);
             flag = 1;
             disp(i)
         end
     end
     %updating a
     a = a + eta * sum;     
     k = k + 1;
     %terminate loop when there are no more unclassified samples
     if flag == 0
         break;
     end    
 end
 a0 = a(1,1);
 a1 = a(1,2);
 a2 = a(1,3);
 m1 = -a2/a1;
 margin = -a0/a1;
 x=-5:20;
 plot(x,m1*x+margin);
 hold on;
 gscatter(data(:,1),data(:,2),label,[]);        
         
end      

 
     
     
     
     
     
 