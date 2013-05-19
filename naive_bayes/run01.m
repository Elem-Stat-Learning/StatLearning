clear all; close all; clc;
  %load data 
  load('../datasets/ex3data1.mat');
  folds = stratifiedSamplingFolds(y, [0.3, 0.7], 0);
  test_idx = cell2mat(folds(1, :));
  train_idx = cell2mat(folds(2, :));
  clear folds;
%train and test on non-normalized features
