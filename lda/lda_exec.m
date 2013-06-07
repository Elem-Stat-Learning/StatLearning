function y = exec_lda(X_test, thetas)
  %Добавляем фиктивный единичный элемент к вектору X для удобства
  X_test = [ones(size(X_test,1), 1), X_test];
  %Вычисляем значения дискриминационной функции для материала экзамена
  discr_vals  = X_test * thetas;
  %На основе решающего правила выделяем образы
  idx_1 = find(discr_vals < 0);
  idx_2 = find(discr_vals > 0);
  y(idx_1,1) = 1;
  y(idx_2,1) = 2;
end
