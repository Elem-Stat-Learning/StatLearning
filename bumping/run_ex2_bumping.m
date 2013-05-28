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
bootstrap_num = 50;
bootstrap_ratio = 0.7;
lambda = 0.2;
thetas = bumping_train(X, y, lambda, bootstrap_ratio, bootstrap_num);
%find with smallest prediction error
fprintf('Find model with smallest prediction error avg on original set...\n');
theta_idx = minPredErr(thetas, X, y);
% Compute accuracy on our training set
theta_idx
%thetas(:, theta_idx);
p = bumping_predict(thetas(:,theta_idx), X);
bump_acc = mean(double(p == y)) * 100;
fprintf('Training Accuracy with bumping: %f\n', bump_acc);
