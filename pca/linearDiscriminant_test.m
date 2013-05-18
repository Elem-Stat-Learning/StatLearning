function y = linearDiscriminant_test(X ,mu, sigma, p)
  sigmaInv = pinv(sigma);
  y(1,:) = X * sigmaInv * mu(1,:)' - 0.5 * mu(1,:) * sigmaInv * mu(1,:)' + log(p(1));
  y(2,:) = X * sigmaInv * mu(2,:)' - 0.5 * mu(2,:) * sigmaInv * mu(2,:)' + log(p(2));
end
