    function [ v ] = multiclass_batch( data, label)
   %Implementation of the batch Perceptron Algorithm for 1 vs. rest
   %multiclass classification
  
    %Initializing
    n=size(data,1);
    col=size(data,2);

    one=ones(n,1);
    dataAug = [one data];                                                   %augmenting the train data vector with 1
    v=zeros(10,col+1);
    eta=0.01;
    diff=99;
    theta=0.001;
    %This loop runs 10 times, once for computing LDF for each of the ten digits
    %vs. the rest of the digits
     for i=1:10
        otherClass=find(label==i-1);
        dataNeg=dataAug;
        dataNeg(otherClass, :) = -dataAug(otherClass, :);                   %negating the data point values for label=i-1
        a = ones(1,col+1);
        count=0;
        while(1)
            count=count+1;
            disp(count)
            flag=0;
            sum = zeros(1,col+1);
            for k=1:n
                if  a * dataNeg(k,:)'  <  0                                 %checking for misclassified samples
                    sum = sum + dataNeg(k,:);
                    flag=1;
                end
            end
            aprev=a;                                                        %storing the previous value of a
            a = a + eta * sum;                                              %updating a
            diff=pdist([aprev;a]);                                          %computing difference between the previous and current values of a
            if diff<theta || flag==0                                        %terminating condition
                break;
            end
        end
            v(i,:)=a;                                                       %storing the a vectors for each of the 10 digits
     end
end