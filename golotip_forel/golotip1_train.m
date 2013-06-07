function [golotips, golo_rads] = golotip1_train(X_train, y_train, weights)
  %Зададим радиус для объединения в кластеры
  max_rad  = sqrt(0.5);
  %Кластеризация ФОРЕЛ
  [clusts, centers] = forel(X_train, max_rad, weights);
  %Найдем расстояние до центров от каждого элемента
  centr_dists = w_euclidean_dist(X_train, centers, weights);
  %Ближайшие к центрам кластеров элементы назначим голотипами
  [min_dists, golotips_idx] = min(centr_dists);
  golotips = X_train(golotips_idx, :);
  %Зададим радиус как расстояние от голотипа до самого дальнего элемента группы
  golo_num = length(golotips_idx);
  golo_rads = zeros(1, golo_num);
  for i=1:golo_num
    golo_dist = w_euclidean_dist(golotips(i,:), X_train(cell2mat(clusts(i)), :), weights);
    golo_rads(i) = max(golo_dist);
  endfor 
end
