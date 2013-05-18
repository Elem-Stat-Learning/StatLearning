function J = computeCostMulti(X, y, theta)
  m = length(y);
  hx = X * theta;
  delta2 = (hx - y).^2;
  J = 1/(2*m) * sum(delta2);
end
