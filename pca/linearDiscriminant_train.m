function [mu, sigma, p] = linearDiscriminant_train(X, y)
  y_len = length(y);
  %find indeces for 2 classes
  class01_idx = find(y==0);
  class02_idx = find(y==1);
  %apriory probabilities of classes
  p(1) = length(class01_idx) / y_len;
  p(2) = length(class02_idx) / y_len;
  %find expectations of xvals for classes
  mu(1,:) = mean(X(class01_idx, :), 1);
  mu(2, :) = mean(X(class02_idx, :), 1);
  sigma = cov(X(class01_idx, :)) + cov(X(class02_idx, :));
  sigma = sigma / y_len;
end 
