%load data
data = load('../datasets/iris.data');
X = data(:, 1:end-1);
y = data(:, end);
clear data;
%run clustering algos
[clusters, centers]  = hier_aglo(X, 0.3, 3);
