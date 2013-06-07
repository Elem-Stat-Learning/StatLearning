close all; clear all; clc;
load('data32.mat');
y = run_golotip1(X_train, y_train, X_test);
