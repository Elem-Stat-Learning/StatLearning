function Testset = genTestsetLoop(X, testLen)
  x_len = size(X, 1);
  x_dim = size(X, 2);
  %Generate random matrix same size as X with uniformly distributed values 
  Testset = rand(testLen, size(X,2));
  for i = 1:x_dim
    %find Min, MaxVals for each feature
    minVal = min(X(:, i));
    maxVal = max(X(:, i));
    Testset(:,i) = Testset(:,i) * (maxVal - minVal) + minVal;
  endfor
end
