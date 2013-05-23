% Initialization
clear ; close all; clc

%% Load Data
%  The first two columns contains the exam scores and the third column
%  contains the label.

data = load('../datasets/ex2data1.txt');
X = data(:, [1, 2]); y = data(:, 3);

%Generate testDataSet

%% ================= Part 1:  Non-normalized kNN classification ================


%% ================= Part 2:  Normalized kNN classification ================
%Normalize features
%[X_norm, mu, sigma] = featureNormalize(X);



%% ==================== Part 3:  Plotting decision boundary ====================
% Plot Boundary
plotDecisionBoundary(X, y, 3);

% Put some labels 
hold on;
% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')

% Specified in plot order
legend('Admitted', 'Not admitted')
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;
