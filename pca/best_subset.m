function bestset = best_subset(X, y)
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
      J = computeCostMulti(Tx, y, theta);
      if (j == 1)
        bestset_i.rss = J;
        bestset_i.idx = v(j, :);
      else
        if (J <  bestset_i.rss)
          bestset_i.rss = J;
          bestset_i.idx = v(j, :);
        endif
      endif
    endfor
    bestset(i)  = bestset_i;
  endfor
end
