function clusters = pogl(X, max_dists, weights)
  clusters = {};
  classes = w_euclidean_dist(X, X, weights);
  x_len = size(X,1);
  for i=1:x_len
    classes(:, i) = (classes(:,i) < max_dists(i));  
  endfor
  classes
  %classes = (dists <= max_dist);
  %for i = 1:(2 ^ num_etalons - 1)
    %clusters(i) = find(bin2dec(num2str(classes)) == i);
    %clusters(i) = find(bin2dec(classes)  ==  i);
  %endfor
end
