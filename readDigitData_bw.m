function [BW_data] = readDigitData_bw(data)


size_data=size(data,1);


%%%Binarization
BW_data=zeros(size_data,28,28);
for i=1:size_data
    I=data(i,:);
    level = graythresh(I);
    BW = im2bw(I,level);
    BW_data(i,:,:)=reshape(BW,28,28);
end


%%%Cleaning out stray pixels
for i=1:size_data
    I=reshape(BW_data(i,:,:),28,28);
    BW_data(i,:,:)=bwmorph(I,'clean',Inf);
end