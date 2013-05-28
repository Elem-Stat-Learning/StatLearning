function clusters = k_etalons(X, etalons, max_dist, weights)
  clusters = {};
  num_etalons = size(etalons,1);
  %find distances to etalon classes
  dists = w_euclidean_dist(X, etalons, weights);
  classes = (dists <= max_dist);
  for i = 1:(2 ^ num_etalons - 1)
    clusters(i) = find(bin2dec(num2str(classes)) == i);
    %clusters(i) = find(bin2dec(classes)  ==  i);
  endfor
end
