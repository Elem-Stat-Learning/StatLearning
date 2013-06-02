clear all; close all; clc;
  %load data 
  data = load('../datasets/iris.data');
  X = data(:, 1:4);
  y = data(:, 5);
  idxs = (1:length(y))';
  cart_tree = ideal_cart_grow(X, y, idxs, 'gini');
  name = 'cartree';
  gv_name = strcat(name, '.gv');
  tree2gv(cart_tree, gv_name);
  ps_name = strcat(name, '.ps');
  cmd = sprintf('dot -Tps %s > %s', gv_name, ps_name);
  system(cmd);
  pause();
