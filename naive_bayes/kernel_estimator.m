function k = kernel_estimator(X0, Xi, h, kern_id)
  x_len = size(X0, 1);
  Val = euclidean_dist(X0, Xi) / h;
  for i=1:x_len
    k(i,:) = kern((Val(i,:))', kern_id);
  endfor
end

