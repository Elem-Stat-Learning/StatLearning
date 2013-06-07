function y = golotip_exec(X_test, golotips, golorads, weights)
  %Вычисление матрицы мер сходства элементов с голотипами
  test_neighbs  = golo_neighb(X_test, golotips, weights)
  y = bsxfun(@gt, test_neighbs, golorads);
end
