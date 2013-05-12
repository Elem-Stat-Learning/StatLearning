function [knn_idx, knn_dist]  = quadratic_knn_search(X, Y, k)
%simply find k nearest neighbors for all items Y set in X set
%X - matrix vectors in rows
%Y - matrix vectrors in cols
  dist_matr = euclidean_dist(X,Y);
  %add id labels to the first column 
  dist_matr =[[(1:size(X,1))]', dist_matr];
  y_len = size(Y, 1);
  for y_idx = 1:y_len
    sorted = sortrows(dist_matr, y_idx + 1);
    knn_idx(y_idx, :) = (sorted(1:k, 1))';
    knn_dist(y_idx, :) = (sorted(1:k, y_idx + 1))';
  endfor 
end
