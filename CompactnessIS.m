function [compactness]=CompactnessIS(indexKNN,dataset)
rows=size(indexKNN,1);
cols=size(indexKNN,2);
compactness=zeros(rows,1);
for i=1:rows
    temp=[];
    for m=1:cols
        c=find(indexKNN(:,m)==i);%%��������Ϊi�ĵ���������k�������湲���ִ���
        c=c';
        temp=[temp c];
    end
    temp=union(temp,indexKNN(i,:));
    temprows=size(temp,2);
    d=0;
    for j=1:temprows
        d=d+norm(dataset(i,:)-dataset(temp(j),:));      
    end
    compactness(i)=temprows/d;
end
