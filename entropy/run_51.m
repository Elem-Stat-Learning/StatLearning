close all; clear all; clc;
load('data51.mat');
y_test = entropy_exec(X_train, y_train, X_test, 7);
