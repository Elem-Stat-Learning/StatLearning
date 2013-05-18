function [J, grad] = weightedCost(X, y, w, theta)
  m = length(y);
  hx = X * theta;
  delta = (y-hx);
  J = delta' * (w .* delta);
  grad = -2 * delta' * w * X;
end
