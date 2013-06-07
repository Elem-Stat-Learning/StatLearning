function y = golotip_exec(X_test, golotips, rads, weights)
  num_classes = size(golotips, 1);
  for i=1:num_classes
    golo_i = cell2mat(golotips(i));
    rad_i = cell2mat(rads(i));
    %Вычисление расстояний до голотипов класса
    dists = w_euclidean_dist(X_test, golo_i, weights);
    dists = -1*bsxfun(@rdivide, dists, rad_i + eps) + 1;
    y(:, 1) = max(dists, [], 2);
  endfor
end
