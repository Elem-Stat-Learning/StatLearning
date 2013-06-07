function y = entropy_exec(X_train, y_train, X_test, l)
  [n,m] = size(X_train);
  test_len = size(X_test,1);
  y = zeros(test_len, 1);
  %Нормируем признаки обучающего материала 
  X_scaled = featureScale([X_train; X_test]);
  X_train_norm = X_scaled(1:n,:);
  X_test_norm = X_scaled(n+1:end,:);
  %Зададим вектор весовых коэффициентов по каждому из свойств
  weights = ones(m, 1);
  for i=1:test_len
    %Находим меру сходства с объектами обучения
    dists = golo_neighb(X_test_norm(i,:), X_train_norm, weights);
    min_val = min(dists);
    max_val = max(dists);
    %Зададим шаг приращения радиуса сферы
    step = (max_val - min_val) / l;
    entrops = zeros(l-1,1);
    rad = min_val;
    for j = 1:(l-1)
      in_idxs = find(dists > rad);
      %Для каждой из сфер вычисляем значение жнтропии
      entrops(j) = entropy_calc(in_idxs, y_train);
      rad = rad + step;
    endfor
    %Находим сферу с мин энтропией
    [min_entr, min_idx] = min(entrops);
    %Проводим распознавание
    rad = min_val + (min_idx-1) * step;
    in_idxs = find(dists > rad);
    [y(i), prob] = entropy_recog(in_idxs, y_train);
  endfor
end
