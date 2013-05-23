function [J, grad] = costFunctionReg(theta, X, y, lambda)
  m = length(y);
  grad = zeros(size(theta));
  %Compute costs
  hx = sigmoid(X * theta);
  subsum1 = y' * log(hx);
  subsum2 =  (-1 * y' + 1) * log(-1* hx + 1);
  subsum3 = (lambda / (2 * m)) *  sum(theta(2:length(theta),1) .^ 2);
  J = (-1/m) * (subsum1 + subsum2) + subsum3;
  %Compute gradient
  grad = (1/m) * (hx-y)' * X + (lambda/m) * theta';
  grad(1,1) = grad(1,1) - (lambda/m) * theta(1,1);
end
