function [clusters, centers] = forel(X, r, weights)
  clusters = {};
  centers = [];
  x_idx = (1:size(X,1));
  i = 0;
  while(length(x_idx) > 0)
    %find distances to centers of clusters
    new_len = 0;
    %init new cluster
    if (new_len == 0)
      i = i + 1;
      center = X(x_idx(1), :);
      clusters(i) = [x_idx(1)];
      x_idx(1) = [];
    endif
    last_center = center + 1;
    %loop update cluster
    while (center != last_center)
      %save last centers 
      last_center = center;
      dists = w_euclidean_dist(X(x_idx,:), center, weights); 
      x_label = find(dists <= r);
      new_len = length(x_label);
      %add idxs to the cluster
      clusters(i) = [cell2mat(clusters(i)), x_idx(x_label)];
      %find new center
      center = mean(X(cell2mat(clusters(i)), :), 1);
      %remove added elements
      x_idx(x_label) = [];
    endwhile
  %update centers
  centers(i,:) = center;
  endwhile
end
