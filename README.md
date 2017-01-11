# a-demo-of-dcf
This is a clustering algorithm code based on density clustering framework
It is created by Jianyun Lu in 2017.01.11
P2_DCF is the executable file
the function of KNNSearch() used to search k nearest neighbors
GSRkNNNew() is used to count the number of the reverse k nearest neighbors
CompactnessIS() is used to compute the priority of non-core points
DensityThreshold() is used to compute density threshold automatically.
DensityPartition() is used to partitioning the dataset into two subsets (core points set and non-core points set)
InitialPartitionMST() is used to creat MST for core points
ClusterFind() is used to obtain initial clustering
ClusterPlot() is used to classify the non-core points into initial clusters and plot the clustering results
