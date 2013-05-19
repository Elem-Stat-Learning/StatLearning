clear all;
close all;
clc;
%load data form SAheart dataset file
data = dlmread('../datasets/SAheart.data', ',', 1, 1);
X = data(:, 1:9);
y = data(:, 10);
[train_idx, test_idx] = stratifiedSampling(y, 0.3);
%train and test on non-normalized features
