function [yclass, yval] = linearRegression_test(X, theta)
  X = [ones(size(X,1),1), X];
  y_temp = X*theta;
  [yval, yclass] = max(y_temp, [], 2);
  yclass = yclass - 1;
end 
