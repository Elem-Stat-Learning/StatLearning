function clusters = clust_03(X, max_dist, weights)
  clusters = {};
  kerns = [];
  kerns = [kerns; X(1,:)];
  kern_size = length(kerns);
  x_len = size(X,1);
  for i =2:x_len
    class = w_euclidean_dist(X(i, :), kerns , weights);
    clusters(kern_size) = find(class <= max_dist);
    if (length(clusters(i)) == 0)
      kerns = [kerns; X(i, :)];
      kern_size = kern_size +1;
    endif
  endfor
end
