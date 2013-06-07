function [golotips, golorads] = golotip1_train(X_train, y_train, weights)
  %Вычислим матрицу мер сходства между элементами
  neighbs = golo_neighb(X_train, X_train, weights);
  %Найдем пороговое значение близости как среднее по близости свойств
  thres_neighb = mean(mean(neighbs));
  %Выделим однородные группы(компоненты связности)
  [golo_num, golo_groups] = conncomp(neighbs > thres_neighb);
  %Для каждой компоненты найдем голотип и радиус
  for i=1:golo_num
    %Найдем голотип (центроид)
    golo_group = golo_groups(i).c;
    avg_neighb = mean(neighbs(golo_group, golo_group), 2);
    [max_val, max_idx] = max(avg_neighb);
    golotips(i,:) = X_train(max_idx, :);
    %Найдем радиус группы
    golorads(i) = min(neighbs(max_idx,:));
  endfor 
end
