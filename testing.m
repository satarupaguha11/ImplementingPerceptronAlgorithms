function [predicted_label] = testing( a, data)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
numOfSamples=size(data,1);
count=0;
predicted_label=zeros(numOfSamples,1);
for i=1:numOfSamples
    dataAug=[1 data(i,:)];
    if a*dataAug'>0
        predicted_label(i)=0;
    else
        predicted_label(i)=1;
    end
end
end

