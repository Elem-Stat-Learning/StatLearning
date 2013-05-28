%load data
data = load('../datasets/iris.data');
X = data(:, 1:end-1);
y = data(:, end);
clear data;
%run clustering algos

%k-etalons clustering (aivazyan p. 217)
%find centroids
num_etalons = 3;
etalons = zeros(num_etalons, size(X,2));
dists = zeros(num_etalons, 1);
weights = ones(size(X,2), 1);
for i = 1:num_etalons
  idxs = find(y==i);
  etalons(i,:) = mean(X(idxs, :));
  dists(i) = sqrt(std(X(idxs, :)) * weights);
endfor
clusters  = k_etalons(X, etalons, mean(dists), weights);
