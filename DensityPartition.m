function [lowdensityOrdering highdensity]=DensityPartition(nb,T,compactness)
rows=size(nb,1);
lowdensityOrdering=[];
highdensity=[];
l=1;
h=1;
for i=1:rows
    if(nb(i)<T)
        lowdensityOrdering(l,1)=nb(i);
        lowdensityOrdering(l,2)=compactness(i);
        lowdensityOrdering(l,3)=i;
        l=l+1;
    else
        highdensity(h)=i;
        h=h+1;
    end
end
lowdensityOrdering=sortrows(lowdensityOrdering,[-1 -2]);
