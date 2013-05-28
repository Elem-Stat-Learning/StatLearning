%load data
data = load('../datasets/iris.data');
X = data(:, 1:end-1);
y = data(:, end);
clear data;
%run clustering algos
[clusters, centers]  = forel(X, 1.6);
