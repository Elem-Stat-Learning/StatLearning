function [idx, errorVal] = minPredErr(thetas, X, y)
  y_len = size(y, 1);
  models_num = size(thetas,2);
  err = zeros(y_len, models_num);
  for i = 1:models_num
    err(:, i) = sigmoid(X * thetas(:,i));
  endfor
  err = sum(repmat(y, 1, models_num) - err);
  %find min err
  [errorVal, idx] = min(err);
end
