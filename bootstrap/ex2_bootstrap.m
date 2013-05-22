%% Initialization
clear ; close all; clc
%% Load Data
fprintf('Loading data\n');
data = load('ex2data2.txt');
X = data(:, [1, 2]);
y = data(:, 3);
X = mapFeature(X(:,1), X(:,2));
% Initialize fitting parameters
initial_theta = zeros(size(X, 2), 1);
%Estimate different lambda's using bootstraping
fprintf('Find optimal lambda and theta vals, using bootstraping.\n');
bootstrap_num = 15;
bootstrap_ratio = 0.6;
lambdas = [(0:0.2:10)]';
opt_lambda = bootstrap(X, y, lambdas, bootstrap_ratio, bootstrap_num);
fprintf('Optimal lambda value = %f.\n', opt_lambda);
fprintf('\nProgram paused. Press enter to continue.\n');
pause;

% Set Options
options = optimset('GradObj', 'on', 'MaxIter', 400);

% Optimize
[theta, J, exit_flag] = ...
	fminunc(@(t)(costFunctionReg(t, X, y, opt_lambda)), initial_theta, options);

% Plot Boundary
plotDecisionBoundary(theta, X, y);
hold on;
title(sprintf('lambda = %g', opt_lambda))

% Labels and Legend
xlabel('Microchip Test 1')
ylabel('Microchip Test 2')

legend('y = 1', 'y = 0', 'Decision boundary')
hold off;

% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);


