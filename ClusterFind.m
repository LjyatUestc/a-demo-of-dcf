function [clusterings]=ClusterFind(pred,edges,clusters)

cols=size(pred,2);
edgerows=size(edges,1);
clusterings=cell(clusters,1);
clusterstartpoints=[];
root=find(pred==0);
clusterstartpoints=[clusterstartpoints root];

for c=1:clusters
    k=1;
    m=1;
    temp=[];
    temp=[temp clusterstartpoints(c)];
    while k~=0
        for i=1:cols   
            if pred(i)==temp(m)
                for j=1:edgerows
                    if (temp(m)==edges(j,1)&&i==edges(j,2))||(i==edges(j,1)&&temp(m)==edges(j,2))
                        clusterstartpoints=[clusterstartpoints i];
                        break;                        
                    elseif j==edgerows
                        temp=[temp i];
                        k=k+1;
                    end
                end
            end   
        end
        m=m+1;
        k=k-1;
    end
    clusterings{c,1}=temp;
end
