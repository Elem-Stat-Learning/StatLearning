function [clusters, centers] = k_means(X, k, centers=[])
  clusters = {};
  if (size(centers, 1) == 0)
    %init centers
    centers = X(1:k, :);
  endif
  %find distances to centers of clusters
  weights = ones(size(X,2), 1);
  last_centers = centers + 1;
  while (centers != last_centers)
    %save last centers 
    last_centers = centers;
    dists = w_euclidean_dist(X, centers, weights); 
    [val, x_label] = min(dists, [], 2);
    %find new cluster partition and new centers(means)
    for i=1:k
      clust_idx = find(x_label == i);
      clusters(i, :) = clust_idx;
      centers(i) = mean(X(clust_idx));
    endfor
  endwhile
end
