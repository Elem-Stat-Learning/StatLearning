close all; clear all; clc;
  x = linspace(-20,20,100)';
  y_ideal = x.*x;
  x_noise = [];
  y_noise = [];
  for i=1:5
    x_noise = [x_noise; (randn(length(x), 1)*3) + x];
    y_noise = [y_noise; (randn(length(y_ideal), 1)*3) + y_ideal];
  endfor
  plot(x,y_ideal, 'g');
  hold on;
  y_smth = kernel_estimator(x, x_noise, y_noise, 3, 7);
  plot(x,y_smth, 'r');
