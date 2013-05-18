function errorVal = kfoldsCV(X, y, lambda, k)
  %lambda is column vector (lambdas in rows)
  %X - matrix with observations in rows
  %y - column vector of yvals
  %lambda - column-vector with diff lambda for penalties
  %k - number of folds
  lambda_num = size(lambda, 1);
  options = optimset('GradObj', 'on', 'MaxIter', 400);
  initial_theta = zeros(size(X,2), 1);
  errorVal = zeros(lambda_num, 1);
  train_size = floor(size(X, 1) / k);
  for i = 1:lambda_num
    for j = 0:(k-1)
      %train model(find optimal parameters)
      minIdx = 1 + j * train_size;
      maxIdx = 1 + (j+1) * train_size; 
      %theta  = fminunc(@(t)(costFunctionReg(t, [X(1:(minIdx), :); X(maxIdx:end, :)], [y(1:(minIdx), :); y(maxIdx:end, :)], lambda(i,:))), initial_theta, options);
      theta  = fminunc(@(t)(costFunctionReg(t, [X(1:(minIdx - 1), :); X(maxIdx + 1:end, :)], [y(1:(minIdx - 1), :); y(maxIdx + 1:end, :)], lambda(i,:))), initial_theta, options);
      Ek = costFunctionReg(theta, X(minIdx:maxIdx, :), y(minIdx:maxIdx, :), lambda(i,:));
      errorVal(i, 1) = errorVal(i, 1) + Ek;
    endfor
    errorVal(i, 1) = errorVal(i, 1) / k;
  endfor
end 
