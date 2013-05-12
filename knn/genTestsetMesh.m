function set = genTestsetMesh(X, testLen)
  x_dim = size(X, 2);
  set = zeros(testLen, size(X, 2));
  for i = 1:x_dim
    %find Min, MaxVals for each feature
    minVal = min(X(:, i));
    maxVal = max(X(:, i));
    set(:,i) = linspace(minVal, maxVal, testLen)';
  endfor
end
