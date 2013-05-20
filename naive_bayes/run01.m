clear all; close all; clc;
  %load data 
  data = load('../datasets/iris.data');
  X = data(:, 1:4);
  y = data(:, 5);
  [pVals, classIds] = naive_bayes(X,y);
  acc = sum(y == classIds')/length(y);
  printf('Recognition accuracy %i percents\n', fix(acc * 100));
