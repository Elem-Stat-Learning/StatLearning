function neighb =  golo_neighb(X, Y, weights)
  x_len = size(X, 1);
  y_len = size(Y, 1);
  %fill by rows
  for x_idx = 1:x_len
    Diff = repmat(X(x_idx, :), y_len, 1) - Y;
    neighb_i = (-1 * (sign(Diff).*Diff) + 1) * weights;
    neighb(x_idx, :) = neighb_i;
  endfor
end
