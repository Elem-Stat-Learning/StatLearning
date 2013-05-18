function x_idx = backward_stepwise(X, y, k)
  x_len = size(X,1);
  x_dim = size(X,2);
  %initial config
  x_idx = (1:x_dim);
  for i = 1:(x_dim-k)
    Txi = [ones(x_len,1), X(:, x_idx)]; 
    theta = pinv(Txi' * Txi) * Txi' * y;
    Jcurr = computeCostMulti(Txi, y, theta);
    Jdelta = [];
    for j = 1:length(x_idx)
      %optimize
      Tx = Txi;
      Tx(:,j+1) = [];
      theta = pinv(Tx' * Tx) * Tx' * y;
      Jdelta = [Jdelta, computeCostMulti(Tx, y, theta)];
    endfor
    Jdelta = Jdelta .- Jcurr;
    [mindelta, delnum] = min(Jdelta);
    x_idx(:, delnum) = [];
  endfor
end
