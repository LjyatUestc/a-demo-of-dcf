function [nb]=GSRkNNNew(KNNdata)
rows=size(KNNdata,1);
cols=size(KNNdata,2);
%clearvars nb dist value index;
nb=zeros(rows,1);% nb saves the number of accurrence
for i=1:rows
    for j=1:cols
        nb(KNNdata(i,j))=nb(KNNdata(i,j))+1;
    end
end


