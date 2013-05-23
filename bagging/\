%% Initialization
clear ; close all; clc
%% Load Data
fprintf('Loading data\n');
data = load('../datasets/ex2data2.txt');
X = data(:, [1, 2]);
y = data(:, 3);
X = mapFeature(X(:,1), X(:,2));
% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);
%Estimate different lambda's using bootstraping
fprintf('Training models on all bootstraps...\n');
bootstrap_num = 30;
bootstrap_ratio = 0.6;
lambda = 0.2;
thetas = bagging_train(X, y, lambda, bootstrap_ratio, bootstrap_num);

% Compute accuracy on our training set
p = bagging_predict(thetas, X);
fprintf('Calculating accuracy with bagging avg...\n');
bag_acc = mean(double(p == y)) * 100;
fprintf('Training Accuracy with bagging: %f\n', bag_acc);


