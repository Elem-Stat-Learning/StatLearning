function [hier_clusts, cl_cent] = hier_aglo(X, rad, num_clusts)
  x_len = size(X,1);
  %initial clust idx
  hier_clusts = num2cell((1:x_len)');
  cl_cent = X;
  x_dim = size(X,2);
  weights = ones(x_dim,1);
  for i = 1:(x_len - num_clusts)
    size(cl_cent)
    dists = w_euclidean_dist(cl_cent, cl_cent, weights);
    [minval, min_idx] = min(dists(find(dists!=0 & dists < rad)));
    %find cluster numbers to join them into one
    dists_dim = size(dists, 2);
    idx_1 = fix(min_idx / dists_dim) + 1;
    idx_2 = rem(min_idx,   dists_dim) + 1;
    %add them
    hier_clusts(idx_1) = [cell2mat(hier_clusts(idx_1)), cell2mat(hier_clusts(idx_2))];
    hier_clusts(idx_2) = [];
    %recalc center
    cl_cent(idx_1,:) = 0.5 *(cl_cent(idx_1,:) + cl_cent(idx_2,:));
    cl_cent(idx_2,:) = [];
  endfor
end
