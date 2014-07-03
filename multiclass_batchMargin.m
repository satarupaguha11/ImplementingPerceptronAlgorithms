    function [ v ] = multiclass_batchMargin( data, label, margin )
    %Implementation of the Single Sample Perceptron Algorithm for 1 vs. rest
    %multiclass classification
  
    %Initializing
    [n,col]=size(data);

    one=ones(n,1);
    dataAug = [one data];                                                   %augmenting the train data vector with 1
    v=zeros(10,col+1);
    eta=0.01;
    diff=99;
    theta=0.001;
    %This loop runs 10 times, once for computing LDF for each of the ten digits
    %vs. the rest of the digits
     for i=1:10
        disp(i)
        otherClass=find(label==i-1);
        dataNeg=dataAug;
        dataNeg(otherClass, :) = -dataAug(otherClass, :);                   %negating the data point values for label=i-1
        a = rand(1,col+1);
        count=0;
        while(1)
            count=count+1;
            flag=0;
            sum = zeros(1,col+1);
            for k=1:n
                if  a * dataNeg(k,:)'  <=  margin                            %checking for misclassified samples
                    sum = sum + dataNeg(k,:);                              
                    flag=1;
                end
            end
            aprev=a;                                                        %stroing the previous value of a
            a = a + eta * sum;                                              %updating a
            diff=pdist([aprev;a]);                                          %computing difference between the previous and current values of a
            if diff<theta || flag==0                                        %terminating condition                                     
                break;
            end
        end
        v(i,:)=a;
     end
end