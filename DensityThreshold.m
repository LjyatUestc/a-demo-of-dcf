function [threshold]=DensityThreshold(nb)
index=unique(nb);
threshold=median(index);