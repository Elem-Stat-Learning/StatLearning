function bestlambda = bootstrap(X, y, lambda, bootstrap_ratio, bootstrap_num)
  lambda_num = size(lambda, 1);
  %get bootstraped dataset idx
  bootstraps_idx = bootstrapSampling(y, bootstrap_ratio, bootstrap_num);
  bootstrap_len = size(bootstraps_idx, 2);
  options = optimset('GradObj', 'on', 'MaxIter', 400);
  bootstrap_costs = zeros(lambda_num, 1);
  for i = 1:lambda_num
    %fit models on every bootstrap
    for j =1:bootstrap_num
      initial_theta = zeros(size(X,2), 1);
      %find optimized theta for given lambda
      theta_j = fminunc(@(t)(costFunctionReg(t, X(bootstraps_idx(j,:), :), y(bootstraps_idx(j,:),:), lambda(i))), initial_theta, options);
      %test on original  dataset
      bootstrap_costs(i) = bootstrap_costs(i) + costFunctionReg(theta_j, X, y, lambda(i));
    endfor
    bootstrap_costs(i) = bootstrap_costs(i) / bootstrap_num;
  endfor
  [mincost, idx] = min(bootstrap_costs);
  bestlambda = lambda(idx);
end
