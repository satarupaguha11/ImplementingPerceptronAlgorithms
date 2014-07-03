function [ v ] = multiclass_batchRelaxation( data, label, margin )
%Implementation of the Single Sample Perceptron Algorithm for 1 vs. rest
%multiclass classification
  
    %Initializing
    n=size(data,1);
    col=size(data,2);

    one=ones(n,1);
    dataAug = [one data];                                                   %augmenting the train data vector with 1
    v=zeros(10,col+1);
    eta=0.01;
    diff=zeros(1,col+1);
    theta=0.01;
    %This loop runs 10 times, once for computing LDF for each of the ten digits
    %vs. the rest of the digits
     for i=1:10
        disp(i)
        pause
        otherClass=find(label==(i-1));
        dataNeg=dataAug;
        dataNeg(otherClass, :) = -dataAug(otherClass, :);                   %negating the data point values for label=i-1
        a = ones(1,col+1);
        while(1)
            flag=0;
            sum = zeros(1,col+1);
            for k=1:n
                if  a * dataNeg(k,:)'  <  margin                            %checking for misclassified samples
                    y=pdist([dataNeg(k,:);zeros(1,col+1)]);
                    y=y.^2;
                    %y = sum(dataNeg(k,:).^2);
                    term = (margin - a*dataNeg(k,:)')*dataNeg(k,:);
                    term=term/y;
                    sum = sum + term;                                       %computing summation of terms corresponding to the misclassified samples
                    flag=1;
                end
            end
            aprev=a;                                                        %storing the previous value of a
            a = a + eta * sum;                                              %updating a
            diff = pdist([aprev;a])                                         %computing difference between the previous and current values of a
            if flag==0 || diff<theta
                break;
            end
        end
        v(i,:)=a;
     end
end