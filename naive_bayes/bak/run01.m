clear all; close all; clc;
  %load data 
  data = load('../datasets/iris.data');
  X = data(:, 1:4);
  y = data(:, 5);
  folds = stratifiedSamplingFolds(y, [0.3, 0.7], 0);
  test_idx = cell2mat(folds(1, :));
  train_idx = cell2mat(folds(2, :));
  clear folds;
  
  classes = unique(y);
  class_len = length(classes)
%train and test on non-normalized features
  x_dims = size(X,2);
  for i=1:class_len
    class_idx = find(y==classes(i));
    [t, mu_i, sigma_i] = featureNormalize(X(class_idx,:));
    fy_i = length(class_idx)/length(y);
    p_xy = zeros(length(test_idx), x_dims);
    %calc cond distributions
    for j=1:x_dims
      p_xy(:,j) = (kernel_estimator(mu_i(j), X(test_idx, j), 2*sigma_i(j) + eps, 7))';
    endfor
    P(i,:) = fy_i *  prod(p_xy,2)';
  endfor
  P
  [pval, id] = max(P);
  %find max likelihood
     
