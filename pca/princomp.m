function [V,v] = princomp(X)
  %X - covariance or correlation matrix
  %V - matrix with eigenvectors in columns
  %v - vector of eigenvalues of X, in decreasing order
  [V,v] = eig(X);
  [v,S] = sort(-diag(v));
  V = V(:,S);
  v = -v;
end
