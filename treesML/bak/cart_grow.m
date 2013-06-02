function cartree = cart_grow(X, y, idxs, crit)
  [x_len, x_dims]= size(X);
  x_len = size(idxs,1);
  if (x_len > 1)
    curr_crit = feval(crit, y(idxs), y);
    left_vals = [];
    right_vals = [];
    %find best split point
    min_crit = curr_crit;
    for i=1:x_dims
      for j=1:x_len
        left = find(X(idxs, i) <= X(idxs(j),i));
        right = find(X(idxs, i) > X(idxs(j),i));
        crit_val = feval(crit, y(idxs(left)), y);
        if (length(right) > 0)
          crit_val = crit_val + feval(crit, y(idxs(right)), y);
        endif
        if (crit_val < min_crit)
          min_crit = crit_val;
          left_vals = left;
          right_vals = right;
          cartree.split_dim = i;
          cartree.split_val = X(idxs(j),i);
        endif
      endfor
    endfor
    %grow subtrees
    cartree.left = cart_grow(X, y, idxs(left_vals), crit);
    cartree.right = cart_grow(X, y, idxs(right_vals), crit);
    idxs([left_vals; right_vals]) = [];
  endif
  cartree.node = idxs;
end
