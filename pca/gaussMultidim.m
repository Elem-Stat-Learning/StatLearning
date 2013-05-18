function pdf = gaussMultidim(X, mu=0, sigma = 1)
  [x_len, p] = size(X);
  mu = repmat(mu, x_len, 1);
  r = chol(sigma);
  pdf = (2*pi)^(-p/2) * exp (-sumsq((X-mu)/r, 2 ) / 2) / prod(diag(r));
end
