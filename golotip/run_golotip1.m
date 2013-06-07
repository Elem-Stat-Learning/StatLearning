function y = run_golotip1(X_train, y_train, X_test)
  [n,m] = size(X_train);
  %Нормализуем вектор признаков материала обучения
  fprintf('Нормализуем (масштабируем) вектор признаков материала обучения\n');
  [X_train_norm, max_vals, min_vals] = featureScale(X_train)
  %Зададим весовые коэффициенты каждого из свойств
  fprintf('Зададим весовые коэффициенты каждого из свойств\n');
  weights = repmat(1/m, m, 1)
  classes = unique(y_train);
  class_len = length(classes);
  cl_golotips = {};
  cl_golorads = {};
  %Для каждого из образов вычисляем набор голотипов и радиусов  
  fprintf('Для каждого из образов вычисляем набор голотипов и радиусов\n');  
  for i=1:class_len
    %Выполнение процедуры голотип
    cl_idx = find(y_train == classes(i));
    [cl_golotips(i), cl_golorads(i)] = golotip1_train(X_train_norm(cl_idx, :), y_train(cl_idx), weights)
  endfor  
  %Нормализация тестовых данных
  fprintf('Нормализация тестовых данных\n');
  X_test_norm = bsxfun(@minus, X_test, min_vals);
  X_test_norm = bsxfun(@rdivide, X_test_norm, max_vals - min_vals);
  %Проверяем материал экзамена на принадлежность к каждому из классов
  fprintf('Проверяем материал экзамена на принадлежность к каждому из классов\n');
  for i=1:class_len
    fprintf('Класс %i\n', i); 
    golotips_i = cell2mat(cl_golotips(i));
    rads_i = cell2mat(cl_golorads(i));
    y = golotip_exec(X_test_norm, golotips_i, rads_i, weights)
  endfor
end
