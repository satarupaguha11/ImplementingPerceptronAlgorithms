function [a] =singleSamplePerceptron(data, label) 
%Implementation of the Single Sample Perceptron Algorithm without margin for binary classification
%Initializing
n=size(data,1);
one=ones(n,1);
a = ones(1,3); 
k=0;
flag=0;
eta=0.1;
count=1;

%augmenting the train data vector with 1
dataAug = [one data];

%finding samples which have labels equal to 1
otherClass=find(label==1);
dataNeg=dataAug;
%negating the train data point vectors having label=1
dataNeg(otherClass, :) = -dataAug(otherClass, :);

 
 while(1)
     for k=1:n
         %checking for misclassified samples
         size(a);
         size(dataNeg(k,:));
         if  a * dataNeg(k,:)'  <  0 
             %updating a
             a = a + (eta) * dataNeg(k,:); 
             count=count+1;
             disp(k);
             flag=1;
             break;
         end
     end
     %terminate loop when there are no more unclassified samples
     if flag==0 
         break;
     end
     flag=0;
 end
    
%  a0 = a(1,1);
%  a1 = a(1,2);
%  a2 = a(1,3);
%  m1 = -a2/a1;
%  b = -a0/a1;
%  x=-5:20;
%  plot(x,m1*x+b);
%  hold on;
%  gscatter(data(:,1),data(:,2),label,[]);        
         
end      

 
     
     
     
     
     
 