function [pVals, classIds] =  naive_bayes(X, y) 
  classes = unique(y);
  class_len = length(classes);
%train and test on non-normalized features
  x_dims = size(X,2);
  for i=1:class_len
    class_idx = find(y==classes(i));
    [t, mu_i, sigma_i] = featureNormalize(X(class_idx,:));
    fy_i = length(class_idx)/length(y);
    p_xy = zeros(size(X));
    %calc cond distributions
    for j=1:x_dims
      p_xy(:,j) = (kernel_estimator(mu_i(j), X(:, j), 2 * sigma_i(j) + eps, 7))';
    endfor
    P(i,:) = fy_i *  prod(p_xy, 2)';
  endfor
  [pVals, classIds] = max(P);
end
