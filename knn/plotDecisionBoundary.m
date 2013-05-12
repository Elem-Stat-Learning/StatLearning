function plotDecisionBoundary(X, y, k)
  % Plot Data
  plotData(X, y);
  hold on
  testdim = genTestsetMesh(X, 100);
  dims = size(testdim, 1);
  for i = 1:dims
    testset = [repmat(testdim(i,1), dims, 1), testdim(:,2)];
    % Evaluate z by kNN classifier
    classes(:, i) = knn_class(X, y, testset, k);
  endfor
  %contour(classes);
  contour(testdim(:, 1)', testdim(:, 2)', classes);%, [0, 0], 'LineWidth', 2);
end
