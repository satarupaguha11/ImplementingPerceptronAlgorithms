function [dataAug]=AugNeg(BW_data, label)

[n,col]=size(BW_data);
one= ones(n,1);
dataAug=[one BW_data];
for i=1:n
	if label(i)==-1
		dataAug(i)=-dataAug(i);
	end
end
