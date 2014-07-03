function [labels] = multiclass_testingNew(v,data)
%This function returns the accuracy of a multiclass classifier
%initializing
count=0;
n=size(data,1);
labels=-ones(n,1);

for k=1:n
    dataAug=[1 data(k,:)];                                                  %augmenting the test data vector with 1
    min=9999;
    disp('k=')
    disp(k)
    for i=1:10
        if v(i,:)*dataAug' < 0   
            disp('i=')
            disp(i)
            
            %checking which side of the decision boundary the test sample lies
            measure=abs(v(i,:)*dataAug');
            if measure < min                                                %finding the decision boundary of the classifier
                min=measure;
                labels(k)=i-1;
            end
        end
    end
    disp('-----')
end

       
end

