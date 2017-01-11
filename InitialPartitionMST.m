function [pred edges]=InitialPartitionMST(data,clusters)
rows=size(data,1);
weights=zeros(rows,rows);
for i=1:rows
    for j=1:rows
        weights(i,j)=norm(data(i,:)-data(j,:));%%度量两点间的相似度，可以替换       
    end
end
UG=tril(weights,-1);
SparseWeights=sparse(UG);
[ST,pred] = graphminspantree(SparseWeights);
[r c value]=find(ST);
index=[value r c ];
index=sortrows(index,1);
rows=size(index,1);
if rows>clusters
    index=index(:,2:end);
    edges=index(rows-clusters+2:rows,:);
else
    printf('clusters size is bigger than edges!');
end
% subplot(224);
% plot(data(:,1),data(:,2),'ro');
% rows=size(index,1)-clusters+1;
% hold on;
% for i=1:rows
%     plot([data(index(i,1),1),data(index(i,2),1)],[data(index(i,1),2),data(index(i,2),2)]);    
% end

