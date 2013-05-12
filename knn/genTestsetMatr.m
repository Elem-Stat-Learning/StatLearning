function Testset = genTestsetLoop(X, testLen)
  x_len = size(X, 1);
  %Generate random matrix same size as X with uniformly distributed values 
  Testset = rand(testLen, size(X, 2));
  maxVals = repmat(max(X), testLen, 1);
  minVals = repmat(min(X), testLen, 1); 
  Testset = Testset .* (maxVals - minVals);
  Testset = Testset + minVals; 
end
