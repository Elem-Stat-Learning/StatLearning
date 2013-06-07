function [y, prob] = entropy_recog(idxs, y)
  classes = unique(y);
  class_len = length(classes);
  cl_probs = zeros(class_len, 1);
  for i=1:class_len
    cl_idxs = find(y(idxs) == classes(i));
    i_len = find(y == classes(i)); 
    cl_prob(i,1) = length(cl_idxs) / length(i_len);
  endfor
  [prob, y] = max(cl_prob);
end
