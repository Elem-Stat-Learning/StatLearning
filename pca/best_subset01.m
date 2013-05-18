function [bestset_idx, bestset_rss] = best_subset(X, y)
  bestset_idx = {};
  bestset_rss ={};
  x_len = size(X, 1);
  x_dims = size(X, 2);
  x_idx = (1:x_dims);
  for i = 1:(x_dims-1)
    bestset_i.rss = 0;
    bestset_i.idx = 0;
    v = nchoosek(x_idx, i);
    for j = 1:size(v,1)
      %add 1's column
      Tx = [ones(x_len, 1)];
      %add selected subset of x_dims
      Tx = [Tx, X(:, v(j,:))];
      %optimize
      theta = pinv(Tx' * Tx) * Tx' * y;
      J(1,j) = computeCostMulti(Tx, y, theta);
    endfor
    [bestset_rss(i), t] = min(J);
    bestset_idx(i)  = v(t, :);
  endfor
end
