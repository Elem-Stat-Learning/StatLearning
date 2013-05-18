clear all;
close all;
clc;
%load data form SAheart dataset file
data = dlmread('../datasets/SAheart.data', ',', 1, 1);
X = data(:, 1:9);
y = data(:, 10);
[train_idx, test_idx] = stratifiedSampling(y, 0.3);
%train and test on non-normalized features
theta = linearRegression_train(X(train_idx, :), y(train_idx, :));
y0 = linearRegression_test(X(train_idx,:), theta);
y1 = linearRegression_test(X(test_idx,:), theta);
acc0 = sum(y(train_idx, :) == y0) / length(y0);
acc1 = sum(y(test_idx, :) == y1) / length(y1);
printf('Accuracy of non-normalized recognition train_ acc =  %f, test_acc\n', acc0, acc1);

%train and test on normalized features
[X_norm, mu, sigma] = featureNormalize(X);
theta = linearRegression_train(X_norm(train_idx, :), y(train_idx, :));
y0 = linearRegression_test(X_norm(train_idx,:), theta);
y1 = linearRegression_test(X_norm(test_idx,:), theta);
acc0 = sum(y(train_idx, :) == y0) / length(y0);
acc1 = sum(y(test_idx, :) == y1) / length(y1);
printf('Accuracy of non-normalized recognition train_ acc =  %f, test_acc\n', acc0, acc1);
