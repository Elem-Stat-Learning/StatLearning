%load data
data = load('../datasets/iris.data');
X = data(:, 1:end-1);
y = data(:, end);
clear data;
%run clustering algos

dist = 0.3;
weights = ones(size(X,2), 1);
clusters  = clust_03(X, dist, weights);
