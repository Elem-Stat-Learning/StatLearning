function theta = linearRegression_train(X,y)
  X = [ones(size(X,1),1), X];
  y = [y, not(y)];
  theta = (X' * X)\X' * y; 
end
