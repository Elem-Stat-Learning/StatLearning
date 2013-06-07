function [X_scaled, min_vals, max_vals]  = featureScale(X)
  min_vals = min(X);
  max_vals = max(X); 
  X_scaled = bsxfun(@minus, X, min_vals);
  X_scaled = bsxfun(@rdivide, X_scaled, max_vals - min_vals);
end
