function theta = train_lda(X_train, y_train)
  [m,n] = size(X_train);
  theta = zeros(n+1, 1);
  classes = unique(y_train);
  if (length(classes) == 2)
    idx_1 = find(y_train==classes(1));
    mean_1 = mean(X_train(idx_1,:));
    idx_2 = find(y_train==classes(2));
    mean_2 = mean(X_train(idx_2,:));
    avg_covar = (length(idx_1) * cov(X_train(idx_1,:)) + length(idx_2) * cov(X_train(idx_2, :))) / length(y_train);
    inv_avg_covar = pinv(avg_covar);
    theta(2:end, 1) = (mean_2 - mean_1) * inv_avg_covar;
    theta(1,1) = 0.5 * (mean_1*inv_avg_covar*mean_1' - mean_2*inv_avg_covar*mean_2');  
  endif
end
