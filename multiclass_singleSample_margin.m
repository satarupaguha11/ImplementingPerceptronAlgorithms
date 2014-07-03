function [v] = multiclass_singleSample( data, label, margin)
%Implementation of the Single Sample Perceptron Algorithm with margin for 1 vs. rest
%multiclass classification
  
%Initializing
n=size(data,1);
col=size(data,2);
one=ones(n,1);
dataAug = [one data];                                                       %augmenting the train data vector with 1
v=zeros(10,col+1);
eta=0.1;
theta=0.1;
%This loop runs 10 times, once for computing LDF for each of the ten digits
%vs. the rest of the digits
 for i=1:10
    otherClass=find(label==i-1);
    dataNeg=dataAug;
    dataNeg(otherClass, :) = -dataAug(otherClass, :);                       %negating the data point values for label=i-1
    a = ones(1,col+1); 
    count=1;
    while(1)
        flag=0;
        for k=1:n
            if  (a*(dataNeg(k,:))') <  margin                               %checking for misclassified samples
                aprev=a;                                                    %storing the previous value of a
                a = a + (eta) * dataNeg(k,:);                               %updating a
                diff=pdist([aprev;a]);                                      %computing difference between the previous and current values of a
                count=count+1;
                disp(k);
                flag=1;
                break;
            end
        end
        if flag==0 ||  diff<theta
            break;                                                          %terminating condition
        end
    end
    v(i,:)=a;                                                               %storing the a vectors for each of the 10 digits    
 end

end

