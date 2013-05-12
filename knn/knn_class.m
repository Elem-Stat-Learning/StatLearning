function class = knn_class(X, y, Z, k)
  [knn_idx, knn_dist] = quadratic_knn_search(X, Z, k);
  class = (round(mean(y(knn_idx), 2)));
end
