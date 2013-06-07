function y = run_golotip1(X_train, y_train, X_test)
  [n,m] = size(X_train);
  %Нормализуем вектор признаков материала экзамена
  [X_train_norm, mu, sigma] = featureNormalize(X_train);
  %Зададим весовые коэффициенты каждого из свойств
  weights = repmat(1, m, 1);
  classes = unique(y_train);
  class_len = length(classes);
  golotips = {};
  rads = {};
  for i=1:class_len
    %Выполнение процедуры голотип
    [golotips(i), rads(i)] = golotip1_train(X_train_norm, y_train, weights);
  endfor
  %Нормализация тестовых данных
  X_test_norm = bsxfun(@minus, X_test, mu);
  X_test_norm = bsxfun(@rdivide, X_test_norm, sigma);
  y = golotip_exec(X_test_norm, golotips, rads, weights); 
end
