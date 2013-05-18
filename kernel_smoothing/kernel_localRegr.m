function y = kernel_localRegr(X0, Xi, Yi, h, kern_id)
  [x_len, x_dims] = size(X0);
  Val = euclidean_dist(X0, Xi) / h;
  X0 = [ones(x_len,1), X0];
  options = optimset('GradObj', 'on', 'MaxIter', 400);
  for i=1:x_len
    k = kern((Val(i,:))', kern_id);
    initial_theta = zeros(x_dims+1,1);
    %J = weightedCost(X0(i,:), Yi, k ,initial_theta)
    theta = fminunc(@(t)(weightedCost(X0(i,:), Yi, k ,t)), initial_theta, options);
    y(i) = X0(i,:) * theta;
  endfor
end
