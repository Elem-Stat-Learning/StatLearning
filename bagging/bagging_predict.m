function p = bagging_predict(theta, X)
m = size(X, 1); % Number of training examples
p = zeros(m, 1);
b_num = size(theta,2);
p = round(sum(sigmoid(X * theta), 2) / b_num);
% =========================================================================


end
