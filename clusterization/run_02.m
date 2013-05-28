%load data
data = load('../datasets/iris.data');
X = data(:, 1:end-1);
y = data(:, end);
clear data;
%run clustering algos

%k-etalons clustering (aivazyan p. 217)
%find centroids
dists = rand(1, size(X,1));
weights = ones(size(X,2), 1);
clusters  = pogl(X, dists, weights);
