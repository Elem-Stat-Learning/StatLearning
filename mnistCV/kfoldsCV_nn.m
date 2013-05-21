%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this exercise
input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)

% Load Training Data
fprintf('Loading Data ...\n');
load('ex4data1.mat');
m = size(X, 1);

%get stratified sampling with k-folds
k = 5;
fprintf('Dividing dataset into %i folds ...\n', k);
folds_ratio = repmat(1/k, 1, k);
folds_idx = stratifiedSamplingFolds(y, folds_ratio);

datasets_idx = [];
for i=1:k
  datasets_idx = [datasets_idx; cell2mat(folds_idx(i,:))];
endfor
clear folds_idx;

fprintf('Program paused. Press enter to continue.\n');
pause;


%training and testing ann with cross-validation techique
fprintf('Training and testing ann and different lambda values with cross-validation');

fprintf('\nInitializing Neural Network Parameters ...\n')
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

fprintf('\nTraining Neural Network... \n')
options = optimset('MaxIter', 50);

lambdavals = (1:1:10);
debug = true;
lambda_num = size(lambdavals,2);
errorVal = zeros(lambda_num, 2);

for i=1:lambda_num
  for j=1:k
    %find indeces for train and test sets
    test_idx = datasets_idx(j,:);
    train_idx = datasets_idx;
    train_idx(k, :) = [];
    train_idx = train_idx(:)';
    
    % Create "short hand" for the cost function to be minimized
    costFunction = @(p) nnCostFunction(p, input_layer_size, hidden_layer_size, num_labels, X(train_idx,:), y(train_idx,:), lambdavals(i));
    [nn_params, cost_train] = fmincg(costFunction, initial_nn_params, options);
    % Obtain Theta1 and Theta2 back from nn_params
    Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
    Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), num_labels, (hidden_layer_size + 1));
    
    
    %Test by predicting on the test set
    pred_test = predict(Theta1, Theta2, X(test_idx,:));
    pred_acc_test = mean(double(pred_test == y(test_idx,:)));
    pred_err_test = 1 - pred_acc_test;
    cost_test = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X(test_idx,:), y(test_idx,:), lambdavals(i));
    
    if (debug)
      fprintf('Test cost for labmda %i, fold № %i = %f\n',lambdavals(i), j,  cost_test);
      fprintf('Test set prediction accuracy: %f\n', pred_acc_test);
    endif
    errorVal(i,1) = errorVal(i,1) + cost_test;
    errorVal(i,2) = errorVal(i,2) + pred_err_test;
  endfor
  errorVal(i,1) = errorVal(i,1) / k;
  errorVal(i,2) = errorVal(i,2) / k;
  fprintf('Mean test cost for labmda %i, = %f\n', lambdavals(i), errorVal(i,1));
  fprintf('Mean test set prediction accuracy for lambda %i, = : %f\n', lambdavals(i), errorVal(i,2));
endfor

%Choose the best lambda value
[error_val, best_lambda_idx] = min(errorVal);
fprintf('Best lambda value = %i with cost = %f', lambdavals(best_lambda_idx), error_val);
if (debug)
  errorVal
endif
