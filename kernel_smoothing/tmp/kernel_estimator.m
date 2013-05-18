function y = kernel_estimator(X0, Xi, Yi, h, kern_id)
  x_len = size(X0, 1);
  Val = euclidean_dist(X0, Xi) / h;
  for i=1:x_len
    k = kern((Val(i,:))', kern_id);
    y(i,:) = (Yi(i,:) *  k) / (ones(size(kern)) * k);
  endfor
end

