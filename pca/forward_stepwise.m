function [bestset_idx, bestset_rss] = forward_stepwise(X, y, k)
  x_len = size(X, 1);
  x_dims = size(X, 2);
  bestset_idx = [];
  bestset_rss = [];
  x_idx = (1:x_dims);
  for i = 1:k
    J = [];
    for idx = x_idx
      Tx = [ones(x_len,1), X(:, bestset_idx), X(:,idx)];
      %optimize
      theta = pinv(Tx' * Tx) * Tx' * y;
      J = [J, computeCostMulti(Tx, y, theta)];
    endfor
    [bestset_rss(i), jnum] = min(J);
    bestset_idx(i) = x_idx(:, jnum);
    x_idx(:, jnum) = [];
  endfor
end
