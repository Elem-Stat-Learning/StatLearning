function dist =  w_euclidean_dist(X, Y, weights)
  %find euclidean distance from every x in X to every y in Y
  %return distance matrix xn * ym
  x_len = size(X, 1);
  y_len = size(Y, 1);
  %fill by rows
  for x_idx = 1:x_len
    Diff = repmat(X(x_idx, :), y_len, 1) - Y;
    dist_i = sqrt((Diff.^2) * weights);
    dist(x_idx, :) = dist_i;
  endfor
end
