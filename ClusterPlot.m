function [clusterings] = ClusterPlot(data,clusterings,clusters,remaindataind)
rows=size(remaindataind,2);
for i=1:rows    
    tempvalue=[];
    for j=1:clusters
        temp=[];
        temp=[temp clusterings{j,1}];
        temprows=size(temp,2);
        d=[];
        for n=1:temprows
            dist=norm(data(remaindataind(i),:)-data(temp(n),:));
            d=[d dist];
        end
       [value index]=sort(d);
       tempvalue=[tempvalue value(1)];
    end
    [valueTwo indexTwo]=sort(tempvalue);
     t=indexTwo(1);
    clusterings{t,1}=[clusterings{t,1} remaindataind(i)];
end
color=[0 0 1;1 0 0;0 1 1;1 0 1;1 1 0;0 1 0;0 0 0;0 .5 0;0 .75 .75;1 1 1;.5 0 0;.5 .5 0;.5 .5 .5;.75 0 .25;
    .75 .5 0;0 .75 0;0 0 .75;.25 .25 0;.25 0 .25;];
nbcolors=100;
myMap = rand(nbcolors, 3);
myMap=[color;myMap];
cmap=colormap;
subplot(224);
for i=1:clusters
    temp=[];
    temp=clusterings{i,1};
    cols=size(temp,2);
    tempdata=zeros(cols,2);
    ic=int8((i*64.)/(clusters*1.)); 
    for j=1:cols
        tempdata(j,:)=data(temp(j),:);
    end
    plot(tempdata(:,1),tempdata(:,2),'o','color',myMap(i,:));
    hold on;
end
