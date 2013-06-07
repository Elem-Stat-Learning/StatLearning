function entropy = entropy_calc(idxs, y)
  entropy = 0; 
  classes = unique(y);
  class_len = length(classes);
  in_len = length(idxs);
  for i=1:class_len
    cl_idxs = find(y(idxs) == classes(i));
    a = length(cl_idxs)/in_len;
    entropy = entropy + a*log(a + eps);
  endfor
  entropy = entropy * -1; 
end
