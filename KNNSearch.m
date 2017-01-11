function [indexKNN]=KNNSearch(dataset,k)
% matlabpool local 2;
    kdtreeNS = KDTreeSearcher(dataset,'bucketsize',500);
    rows=size(dataset,1);
    indexKNN=zeros(rows,k);
    
    for i=1:rows        
          [temp,d] = knnsearch(kdtreeNS,dataset(i,:),'k',k+1);
          indexKNN(i,:) = temp(2:end);
    end    
% matlabpool close;