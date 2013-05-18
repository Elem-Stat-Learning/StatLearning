function theta = forward_stagewise(X, y, minCorr, maxIters)
  x_len = size(X, 1);
  x_dims = size(X, 2);
  theta = [mean(y); zeros(x_dims,1)];
  X = [ones(x_len,1), X];
  iter_num = 0;
  do
    res = y - X * theta;
    for i = 2:(x_dims + 1)
      C(i) = cov(X(:, i), res);
    endfor
    [greatestCorr, idx] = max(C);
    dtheta = (X(:,idx)' * res)/(X(:,idx)' * X(:,idx));
    theta(idx) = theta(idx) + dtheta;
    iter_num = iter_num + 1;
    printf('Iteration %i, correlation %f;\n ', iter_num, greatestCorr);
    if (iter_num == maxIters)
      printf('Max number of iterations (%i) exceeded', maxIters);
      break;
    endif
  until (abs(greatestCorr) < minCorr)
  printf('Current correlation = %f', greatestCorr);
end
