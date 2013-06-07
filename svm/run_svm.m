clear ; close all; clc
load('ex6data2.mat');
C = 1; sigma = 0.1;
model= svm_train(X, y, C, 'gaussianKernel', sigma); 
visualizeBoundary(X, y, model);
fprintf('Program paused. Press enter to continue.\n');
pause;
