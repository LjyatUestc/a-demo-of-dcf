clear all;
load Flame2d2c;
data=flame(:,1:2);
clusters=2;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure;
subplot(221);
plot(data(:,1),data(:,2),'o');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%tStart=tic;
r = size(data,1);
k1=11;
indexKNN=KNNSearch(data,k1);
compactnessIS=CompactnessIS(indexKNN,data);
nbFir=GSRkNNNew(indexKNN);
thresholdFir=DensityThreshold(nbFir);
[lowdataOrderingFir highdataFir]=DensityPartition(nbFir,thresholdFir,compactnessIS);
subplot(222);
plot(data(highdataFir(:),1),data(highdataFir(:),2),'ro');
hold on;
plot(data(lowdataOrderingFir(:,3),1),data(lowdataOrderingFir(:,3),2),'bo');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
k2=11;
hc = size(highdataFir,2);
for i=1:hc
    highdata(i,:) = data(highdataFir(i),:);
end
indexKNN=KNNSearch(highdata,k2);
compactnessIS=CompactnessIS(indexKNN,highdata);
nbSec=GSRkNNNew(indexKNN);
thresholdSec=DensityThreshold(nbSec);
[lowdataOrderingSec highdataSec]=DensityPartition(nbSec,thresholdSec,compactnessIS);
subplot(223);
plot(highdata(highdataSec(:),1),highdata(highdataSec(:),2),'ro');
hold on;
plot(highdata(lowdataOrderingSec(:,3),1),highdata(lowdataOrderingSec(:,3),2),'bo');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hc = size(highdataSec,2);
highdata=[];
for i=1:hc
    highdata(i,:) = data(highdataFir(highdataSec(i)),:);
end
%clusters = 7;
[pred edges]=InitialPartitionMST(highdata,clusters);
[iniclusterings]=ClusterFind(pred,edges,clusters);
for i=1:clusters
    temp=[];
    ntemp=[];
    temp=iniclusterings{i,1};
    cols = size(temp,2);
    for j=1:cols
        %ntemp(j) = ceil(highdataFir(highdataSec(temp(j)))/samplenum);
        ntemp(j) = highdataFir(highdataSec(temp(j)));
    end
    clusterings{i,1} = ntemp;
end
lf = size(lowdataOrderingFir,1);
ls = size(lowdataOrderingSec,1);
for i=1:ls
    remaindataind(i)= highdataFir(lowdataOrderingSec(i,3));
end
for i=1:lf
    remaindataind(i+ls) = lowdataOrderingFir(i,3);
end
%remaindata=[lowdataOrderingSec;lowdataOrderingFir];
[clusterings] = ClusterPlot(data,clusterings,clusters,remaindataind);


