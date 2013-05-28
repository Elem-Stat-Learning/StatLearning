function thetas = bumping_train(X, y, lambda, bootstrap_ratio, bootstrap_num)
  thetas = zeros(size(X, 2), 1);
  lambda_num = size(lambda, 1);
  %get bootstraped dataset idx
  bootstraps_idx = bootstrapSampling(y, bootstrap_ratio, bootstrap_num);
  bootstrap_len = size(bootstraps_idx, 2);
  options = optimset('GradObj', 'on', 'MaxIter', 400);
  bootstrap_costs = zeros(lambda_num, 1);
    %fit models on every bootstrap
    for j =1:bootstrap_num
      initial_theta = zeros(size(X,2), 1);
      %find optimized theta for given lambda
      thetas(:,j) = fminunc(@(t)(costFunctionReg(t, X(bootstraps_idx(j,:), :), y(bootstraps_idx(j,:),:), lambda)), initial_theta, options);
    endfor
end
