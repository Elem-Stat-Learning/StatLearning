function p = bumping_predict(theta, X)
  m = size(X, 1); % Number of training examples
  p = zeros(m, 1);
  p = round(sigmoid(X * theta));
end
