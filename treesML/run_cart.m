clear all; close all; clc;
  %load data 
  data = load('../datasets/iris.data');
  X = data(:, 1:4);
  y = data(:, 5);
  %split data inot train and test sets
  folds_idx = stratifiedSamplingFolds(y, [0.7, 0.3], 0);
  train_idx = cell2mat(folds_idx(1,:));
  test_idx = cell2mat(folds_idx(2,:));
  %train model
  idxs = (1:length(y(train_idx,:)))';
  cart_tree = cart_grow(X(train_idx,:), y(train_idx,:), idxs, 'gini');
  %test model
  
  fprintf('Accuracy on training set: %f\n');
  fprintf('Accuracy on test set: %f\n');
  
  fprintf('Program paused. Press Enter to continue... \n'); 
  pause();
